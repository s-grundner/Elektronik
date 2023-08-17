
11.1 Objekt Orientierte Programmierung - Kapselung
===================

Das Objektorientierte Programmierparadigma basiert auf 3 Ideen:

- Kapselung
- Vererbung
- Polymorphie

In der OOP können besondere Datentypen definiert werden - die **Klassen**. Die Variablen welche von diesem Typ erzeugt werden nennt man **Objekte**.

## Klassen

Klassen sind als Datentypen zu verstehen.

- eine Klasse kann mehr als nur ein einziges Datum (Zahl, Zeichenkette, Feld ...) speichern. Ein *int*-Datentyp hingegen kann nur eine Zahl speichern.
- eine Klasse kann gleichzeitig Methoden mit diesem Datentyp anbieten.

Definition einer eigenen, vollständig leeren Klasse **Cls**:

```java
class Cls {
  
}
```

Klassennamen beginnen mit einem Großbuchstaben.

Soll eine Klasse ein Datum speichern können, benötigt man eine sogenannte Membervariable (Attribut, Eigenschaft):

```java
class Cls {
  int num;		// Membervariable
}
```

Mit dieser Klasse kann ein numerischer Wert (int) gespeichert werden (dafür würde man natürlich keine eigene Klasse benötigen).

Soll die Klasse zusätzlich eine Methode anbieten können, so muss diese ebenfalls in der Klasse definiert werden:

```java
class Cls {
  int num;						// Membervariable
  
  public String printNum() {	  // Membermethode
    ...
  }
}
```

Mit dieser Klasse kann ein numerischer Wert gespeichert werden und zusätzlich eine Methode printNum() aufgerufen werden.

>**Klassen** können als selbstdefinierbare Datentypen verstanden werden.
>
>Klassen können überall verwendet werden wo Datentypen verwendet werden. Als Aufrufparameter oder Rückgabewerde von Methoden, als Feld-Typen oder zum Beispiel als Typen von Arraylisten.

## Objekte

Eine Variable vom Typ einer Klasse nennt man ein *Objekt*. Das Erzeugen dieser Variable funktioniert genau so wie mit einfachen Datentypen: `Datentyp Variablenname;`

```java
Cls a;	// Variable a vom Typ Cls
```

Man nennt diese, *davon abgeleitete/instanzierte* Variable eine *Referenz auf ein Objekt der Klasse Cls*.

Das Anlegen einer Variable (ein sog. **Objekt**) nach dieser Klasse, erfolgt mit dem **new**-Operator:

```java
a = new Cls();		// ein neues Objekt der Art Cls wird erzeugt und die Adresse der Variable a zugewiesen.
```

Auf die Komponenten des Objekts a kann man mit dem **Punkt**-Operator zugreifen:

```java
a.num = 10;		// Zugriff auf die Membervariable num des Objekts auf das a zeigt.
a.printNum();	// Ausführen der Methode printNum des Objekts auf das a zeigt.
```

> **Objekte** können als Variable vom Typ ihrer Klasse verstanden werden.


Konstruktor
------------

Der Konstruktor ist eine spezielle Methode die automatisch bei der Erzeugung eines Objekts ausgeführt wird (also während dem new-Aufruf).  Der Konstruktor hat den gleichen Namen wie die Klasse und (im Gegensatz zu den Methoden) KEINEN Rückgabewert, also auch kein void:

```java
class Cls {
  public Cls()		// Methode ohne void und Datentyp und der selbe Name wie die Klasse
  {
    ...
  }
}
```

Aufruf:

```java
Cls obj;			// Referenz auf ein Cls-Objekt erzeugen
obj = new Cls();	// Erzeugen eines Objekts und übergabe der Referenz and die Ref-Var. Der Konstruktor wird aufgerufen.
```

Wie jede andere Methode auch, kann der Konstruktor auch überladen werden:

```java
class Cls {
  public Cls()		// 1. Konstruktor, ohne Aufrufparameter
  {
    ...
  }
  public Cls(int num)	// 2. Konstruktor, mit einer Nummer als Parameter
  {
    ...
  }
}
```

Welcher der beiden Konstruktoren verwendet wird hängt davon ab wieviele Parameter beim new-Aufruf mitgegeben werden. `new Cls()` verwendet den ersten Konstruktor und `new Cls(2)`  verwendet den zweiten Konstruktor:

```java
Cls obj1, obj2;		// 2 Referenzen auf Cls-Objekte erzeugen
obj1 = new Cls();	// Erzeugen eines Objekts und Übergabe der Referenz and die Ref-Var. Der Konstruktor Cls() wird aufgerufen.
obj2 = new Cls(3);	// Erzeugen eines Objekts und Übergabe der Referenz and die Ref-Var. Der Konstruktor Cls(int num) wird aufgerufen.
```

Häufig sollen bei der Erstellung eines Objekts die Daten eines schon vorhandenen Objekts kopiert werden. Wird das in einen Konstruktor eingebaut, so nennt man diesen einen **Copy-Konstruktor**:

```java
class Cls {
  public Cls(Cls c)		// Konstruktor, erstellt ein Objekt das eine Kopie eines weiteren Objekts ist
  {
    ...
  }
}
```

Werde Variablen mit dem gleichen Namen angelegt, wird die vorherige Variable unsichtbar (überladen). Um auf überladene Membervariable oder -Methoden zugreifen zu können, gibt es die **this**-Referenz. Sie gibt immer eine Referenz auf genau das Objekt zurück in welchem sie verwendet wird:

