# Initialisierung

Allgemein werden die folgenden drei Begriffe unterschieden:

- Deklaration	erklärt den Typ und Namen einer Variable
- Definition	erklärt den Typ und Namen einer Variable und reserviert darüber hinaus noch Speicherplatz für die Variable
- Initialisierung	erstmalige Belegung mit einem Wert.

Sehr häufig werden diese drei Vorgänge (oder Teile davon) gleichzeitig durchgeführt, etwa:

```c++
int c=3;  // hier: definiert (Speicher reserviert), deklariert (c=int) und initialisiert (c=3)
```

Gerade für C/C++ ist kennzeichnet, dass es nicht initialisierte Variable geben kann. Wenn das nicht notwendig ist, kann darauf verzichtet werden, der Vorgang nimmt Zeit in Anspruch (eventuell Array mit 10000 Plätzen, dann müssen 10000 *int*-Werte geschrieben werden). 

> Auf alle Fälle Initialisieren wenn notwendig, wenn nicht notwendig: nicht initialisieren.

Klassisch kann so initialisiert werden:

```c++
int num1 = 3;       // hier wird deklariert/definiert/initialisiert
int num2;           // hier wird deklariert/definiert
num2 = 4;           // Zuweisung (keine Initialisierung!)
extern int num3;    // reine Deklaration - es wird "erklaert": num3 ist ein int, wird aber woanders definiert
```

Je nach Konstruktoren können auch Objekte initialisiert oder nicht initialisiert sein. Grundsätzlich ist es *Good-Practice* - Objekt-Member müssen initialisiert werden.

Eine ebenfalls veraltete Methode für die Initialisierung:

```c++
class myInt{
  myInt(int i):m_i(i){}
  myInt():m_i(0){}					// leerer Konstruktor -> m_i = 0
  int m_i;
};
...
myInt ob1(12);
myInt ob2();
```

Bei der Verwendung des Objekts *ob2* bekommt man einen Fehler. Der Grund: die Zeile `myInt ob2()` wird als Funktionsdeklaration interpretiert. Dieses Verhalten ist als **Most Vexing Parse** (https://en.wikipedia.org/wiki/Most_vexing_parse) bekannt.

## {}-Initialisierung

Seit C++11 gibt es die {}-Initialisierung:

```c++
int arr1[]= {1,2,3,4,5};			// klassisches Array

vector<int> arr2{1,2,3,4,5};	// Initialisierung von Objekten, hier STL-Lib-Vektor

const int* ptr= new const int[3]{1,2,3};

int num1{3};			// num = 3
int num1{};       // num = 0

std::string str{};  			// str -> ""
std::vector<float> vec{}; // vec -> leerer Vektor

int num2{2.74};		// muss zumindest eine Warnung generieren weil float->int
                  // nicht automatisch passieren darf
```

Das letzte Beispiel soll zeigen: so sind Variable zu initialisieren. Sollte jemand den Typ nachträglich verändern wird zumindest eie Warnung generiert, dass die Initialisierung auch angepasst werden muss.

Standard-Initialisierung in Klassen:

```c++
class array{
public:
  array(): m_dta{1,2,3,4,5}{}    
  int m_dta[5];
};
...

array arr;		      // Aufruf des Standard-Initialisierers oben
array arr{1,2,3};		// direkte Initialisierung der public-Member-Attr
```

### Initialisierungslisten-Konstruktoren

Ein Konstruktor kann beliebige Objekte aufnehmen und mittels *Initialisierungsliste* aufgenommen werden:

```c++
class myCls {
  myCls(initializer_list<int> argv) {
    for (int i=0; i!=argv.size(); i++)
      cout << argv.begin()[i] << " ";
  }
}
...
myCls c1{1,2};						// Ausgabe: 1 2
myCls c1{1,2,3,4,5};			// Ausgabe: 1 2 3 4 5
```

Die *Initializer*-Liste bietet lediglich die Funktionen *begin()*, *end()* und *size()*.

Wenn ein Container implementiert werden soll, dann kann der Typ der *initializer_list* auch der *Typname* des Templates sein:

```c++
template<typename T>
class myCls {
  myCls(initializer_list<T> argv) { ...
```

## Konstruktor

In C++ können Konstruktoren unterschiedliche aufgerufen werden

```c++
E e1; 			 // Constructor E()
E e2 = E();	 // Constructor E()
E e3 = E{};  // Constructor E()
E e4[2];		 // E() fuer beide Array-Elemente
E* p = new E[2]; // E() fuer beide Array-Elemente
E e5();			 // NICHT ERLAUBT
E e6 {1};		 // Constructor E(int)
E e7 {1,2};	 // Constructor E(int,int)
E e8(1,2,3); // Constructor E(int,int)
E e9 = 1;		 // Constructor E(int) nur wenn Konstruktor nicht explicit
E e0(e1);		 // Copy-Constructor erzeugt eine (evtl. flache) Kopie von e1 
```

Konstruktoren können außerdem als *inline*, *explicit*, *friend* or *constexpr*).

