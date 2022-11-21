# 10 Ausnahmen / Exceptions

In Software gibt's zum einen syntaktischen Fehler im Programm "Syntax Error". Diese können von einem Compiler gefunden werden (z.B. es fehlt eine Klammer, eine Variable wird verwendet, wurde aber nie definiert ...). Aufgrund dieser Art von Fehlern kann das Programm schon mal gar nicht kompiliert und ausgeführt werden.

Wenn all diese syntaktischen Fehler ausgeräumt sind kann das Programm kompiliert und gestartet werden. Es können allerdings Fehler im Programm sein die erst während der Programmlaufzeit entstehen. Wird eine Division ausgeführt wobei der Divisor von der Tastatur eingelesen wird dann kann ja ein Benutzer eine 0 eingeben. Wenn das in der Programmlogik nicht geprüft wird, dann wird versucht eine Division durch 0 zu berechnen die allerdings nicht definiert ist. Fehler die erst zur Laufzeit auftreten - **Laufzeitfehler** - werden auch als Ausnahmen / Exception bezeichnet.

Zum Beispiel: Division durch Null, Feld-Index im unerlaubten Bereich oder die zu lesende Datei konnte nicht geöffnet werden.

Beispiel:

```java
int a = 3, b = 0;
int c = a / b;
```

Wenn das Programm ausgeführt, lässt es sich fehlerfrei übersetzen. Zur Laufzeit erhält man den Fehler:

```java
Exception in thread "main" java.lang.ArithmeticException: / by zero
	at temp.test.main(test.java:12)
```

Es handelt sich um eine *ArithmeticException* (Klasse java.lang.ArithmeticException) welche die Nachricht */ by zero* an der Stelle *temp.test.main(test.java:12)* ausgibt. Das Programm wird an dieser Stelle beendet.

## Try / Catch

Damit ein Programm nicht zwangsläufig beim Auftreten einer Ausnahme beendet wird, kann der kritische Programmteil in einen *Try-Block* eingebettet werden. Es wird versucht diesen Programmteil auszuführen, sollte eine Ausnahme in diesem Teil auftreten, dann kann diese in einem *Catch-Block* aufgefangen werden. Für das vorherige Beispiel also:

```java
try {

  int c = a / b;
  System.out.println("Ergebnis: " + c);

} catch (ArithmeticException excep) {

  System.out.println("Division durch 0!");

}
```

Es wird versucht die Division auszuführen, sollte die Rechnung eine Ausnahme auslösen, dann verzweigt das Programm in den Catch-Block, gibt den Text "Division durch 0!" aus und führt das Programm nach dem Ende des Catch-Blocks fort.

Mit dem Objekt excep steht auch weitere Information zur Verfügung:

`String getMessage()`	liefert die Nachricht */ by zero*

`Class getClass()`		liefert den Klassennamen *java.lang.ArithmeticException*

## Behandlung mehrerer Exceptions

Möglichkeit 1:

```java
try {
  ...
} catch (IOException|FileNotFoundException ex) {	// fängt beide Ausnahmen ab
  System.out.println("IOException oder FileNotFoundException aufgetreten!");
}
```

Möglichkeit 2:

```java
try {
  ...
} catch (IOException ex) {				// fängt 1ten Ausnahmentyp ab
  System.out.println("IOException aufgetreten!");
} catch (FileNotFoundException ex) {	 // fängt 2ten Ausnahmentyp ab
  System.out.println("FileNotFoundException aufgetreten!");
}
```

Möglichkeit 3:

```java
try {
  ...
} catch (IOException | FileNotFoundException ex) {// fängt 1ten Ausnahmentyp ab
  System.out.println("Exception aufgetreten!");
}
```

Möglichkeit 4:

```java
try {
  ...
} catch (Exception ex) {	// fängt sämtliche von Exception abgeleitete Ausnahmen ab
  ...
}
```

## Exceptions / RuntimeExceptions

- ArithmeticException: mathematische Ausnahmen
- ArrayIndexOutOfBoundsException: Index eines Feldzugriffs ausserhalb des definierten Bereichs
- NullPointerException: Versuch auf ein Objekt zuzugreifen das nicht instanziert wurde
- IOException: Fehler beim Dateizugriff

Es gibt Exceptions die leiten sich nicht direkt von der Klasse Exception ab, sondern von der Klasse **RuntimeException**. RuntimeExceptions müssen nicht zwangsläufig behandelt werden. Ein Beispiel dafür ist die ArithmeticException. Sie muss nicht behandelt werden wenn eine Division durchgeführt wird. Die IOExceptions im Gegensatz dazu müssen behandelt werden. Wird dieser Umstand ignoriert, kann das Programm nicht erstellt werden, aufgrund "Nicht behandelter Ausnahmebedingung".

