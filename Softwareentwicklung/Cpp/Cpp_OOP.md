---
tags: ["Cpp"]
aliases: []
created: 29. November 2022
---

# 4 OOP - Objektorientierung

Beziehungen von Klassen zueinander:

- *is-a*-Beziehungen: Generalisierung, Spezialisierung; Ausdruck durch Vererbung
- *part-of*-Beziehung: Aggregation (beliebig), Komposition (streng); Zusammensetzung einer Klasse aus anderen Klassen

## Kapselung

Prinzip: Zusammenfassen von Variablen und Funktionen (Member) in einen Datenverbund (Klasse).

- eine *Klasse* entspricht einem Datentyp.
- ein *Objekt* ist eine Variable deren Typ eine Klasse ist.
- Die Variablen in einer Klasse werden als *Member-Variable* bezeichnet
- Die Funktionen in einer Klasse werden als *Member-Methoden* bezeichnet

Klassendefinition durch *class*:

```c++
class Rectangle {       // Class Rectangle (=Datatype)
public:
    int mLength;       // Member-Variable / Atribute / Field
    int mWidth;
};                      // Don't forget Semicolon
```

Erzeugen eines Objekts (wie Definition einer einfachen Variable):

```c++
Rectangle r1;           // Variable (Object) of Type (Class) Rectangle
// Create Pointer + Object:
Rectangle *ptrRect = new Rectangle();
// with new created -> has to be deleted with delete (Heap-Var)
```

Auf die Variablen/Methoden von Objekten kann mittels Punkt-Operator zugegriffen werden:

```c++
obj.mVar = 3;			// if mVar public
```

Auf die Variablen/Methoden von Zeigern auf Objekte kann mittels -> Operator zugegriffen werden (gleich wie bei Strukturen):

```c++
ptr = &obj;
ptr->mVar = 3;			// if mVar public
```

Wenn *ptr* durch *new* erstellt wurde, dann darf das *delete* nicht vergessen werden:

```c++
Rectangle *ptr = new Rectangle();
...
delete ptr;
```

### Methoden

Member-Methoden:

```c++
class Rectangle {
public:
    int mLength;						// Member-Variable
    int mWidth;
    void init(int length, int width) {	// Member-Method
      mLength = length;
      mWidth = width;
    }
};
```

Methoden können (wie Funktion auch) Default-Parameter besitzen:

```c++
class Account {
  ...
  Account(string owner, double balance, int num = -1);
  ...
}
```

Wenn für den letzten Parameter kein Wert mitgegeben wird, dann wird in der Methode der Default-Wert verwendet. Im angeführten Beispiel: num = -1.

#### Konstruktor

(C++11 und Initialisierung: `int i {3};` - stärkere Typprüfung (kein Auto-Cast) daher empfohlen.)

Konstruktor: wird automatisch beim Erzeugen eines Objekts aufgerufen. Er hat den gleichen Name wie die Klasse aber keinen Rückgabewert; z.B. Rechteck().

Wenn kein Konstruktor definiert wird, gibt es einen impliziten Default-Konstruktor. Wenn mindestens ein Konstruktor mit Aufrufparameter definiert wird, dann wird der implizite Default-Konstruktor nicht mehr zur Verfügung gestellt. Es sind dann keine Objekte mehr erstellbar ohne Angabe der notwendigen Parameter:

```c++
Cls obj1(3);
Cls obj2 = 3; 				// Alternative Schreibweise
Cls obj3 = Cls(3);			// ruft Copy-Konstruktor auf
Cls obj4 = Cls{4};			// ruft Copy-Konstruktor auf
Cls obj5(obj4);             // ruft Copy-Konstruktor auf
Cls obj6{3};				// abgekuerzte C++11 Init.-Schreibweise
```

Es wird das Objekt obj1 bis obj5 der Klasse Cls erzeugt. Dabei wird dieser Konstruktor ausgeführt:

```c++
Cls(int x) { ... }
```

Die alternative Schreibweise funktioniert nur für einen Parameter und nur wenn das Schlüsselwort *explicit* nicht bei der Konstruktor Definition angegeben wurde:

```c++
explicit Cls(int x) { ... }		// Cls obj2 = 3; ist nicht mehr erlaubt wegen explicit
```

Für einfaches Initialisieren funktioniert auch diese Schreibweise:

```c++
Cls(int r, int i) : m_re(r), m_im(i) {}		// m_... sind Member-Var
Cls(int i) : m_re(3), m_im(i) {}
```

Die Trennung erfolgt durch einen Doppelpunkt.  
(Wann immer Member-Attribute nur auf einfache Werte gesetzt werden ist diese Schreibweise zu bevorzugen. Mit dieser Art wird keine lokale Variable angelegt - damit ist die Ausführung effizienter.)

Auch Konstruktoren können beim Prototypen Default-Werte vorgegeben werden:

```c++
Cls(int r, int i = 3);
```

In C++ ist automatisch ein **Copy-Konstruktor** verfügbar. Um diesen Konstruktor zu verbieten, kann er explizit deklariert (Prototyp genügt) und in den `private` Bereich gesetzt werden:

```c++
Cls(const Cls &rhs);
```

Mittels eines solchen Copy-Konstruktors, kann auch die Funktion angepasst werden (notwendig für *Deep Copy* anstatt *Shallow Copy*).

Grundsätzlich ist die {}-Form der Initialisierung die empfohlene:

```c++
Cls obj4 = Cls{4};
```

Der Grund ist dass dadurch keine Kopie des Werts erzeugt. Der Parameter wird direkt in den Konstruktor geschrieben (Effizient). Im Gegensatz dazu:

```c++
Cls obj4 = cls(3);
```

ruft den Copy-Konstruktor auf.

#### Destruktor

