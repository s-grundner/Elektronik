---
tags:
  - Java
  - OOP
aliases:
  - Kapselung
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester: SS24
created: 29. November 2022
professor:
  - Herbert Prähofer
cited:
---
 

# Objekt Orientierte Programmierung - Kapselung

Das Objektorientierte Programmierparadigma basiert auf 3 Ideen:

- Kapselung
- Vererbung
- Polymorphie

In der OOP können besondere Datentypen definiert werden - die **Klassen**. Die Variablen welche von diesem Typ erzeugt werden nennt man **Objekte**.

## Klassen

Klassen sind als Datentypen zu verstehen.

- eine Klasse kann mehr als nur ein einziges Datum (Zahl, Zeichenkette, Feld …) speichern. Ein *int*-Datentyp hingegen kann nur eine Zahl speichern.
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

## Konstruktor

Der Konstruktor ist eine spezielle Methode die automatisch bei der Erzeugung eines Objekts ausgeführt wird (also während dem new-Aufruf). Der Konstruktor hat den gleichen Namen wie die Klasse und (im Gegensatz zu den Methoden) KEINEN Rückgabewert, also auch kein void:

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

Welcher der beiden Konstruktoren verwendet wird hängt davon ab wieviele Parameter beim new-Aufruf mitgegeben werden. `new Cls()` verwendet den ersten Konstruktor und `new Cls(2)` verwendet den zweiten Konstruktor:

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

![07_OOP_Zugrifsmodifikator](assets/07_OOP_Zugrifsmodifikator.png)

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
> *\<leer\>* **:** das Element bezieht sich auf ein Objekt. Daher ist auch ein Objekt notwendig um auf das Attribut/die Methode zugreifen zu können.

## Kapselung

Die Idee der Kapselung ist möglichst sämtliche Daten vor dem Benutzer zu verstecken die nicht notwendigerweise sichtbar sein müssen. Das hat zwei Vorteile: ein kompliziertes Gebilde wird dadurch einfacher und infolgedessen können bewusste und unbewusste Veränderungen in diesen nicht relevanten Teilen verhindert werden. Als Anwender eines Pkw ist es auch von Vorteil wenn sich die "komplizierte Technik" hinter klaren, reduzierten Schnittstellen versteckt (im besten Fall fährt das Auto alleine).

Daher: nach Möglichkeit alles Private setzen.

## Destructor

Den gibt es in Java nicht, der Garbage-Collector (GC) zerstört Objekte automatisch, die im späteren Programmverlauf nicht mehr benötigt werden. Wann das erfolgt kann nicht bestimmt werden. Eine Möglichkeit dem GC explizit anzuweisen ein Objekt zu löschen ist das Entfernen einer Referenz auf das Objekt:

```java
ref = null;   // GC loescht das Objekt auf dem die Referenz ref zeigte
```

# Theorie Fragen - 01 Klassen

Erklären Sie den Unterschied zwischen Wertesemantik und Referenzsemantik.
?
Der unterschied ist die Art des Zugriffs der Variablen auf die Daten. 
- **Wertesemantik**: Es wird der Wert der Variable Kopiert. Änderungen an der Kopie haben keinen Einfluss auf das Original.
- **Referenzsemantik**: Hier werden Referenzen bzw. Zeiger auf die Daten verwendet. Änderungen an der Referenz beeinfluss das Original und umgekehrt.

---

In Java können Methoden überladen werden. Was bedeutet Überladen von Methoden?
?
Hier hat eine Klasse mehrere Methoden mit dem selben Namen und dem selben Rückgabewert. Die Anzahl bzw. der Typ der Parameter muss sich jedoch von allen anderen gleichnamigen Methoden unterscheiden

---

Bei überladenen Methoden wird bei einem Aufruf wird eine Methode aus den überladenen Methoden ausgewählt. Wie erfolgt die Auswahl?
?
Die Auswahl erfolgt anhand der Signatur der Methode. Die Signatur umfasst den Methodennamen und die Parameterliste. Der Compiler wählt die Methode, deren Parameterliste am besten zu den beim Aufruf übergebenen Argumenten passt. D

---