### Explizite Konstruktoren

Ein Konstruktor kann **implizit** Argumente konvertieren, damit er aufgerufen werden kann. Initialisierung mittels = wird **Kopierinitialisierung** genannt (damit wird eine Kopie des Initialisierers in das initialisierte Objekt geschrieben). 

```c++
myCls c1 = 1;				// implizit 1)
myCls c2 = {1};			// implizit 2)
myCls c3 = {1,2};		// implizit 3)
```

1. (Kopierinitialisierung) es wird nach einem Konstruktor gesucht, dem ein Argument genügt (entweder nur 1 Parameter oder mehrere mit Standardargumenten). Für diesen einen Parameter wird weiter versucht den 1er auf den entsprechenden Typen zu konvertieren. Wenn das möglich ist funktioniert diese Initialisierung.
2. genau gleich wie 1
3. Analog zu den vorherigen Fällen, hier wird lediglich versucht 2 Parameter zu konvertieren.

Mit dem *explicit*-Schlüsselwort kann auf eine **explizite** Umwandlung bestanden werden. Damit sind die eben gezeigten Fälle nicht erlaubt (für den Konstruktor vor welchem dieses Schlüsselwort steht).

```c++
myCls c1 {1};			// explizit, sucht Konstruktor myCls(int)
myCls c2 {1,2};	  // explizit, sucht Konstruktor myCls(int,int)
```

Für diese Fälle sind passende Konstruktoren notwendig (auch mit Standardwerten möglich),  die Initialisierung erfolgt explizit (keine Kopierinitialisierung).

Diese Fälle wirken ein wenig konstruiert, für Funktionsaufrufe ist die Sache oft entscheidender:

```c++
void myFunc(myCls c);
....
myFunc(1);		// myCls-Parameter wird implizit Konvertiert (wenn zulaessig)
```

mit diesem Funktionsaufruf wird für den Funktionsparameter eine implizite Konvertierung vorausgesetzt. Mit *explicit* kann dieser Aufruf unterbunden werden, dann funktionieren nur Varianten von:

```c++
myFunc(myCls{1});			// expliziter Aufruf
```

Wenn überhaupt kein Konstruktor vorhanden ist, dann funktioniert:

```c++
myCls c {1,2,"abc"};
```

sofern die Klasse *myCls* als erste 3 Member *int*, *int* und *const char\** beinhaltet.

## Regeln

- C.42 wenn ein Konstruktor auch ungültige Objekte erzeugen kann, dann Exception auslösen

- C.46 Konstruktoren mit nur einem Parameter immer *explicite* definieren (außer bewusst nicht gewünscht), ansonsten kann die "versehentliche" Zuweisung funktionieren:

  ```c++
  class String {
  public:
      explicit String(int);  // explicit
      // String(int);        // implicit
  };
  String s = 10;             // error because of explicit
  ```

  