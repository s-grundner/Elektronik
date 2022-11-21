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

#### const

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

### this

In Member-Methoden ist automatisch mit *this* ein Zeiger auf das eigene Objekt verfügbar:

```c++
this->val = 3;			// -> Operator weil this ein Zeiger ist
```

Damit kann eine Member-Variable oder eine Member-Funktion referenziert werden. Notwendig ist das, wenn eine Membervariable überschrieben wurde (z.B. mit einer lokalen Variable).

### static

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

## Vererbung

Ziel soll sein: einmal programmiert - so oft wie möglich verwenden. Die Vorteile sind klar:

- Bequemlichkeit - nicht nochmal das Gleiche programmieren zu müssen
- Sicherheit - Fehler in schon verfügbaren und oft verwendeten Komponenten werden schneller gefunden
- Wartbarkeit - gefundene Fehler oder Verbesserungen die eingebaut werden, sind für alle die die Komponente verwenden sofort verfügbar.

Da eine vorhandene Klasse nicht immer ganz genau zu einem Problem passt, kann eine *ähnliche* Klasse *abgeleitet* und angepasst werden.

- Die Klasse von der abgeleitet wird nennt man **Basisklasse** (Superklasse, Oberklasse, Elternklasse ...)
- Die **abgeleitete Klasse** wird als Subklasse, Unterklasse, Kindklasse ... bezeichnet. Sie besteht aus allem was in der Basisklasse implementiert wurde. Zusätzlich können in ihr Member (Variable und/oder Methoden) überschrieben oder zugefügt werden.

```c++
class Figur {		// Basisklasse Figur
public:
    void sayHello() {	// ist in abgeleiteter Klasse sichtbar
        printf("Hello from Figure ...");
    }
private:
    int mLength;	// ist in abgeleiter Klasse nicht sichtbar (aber vorhanden)
    int mWidth;
};
class Rectangle : public Figur {	 // Rectangle = abgeleitete Klasse (von Basisklasse Figur) - mit public: Sichtbarkeit wird direkt übernommen
  void sayHello() {				// Figur-Klasse sayHello wird überschrieben
    printf("Hello from Rectangle ...");
  }
};
```

Mit dem Sichtbarkeitsmodifikator vor der Basisklasse wird angegeben wie die Elemente der Basisklasse an Klassen weitervererbt werden wenn die abgeleitete Klasse wiederum abgeleitet wird (*public*, *protected* oder *private*). Der angegebene Wert ist die freizügigst erlaubte Art. Beispiel:

- *public* vor der Basisklasse: sämtliche Attribute werden von der Basisklasse genau gleich durchgereicht
- *protected*: public-Member werden auf *protected* reduziert, andere bleiben
  *private*: *public* und *protected*-Member werden auf *private* reduziert, *private* bleibt

### Konstruktor

In abgeleiteten Klassen wird der Konstruktor der Basisklasse automatisch vor dem Konstruktor der abgeleiteten aufgerufen. Wenn in der Basisklasse kein Konstruktor ohne Parameter vorhanden ist, dann muss der Konstruktor mit entsprechenden Parametern aufgerufen werden:

```c++
class Figur {
  Figur(string man) {				// Basiskonstruktor benötigt string
    printf(("Hello from Figure to " + man).c_str());
  }
};
class Rectangle : public Figur {
  Rectangle(string name) : Figur(name) {	// Aufruf Basiskonstruktor mit c-String
    printf(("Hello from Rectangle to " + man).c_str());
  }
};
```

Im Kopf der abgeleiteten Klasse (nicht beim Prototypen) wird, getrennt durch einen Doppelpunkt, der Basisklassenkonstruktor mit dem entsprechenden Parameter angeführt.

Wird mehrfach abgeleitet (abgeleitete Klasse wird wieder abgeleitet ...), gilt immer: der Konstruktor der Basisklasse wird vor dem Konstruktor der ersten Ableitung, dieser vor dem der zweiten Ableitung ausgeführt und so fort.

### Destruktor

Beim Aufruf des Destruktors einer abgeleiteten Klasse wird anschließend automatisch der Destruktor der Basisklasse mit aufgerufen. Da Destruktoren keinen Aufrufparameter haben können, ist hier kein explizites Aufrufen notwendig (oder möglich).

