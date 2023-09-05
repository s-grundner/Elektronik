---
tags:
  - OS
aliases:
  - Mutually excluded
  - Sperr-Synchronisation
created: 5. September 2023
---

# Sperr-Synchronisation

Referenz-Beispiel: 
- mehrere Threads arbeiten parallel mit gemeinsam genutztem Speicher. Beide Threads inkrementieren jeweils die selbe Variable.
- allgemein besteht ein Inkrementieren aus den atomaren Teilen:
  - Lesen
  - Erhöhen
  - Schreiben
- Dabei kann folgendes passieren (**Lost-Update**) :
  
  ![OS_LostUpdate](assets/OS_LostUpdate.png)
  
  
  
  Thread2 liest den ursprünglichen Wert von Var, erhöht ihn und schreibt ihn. Thread1 liest ebenfalls den ursprünglichen Wert, erhöht diesen ebenfalls und überschreibt damit den von Thread2 erhöhten Wert. Der Grund liegt darin, dass die zeitliche Abfolge nicht abgestimmt ist. Die Änderung von Thread2 ist wirkungslos, sein *Update* wird verloren (*lost*).

Im Folgenden inkrementieren zwei Threads den Wert einer globalen Variable jeweils 10 Millionen mal (Beispiel DataRace):

```c++
#include <iostream>
#include <thread>
using namespace std;
  
class LostUpdate {
private:
    static int count;                     // geteilte Variable
public:
    static int getCount() { return count; }
  
    void operator()() {
        for (int i = 1; i <= 10000000; i++)
            count++;
    }
};
int LostUpdate::count = 0;                // init shared memory
  
int main() {
    LostUpdate obj1;
    LostUpdate obj2;
  
    cout << "LostUpdate Problem: ";
    cout << "2 Threads Increment Shared Memory (each 10000000 times)." << endl;
    cout << "... Result should be: 20000000" << endl;
  
    cout << "... Before incr: Shared memory= " << LostUpdate::getCount() << endl;
  
    thread t1(obj1);
    thread t2(obj2);
  
    t1.join();
    t2.join();
  
    cout << "... After incr: Shared memory= " << LostUpdate::getCount() << endl;
  
    return 0;
}
```

Die Ursache: die Berechnung *count++* wird unterbrochen. Man bezeichnet Abschnitte, die nicht unterbrochen werden dürfen **krititsche Abschnitte**/**Critical Section**. Eine einfache Lösung für dieses Problem: die Berechnung darf nicht unterbrochen werden. Dieses Vorgehen kann mittels **Sperr-Synchronisation** erfolgen - der Abschnitt wird für Threads gesperrt, wenn er von einem Thread bearbeitet wird.

## Mutex

(Mutual Exclusion) Die `mutex`-Klasse bietet dazu einen *Mutex* an. Mit einem Mutex kann eine Sperrung erwirkt werden (*lock*). Damit wird dieser Programm-Abschnitt nicht von einem weiteren Thread begonnen. Kommt ein Thread zu einem gesperrten Mutex, dann wartet dieser Thread an dieser Stelle bis der Mutex wieder entsperrt wird, sperrt ihn dann und beginnt den Abschnitt. Erst mit einer Freigabe (*unlock*) im Folgenden, kann dieser Abschnitt wieder von einem anderen Thread durchlaufen werden.

Aufbau:

```c++
#include <mutex>         // header
...
std::mutex mu;           // Mutex definieren
...
mu.lock();               // sperren
...                      // gesperrter Bereich
mu.unlock();             // entsperren
```

> [!EXAMPLE]
```c++
#include <iostream>
#include <mutex>
#include <thread>
using namespace std;

class LostUpdate {
private:
    static int count;    // shared memory
    static mutex m;

public:
    static int getCount() { return count; }

    void operator()() {
        for (int i = 1; i <= 10000000; i++) {
            m.lock();    // !!!!!!!!!!!!!!!!!!!!
            count++;
            m.unlock();  // !!!!!!!!!!!!!
        }
    }
};
// init shared memory
int LostUpdate::count = 0;
mutex LostUpdate::m;

int main() {
    LostUpdate obj1;
    LostUpdate obj2;

    cout << "LostUpdate Problem: 2 threads increment shared memory (each by "
            "10000000)." << endl;
    cout << "... Result should be: " << "20000000" << endl;

    cout << "... Before incr: Shared memory= " << LostUpdate::getCount() << endl;

    thread t1(obj1);
    thread t2(obj2);

    t1.join();
    t2.join();

    cout << "... After incr: Shared memory= " << LostUpdate::getCount() << endl;

    return 0;
}
```

Mit Mutex kann auch sichergestellt werden, dass zwei parallele Threads gleich schnell/häufig einen kritischen Bereich ausführen. Wird ein Bereich gesperrt, wartet der konkurrierende Thread auf die Zuteilung, wird dieser Bereich verlassen betritt der Wartende.

Problem: wenn innerhalb des kritischen Bereichs eine Exception auftritt, wird unlock nicht mehr ausgeführt und der Bereich wird nicht wieder betretbar - **Deadlock**.

--> moderner Ansatz: Mutex sollen nicht direkt verwendet werden. Alternativ:

```c++
//mu.lock();         // so besser nicht
std::lock_guard<std::mutex> guard(mu);	// besser so
...
//mu.unlock();       // so besser nicht
```

Mit dieser Variante, wird ein lokaler Mutex definiert, wenn dieser Bereich (Scope) verlassen wird (verlassen wird auch durch eine Exception), dann wird diese lokale Variable freigegeben und der Mutex entsperrt. Nochmal alternativ:

```c++
std::unique_lock<std::mutex> lck(mu);
```

(Verwendung siehe Unten: mit diesem sind weitere Funktionen verfügbar).

Eine weitere **Deadlock** Situation (bleibende Sperre) kann erfolgen, wenn sich eine Funktion innerhalb dieses Bereichs selber rekursiv aufruft.

Mutex arbeiten mit einer Sperre des kritischen Bereichs (daher mutual exclusion = gegenseitiges Ausschließen).