Hat den gleichen Namen wie die Klasse mit vorangestellter Tilde; z.B. ~Rechteck(). Ein Destruktor darf niemals einen Aufrufparameter haben und niemals im private Bereich stehen. Ein Destruktor wird automatisch bei der Löschung eines Objektes aufgerufen. Wird ein Objekt als Variable definiert geschieht das beim nächsten Schließen einer geschwungenen Klammer \}. Für globale Objekte passiert das beim Verlassen der Main-Methode. Für dynamisch erzeugte Objekte wird der Destruktor mit dem Aufruf von *delete* ausgeführt.

```c++
~Cls() { ... }
```

#### Const

Methoden die nur lesend auf Member zugreifen, sollen das Attribut *const* hinten anstellen:

```
int fct(...) const;
```

#### Referenzen

In Funktionsparametern können in C++ Referenzen übergeben werden:

```c++
char func(int &param) {
```

Ein wesentlicher Unterschied dabei ist, dass der Parameter dadurch innerhalb der Funktion verändert werden kann (*Call-By-Reference*). Eine weitere Folge dieses Aufrufs ist, dass der Parameter beim Eintritt in die Funktion nicht kopiert werden muss und gerade wenn der Parameter sehr groß ist dass für die Performance durchaus relevant ist (wenn es eine Klasse ist, dann wird dabei der Copy-Konstruktor aufgerufen). Außerdem wird beim Verlassen der Funktion durch Auflassen der Kopie der Destruktor aufgerufen. Soll der Parametern lediglich aus Performance-Gründen als Referenz übergeben werden, dann wird mit *const* erweitert:

```c++
char func(const int &param) {
```

Damit wird beim Eintritt keine Kopie angefertigt, der Inhalt der Variable kann trotzdem nicht verändert werden.

### This

In Member-Methoden ist automatisch mit *this* ein Zeiger auf das eigene Objekt verfügbar:

```c++
this->val = 3;			// -> Operator weil this ein Zeiger ist
```

Damit kann eine Member-Variable oder eine Member-Funktion referenziert werden. Notwendig ist das, wenn eine Membervariable überschrieben wurde (z.B. mit einer lokalen Variable).

### Static

Member-Variablen und Member-Methoden kann das Attribut *static* vorangestellt werden. Statische Member haben keinen Objektbezug, es sind **Klassenfelder** bzw. **Klassenmethoden**.

```c++
objekt.var1 = 3; 		// var1 gehört zum Objekt --> kann nur Non-Static sein
klasse::var2 = 4;		// var2 kann auch ohne Objekt verwendet werden --> static
```

Statische Variable gibt es nur einmal, nicht statische sind in jedem Objekt unabhängig verfügbar.

Beispiel:

```c++
class Christmas {
private:
    static int numObj;
...
```

Statische Member-Variable können wie globale Variable außerhalb von Methoden mit Angabe der Klasse initialisiert werden:

```c++
int Christmas::anzObjekte = 0;
```

Analoges gilt für Klassenmethoden, sie werden mit einer Angabe für die Klasse angeführt `myCls::doit()`.

### Sichtbarkeitsmodifikatoren

Grundlegend in der OOP ist das Verbergen von Membern. Einerseits um die Übersicht zu verbessern und andererseits um Parameter vor Zugriff schützen zu können.

- **public**: Member ist für jeden verwendbar (lesen/schreiben/ausführen). In einer abgeleiteten Klasse können diese Member so verwendet werden als ob sie direkt in der Klasse definiert seien. Mit jedem aus der Basis-Klasse oder abgeleiteten Klasse erzeugten Objekt kann der Member ebenfalls verwendet werden.
- **private**: auf diesen Member kann weder mittels Objekten aber auch nicht in abgeleiteten Klassen zugegriffen werden. Der Member wird zwar mit vererbt, kann aber nur über eventuell verfügbare Methoden bearbeitet werden. Wenn kein Modifikator angeführt wird, dann gilt die private Sichtbarkeit.
- **protected**: Member mit diesem Schlüsselwort verhalten sich innerhalb von abgeleiteten Klassen wie *public* Member. Beim Zugriff über Objekte verhalten sich diese Member allerdings wie private Member.

Die Modifikatoren werden bei der Prototypen-Definition angeführt. Um eine einfache Wiederverwendung von Klassen zu ermöglichen, werden Klassen in eigene Dateien gespeichert. Damit können sie über eine Header-Datei in ein Programm eingebunden werden. Die Attribute können auch mehrfach angeführt werden. Typischer Aufbau:

h-Datei:

```c++
#ifndef PERSON_H
#define PERSON_H
using namespace std;
class Person {
public:         // access from everywhere
    Person(int age, string name);
    int getAge() const;
    string toString() const;
protected:      // access from within Person and specialized
    string mName;
private:        // access only from within Person
    int mAge;
};
#endif  // PERSON_H
```

c-Datei:

```c++
#include <iostream>
#include <sstream>
#include "person.h"
using namespace std;
Person::Person(int age, string name) {    // Implementation Constructor
  this->mAge = age;                       // this is a pointer
  this->mName = name;
}
int Person::getAge() const {
  return mAge;
}
string Person::toString() const {
  ostringstream out;
  out << "\nNAME: " << mName << "\nAlter: " << mAge << "\n";
  return out.str();
}
```

- [Cpp_OOP_Vererbung](Cpp_OOP_Vererbung.md)
- [Cpp_OOP_Polymorphismus](Cpp_OOP_Polymorphismus.md)

## [Cpp_Friends](Cpp_Friends.md)

## Referenzen

- Sehr umfassende Einführung

  <http://www.cpp-tutor.de/cpp/le14/ableitung.html>
  
- Gute Erklärungen  
  <https://www.informatikzentrale.de/>