---
tags:
  - OS
aliases: []
created: 29. November 2022
---

# 3 Os - Synchronisation - C

Häufig müssen parallel laufende Threads miteinander synchronisiert werden (Ablauf aufeinander abgestimmt). Das kann durch die Nutzung gemeinsamer Betriebsmittel, Datenbereichen oder beim Austausch von Information notwendig sein. In vielen Fällen ist der gleichzeitige Zugriff auf Betriebsmittel nicht zulässig oder kann Fehler verursachen (siehe weiter unten).

Wenn der Zugriff nicht geregelt wird, dann kann es zu sogenannten **Data-Races** kommen. Damit ist gemeint, dass jeder Thread versucht, seine Operationen so schnell wie möglich zu erledigen, ohne die Organisation des Gesamt-Prozesses. Da sich der Ablauf dadurch zwangsläufig "eher sporadisch" verhält, sollten Data-Races vermieden werden und der Zugriff auf geteilte Resourcen organisiert werden (Fehler durch Data-Races sind oft sehr schwer zu finden).

Zum Vermeiden von Data-Races in C++:

- Sperr-Synchronisation mittels Mutex
- Bedingungsvariable (Condition Variables)

Eine Möglichkeit Data-Races zu vermeiden, kann mittels **Bedingungsvariablen** erreicht werden. Dabei kann ein Thread Bedingungsvariable entsprechend setzen. Genaugenommen verhindert diese Art keine Data-Races, sondern vermeidet die Ursache dafür (gleichzeitig genutzte Resource). Ein Konzept wie sie tatsächlich verhindert werden können ist die **Sperrsynchronisation**.

## [Sperrsynchronisation - Mutex](Mutex.md)

[Semaphore](Semaphore.md)

## Ereignis-Synchronisation

Beispiel **Producer-Consumer**:

- Ein Produzent-Thread erzeugt Daten und schreibt diese in einen Buffer (FIFO)

- Ein Konsument-Thread verwendet die Daten des Produzenten weiter. Er holt sie dazu aus dem FIFO-Speicher

- Reale Probleme:

  - der Produzent erzeugt zu viel Daten, der Buffer läuft über (eventuell entnimmt der Konsument die Daten zu langsam) -> *Buffer-Overflow*
  - der Konsument möchte Daten abholen, der Buffer ist allerdings schon leer -> *Buffer-Underflow*

  einfachste Lösung: Auslösen einer Exception für Buffer-Overflow/-Underflow

FiFo-Buffer, am Einfachsten realisiert als [Ringbuffer](../../Digitaltechnik/Ringbuffer.md). Die Position des Schreibens und Lesens wird mittels eines Index in einem Array festgelegt. Die 8 Plätze in diesem Beispiel bieten Platz für bis zu 7 Elemente (würden 8 Elemente zugelassen, kann Voll nicht von Leer unterschieden werden …):

![OS_FiFo](assets/OS_FiFo.png)

### Exceptions

Fifo-Klasse fifo.h:

```c++
#include <stdexcept>
#include <cassert>
using namespace  std;

class FIFO {
private:
    int* m_queue;
    int m_size, m_write, m_read;

public:
    FIFO(int size){		// Buffer Konstruktor
        m_size = size+1;
        m_queue = new int[size+1];
        m_write = 0;
        m_read = 0;
    }
    ~FIFO() {
        delete[] m_queue;
    }

    void enqueue(int item) {	// in Buffer schreiben
        if(this->isFull()) throw overflow_error("enqueue: overflow_error");
        else{
            m_queue[m_write] = item;
            m_write++;
            m_write %= m_size;
        }
    }

    int dequeue() {	// aus Buffer entnehmen
        if (isEmpty()) throw underflow_error("dequeue: underflow_error");

        int value = m_queue[m_read];
        m_read++;
        m_read %= m_size;
        return value;
    }

    bool isEmpty() {
        if(m_write == m_read) return true;
        return false;
    }

    bool isFull() {
        if(m_read == (m_write+1) % m_size) return true;
        return false;
    }
};
```

Testen der FIFO-Klasse main.cpp:

```c++
#include <iostream>
#include <cassert>
#include "fifo.h"
using namespace std;

int main(){
    {
        FIFO fifo(5); // 5 Elemente haben Platz
        assert(fifo.isEmpty() && "Test: isEmpty()");
    }
// ----------------------------------------------------
    {
        FIFO fifo(5); // 5 Elemente haben Platz
        fifo.enqueue(1);
        fifo.enqueue(2);
        fifo.enqueue(3);
        fifo.enqueue(4);
        fifo.enqueue(5);
        assert(fifo.isFull() && "Test: isFull()");
    }
// ----------------------------------------------------
    {
        FIFO fifo(5); // 5 Elemente haben Platz
        fifo.enqueue(1);
        int val= fifo.dequeue();
        assert(val==1 && "Test: enqueue and dequeue");
        assert(fifo.isEmpty() && "Test: isEmpty()");
    }
// ----------------------------------------------------
    {
        try{
            FIFO fifo(5); // 5 Elemente haben Platz
            int val= fifo.dequeue();

            assert(false && "fail: underflow_exception ");

        } catch(underflow_error& e){
            // diese Exception soll passieren
        }
    }
// ----------------------------------------------------
    {
        try{
            FIFO fifo(5); // 5 Elemente haben Platz
            fifo.enqueue(1);
            fifo.enqueue(2);
            fifo.enqueue(3);
            fifo.enqueue(4);
            fifo.enqueue(5);

            fifo.enqueue(6);
            assert(false && "fail: overflow_exception ");

        } catch(overflow_error& e){
            // diese Exception soll passieren
        }
    }
// ----------------------------------------------------
    cout << "All tests passed, OK ..." << endl;

    return 0;
}
```

`assert(param)`: wenn `param == false` ist, dann wird eine Exception ausgelöst. Ein Assert wird üblicherweise eingebaut, wenn etwas nie passieren kann/soll - Erstens um den Leser zu zeigen, dass die angegebene Bedingung immer erfüllt wird und zweitens, damit dieser (weil nie vorkommend) nicht berücksichtigte Fehler abgefangen wird.

Mit diesen Exceptions kann sichergestellt werden, dass der Buffer nie überoder unterläuft. Allerdings gibt es Exceptions wenn Producer und Consumer nicht gleich schnell den Buffer füllen/entleeren.

### Thread-Sicher

Sollte es tatsächlich möglich sein, dass ein Buffer überlaufen kann, ist die Exception-Variante ungenügend, sie führt zu einem Programmende.

Besser: der Buffer wird *Thread-Safe* gemacht. Wenn der Buffer schon zu voll ist, wartet der Produzent. Ist der Buffer leer, wartet der Konsument. Das kann mittels **Bedingungsvariable** (**C**ondition-**V**ariable) erfolgen.

Aufbau:

```c++
#include <condition_variable>

mutex mu;     							// Sperrsync
condition_variable m_cv;    // Ereignissync
```

Producer:

```c++
// -------------------------------- 1ter Thread (Producer):
unique_lock<mutex> lck(mu);			  // Mutex fuer Blockade
while (isFull()) m_cv.wait(lck);  // Bis Platz in FiFo & Trigger von CV
...
m_cv.notify_all(); 								// Mutex freigeben & m_cv-Wartende triggern
```

Hier wird, wenn der FiFo-Buffer voll ist, gewartet bis die Bedingungsvariable m_cv getriggert wird. Wenn die getriggert wird, dann wird wiederum geprüft ob der FiFo-Buffer noch voll ist. Ein Trigger passiert entweder, wenn ein Consumer ein Element entnommen hat oder, wenn ein zweiter Producer diesen Ablauf verlässt. Mit dem abschließenden `notify_all` wird ein Trigger an andere Wartende gesendet.

Consumer:

```c++
// -------------------------------- 2ter Thread (Consumer):
unique_lock<mutex> lck(mu);			  // Mutex fuer Blockade
while (isEmpty()) m_cv.wait(lck); // Bis Element in FiFo & Trigger von CV
...
m_cv.notify_all(); 								// Mutex freigeben & m_cv-Wartende triggern
```

