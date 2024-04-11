## Vererbung

Ziel soll sein: einmal programmiert - so oft wie möglich verwenden. Die Vorteile sind klar:

- Bequemlichkeit - nicht nochmal das Gleiche programmieren zu müssen
- Sicherheit - Fehler in schon verfügbaren und oft verwendeten Komponenten werden schneller gefunden
- Wartbarkeit - gefundene Fehler oder Verbesserungen die eingebaut werden, sind für alle die die Komponente verwenden sofort verfügbar.

Da eine vorhandene Klasse nicht immer ganz genau zu einem Problem passt, kann eine *ähnliche* Klasse *abgeleitet* und angepasst werden.

- Die Klasse von der abgeleitet wird nennt man **Basisklasse** (Superklasse, Oberklasse, Elternklasse …)
- Die **abgeleitete Klasse** wird als Subklasse, Unterklasse, Kindklasse … bezeichnet. Sie besteht aus allem was in der Basisklasse implementiert wurde. Zusätzlich können in ihr Member (Variable und/oder Methoden) überschrieben oder zugefügt werden.

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

Wird mehrfach abgeleitet (abgeleitete Klasse wird wieder abgeleitet …), gilt immer: der Konstruktor der Basisklasse wird vor dem Konstruktor der ersten Ableitung, dieser vor dem der zweiten [Ableitung](Differenzialrechnung.md) ausgeführt und so fort.

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