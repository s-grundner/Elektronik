---
tags:
  - MOC
  - Java
  - oop
aliases:
  - Java_OOP
subject:
  - ""
inst:
  - HTL
created: 29. November 2022
---

# Map of Content - Java_OOP

```dataview
LIST
FROM #Java AND #oop
SORT file.name
 ```

# Assoziation - Aggregation - Komposition

- [Assoziation](Assoziation.md)
- [Aggregation](Aggregation.md)
- [Komposition](Komposition.md)

## Mehrfache Beziehungen

Ist die Anzahl der Beziehungen bekannt, kann ein Array verwendet werden. Sollte die Anzahl der Teilobjekte unbekannt sein wird mit ArrayLists (oder List) gearbeitet:

```java
import java.util.ArrayList;

class OberKlasse {
  private ArrayList unterKlassenListe;

  public OberKlasse() {
    unterKlassenListe = new ArrayList();
  }
  
  public void addUK() {
    unterKlassenListe.add(new UnterKlasse());
  }
```

# Objekt Orientierte Programmierung - Weiteres

## Singleton-Objekte

nur ein einziges Objekt der Logger-Klasse ist erlaubt (wenn innerhalb eines Programm Info geloggt werden soll auch sinnvoll wenn das nur an eine Stelle protokolliert wird):

```java
public final class Logger {
  private static Logger logger;

  private Logger() {   // Priv Konstruktor
      				   // kann nicht von ausserhalb aufgerufen werden
  }

  public static synchronized Logger getInstance() {  // -> Erzeugt oder gibt zurueck
    if ( logger == null )	   // Wenns noch keinen Konstruktor gibt
      logger = new Logger();   // hier wird Konstruktor von "Innen" aufgerufen
    return logger;			   // Logger erzeugt oder vorhanden zurueck
  }

  public void log( String s ) {
    System.out.println( s );
  }
}

public class LoggerUser {
  publicstatic void main( String[] args ) {
    Logger.getInstance().log( "Log mich!" );
  }
}
```

Das ist ein Beispiel bei dem bewusst ein Konstruktor Private ist. Damit kann ein Objekt nicht wie sonst üblich erzeugt werden. Ein `new Logger()` führt zu einem Fehler. Die einzige Möglichkeit an ein Logger-Objekt zu kommen ist der Aufruf der statischen getInstance-Methode. Darin wird geprüft ob es schon ein Logger-Objekt gibt, wenn Ja, wird eine Referenz darauf zurückgegeben. Wenn Nein, wird ein neues Objekt erzeugt.

Mit dem Schlüsselwort *synchronized* kann sichergestellt werden, dass eine Methode nur einfach aufgerufen werden kann. Wenn diese Methode mehrfach, gleichzeitig angefordert wird, dann muss der zweite Aufrufer auf das Ende des ersten Warten.

## Fabrikmethoden

Falls Objekte nur über Methoden erzeugt werden können, dann werden diese Methoden als *Factory*-Methoden bezeichnet. Im folgenden Beispiel können maximal drei Objekte der Klasse *Fact* erstellt werden. Der Versuch ein viertes zu erstellen gibt null zurück:

```java
public final class Fact {
  private static int num; // Zaehlt die Anz. d. Objekte

  private Fact() {   // Priv Konstruktor – kann nicht aufgerufen werden
  }

  public static synchronized Fact getInstance() {
    if ( num < 3 ) {	// Objekte werden nur erzeugt wenn weniger als 3
      num++;
	  return new Fact();
    }
    else return null;
  }
}
```

Die übliche Art ein Objekt zu erzeugen, über einen Konstruktor kann das nicht. Ein Konstruktor gibt immer ein Objekt zurück.

## Abkürzung Bei Überladungen

```java
public class Car
{
  public int topSpeed = 100;    // wird für beide Konstruktoren eingefügt

  public Car()
  {
  }
  public Car(int topSpeed)
  {
    this.topSpeed = topSpeed;
  }
}

Public class Garage
{
  Car ferrari = new Car();    // topSpeed = 100
  Car fiat = new Car(120);    // topSpeed = 120
  ...
```

## Instanceof

Prüfung ob Objekt von einer bestimmten Klasse mit Operator *instanceof*

```java
System.out.println(new Worm() instanceof Worm);         // true
System.out.println(new Worm() instanceof Creature);     // true
System.out.println(new Worm() instanceof Object);       // true
System.out.println(new Worm() instanceof String);       // Compilerfehler
```

## Object.getClass()

getClass() ist eine Object-Methode, daher ist diese Methode für jedes Objekt verfügbar:

```java
System.out.println(hugo.getClass().equals(Object.class));         // false
System.out.println(hugo.getClass().equals(Creature.class));       // false
System.out.println(hugo.getClass().equals(Worm.class));           // true (hugo = Wurm)
```
