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

### Virtual Methoden

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