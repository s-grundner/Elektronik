# 9 Datei Zugriff / I/O-Streams

Um Daten über die Dauer der Ausführung eines Programms hinaus zu behalten, müssen Daten in Dateien geschrieben werden (Spielstand, Worddokument ...). In Java laufen sämtliche Ein-/Ausgaben *stromorientiert*, also mit Hilfe von **I/O-Streams**. Ein Datenstrom ist eine Verbindung zwischen einer Quelle (Tastatur, aus Datei lesen, das Programm ...) und einem Ziel (Konsole, in Datei schreiben, das Programm ...). Der Datenstrom verläuft dabei nur in eine Richtung. Die Abfolge lautet:

- Die Verbindung mit der Datenquelle wird geöffnet
- Sequenzielle (nacheinander erfolgende) Übertragung
- Die Verbindung mit der Datenquelle wird geschlossen

Die verwendeten Klassen und Methoden müssen aus dem Paket `java.io` importiert werden.

## Exceptions

Zugriffe auf Dateien können immer Ausnahmen auslösen. Eine zu lesende Datei existiert nicht mehr, ist verschoben worden oder in eine zu schreibende Datei ist der Zugriff nicht gestattet. Daher ist eine Ausnahmebehandlung für Dateien immer sinnvoll und notwendig. 

## Gebuffert in Datei Schreiben

Werden mehrere Zeichen von einer Datei (Datenquelle) gelesen bzw. in eine Datei (Datenziel) geschrieben, dann ist es sehr aufwendig jedes Zeichen einzeln zu verarbeiten. In Java steht mit den `BufferedWriter`  eine Klasse zur Verfügung zum gebufferten Schreiben:

```java
BufferedWriter out = new BufferedWriter(new FileWriter("c:\\temp\\test.txt"));	// oder "c:/temp/test.txt"
```

Der `BufferedWriter`  müssen mit einem elementaren Strom verkettet werden. Beim Schreiben in Dateien mit einem `FileWriter` Objekt.

Den `BufferedWriter` Objekten stehen die Instanzmethoden `write()` und `newLine()` zur Verfügung.

Abschließend muss der Strom mit der Methode `close()` beendet werden:

```java
// Öffnen
BufferedWriter out = new BufferedWriter(new FileWriter("c:\\temp\\test.txt"));	// oder "c:/temp/test.txt"

// Schreiben
out.write("Hallo wie geht's");
out.newLine();					// Zeilenumbruch passt sich ans System an
out.write("I like JAVA\r\n");	  // \r\n: Windows-Zeilenumbruch

// Schließen
out.close();
```

Durch eine gebufferte Verbindung kann die Datenquelle (das Programm) die Daten schnellstmöglich in den Buffer schreiben. Der langsamere Strom zum Datenziel (die Datei) wird mit der ihr möglichen Geschwindigkeit beschrieben bzw. erst dann wenn eine gewisse Datenmenge aufgelaufen ist. Die schnelle Quelle wird dadurch nicht von einem langsamen Ziel gebremst und die Anzahl der Zugriffe wird reduziert.

Mit der Methode `flush()` können die Daten bewusst zu diesem Zeitpunkt in den Datenstrom geschrieben werden.

## Gebuffert aus Datei Lesen

Datenstrom öffnen:

```java
BufferedReader in = new BufferedReader(new FileReader("c:\\temp\\test.txt"));	// oder "c:/temp/test.txt"
```

Lesen der nächsten Zeile aus der Datei (Zeilenumbruch wird entfernt):

```java
String zeile = in.readLine();
```

Wenn die letzte Zeile gelesen wurde, wird beim nächsten Lesen null zurückgegeben. Schließen des Datenstroms:

```java
in.close();
```

## Dateien und Verzeichnisse

Im Paket `java.io` findet sich die Klasse `File` deren Objekte jeweils entweder eine Datei oder ein Verzeichnis repräsentieren:

`public File(String pathname)`	File-Objekt gemäß pathname

Methoden:

`boolean canRead()`				Liefert true wenn das File-Objekt lesbar ist.

`boolean canWrite()`				Liefert true wenn das File-Objekt schreibbar ist.

`boolean createNewFile()`			Legt eine neue Datei an.

`boolean delete()`				Löscht die zum File-Objekt gehörende Datei.

`boolean exists()`				liefert true, wenn das File-Objekt existiert.

`String getName()`				liefert den Namen des File-Objekts.

`boolean isDirectory()`			liefert true, wenn das File-Objekt ein Verzeichnis ist.

`boolean isFile()`				liefert true, wenn das File-Objekt eine Datei ist.

`long length()`					liefert die Größe der Datei in Bytes.

`String[] list()`				liefert eine Liste der Verzeichniseinträge, wenn das File-Objekt ein Verzeichnis ist und null sonst.

`boolean mkdir()`				legt ein neues Verzeichnis mit dem Namen des File-Objekts an.

`boolean renameTo(File dest)`		benennt das File-Objekt in dest um.

## Andere Streams

*FileReader*: ungebuffertes Lesen von einem Datei-Datenstrom

*FileWriter*: ungebuffertes Schreiben von einem Datei-Datenstrom

Die Streams *FileReader*, *FileWriter*, *BufferedReader*, *BufferedWriter* sind *Zeichenströme*, das bedeutet es werden Zeichen als kleinste Einheit übertragen. In Java sind diese als 2-Byte Unicode-Zeichen (*Character*) dargestellt.

Im Gegensatz zu den Zeichenströmen gibt es die *Byteströme* die als kleinste Einheit je ein Byte übertragen: *InputStream* und *OutputStream*.