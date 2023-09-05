## Signal-Synchronisation - Semaphore

Eine weitere Möglichkeit der Synchronisation bieten die sogenannten Semaphore (Bahnsignal). Mit Semaphore kann auch mehrfache Vergabe von Ressourcen organisiert werden (sofern das zulässig ist).

Semaphore beinhalten:

- einen Zähler, dieser signalisiert wieviel Zugänge noch möglich sind. Beim Eintritt wird der Zähler dekrementiert. Wenn der Zähler auf 0 steht, ist kein Eintritt möglich. Beim Verlassen wird der Zähler wiederum inkrementiert.
- eine Queue, in dieser werden die Threads nach Ankunft gereiht wenn der Zähler 0 ist. Wird der Zähler wieder größer 0, dann wird einer der gequeueten Threads aktiviert.

Im Gegensatz zu Mutex wird von C++ kein Semaphor-Mechanismus angeboten und muss daher, wenn gewünscht, selbst implementiert werden:

```c++
struct Semaphor {
    int counter;		// Zutritt-Zaehler
    Queue* queue;		// Warteschlange
};

void init(Semaphor *sema) {
    sema->counter = 1;		// wenn Resource nur einfach begehbar
    sema->queue = new Queue();  
}

void wait(Semaphor *sema) {		// wenn besetzt -> wait
    if (sema->counter > 0)
        sema->counter--;
    else // selbst Anstellen: eigene PID in die Queue
        sema->queue->enqueue(PID);
}

void notify(Semaphor *sema) {
    if (sema->queue->isEmpty()){
        sema->counter = 1;		// wenn Resource nur einfach begehbar
    } else {
        // Entblockieren eines Prozesses aus der Warteschlange
        PID = sema->queue->dequeue();
        resume(PID);
    }
}
```

Typische Verwendungsfälle von Semaphore:

- Aufteilung von Mehrfach vorhandenen Rechnerkernen (in modernen Betriebssystemen)
- gepufferte Datenübertragung - in einem FIFO-Buffer kann ein Leseund ein Schreib-Thread gleichzeitig zugreifen, solange der Buffer gefüllt ist (kann mit dem Counter ermöglicht werden)

Alternativ kann aus C eine Semaphor-Variante verwendet werden, Abfolge:

Abfolge:

```c++
#include <semaphore.h>
...
sem_t mySema;						    // Definition Semaphore
...
sem_init(&mySema, 0, 5);	   // Konfiguration: 5 duerfen gleichzeitig arbeiten
...
  sem_wait(&mySema);				// Warten bis einer der 5 Sph. frei.
                             // Wenn frei: Semaphore dekrementieren und weiter
  ...kritischer Abschnitt...
  sem_post(&mySema);				// Semaphore inkrementieren 
...
sem_destroy(&mySema);
```

Hier werden 6 mal Threads mit den gleichen Funktionen gleichzeitig gestartet. Es sind aber nur 5 gleichzeitig erlaubt. Beispiel (c++):

```c++
#include <stdio.h>
#include <thread>
#include <semaphore.h>

using namespace std;

sem_t mySema;

void myFunc(int num) {
  sem_wait(&mySema);
  printf("%i: starting..\n", num);

  this_thread::sleep_for (chrono::seconds(5));

  printf("%i: exiting..\n", num);
  sem_post(&mySema);
}

int main() {
  sem_init(&mySema, 0, 5);

  thread t1(myFunc, 1);
  thread t2(myFunc, 2);
  thread t3(myFunc, 3);
  thread t4(myFunc, 4);
  thread t5(myFunc, 5);
  thread t6(myFunc, 6);

  t1.join();
  t2.join();
  t3.join();
  t4.join();
  t5.join();
  t6.join();

  sem_destroy(&mySema);
  return 0;
}
```