### Verdeckte Member

Soll auf verdeckte Member (siehe Beispiel) der Basisklasse zugegriffen werden, so ist der Klassenname gefolgt vom Bereichsoperator :: vor den Membernamen zu setzen:

```c++
class GBase {
public:
    void setPosition(...);
    void setSize(...);
protected:
    short mXPos, mYPos;
    short mWidth, mHeight;
};
class Frame: public GBase {
    ....
    short mWidth;	// Überdecken des Basisklassen-Members
  public:
    Frame(...);
    void DoAnything()
};
void Frame::DoAnything() {	// Zugriff auf Member der Basisklasse
    mWidth++;         // Frame Member
    GBase::mWidth++;  // Basisklassen-Member
    ....
}
```

Dieser Zugriff ist auch über die Objekte möglich (natürlich nur wenn der Member *public* ist und als *public* Klasse angegeben wurde):

```c++
class Frame: public GBase {
public:
    void move(short x);
};
class MyFrame: public Frame {
public:
    void move(short x, short y);
};
....

Frame   frameObj;	// Objekt der abgeleiteten Klassen
MyFrame myFrameObj;	// Objekt der abgeleiteten Klassen
// Aufrufe der Memberfunktion move(...)
myFrameObj.Frame::move(10);   // move() der Klasse Frame!
```

## Polymorphismus

Übliches Design in der OOP: eine abgeleitete Klasse (Spezialfall der Basisklasse) **ist eine** Basisklasse (allgemeiner Fall der abgeleiteten Klasse). Beispiel.:

- ein Girokonto (abgeleitete Klasse) **ist ein** Konto (Basisklasse)
- ein Hund (abgeleitete Klasse) **ist ein** Tier (Basisklasse)
- eine Assistentin (abgeleitete Klasse) **ist eine** Angestellte (Basisklasse)

Daher kann ein Zeiger auf eine abgeleitete Klasse in einem Basisklassenzeiger abgelegt werden:

```c++
Figur *f1 = new Rectangle();		// Ein Rechteck IST EINE Figur
```

Der Vorteil dieser Konstruktion wird deutlich, wenn unterschiedliche Objekte in einer Liste gesammelt werden sollen (Dreieck, Linie, Rechteck sind alle Figur).

Problem bislang: wird eine überschriebene Methode der Variable f1 aufgerufen, dann wird die Methode der Klasse Figur und nicht die Methode der Klasse Rechteck ausgeführt. Der Grund ist, dass der Compiler während der Programmerstellung noch nicht weiß, dass der Zeiger zur Laufzeit auf ein Rechteck-Objekt zeigt (statisches Binden). Mit dem Schlüsselwort *virtual* wird dem Compiler mitgeteilt, dass erst zur Laufzeit entschieden werden soll, welche Methode ausgeführt werden soll (spätes/dynamisches Binden).

### virtual Methoden

Mit dem *virtual*-Schlüsselwort vor einer Member-Methode einer Basisklasse wird dem Compiler vorgeschrieben die Entscheidung der Methodenwahl erst zur Programmlaufzeit zu treffen:

```c++
class Figur {
  virtual void sayHello() {		// <- Methode virtual
    printf("Hello from Figure ...");
  }
};
class Rectangle : public Figur {
  void sayHello() {
    printf("Hello from Rectangle ...");
  }
};
int main()
{
  Figur *f1 = new Rectangle();
  f1->sayHello();				// <- Aufruf der virtual-Methode -> Rechteck-Ausgabe
  return 0;
}
```

Obwohl ein Figur-Zeiger erstellt wird, wird nun die Rechteck-Ausgabe ausgeführt (aufgrund des *virtual*-Schlüsselworts).

### Abstrakte Klasse

Wird zusätzlich zum *virtual*-Schlüsselwort anstatt der Methoden-Implementierung *=0* angegeben, dann wird die Klasse abstrakt:

```c++
class Figur {
  virtual void sayHello() = 0;		// virtual und =0 machen die Klasse abstrakt
};
class Rectangle : public Figur {
  void sayHello() {					// diese Methode muss nun implementiert werden
    printf("Hello from Rectangle ...");
  }
};
int main()
{
  Figur *f1 = new Rectangle();
  f1->sayHello();						// <- Aufruf der virtual-Methode -> Rechteck-Ausgabe
  return 0;
}
```