Welche Sichtbarkeitsattribute gibt es in Java? Welche Sichtbarkeit ist mit den unterschiedlichen Attributen definiert?
?
- **public**: Die Methode oder das Feld ist überall sichtbar, d.h., in allen Klassen.
- **protected**: Die Methode oder das Feld ist in der gleichen Klasse, im gleichen Package und in Subklassen sichtbar.
- **default** (keine Modifikatoren, auch package-private genannt): Die Methode oder das Feld ist nur im gleichen Package sichtbar.
- **private**: Die Methode oder das Feld ist nur innerhalb der gleichen Klasse sichtbar.

---

Geben Sie an, in welchem Bereich ein Programmelement, bei dem kein Sichtbarkeitsattribut angegeben ist, sichtbar ist. Kreuzen Sie an:
- in der Klasse
- im gleichen Package
- in Subklassen im gleichen Package
- in allen Subklassen
- in Klassen von anderen Packages
?
im gleichen Package.
in der Klasse
in Subklassen im gleichen Package

---

Was bedeutet das Attribut final bei Objektfeldern?
?
Das Attribut `final` bei Objektfeldern bedeutet, dass der Wert des Feldes nach seiner Initialisierung nicht mehr geändert werden kann. Das Feld muss also genau einmal einen Wert zugewiesen bekommen und bleibt danach konstant.

---

Wann und wo müssen Objektfelder, die final deklariert sind, gesetzt werden?
?
Final deklarierte Objektfelder müssen entweder direkt bei der Deklaration oder im Konstruktor der Klasse gesetzt werden. Es ist erforderlich, dass sie spätestens beim Abschluss der Initialisierung des Objekts einen Wert erhalten haben.

---

Erläutern Sie das Schema zur Implementierung von Getter und Setter-Methoden.
?
Mit Getter und Setter sollen private Felder kontrollierter über öffentliche Methoden Zugänglich gemacht werden. Anstatt das Feld `public` zu deklarieren 

---

Schreiben Sie für ein privates Feld `private String name;` Getter und Setter-Methoden.
?
```java
private String name;

public String getName() { return name; }
public void setName(String name) { this.name = name; }
```

---

Record-Klassen sind spezielle Klassen in Java. Wie werden Record-Klassen definiert und welche Eigenschaften sind damit verbunden?
?
Mit Record Klassen werden unveränderliche Datenträger definiert: `public record Person(String name, int age) {}`
Es werden automatisch für die private final Felder,
- öffentliche Getter-Methoden,
- ein Konstruktor,
- `equals()`,
- `hashCode()`
- und `toString()` Methoden generiert.

---

Was ist bei Record-Klassen erlaubt und was ist nicht erlaubt?
?
**Erlaubt:**
- Definieren von zusätzlichen Methoden.
- Implementieren von Interfaces.
- Hinzufügen von statischen Feldern und Methoden.
- Schreiben eines benutzerdefinierten Konstruktors.
**Nicht erlaubt:**
- Erben von anderen Klassen (Records sind final).
- Ändern der automatisch generierten Methoden `equals()`, `hashCode()` und `toString()` in einer Weise, die gegen die Vertragsbedingungen verstößt.
- Manuell definierte Felder, die nicht in der Komponentenliste enthalten sind.

---

Enumerationsklassen sind spezielle Klassen in Java. Wie werden Enumerationsklassen definiert und welche Eigenschaften sind damit verbunden?
?
Enums werden mit dem Schlüsselwort `enum` definiert.
Jede Instanz eines Enums ist ein `public static final` Objekt.
Enums können Konstruktoren, Methoden und Felder enthalten, aber die Instanzen sind vordefiniert und unveränderlich.

---

Was ist bei Enumerationsklassen erlaubt und was ist nicht erlaubt?
?
**Erlaubt:**
- Definieren von Konstruktoren, Methoden und Feldern.
- Implementieren von Interfaces.
- Hinzufügen von benutzerdefinierten Methoden für spezielle Funktionalitäten.
- Verwenden von Enums in `switch`-Statements.
**Nicht erlaubt:**
- Erben von anderen Klassen (Enums sind final und können nicht erweitert werden).
- Manuelles Erstellen von Enum-Instanzen außerhalb der definierten Konstanten.
- Verändern der Enum-Konstanten zur Laufzeit (sie sind unveränderlich)