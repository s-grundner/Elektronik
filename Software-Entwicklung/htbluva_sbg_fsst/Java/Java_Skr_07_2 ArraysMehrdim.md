# 7.2 Mehrdimensionale Arrays

Arrays bündeln gleichartige Daten (int ...)  in eine Array-Variable. Mit Arrays können nicht nur primitive Datentypen gebündelt werden sondern alle Arten von Variablen. Daher können auch Array-Variable in eine Array-Variable gebündelt werden. Dadurch entstehen mehrdimensionale Arrays. Zum Beispiel kann die Feldvariable: `int[] numArr` mit einer eckigen Klammer als neue Feldvariable definiert werden: `int[][] arrVonNumArr`.

Beispiel:

```java
int[][] r;				// r ist als Array bestehend aus Elementen vom Typ (Array bestehend aus Integer-Elementen)
r = new int[4][];		// r soll aus 4 int-Arrays bestehen
r[0] = new int[3];		// das 1te r-Element soll ein Array mit 3 Elementen sein
r[1] = new int[1];		// das 2te r-Element soll ein Array mit 1 Element sein
r[2] = new int[2];		// das 3te r-Element soll ein Array mit 2 Elementen sein
r[3] = new int[3];		// das 4te r-Element soll ein Array mit 3 Elementen sein
```

<img src="./bilder/05_FelderMehrdim01.png" width="200">

Wie man in diesem Beispiel erkennt ist es nicht notwendig, dass jedes Array-Element gleich groß sein muss (das wären rechteckige Arrays). Auch hier gibt's die Abkürzung:

```java
int[][] r = { {0, 1, 2}, {4}, {5, 6}, {7, 8, 9} };
```

Jedes Element wird einfach wieder in geschwungene Klammern gepackt. Die Größe dieses Felds ist genau wie im vorherigen Beispiel.

Auf diese Art:

```java
int[][] r = new int[4][3];
```

kann allerdings nur ein Array definiert werden in dem jedes Element gleich groß ist (rechteckig).

Um die Größe eines Felds zu bestimmen funktioniert auch hier:

```java
int anzElemente = r.length;
```

Es wird die Anzahl der Elemente dieses Felds zurückgegeben, Für unser Beispiel 4 (r[0] ... r[3]). Um die Anzahl der Elemente im ersten Element zu bestimmen entsprechend:

```java
int anzElemente = r[0].length;
```

Für unser Beispiel 3 (r\[0\]\[0\] ... r\[0\]\[2\]). Zum einfachen Anzeigen von mehrdimensionalen Arrays funktioniert die toString()-Methode nicht, stattdessen gibt's die deepToString() Methode:

```java
System.out.println(Arrays.deepToString(r));
```

Auf die gleiche Weise kann jedem Element eines 2-dimensionalen Felds wiederum ein Array zugewiesen werden. Damit kann ein 3-dimensionales Array definiert werden. Logisch gibt es keine Begrenzung der Dimension eines Feldes.

## Methoden / Eigenschaften von Arrays

`arr.length`					gibt die Anzahl der Elemente im Array arr zurück

`arr[0].length`				gibt die Anzahl der Elemente im ersten Element des Feldes arr zurück

`Arrays.deepToString(arr)`	Wandelt das Array arr in einen String zur Ausgabe um