Der Ablauf beim Consumer ist analog, wenn ein Trigger erhalten wird, dann wird hier entsprechend geprüft ob er vom Producer gekommen ist durch eine Einlage.

Hier die Umsetzung - fifo.h (mit Implementierung):

```c++
#include <condition_variable>
#include <stdexcept>
using namespace std;

class FIFO {
private:
    int *m_queue;
    int m_size, m_begin, m_end;

    mutex mu;     							// Sperrsync
    condition_variable m_cv;    // Ereignissync

public:
    FIFO(int size) {
        m_size = size + 1;
        m_queue = new int[size + 1];
      m_begin = 0;
      m_end = 0;
    }

    ~FIFO() {
        delete[] m_queue;
    }
    // Einfuegen: wenn voll: Warten (statt Exception)
    void enqueue(int item) {
        unique_lock<mutex> lck(mu);
																		 // v================v
        while (isFull()) m_cv.wait(lck); // Warten bis mu frei

        m_queue[m_begin] = item;
        m_begin++;
        m_begin %= m_size;

        m_cv.notify_all(); //Blockade freigeben
    }
    // Entnahme: wenn leer: Warten (statt Exception)
    int dequeue() {
        unique_lock<mutex> lck(mu);
																		 // v================v
        while (isEmpty()) m_cv.wait(lck); // Warten bis mu frei
                                      
        int value = m_queue[m_end];
        m_end++;
        m_end %= m_size;

        m_cv.notify_all(); // Blockade freigeben
        return value;
    }

    bool isEmpty() {
        if (m_begin == m_end) return true;
        return false;
    }

    bool isFull() {
        if (m_end == (m_begin + 1) % m_size) return true;
        return false;
    }
};
```

Es wird ein 5 Elemente großer Buffer erstellt. Dorthinein werden 50 Elemente eingestellt und "gleichzeitig" von einem zweiten Thread entnommen.

Hauptprogramm main.cpp:

```c++
#include <iostream>
#include <thread>
using namespace std;

#include "fifo.h"

class Producer{                // Producer-------------------------
private:
    FIFO *m_fifo;

public:
    Producer(FIFO *fifo) {
        m_fifo = fifo;
    }
    void produce() {
        for (int i = 1; i <= 50; i++) {
            cout << "PRODUCER: enqueue " << i << endl;
            m_fifo->enqueue(i);
        }
    }
    void operator()() { produce(); }
};


class Consumer {                // Consumer-------------------------
private:
    FIFO *m_fifo;

public:
    Consumer(FIFO *fifo) {
        m_fifo = fifo;
    }

    void consume() {
        for (int i = 1; i <= 50; i++)
            cout << "\t\t\t\tCONSUMER: dequeue " << m_fifo->dequeue() << endl;
    }
    void operator()() { consume(); }
};

int main(int argc, char *argv[]) {

    cout << "Erstelle 5 Elemente groszen Buffer ..." << endl;
    FIFO *fifo = new FIFO(5);

    Producer producer(fifo);
    Consumer consumer(fifo);

    cout << "Starte producer-Thread ..." << endl;
    thread thread_producer(producer);
    cout << "Starte consumer-Thread ..." << endl;
    thread thread_consumer(consumer);

    thread_producer.join();
    thread_consumer.join();

    return 0;
}
```

## Zusammenfassung

Beherzigen Sie folgende Regeln bei der Synchronisierung von Threads:

- Nie Resourcen anfordern, wenn gleichzeitig schon welche besetzt werden.
- Sicherstellen, dass eine Resourcen-Sperre in jeden Fall freigegeben wird.

## Fragen

- Warum sollen Threads synchronisiert werden (sollen sie/wann/warum)?
- Was versteht man unter einem Data-Race (gut/schlecht)?
- Auf welche Arten können Prozesse in synchronisiert werden?
- Was versteht man unter Threadsafe?
- Was bedeutet Lost-Update?
- Erklären Sie das Producer/Consumer-Problem?
- Zeigen Sie wie Deadlocks trotz (schlechter) Sperrsynchronisation passieren können?

## Referenzen

- Java-Semaphore/Mutex  
  <https://www.mkyong.com/java/java-thread-mutex-and-semaphore-example/>