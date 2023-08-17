# 10 Ausnahmen / Exceptions - Übungen

## Einlesen Schulnoten (100)

Erstellen Sie ein Programm das:

- in einer Funktion **getNums** ganzzahlige Schulnoten von der Tastatur einliest. Die eingelesenen Nummern sind in einem ganzzahligem Array (maximale Größe 10 Elemente) abzulegen. Das Einlesen soll so lange erfolgen, bis etwas anderes als eine Ganzzahl eingegeben wird. Die Erkennung ist mittels **try-catch** zu implementieren. Damit ersichtlich ist wieviele Noten eingegeben wurden wird die Anzahl der eingegebenen Werte an die erste Stelle des Felds gestellt. Ob mehr als die erlaubten 9 Noten eingegeben werden soll ebenfalls mittels **try-catch** erkannt werden (und wie eine ungültige Eingabe behandelt werden). Die Funktion gibt das Array zurück.

  Beispielhaftes Feld für Eingabe von 1, 4 und 2:

  ```
  [3, 1, 4, 2, 0, 0, 0, 0, 0, 0]
  ```

## Mittelwert Schulnoten (101)

Schreiben Sie für das vorhergehende Programm:

- eine Funktion **getMW** die den Mittelwert der eingegebenen Zahlenfolge ermittelt und zurückgibt. Die Zahlenfolge wird dieser Funktion als Array übergeben. An der ersten Stelle des Felds ist die Anzahl der folgenden, auszuwertenden Noten abgelegt. Wenn im Feld keine Werte abgelegt sind (erstes Element ist 0), dann soll das mittels **try-catch** abgefangen werden und die Funktion -1 zurückgeben (Division durch 0 wirft nur Exception bei Integer-Division).

## Noten-Datei Lesen (102)

Erweitern Sie das vorhergehende Programm:

- mit einer Funktion **readWerte** welche die Noten aus einer Datei einliest und ein Feld in gleicher Form wie oben bei der Tastatureingabe zurückgibt. Für Exceptions sind **try-catch** vorzusehen.