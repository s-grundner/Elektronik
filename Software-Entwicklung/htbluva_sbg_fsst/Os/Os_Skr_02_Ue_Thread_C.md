# 2 Os - Threads - C - Übungen

## Hilfsklassen

#### Anzahl von Cores

- Anzahl maximal möglicher (wirklich) paralleler Threads: ` std::thread::hardware_concurrency()` (= Anzahl an Cores), Ansonsten wird quasiparallel gearbeitet.

#### Zeitmessung

- Timer-Klasse:

  ```c++
  #ifndef TIMER_H
  #define TIMER_H
  
  #include <chrono>
  #include <string>
  using namespace std;
  
  class Timer {
  private:
      static chrono::steady_clock::time_point start;
  public:
      static void reset() {
          start = chrono::steady_clock::now();
      }
      static double getTime() {
          chrono::duration<double> dur = chrono::steady_clock::now() - start;
          return dur.count();
      }
  };
  chrono::steady_clock::time_point Timer::start = chrono::steady_clock::now();   // Init der stat-Var. start
  
  #endif // TIMER_H
  ```

- Verwendung:

  ```c++
  Timer::reset();
  cout << "Aufwaendige Berechnung ..." << endl;
  for (size_t i = 0; i < 1000000000; i++) {
      ;
  }
  cout << "Dauer: " << Timer::getTime() << endl;
  ```


## Funktion als Thread

Erstellen Sie eine Funktion `up` die eine statische Variable `mCtr` inkrementiert und in die Konsole ausgibt. Eine zweite Funktion `down` dekrementiert die selbe statische Variable `mCtr` und gibt sie ebenfalls in die Konsole aus. Führen Sie die beiden Funktionen in separaten Threads aus.

```c++
int m_num = 100;

int up() {
    while(m_num > 0)
        cout << endl << m_num++;
}
int down() {
    while(m_num > -10)
        cout << endl << m_num--;
}

int main() {
    thread myThread1(down);
    thread myThread2(up);

    myThread1.join();
    myThread2.join();

    return 0;
}
```

Was kann aus der ausgegebenen Folge geschlossen werden.

## Funktion mit Parametern

Erstellen Sie eine `countDown`-Funktion zum Zählen von einem gegebenen Wert bis auf 0. Geben Sie die Zahlen in der Konsole aus.

```c++
#include <iostream>
#include <thread>

using namespace std;

void countDown(int ctr) {
    while(ctr > 0)
        cout << endl << ctr--;
}

int main() {
    thread myThread(countDown, 100);
    myThread.join();

    return 0;
}
```

## Funktion mit Lambda-Ausdruck

Erstellen Sie einen Countdown mittels Lambda-Ausdruck.

```c++
#include <iostream>
#include <thread>

using namespace std;

int main() {
    int ctr = 17;
    thread myThread([](int num){
        for (int i = num; i >= 0; i--)
            cout << i << endl;
    }, ctr);

    myThread.join();

    return 0;
}
```

## Klassen in Threads

In vielen Applikationen wird der Zugriff auf Dateien in eigene Threads verschoben (um durch diesen vergleichsweise langsamen Zugriff etwa eine GUI nicht zu blockiert).

```c++
#include <thread>
#include <fstream>
#include <string>
#include <iostream>

using namespace std;

class File {
private:
    string m_fname;
    string m_cont;
public:
    File(string fname) : m_fname(fname) {}
    void operator()() {
        ifstream ifs(m_fname);
        m_cont = string((istreambuf_iterator<char>(ifs)),
                       (istreambuf_iterator<char>()));
        cout << m_cont << endl;
    }
};

int main() {
    File myObj("./data.txt");
    thread myThread(myObj);
    myThread.join();

    return 0;
}
```

## Scheduling - Punktstrich

Wie das Betriebssystem Threads Rechnerzeit zuteilt, kann einfach so dargestellt werden:

- ein Thread gibt in einer Dauerschleife "|"
- ein zweiter Thread gibt dauerhaft "." aus

Testen Sie das gegebene Programm.

```c++
#include <iostream>
#include <string>
#include <thread>
using namespace std;

class PunktStrich {
private:
    string m_s;
public:
    PunktStrich(string s) {
        m_s = s;
    }
    void operator()(){
        while (true) {cout << m_s;}
    }
};

int main() {
    PunktStrich obj1(".");
    PunktStrich obj2("|");
    thread t1(obj1);
    thread t2(obj2);

    while (true);

    return 0;
}
```

