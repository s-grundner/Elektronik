# 2 Os - Threads - C

https://www.heise.de/select/ix/2017/5/1492877730281965



Seit C++11 gibt es von C++ Unterstützung durch *std::thread*. Davor war Multi-Threading ausschließlich durch direkte OS-APIs möglich. Für Unix-Varianten ist nach wie vor *pthread* sehr präsent. Diese Bibliothek repräsentiert das Standard-POSIX-API. Allgemein ist zu bemerken, dass sich das Verhalten von Threads je nach verwendetem OS unterscheiden kann.

Für *std::thread* muss zumindest mit C++11 Unterstützung kompiliert werden: `-std=c++11`

## thread - Klasse

In C++ (seit C++11) gibt es die Klasse *thread*:

```c++
...
#include <thread>
...
static void myFunc() {...}
...
std::thread myThread(myFunc);
...
```

- Kompilieren mit Option `-std=c++11` (oder später)
- *include* von *thread*
- Konstruktor des Objekts *myThread* mit der Funktion *myFunc*, die Funktion wird automatisch sofort gestartet
- Mit dem Thread-Objekt kann der Thread dann gesteuert werden (gestoppt ...)
- Die Funktion muss statisch sein, sie wird ja unabhängig vom weiteren Hauptprogramm laufen.

Mit *join()* kann ein Thread auf das Ende eines zweiten Threads warten:

```c++
myThread.join();
```

Dadurch stoppt das Programm an dieser Stelle und wartet auf das Ende von *myThread*.
Wenn ein Thread-Objekt zerstört wird und dessen Ende nicht mittels *join()* überwacht wurde, dann wird das Thread-Objekt im Destruktor mittels *std::terminate* und einer Fehlermeldung beendet. Alternativ zu *join()* kann der Member *detach()* aufgerufen werden. Damit läuft der Thread unabhängig weiter. In jedem Fall werden beim Beenden eines Programms (Haupt-Thread) sämtliche Threads sofort beendet.

### Funktion mit Parametern

Wenn die Funktion, die mittels Thread neu gestartet wird, Aufrufparameter hat, dann:

```c++
...
#include <thread>
...
static void myFunc(int num, char *str) {...}
...
std::thread myThread(myFunc, 1, "Hellau");
...
```

- die Parameter werden nach Angabe der Funktion in der richtigen Reihenfolge aufgelistet.

### Funktion mit Lambda-Ausdruck

Wenn *nur* eine einfache Funktion laufen soll, kann die abgekürzt mittels Lambda-Ausdruck angegeben werden:

```c++
...
#include <thread>
...
std::thread myThread([](){ <==code==> });
...
```

- an der Stelle `<==code==>` wird der Code eingefügt, z. B.:

  ```c++
  std::thread myThread([](){ cout << "Hello World!"; });
  ```

- in der runden Klammer () werden eventuelle Funktionsparameter angegeben (int start ...) und nach dem $\lambda$-Ausdruck mit dem Wert.
- in der eckigen Klammer können gesammelt lokale Attribute durchgereicht werden.

Es muss daher keine eigene Funktion geschrieben werden (wenn sie sonst nirgendwo Verwendung findet).

### Funktionsobjekte in Threads

Zum Kapseln von mehr Daten kann einem Thread ein Objekt mitgegeben werden:

```c++
...
#include <thread>
...
MyCls myObj(...);
...
std::thread myThread(myObj);
...
```

Die Klasse des *myObj*-Objekts muss dafür den Funktions-Operator Überschreiben (die Klasse nennt man in diesen Fällen dann einen *Funktor*):

```c++
void operator()() { ... }
```

Beim Thread-Start wird dieser dann ausgeführt.

### Scheduling - Punktstrich

Wie das Betriebssystem Threads Rechnerzeit zuteilt, kann einfach wie folgt dargestellt werden

- ein Thread gibt in einer Dauerschleife "|"
- ein zweiter Thread gibt dauerhaft "."

aus:

```c++
class PunktStrich {
private:
    string s;
public:
    PunktStrich(string s) {
        this->s = s;
    }
    void operator()() {
        while (true) {	// Dauerschleife
            cout << s;
        }
    }
};

int main() {
    PunktStrich obj1(".");
    PunktStrich obj2("|");
    thread t1(obj1);
    thread t2(obj2);

    while (true) ;

    return 0;
}
```

## future/async

(ab C++11)

- thread ist eine Klasse und hat keinen Rückgabewert:

  ```c++
  thread myThread(func);
  ```