- Von einer abstrakten Klasse können keine Objekte erzeugt werden, es können nur andere Klassen abgeleitet werden. 
- Von einer abstrakten Klasse abgeleitete Klassen müssen die nicht implementierte Methode implementieren.
- Abstrakte Klassen können zusätzlich auch weitere Methoden implementieren (sind dann in der abgeleiteten Klasse verfügbar).

Wenn eine Klasse ausschließlich aus virtuellen Elementen besteht ist es ein **Interface**.

### Virtuelle Destruktoren

Wird, wie in den vorangegangenen Beispielen, ein Objekt einem Basis-Zeiger zugewiesen, z.B. mit:

```c++
Figur *f1 = new Rechteck();
```

Dann muss abschließend immer ein *delete* ausgeführt werden um den dynamisch erzeugten Speicher wieder freizugeben. Dabei wird der Destruktor dieser Klasse aufgerufen. Wenn der Destruktor nicht virtuell ist, dann wird lediglich der Destruktor der Basisklasse ausgeführt (ist ja dann nicht polymorph). Eventuell im Rechteck dynamisch reservierter Speicher wird dann nicht mehr freigegeben:

```c++
class Figur {
  public:
  virtual void sayHello() {
    printf("Hello from Figure ...");
  }
};
class Rectangle : public Figur {
  int *arr = new int[1000];		// Mit jedem neuen Objekt wird ein neues Feld angelegt
  void sayHello() {
    printf("Hello from Rectangle ...");
  }
  ~Rectangle() {
    delete []arr;
  }
};
int main()
{
  while(1) {
    Figur *f1 = new Rectangle();
    delete f1;					// Destruktor von Figur wird aufgerufen (gibts nicht)
  }
  return 0;
}
```

In der Endlosschleife wird jedes Mal ein neues Rechteck erzeugt und an einen Figur-Zeiger übergeben. Anschließend wird das Objekt gelöscht und der Destruktor (von Figur) aufgerufen. Diesen gibt's nicht, es passiert nicht. Der Rechteck-Destruktor wird nicht aufgerufen. Mit einem virtuellen Destruktor in der Basisklasse:

```c++
virtual ~Figur() {};
```

Wird der Destruktor virtual aufgerufen, dann wird zuerst der Basis-Destruktor und anschließend der abgeleitete Destruktor, womit der Speicher freigegeben wird.

**Lösung: Angewöhnen Destruktoren am Besten immer virtual definieren!**

## Friends

Auf *private* Daten einer Klasse kann nur von innerhalb der Klasse selber zugegriffen werden. Ähnlich kann auf *protected* Daten nur aus der Klasse selber oder einer davon abgeleiteten Klasse zugegriffen werden.

In C++ gibt es davon eine dem widersprechende Ausnahme:

> Wenn eine fremde Funktion/Klasse als **friend** definiert ist kann sie von außerhalb direkt auf die inneren Daten zugreifen unabhängig von der obigen Aussage.
>
> Als Friend darf eine Funktion nur innerhalb der Daten-preisgebenden Klasse definiert sein.

Beispiel (Cls2 ist Friend von Cls1):

```
class Cls1 {
    friend class Cls2;
    public: Cls1() {num = 10;};
    private: int num;
};
// ----
class Cls2 {
    public: void ausgabe(Cls1 c1) {std::cout << "Private: " << c1.num << std::endl;};
};
// ----
void main() {
    Cls1 c1;
    Cls2 c2;
    c2.ausgabe(c1);
}
```

Ein Friend muss zur Kompilierungszeit nicht bekannt sein, so kann eine noch nicht definierte Klasse/Funktion als Friend angeführt werden, der Compiler prüft nicht auf Korrektheit. Eine Friend Funktion wird wie im Prototyp angeführt: `friend int main();`.

## Referenzen

- Sehr umfassende Einführung

  http://www.cpp-tutor.de/cpp/le14/ableitung.html
  
- Gute Erklärungen
  https://www.informatikzentrale.de/