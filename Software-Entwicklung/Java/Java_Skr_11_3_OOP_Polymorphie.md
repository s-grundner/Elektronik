11.3 Objekt Orientierte Programmierung - Polymorphie
===================

## Beispiel

In diesem Beispiel wird das speziellere Rechteck von der generellen Figur abgeleitet:

```java
public class Figure {
  public void zeichnen() {
    System.out.println("Figur wird gezeichnet.");
  }
}
public class Rechteck extends Figure {
  public void zeichnen() {
    System.out.println("Rechteck wird gezeichnet.");
  }
}
public class Dreieck extends Figure {	// leere Klasse
}
```

Beim Ausführen funktioniert das folgende:

```c#
Figure f2 = new Rechteck();
f2.zeichnen();
```

Ein Rechteck ist eine Figur, daher kann das erstellte Rechteck-Objekt einer Figur-Referenz zugewiesen werden. Es gibt folgende Ausgabe:

```
Rechteck wird gezeichnet.
```

Obwohl f2 vom Typ Figure ist, wird die passende Methode aufgerufen. Der Vorteil dieses Aufrufs wird hier besser deutlich:

```c#
Figure[] fArr = {new Dreieck(), new Rechteck(), new Linie()};
fArr[0].zeichnen();		// Figur wird gezeichnet	( Dreieck hat keine eigene zeichnen-Meth.)
fArr[1].zeichnen();		// Rechteck wird gezeichnet
fArr[2].zeichnen();		// ...
```

Während der Kompilierung ist noch nicht bekannt welche Methode zeichnen ausgeführt werden soll (das obige Feld könnte ja erst zur Laufzeit befüllt werden). Welche zeichnen-Methode genau aufgerufen wird, entscheidet sich während der Laufzeit (daher die Bezeichnung *späte Bindung* oder *dynamische Bindung*). Das ein und der gleiche Aufruf (z.B. fArr[x].zeichnen()) je nach Element im Feld unterschiedliche Verhalten zeigt wird als **polymorphes** Verhalten bezeichnet.

## Abstrakte Klassen/Methoden

Eine Lösung um solche Verhalten zu verlangen bietet eine *abstrakte* Klasse. Klassen können mit dem Schlüsselwort *abstract* versehen werden:

```java
public abstract class cls {
  ...
}
```

Es können keine Objekte dieser abstrakten Klasse abgeleitet werden. Sie können nur als Superklasse für andere Klassen dienen. In einer abstrakten Klassen können Attribute und Methoden definiert werden wie in normalen Klassen auch. Zusätzlich können in abstrakten Klassen auch abstrakte Methoden definiert werden. Diese Methoden **müssen** in abgeleiteten Subklassen dann überschrieben werden. Daher ist eine Implementierung in der Superklasse auch gar nicht erlaubt:

```java
public abstract class Creature {			// abstrakte Superklasse
  ...
  public abstract void essen(String mcMeal);	// abstrakte Methode
  ...
}

public class Worm extends Creature {	// abgeleitete Subklasse
  @Override							 // nice to have
  public void essen(String doener) {	// diese Methode muss hier implementiert werden.
    ...
  }
}
```

In der abstrakten Klasse *Creature* wird vorgeschrieben (weil sie abstrakt ist): die Methode *essen* muss in jeder abgeleiteten Klasse überschrieben werden (außer die abgeleitete Klasse ist wieder abstrakt, dann wird weitergereicht).

Mittels abstrakter Klassen kann abgeleiteten Klassen vorgeschrieben werden, dass gewisse Methoden implementiert werden müssen. Die Art der Aufrufparameter muss dabei ebenfalls zusammenpassen (kein Überladen sondern ein Überschreiben).

Da gilt: *SubClass ist ein Cls* (Generalisierung) funktioniert:

```java
Creature bill = new Worm();		// Wurm ist auch eine Kreatur
o1.essen("Doppelwopper");
```

Da sämtliche von einer abstrakten Klasse die abstrakten Methode implementieren müssen und diese üblicherweise unterschiedlich sind (sonst wäre könnte die Methode direkt in die Superklasse eingebaut werden) ist deren Aufruf polymorph (immer unterschiedlich).  Im Gegensatz dazu steht ein *immergleicher* Methodenaufruf abgeleiteter Klassen ohne Überschreiben (monomorph).

------

## Zusammenfassung

> Von abstrakten Klassen können keine Objekte abgeleitet werden.
>
> Eine abstrakte Klasse kann herkömmliche Attribute, Methoden (wie bisher) aber auch abstrakte Methoden beinhalten.
>
> Abstrakte Methoden müssen in abgeleiteten Klassen überschrieben werden.
>
> Mittels abstrakter Klassen werden Methoden polymorph aufgerufen.

---

## Schnittstellen

Klassen können nur eine einzige Elternklasse haben. Mit Schnittstellen (Interfaces) können ergänzend Methoden/Eigenschaften eingebracht werden.

```java
Interface Buyable {
  double price();
}
```

Implementierung:

```java
public class Chocolate implements Buyable {
  @Override public double price() {
    return 0.69;
  }
}
```

 Wird eine Klasse von einer anderen abgeleitet kann sie weiter noch eine Schnittstelle erweitern:

```java
Public class Magazine extends GameObject implements Buyable {
  double price;
  @Override public double price() {
    return price;
  }
}
```

Sollen die Methoden mehrerer Interfaces implementiert werden:

```java
Public class Magazine extends GameObject implements Buyable, Burnable {
...
```

Sie werden durch Beistriche voneinander getrennt.