> Exceptions müssen behandelt werden, sonst kann das Programm nicht übersetzt werden.
>
> RuntimeExceptions müssen nicht behandelt werden.

## Weiterreichen von Exceptions

Soll eine Ausnahme nicht direkt in der Methode behandelt werden in der sie auftritt, dann kann diese an die Aufrufende Instanz "weitergeleitet" (geworfen) werden:

```java
public static void main(String[] args) {
  FileReader inStream = new FileReader("c:\\temp\\test.txt");
  ...
```

Dieser Code lässt sich nicht übersetzen, der Compiler bringt die Meldung: "Nicht behandelte Ausnahmebedingung (exception type) FileNotFoundException". Weiterleiten der Ausnahme:

```java
public static void main(String[] args) throws FileNotFoundException {
  FileReader b2 = new FileReader("c:\\temp\\test.txt");
  ...
```

Damit lässt sich der Code übersetzen. Tritt die Ausnahme auf (Dateiname oder Pfad fehlerhaft), dann bricht das Programm ab und bringt eine FileNotFoundException-Fehlermeldung. Wird eine Exception in einer Methode weitergeleitet muss die aufrufende Instanz die Exception behandeln. Im angeführten Beispiel ist die höhere Instanz die JRE die eben den Fehler während der Laufzeit ausgibt. In einer Methode sieht das so aus:

```java
public static void main(String[] args) {
  try {
    FileReader in = fileOpen();
  } catch (IOException e) {
    ...
    e.printStackTrace();
  }
}

static FileReader fileOpen() throws IOException {
  return new FileReader("c:\\temp\\tedst.txt");
}
```

> Mit throws im Methodenkopf können Ausnahmen in dieser Methode abgefangen und an die höhere Instanz weitergeleitet werden.

## Selbstdefinierte Exceptions

Um eigene Ausnahmen zu definieren müssen sie von passenden Exceptions abgeleitet werden:

```java
public class MyException extends RuntimeException {
}
```

Damit kann die eigene Exception geworfen werden:

```java
static void myFunc() {
  ...
  throw new MyException();   // Funktion wird hier beendet und Fehler
                             // an aufrufende Instanz weiter geleitet
  ...
}
```

Behandlung (nicht zwingend, da von einer RuntimeException abgeleitet):

```java
try {
  myFunc();
} catch (MyException except) {
  System.out.println("Fehler aufgetreten");
}
```

## Einsatz / Effizienz

Der Vorteil vom Java-Ausnahmen Konzept ist, dass gewisse Auseinandersetzungen zu Laufzeitfehlern schon während der Verwendung von Methoden erzwungen werden können. So muss für die Dateibehandlung ein Try/Catch oder alternativ ein Weiterleiten auf alle Fälle eingebaut werden.

Das Behandeln von Ausnahmen mit Try/Catch ist grundsätzlich ineffizient (es muss ein Stack-Speicherabbild erstellt werden). Sollte Geschwindigkeit eine Rolle spielen, ist es besser die Ausnahme vorher abzufangen. Für Division durch Null kann entsprechend eine Verzweigung eingebaut werden oder bei Dateizugriffen kann vor dem Öffnen des Datenstroms eine Prüfung eingebaut werden die auf Existenz der Datei prüft.

> Try/Catch nur für Zeitunkritische Programmteile verwenden. Ansonsten Fehlerquellen vorab behandeln.

## Finally

Wird aus einer Methode eine Ausnahme in einem Try-Block an die nächsthöhere Instanz geworfen, dann gibt es in der Methode keine Möglichkeit evtl. noch notwendigen Code auszuführen. Daher gibt's zusätzlich den Finally-Block der das ermöglicht:

```java
01:static void myFunc() throws IOException {
02:  try {
03:    ...
04:    // hier tritt die IOException auf
05:    ...  
06:  } catch (FileNotFoundException ex) {
07:    ...
08:  } finally {
09:    ...
10:  }
11:  
12:}
```

Der Catch-Block in Zeile 06 fängt keine IOException auf, wenn eine solche auftritt, dann würde sie sofort an die aufrufende Instanz weitergeleitet (throws in Zeile 01). Davor wird aber noch der Code im Finally-Block in Zeile 09 ausgeführt. Der Finally-Block wird auch ausgeführt wenn der Try-Block Fehlerfrei durchläuft und auch wenn eine FileNotFoundException aufgefangen wurde.

> Code im Finally-Block wird immer ausgeführt.

## Referenzen

- Oracle-Handbuch:

  https://docs.oracle.com/javase/tutorial/essential/exceptions/

- Insel (deutsch):

  http://openbook.rheinwerk-verlag.de/javainsel9/javainsel_06_001.htm

- https://www.tutorialspoint.com/java/java_exceptions.htm

  
