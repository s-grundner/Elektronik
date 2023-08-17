# 12 Collections

Collections sind Sammlungen. Sie sind geeignet Mengen von Daten aufzunehmen. Das kann eigentlich schon mit Hilfe von Feldern gemacht werden. Die haben allerdings einen gravierenden Nachteil: die Größe kann während der Laufzeit nicht verändert werden. Neben diesem großen Unterschied gibt es in Java sehr viele unterschiedliche Collection-Typen. Wir werden uns nur mit einer Art beschäftigen - den ArrayLists (der Unterschied der vielen Collection-Typen wird dann relevant wenn richtig viele Daten verarbeitet werden. Dann sind z.B. einige Typen schneller). Sie gehört zu den Listen.

Definition einer ArrayList:

```java
import java.util.*;

...
ArrayList al = new ArrayList();
```

Die ArrayList ist im Package *util* definiert, daher muss die entsprechende Klasse immer importiert werden.

Die Definition ist wie für jedes andere Objekt auch. Bemerkenswert im Gegensatz zu Feldern ist, dass kein Element-Typ angegeben werden muss. Mit der Methode add() kann in eine ArrayList jedes beliebige Element aufgenommen werden:

```java
al.add("abc");					// String
al.add(7);						// int
al.add(true);					// boolean
Komplex c = new Kompex(1,2);	 // auch Objekte von selbstdefinierten Klassen
al.add(c);
```

Soll der Typ strikt vorgegeben werden, so kann das in spitzen Klammern erfolgen:

```java
ArrayList<String> alStr = new ArrayList<String>();
```

Für diese ArrayList führt das Einfügen eines Integers zu einem Fehler. Wenn Listen nur für einen Typen verwendet werden sollen, dann ist es Sinnvoll das auch anzugeben. Primitive Datentypen können nicht direkt angeführt werden, für diese Zwecke gibt's Wrapper-Klassen, also ArrayList\<Integer\> an Stelle von ArrayList\<int\>.

Wieviele Elemente in einer ArrayList abgelegt sind kann mit Hilfe der size-Methode ermittelt werden (wie für Felder mit der length-Eigenschaft):

```java
int anzElemente al.size(); 	// liefert für obiges Beispiel 4
```

Auf einzelne Elemente der Liste kann ähnlich wie in einem Feld zugegriffen werden:

```java
System.out.println(al.get(1));		// gibt 7 aus
```

Die Zählweise ist wie für Felder mit 0 beginnend. Nicht jede Collection bietet die Möglichkeit dieses **wahlfreien** Zugriffs - darunter versteht man, dass z.B. direkt auf das 10te Element mit al.get(9) zugegriffen werden darf. In anderen Collections kann zum Beispiel immer nur auf das nächste Element zugegriffen werden.

Wird auf einen Index ausserhalb des Bereichs zugegriffen dann gibts gleich wie bei Feldern eine IndexOutOfBoundsException.

In ArrayList können Elemente auch direkt gelöscht werden:

```java
al.remove(1);
```

Damit wird das 2te Element aus der Liste gelöscht. Die folgenden rücken vor und das Feld wird um ein Element kleiner.

Für's entfernen gibt's eine überladene Methode:

```java
al.remove("abc");
```

Hier wird die Liste durchsucht und das erste Element mit Inhalt "abc" wird gelöscht. Eventuell weitere verbleiben im Feld. Gibt's kein Element mit der gesuchten Inhalt, dann wird kein Element gelöscht.

## Methoden / Eigenschaften von ArrayListen

`ArrayList alist`                      Definition einer ArrayList

`alist = new ArrayList()`      Erstellt eine neue ArrayList (Elemente undefiniert)

`ArrayList<String>`                   ArrayList in die nur String eingefügt werden können

`ArrayList<Integer>`                 ArrayList in die nur Integer eingefügt werden können (int klappt nicht da es ein Datentyp und keine Klasse ist)

`new ArrayList<String>()`      Konstruktor dazu

`alist.size()`                       Gibt die Anzahl der Elemente im Feld arr zurück

`alist.add("abc")`               Fügt an der letzten Stelle ein Element ein (hier "abc")

`alist.add(0, "abc")`        Fügt an der 1ten Stelle ein Element ein (hier "abc")

`alist.remove(1)`                Löscht das 2te Element in der Liste (Zählung von 0 beginnend)

`alist.get(1)`                      Gibt das 2te Element in der Liste zurück (Zählung von 0 beginnend)

`alist.contains("abc")`    Gibt mit true/false zurück ob das Element enthalten ist

`alist.clear("abc")`          Löscht die Liste

`alist.indexOf("abc")`      Gibt die Position zurück an welcher "abc" das erste mal gefunden wird

`alist.toString() `              Gibt die Liste als Zeichenkette aus