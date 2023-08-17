# 1 Einführung

Warum Java? Java ist eine der am weitesten verbreitete Sprache (Tiobe 2021: C vor Python und Java). Durch das Konzept der Java-Virtual-Machine lässt sich das kompilierte Programm auf allen gängigen Plattformen (Windows, Linux, Mac, Android ...) ausführen. Java ist sicher, objektorientiert und es gibt durch die große Verbreitung eine Vielzahl von verfügbaren Funktionen auf die zugegriffen werden kann. Es gibt eine große Community und damit eine Unzahl an verfügbaren Lösungen. Für das Android-Betriebssystem werden sehr viele Anwendungen mittels Java erstellt (allerdings mit anderen Bibliotheken).

## Begriffe

- Entwicklungsumgebung (IDE):
  Programm das bei der Programmentwicklung unterstützt. Besteht zumindest aus einem Editor. Oft mit Syntax-Highlightning (Färbung von Code-Elementen), integriertem Debugger, Projektorganisation, Erstellen von Dokumentationen und vielem Anderen. Im einfachsten Fall würde auch ein einfacher Editor genügen.

- Compiler: Programm welches den **Java-Quellcode** in den **Java-Bytecode** übersetzt. In vielen anderen Programmiersprachen (C, C++, C# ...) wird durch den Compiler direkt in ein ausführbares Programm (in Windows EXE) übersetzt.

- Java Virtuelle Maschine (JVM): Dieses Programm kann den Java-Bytecode auf dem Rechner ausführen.

- Java Development Kit (JDK): Paket das unter Anderem den Compiler und die JRE beinhaltet.

- Java Runtime Environment (JRE): Beinhaltet die JVM und Programmbibliotheken.

- Quellcode: Code der "reingetippt" wird (.java-Datei).

- Bytecode: Die Datei, die vom Java-Compiler aus dem Quellcode erstellt wird (.class-Datei).

## Programm-Erstellung/-Ausführung

Nach Erstellung des Quellcodes muss das Programm in einen Byte-Code umgewandelt werden (**Kompiliert**) werden. Man benötigt dafür einen Java-Compiler (Teil der JDK). Der Java-Bytecode kann nicht alleine direkt auf dem Betriebssystem ausgeführt werden. Man benötigt ein Programm das diesen Bytecode ausführt, die **Java-Virtuelle-Maschine**. Der Vorteil dieser Variante (im Vergleich zu anderen Programmiersprachen) ist, dass auf einem Rechnersystem mit einem verschiedenen Betriebssystem der idente Bytecode unter Verwendung einer JVM ausgeführt werden kann.

![Programm-Erstellung](bilder/01_Einführung_Erstellung.png "Programm-Erstellung")

**Beispiel:** Ausgabe von "Hello 2AHEL!" auf der Konsole: 

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello 2AHEL!");
    }
}
```

Dieser **Quellcode** wird in die Datei *c:/temp/HelloWorld.java* gespeichert (Achtung auf Groß-/Kleinschreibung) - der Dateiname muss dem Klassennamen entsprechen. In einem Terminalfenster (Kommandozeile, DOS-Box) wird in das Verzeichnis *c:/temp/* gewechselt und der Quellcode kompiliert (Compiler: *javac.exe*):

```
C:\temp>javac HelloWorld.java
```

Dadurch wird in *c:/temp/* die Datei *HelloWorld.class* (der **Bytecode**) erstellt. Abschließend wird das Programm in der JVM (Aufruf durch *java.exe*) ausgeführt:

```
C:\temp>java -cp .HelloWorld
```

Der Parameter *-cp .* fügt den aktuellen Pfad (*c:/temp*) zum *ClassPath* dazu.

Eine moderne Entwicklungsumgebung (IDE, z.B. Eclipse, IntelliJ IDEA)  führt diesen Weg automatisch aus, wenn immer das Programm gestartet wird.

## Packages

Größere Anwendungen können aus einer Vielzahl von Quellcode-Dateien zusammengesetzt sein. Um eine bessere Übersicht gewährleisten zu können, werden zusammengehörende Dateien in Paketen, den Packages abgelegt. Für einfache Programm (wird bei uns fast immer so sein) ist das nicht unbedingt sinnvoll beziehungsweise notwendig.

**Hauptprogramm *main* in einem Package:**

```java
package helloPackage
public class HelloWorld {
	public static void main(String[] args) {
		System.out.println("Hello 2AHEL!");
	}
}
```

Das Source-File *HelloWorld.java* liegt hier in *helloPackage*, das Kompilieren funktioniert in diesem Fall analog:

```
C:\temp>javac helloPackage\HelloWorld.java
```

damit wird im Verzeichnis der Java-Source die Datei *HelloWorld.class* erstellt. Zum Ausführen (Wichtig: . statt \\):

```
c:\temp\java helloPackage.HelloWorld
```

die *class*-Datei liegt in einem Verzeichnis das genau wie das Package benannt ist. Das Programm wird außerhalb dieses Verzeichnisses gestartet mit dem Verzeichnisname/Pfadname und Punkt und Class-Name. Wenn im Hauptprogramm mehrere Source-Dateien eingebunden werden, dann muss lediglich das Hauptprogramm kompiliert werden, die eingebundenen Sourcen werden automatisch mit kompiliert.

## Fragen

- Was versteht man unter einem Quell-Code und was unter einem Byte-Code?
- Welche Vor-/Nachteile ergeben sich dadurch, dass in Java kein direkt ausführbares Programm erzeugt wird?
- Wie wird ein Java-Programm kompiliert?
- Wie wird eine Java-Anwendung ausgeführt?
- Was ist der Sinn von Packages?
- Kompilieren und führen sie eine Java-Anwendung aus.
