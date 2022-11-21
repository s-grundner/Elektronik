# 7.2 Mehrdimensionale Arrays - Übungen

1. Es soll ein Array angelegt werden mit 2x2 Ganzzahlen. Gib die Adresse des Arrays aus. Gib den Inhalt des Arrays (1te Dimension - Index 0) aus.

   

2. Finde das Maximum eines nicht rechteckigen, 2 dimensionalen Arrays.

   

3. Lege ein einfaches Array an um alle Noten eines Schülers in den besuchten Gegenständen zu Speichern. Berechne anschließend den arithmetischen Mittelwert um den Notenschnitt zu berechnen.

   

4. Das vorherige Beispiel soll erweitert werden um die Noten sämtlicher Fächer der Schülers einer Klasse abzulegen. Berechne anschließend den Notenschnitt des Schülers und den Notenschnitt je Fach.

   

5. Das vorherige Beispiel soll erweitert werden um die Noten der Klassen einer Abteilung abzulegen.

   

6. Sudoku. Es soll ein 9x9-Sudoku-Feld angelegt werden. In diesem gegebenen Array sind teilweise Nummern von 1-9 eingetragen. Andere Array-Elemente sind noch leer (mit 0 befüllt). Mittels Eingabeaufforderung können Werte eingetragen werden. Ein voll befülltes Feld soll auf richtige Lösung überprüft werden.


### Beispiele