Was wird durch dieses Beispiel deutlich?

## Scheduling - Zeitaufwand (705)

Ermitteln Sie ob eine Berechnung schneller erfolgt, wenn in parallelen Threads gearbeitet wird, oder wenn parallele Threads laufen:

```c++
#include <iostream>
#include <thread>
#include <vector>
using namespace std;

#include "timer.h"

#define SIZE 10000000

static vector<int> vdata(SIZE);
static long long sum1 = 0;
static long long sum2 = 0;
static long long sum = 0;

void thread_function1(unsigned int x, unsigned int y) {
    sum1 = 0;
    for (size_t i = x; i <= y; i++) {
        sum1 += vdata[i];
    }
}

void thread_function2(unsigned int x, unsigned int y){
    sum2 = 0;
    for (size_t i = x; i <= y; i++) {
        sum2 += vdata[i];
    }
}

int main(){
    cout << "Berechnung der Quersumme eines Vektors" << endl << endl;

    for (size_t i = 0; i < SIZE; i++) {
        vdata[i] = i;
    }

    Timer::reset();
    cout << "Starte Loesung mittels 2er Threads" << endl;

    thread t1(thread_function1, 0, SIZE / 2);
    thread t2(thread_function2, SIZE / 2 + 1, SIZE - 1);
    t1.join();
    t2.join();

    sum = sum1 + sum2;
    cout << " Ergebnis: Summe= " << sum << endl;
    cout << " Berechnungsdauer: " << Timer::getTime() << "s\n";

    cout << endl << endl;

    Timer::reset();
    cout << "Starte Loesung mittels einzelnem Thread" << endl;
    sum = 0;
    for (size_t i = 0; i < SIZE; i++) {
        sum += vdata[i];
    }

    cout << " Ergebnis: Summe= " << sum << endl;
    cout << " Berechnungsdauer: " << Timer::getTime() << "s\n";

    return 0;
}
```

Warum ist welche Variante Schneller/Langsamer?

- Wechseln Sie beim Compilieren eventuell zwischen Debug- und Release Variante (Compiler-Switch -g).
- Ändern Sie das Programm ab indem Sie in den Thread-Funktionen die Zwischenergebnisse nicht direkt in der statischen Variable summieren sondern in einer lokalen und weisen Sie erst am Ende der Funktion das Ergebnis der statischen Variable zu
- Prüfen Sie ob ein Aufteilen auf 4 Threads eine Verbesserung bringt

--> das simple Verwenden mehrerer Threads führt nicht zwangsläufig zu einer Beschleunigung

## Schedulling - Zeitaufwand future/async (706)

Ermitteln Sie ob eine Berechnung schneller erfolgt, wenn in parallelen Threads gearbeitet wird, oder wenn parallele Threads laufen:

```c++
#include <future>
#include <iostream>
#include <vector>
using namespace std;

#include "timer.h"

#define SIZE 100000000

static vector<int> vdata(SIZE);
static long long sum1 = 0;
static long long sum2 = 0;
static long long sum = 0;

long long async_function(unsigned int x, unsigned int y) {
    long long sum = 0;
    for (size_t i = x; i <= y; i++) {
        sum += vdata[i];
    }
    return sum;
}

int main() {
    cout << "Berechnung der Quersumme eines Vektors" << endl << endl;

    for (size_t i = 0; i < SIZE; i++) {
        vdata[i] = i;
    }

    Timer::reset();
    cout << "Starte Loesung mittels 2er Async Futures" << endl;

    future<long long> future_sum1 =
        async(std::launch::async, async_function, 0, SIZE / 2);
    future<long long> future_sum2 =
        async(std::launch::async, async_function, SIZE / 2 + 1, SIZE - 1);

    sum1 = future_sum1.get();
    sum2 = future_sum2.get();
    sum = sum1 + sum2;

    cout << " Ergebnis: Summe= " << sum << endl;
    cout << " Berechnungsdauer: " << Timer::getTime() << "s\n";

    cout << endl << endl;

    Timer::reset();
    cout << "Starte Loesung mittels einzelnem Thread" << endl;
    sum = 0;
    for (size_t i = 0; i < SIZE; i++) {
        sum += vdata[i];
    }

    cout << " Ergebnis: Summe= " << sum << endl;
    cout << " Berechnungsdauer: " << Timer::getTime() << "s\n";

    return 0;
}
```