```java
class Cls {
  int num;
  public Cls(int num)		// Lokale Var. num hat gleichen Namen wie Memberattribut num
  {
    this.num = num;			// Unterscheidung durch this: this.num = Memberattribut; num = lokale Var.
    ...
  }
}
```

> Der Konstruktor ist eine Methode die automatisch beim Erzeugen jedes erstellten Objekts aufgerufen wird (new).
>
> Auch Konstrukoren können überladen werden.
>
> Einen Konstruktor der die Attribute eines schon bestehenden Objekts kopiert wird als Copy-Konstruktor bezeichnet.
>
> Der Aufruf der this-Referenz in einem Objekt gibt die Referenz auf dieses Objekt selbst zurück.

## Zugriffsmodifikatoren

Die Zugriffsmodifikatoren beschreiben von wo aus auf Memberelemente zugegriffen werden kann:

> *leer:* ohne Modifikator kann auf das Element von überall innerhalb des Paketes in welchem sich das Objekt befindet zugegriffen werden (diese Sichtbarkeit nennt man auch package).
>
> **private:** auf das Element kann ausschließlich von innerhalb des Objekts/der Klasse zugegriffen werden. Durch private wird größtmögliche Datenkapselung erreicht. Memberattribute sollen immer *private* definiert werden.
>
> **protected:** wie private, mit Ausnahme bei der Vererbung: protected Elemente werden auch vererbt (im Gegensatz zu private).
>
> **public:** auf das/die betreffende Attribut/Methode kann von überall zugegriffen werden. Es gibt keine Einschränkung. Dieser Modifikator soll nur verwendet werden, wenn eine Kapselung explizit nicht gewünscht ist. Für die meisten Methoden ist diese Art sinnvoll.

**Beispiel:**

<img src="./bilder/07_OOP_Zugrifsmodifikator.png" width="400">

In der Klasse Dreieck gibt's die 3 Memberattribute a (public), b (private) und c (package). Die Variable a und die Methode getB() kann von überall, auch von außerhalb des Paketes gesehen oder beschrieben werden. Die Variable c kann von innerhalb des Pakets in dem das Objekt existiert gelesen oder geschrieben werden. Die Variable b kann nur von innerhalb des Objekts selbst gelesen oder verändert werden. Private Elemente sind nach aussen nicht sichtbar.

## Speichermodifikatoren

Üblicherweise gehören Methoden immer zu den Objekten in deren Klasse sie definiert sind. Das bedeutet eine Methode kann nur aufgerufen werden, wenn ein Objekt dieser Klasse angelegt wird:

```java
class Cls {				// Klasse Cls
  int calcRes() { ... }	  // NICHTSTATISCHE Methode calcRes der Klasse Cls
}

....
  
Cls obj = new Cls();		// Objekt obj der Klasse Cls
int res = obj.calcRes();	// Aufruf der Methode als Teil des Objekts obj
```

Diese **nicht-statischen**/**non-static** Methoden können nur verwendet werden wenn ein Objekt da ist, an welches `.CalcRes()` "drangehängt werden kann".

Soll mit einer Klasse eine Methode angeboten werden die nicht an ein Objekt gebunden ist, dann definiert man diese Methode **statisch**:

```c#
class Cls {						// Klasse Cls
  static int calcRes() { ... }	  // STATISCHE Methode calcRes der Klasse Cls
}

....
  
Cls.calcRes();	// Aufruf der Methode ohne Objekt. Cls wird nur angegeben damit Methode gefunden werden kann
```

Genauso können Memberfelder statisch oder nicht-statisch sein.

**Beispiel:**

```java
public class Kreis {
  public static double pi=3.14;		 // statische Variable pi
}
```

Verwendung:

```java
double u = Kreis.pi * 2 * 3;		// Berechnung des Umfangs
```

Die Variable **pi** kann verwendet werden ohne das ein ein Objekt der Klasse Kreis angelegt werden muss. 

> **static:** das Element bezieht sich nicht auf eine Instanz/Objekt der Klasse. Daher ist auch kein Objekt notwendig um auf das Attribut/die Methode zugreifen zu können.
>
> *<leer>* **:** das Element bezieht sich auf ein Objekt. Daher ist auch ein Objekt notwendig um auf das Attribut/die Methode zugreifen zu können.

## Kapselung

Die Idee der Kapselung ist möglichst sämtliche Daten vor dem Benutzer zu verstecken die nicht notwendigerweise sichtbar sein müssen. Das hat zwei Vorteile: ein kompliziertes Gebilde wird dadurch einfacher und infolgedessen können bewusste und unbewusste Veränderungen in diesen nicht relevanten Teilen verhindert werden. Als Anwender eines Pkw ist es auch von Vorteil wenn sich die "komplizierte Technik" hinter klaren, reduzierten Schnittstellen versteckt (im besten Fall fährt das Auto alleine).

Daher: nach Möglichkeit alles Private setzen.

## Destructor

Den gibt es in Java nicht, der Garbage-Collector (GC)  zerstört Objekte automatisch, die im späteren Programmverlauf nicht mehr benötigt werden. Wann das erfolgt kann nicht bestimmt werden. Eine Möglichkeit dem GC explizit anzuweisen ein Objekt zu löschen ist das Entfernen einer Referenz auf das Objekt:

```java
ref = null;   // GC loescht das Objekt auf dem die Referenz ref zeigte
```