- Mit `async` kann ebenfalls ein Thread gestartet werden. Es ist eine Funktion und kann etwas zurückgeben:

  ```c++
  #include <future>
  ...
  future<int> fu = async(func);
  // Alternative Schreibweise:
  // future<int> fu( async(func) );
  ```

  Die Funktion wird in einem eigenem Thread ausgeführt. Damit ist das Ergebnis bei der Abarbeitung dieser Zeile nicht zwangsläufig verfügbar. Hier wird ein Versprechen für die Zukunft (*future*) abgegeben, dass in `fu` ein Wert verfügbar sein wird (`future` ist eine *Template*-Klasse, hier wird ein `int` zurückgegeben werden).

  > Für `future`-Variable wird zugesichert, dass sie spätestens bei Aufruf von `.get()` verfügbar sind.

  Wenn später der Wert von `fu` benötigt wird, dann wird er mittels
  
  ```c++
  fu.get();
  ```
  
  zugewiesen. Eventuell ist zu diesem Zeitpunkt der Wert im parallelen Thread schon berechnet worden, ansonsten wird an dieser Stelle der Programmverlauf angehalten bis der Rückgabewert verfügbar ist.

Starten eines Threads, hier wird mit der Funktion `void` zurückgegeben (nichts):

```c++
#include <future>
#include <iostream>
using namespace std;

void func() {
    cout << "Nachricht aus Async-func" << std::endl;
}

int main() {
    future<void> result( async(func));
    cout << "Message from main." << std::endl;
    result.get();
    return 0;
}
```

Mit `get()` wird auf den Rückgabewert (Beendigung des Threads) gewartet.

Für die Rückgabe eines Berechnungswerts:

```c++
#include <future>
#include <iostream>
using namespace std;

int func(int a, int b) {
    return a+b;
}

int main() {
    future<int> result( async(func, 30, 20));
    cout << "Berechnung gestartet ..." << endl;
    cout << "Ergebnis: " << result.get();
    return 0;
}
```

## promise

(ab C++11)

Bei der Konfiguration eines Threads mussten bislang die Aufrufparameter bekannt sein. Sollte ein Parameter noch nicht bekannt sein, kann ein Versprechen (*promise*) abgegeben werden, dass der Wert für die Ausführung geliefert werden wird:

```c++
#include <future>
...
promise<int> prom;                    // Versprechen: prom wird verfuegbar sein
future<int> fu = prom.get_future();	  // fu wird verfuegbar sein - Versprochen
```

An die Thread-Funktion kann dieser future-Wert als Referenz-Parameter mitgegeben werden. Damit wird der Funktion versprochen: wenn sie den Wert benötigen wird, dann wird er ihr zur Verfügung gestellt. Wird er in der Funktion dann tatsächlich benötigt, dann wird er wiederum mit `.get()` abgerufen:

```c++
#include <iostream>
#include <future>
using namespace std;
int fact(future<int> &in) {                   // Param: Referenz auf zukuenft. Wert
    int res = 1;
    int val = in.get();                       // hier wird auf den future-Wert gewartet
    for (int i = 1; i <= val; i++)
        res *= i;
    return res;
}
int main() {
    promise<int> prom;                        // Versprechen: prom wird befuellt sein
    future<int> x = prom.get_future();        // Future: in Zukunft wird ein x da sein
    future<int> fu = async(fact, ref(x));     // Thread starten mit Referenz auf Zukunft
    prom.set_value(10);                       // Jetzt wird Versprechen eingehalten
    cout << 10 << "! = " << fu.get() << endl; // Rueckgabewert der Funktion
}
```

(wenn einer Thread-Funktion eine Referenz mitgegeben werden soll, dann muss `ref(x)` verwendet werden - [Link](http://jakascorner.com/blog/2016/01/arguments.html))

Dieser Ablauf hat dann Sinn wenn:

- vor dem *in.get()* in der Funktion ein nennenswerter Aufwand abgearbeitet wird. Der parallele Thread kann dann schon Vorarbeit leisten bis aus dem Hauptprogramm ein Versprochener Wert eintrifft.
- Für die Berechnung des versprochenen Werts (hier wird direkt nach der Konfiguration der konstante Wert 10 zugewiesen *prom.set_value(10)*) ein Aufwand notwendig ist.

## jthread

ab C++20 sind `jthread` verfügbar, diese Threads beenden automatisch mit der aufrufenden Funktion und können unterbrochen werden. In den aktuellen Compiler-Versionen

- clang version 12.0.0
- g++ (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0

ist `jthread` nicht implementiert.

## Fragen

- Unterschied Thread/Prozess
- Wird eine Berechnung durch das Aufteilen auf mehrere Threads schneller (wodurch/warum/wann/wann nicht...)?
- Unterschied Join/Detach
- Unterschied Thread/Async

## Referenzen

- Async/Future
  https://solarianprogrammer.com/2012/10/17/cpp-11-async-tutorial/

- Video Async/Future/Promise:
  https://www.youtube.com/watch?v=SZQ6-pf-5Us