1. Es soll ein Array angelegt werden mit 2x2 Ganzzahlen. Gib die Adresse des Arrays aus. Gib den Inhalt des Arrays (1te Dimension - Index 0) aus.
   L:

   ```java
   int[][] arr = {{1, 2},{3, 4}};
   System.out.println(arr);
   System.out.println(arr[0]);
   ```

   Anzeige:

   ```java
   [[I@15db9742
   [I@6d06d69c
   ```

   Die erste Ausgabe zeigt: 2-dim.-Array (doppelte [-Klammer) bestehend aus Integer-Elementen unter der Adresse ... .
   Die zweite Ausgabe zeigt: Array mit Integer-Werten unter der Adresse ... .

   

2. Finde das Maximum eines nicht rechteckigen, 2 dimensionalen Arrays.

   L:

   ```java
   int max = numFeld[0][0];

   for (int i = 0; i < numFeld.length; i++) {
     for (int j = 0; j < numFeld[i].length; j++) {
       max = Math.max(max, numFeld[i][j]);
     }
   }
   ```

3. Lege ein einfaches Array an um alle Noten eines Schülers in den besuchten Gegenständen zu Speichern. Berechne anschliessend den arithmetischen Mittelwert um den Notenschnitt zu berechnen.
   L:

   ```java
   String nameSchueler = "MUSTERMANN Max";
   String[] fachSchueler = {"GGP", "RK", "BESP", "HWE"};	  // welche Fächer hat der Schüler
   int[] notenSchueler = {1, 3, 2, 4};						// welche Noten hat der Schüler
   ...
   ```

4. Das vorherige Beispiel soll erweitert werden um die Noten sämtlicher Fächer derSchülers einer Klasse abzulegen. Berechne anschliessend den Notenschnitt des Schülers und den Notenschnitt je Fach.
   L:

   ```java
   String[] nameSchueler = {"MUSTERMANN Max", "HUBER Manuel", "MAIER Klaus", "MüLLER Sebastian", "MEIER Fritz"};
   String[] fachSchueler = {"GGP", "D", "BESP", "RK"};													// welche Fächer haben die Schüler
   int[][] notenSchueler = {{1, 1, 2, 1}, {2, 2, 1, 2}, {1, 2, 3, 4}, {1, 2, 3, 5}, {1, 2, 3, 4}};			// welche Noten haben die Schüler [Schueler][Fach]
   ...
   ```
   Wichtig: für das Array notenSchueler klar notieren, welche Dimension den Schüler und welche Dimension das Fach beinhaltet.

5. Das vorherige Beispiel soll erweitert werden um die Noten der Klassen einer Abteilung abzulegen.
   L:

   ```java
   String[] jahrgang = { "2AHEL", "2BHEL" };		
   String[][] nameSchueler = {																			// [klasse][schueler]
   				{ "Mustermann Max", "Huber Manuel", "Maier Klaus", "Müller Sebastian Manuel Siegfried"},
   				{ "Heiner Max", "Berthans Manuel", "Klieber Klaus", "Mülhan Sebastian", "Sogis Fritz" } };
   		
   String[][] fachSchueler = {{ "GGP", "D", "BESP", "RK" },{ "GGP", "D", "BESP"}}; // [Jahrgang][Fach] ... andere Klasse-->andere Fächer

   int[][][] notenSchueler = { // [klasse][schueler][fach]
     				{ { 1, 1, 2, 1 }, { 2, 2, 1, 2 }, { 1, 2, 3, 4 }, { 1, 2, 3, 5 }},
   				{ { 1, 1, 2}, { 2, 2, 1 }, { 1, 2, 3 }, { 1, 2, 3 }, { 1, 2, 3 } } };
   ...
   ```

   Wird schon sehr unübersichtlich --> gut ersichtlich mit den Indexen arbeiten (Bedeutung notieren).

6. Sudoku. Es soll ein 9x9-Sudoku-Feld angelegt werden. In diesem gegebenen Feld sind teilweise Nummern von 1-9 eingetragen. Andere Feld-Elemente sind noch leer (mit 0 befüllt).

   - Durch Eingabe-Abfragen können mit geeigneten Koordinaten Werte in das Rätsel eingetragen werden.
   - Es soll nur an Feldpositonen, an denen keine Angabe gegeben ist eingetragen werden dürfen, ansonsten Ausgabe einer Fehlermeldung.
   - Wenn sämtliche Felder befüllt sind, soll eine Überprüfung stattfinden ob das Sudoku korrekt gelöst wurde.

   die Ausgabe der aktuellen Einträge in der Konsole soll ansprechend erfolgen, z.B.:

   ```cmd
      | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 
   ---+---+---+---+---+---+---+---+---+---+
    1 | 3 | 4 |   | 1 | 6 | 7 |   |   | 5 | 
   ---+---+---+---+---+---+---+---+---+---+
    2 | 5 |   |   |   |   | 9 | 3 | 7 | 1 | 
   ---+---+---+---+---+---+---+---+---+---+
    3 | 1 | 7 | 9 | 2 | 5 | 3 |   |   | 4 | 
   ---+---+---+---+---+---+---+---+---+---+
    4 |   | 6 |   | 9 |   |   |   |   |   | 
   ---+---+---+---+---+---+---+---+---+---+
    5 |   | 5 |   | 3 | 4 |   | 1 | 2 | 9 | 
   ---+---+---+---+---+---+---+---+---+---+
    6 |   |   | 2 | 5 | 7 |   |   |   |   | 
   ---+---+---+---+---+---+---+---+---+---+
    7 | 6 |   | 4 | 7 |   |   | 9 | 3 |   | 
   ---+---+---+---+---+---+---+---+---+---+
    8 |   | 1 | 3 |   |   |   | 5 |   |   | 
   ---+---+---+---+---+---+---+---+---+---+
    9 |   |   |   | 6 |   | 2 |   |   |   | 
   ---+---+---+---+---+---+---+---+---+---+
   ```

   L:

   ```java
   int[][] feld = { { 3, 4, 0, 1, 6, 7, 0, 0, 5 }, { 5, 0, 0, 0, 0, 9, 3, 7, 1 }, { 1, 7, 9, 2, 5, 3, 0, 0, 4 },
   				{ 0, 6, 0, 9, 0, 0, 0, 0, 0 }, { 0, 5, 0, 3, 4, 0, 1, 2, 9 }, { 0, 0, 2, 5, 7, 0, 0, 0, 0 },
   				{ 6, 0, 4, 7, 0, 0, 9, 3, 0 }, { 0, 1, 3, 0, 0, 0, 5, 0, 0 }, { 0, 0, 0, 6, 0, 2, 0, 0, 0 } };

   int[][] feldOrig = new int[feld.length][feld[0].length];
   ...
   ```

   Zum Überprüfen , welches Feld beschrieben wird kann ein zweites Feld verwendet werden (hier feldOrig[]).

   Verwende Methoden zur Verbesserung der Lesbarkeit.

   Erweiterungen:


- Bei jeder Eingabe soll auf Plausibilität geprüft werden (gibt's die Eingabe schon in der Zeile/Spalte, gibt's die Eingabe schon im 3x3 Feld)
   - Auf Anfrage soll ein Lösungsvorschlag angeboten werden
   - Das Programm soll in der Lage sein die Lösung zu berechnen