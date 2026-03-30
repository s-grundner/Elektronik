---
tags:
  - OS
  - Java
aliases: []
created: 29th November 2022
title: Threads
---

# Os - Threads - Java

Vielfach sollen mehrere Berechnungen parallel/gleichzeitig/quasiparallel Erfolgen. Mit Nebenläufigkeit bezeichnet man die Fähigkeit eines Systems, zwei oder mehr Vorgänge gleichzeitig oder quasi-gleichzeitig ausführen zu können. 

- **Threads durch Java-Sprachkonstrukte**  
  In Java sind **Threads direkt in die Sprache** integriert. 
- **Ein Prozess kann mehrere Threads enthalten**  
  Ein Prozess enthält zumindest einen aber eventuell mehrere nebenläufige Threads (Parallel oder Quasiparallel).

- **Threads eines Prozesses haben einen gemeinsamen Adressraum**  
  Sie können auf dieselben Variablen zugreifen

Wichtige Anwendung: GUI-Anwendungen sollen möglichst akkurat auf Benutzeranwendungen reagieren aber gleichzeitig rechenintensive Teile effizient ausführen. Das Bedienen der GUI-Elemente und die verborgenen Rechnungen sind in nebenläufigen Threads zu führen.

Threads werden in Java durch die 

- **Klasse Thread** und das  
- **Interface Runnable** implementiert.

In beiden Fällen wird der nebenläufige Thread-Code, in der überlagerten **Methode run()** implementiert. 

**Kommunikation** zwischen den Threads (Datenaustausch …) kann mittels **Instanzoder Klassenvariablen** oder durch Aufruf von **Methoden** erfolgen. 

Zur **Synchronisation** stellt Java das aus der Betriebssystemtheorie bekannte Konzept des **Monitors** zur Verfügung, das es erlaubt, **kritische** **Abschnitte** innerhalb von Programmblöcken und **Methoden** zu kapseln und so den Zugriff auf gemeinsam benutzte Daten zu koordinieren. 

## Thread-Klasse

Um einen neuen Thread zu erzeugen wird eine Klasse von der Thread-Klasse abgeleitet. In dieser Klasse wird die `run()`-Methode überschrieben:

```java
class ThreadCls extends Thread {
    ...
    @Override public void run() {      // Ueberschreiben der run-Methode
        for(int i = 0; i < 10; i++) {
            try {
                Thread.sleep(5000);    // sleep braucht try-catch
            } catch(InterruptedException e) {}
            System.out.println("Hello from ThreadCls");
        }
    }
    ...
}
```

Im Java-Programm kann ein Objekt dieser Klasse erzeugt werden und die geerbte Methode `start()` aufgerufen werden:

```java
public static void main(String args[]) {
    ThreadCls myThread = new ThreadCls(...);      // ... je nach Konstruktur
    myThread.start();                               // ererbte Methode - ruft run() auf  
}
```

Mit der ererbten Methode `start()` (nicht überschreiben!) wird automatisch die überladene `run()` Methode in einem neuen Thread ausgeführt. Wird die `run()`-Methode direkt aufgerufen, dann wird **kein** eigener Thread gestartet.

Wie in C auch, kann der Haupt-Thread auf das Ende eines erzeugten Threads warten mit `join()`:

```java
...
myThread.join();     // hier wird gewartet bis myThread-run am Ende
...
```

Diese Methode kann auch mit Parameter "maximale Wartezeit in ms" angewendet werden:

```java
...
myThread.join(2000); // hier wird max 2s gewartet bis myThread am Ende
...
```

Wird das Hauptprogramm beendet bevor ein nebenläufiger Thread beendet wurde, dann läuft dieser im Hintergrund weiter. Sauber ist üblicherweise:

- entweder das Ende der gestarteten Threads mit einem `join` abwarten oder
- bewusst komplettes Beenden mittels `System.exit(0)` (0=Returncode OK)

> - Von der `Thread`-Klasse abgeleitete Klassen müssen die nebenläufige Funktion `public void run()` überschreiben.
> - Die `run()`-Funktion wird automatisch nebenläufig gestartet, wenn die `start()`-Funktion aufgerufen wird.
> - Der so erstellte nebenläufige Thread läuft auch weiter wenn `main()` beendet wird.

## Runnable

In Java gibt es keine Mehrfach-Ableitung, ist für eine bereits abgeleitete Klasse eine Thread-Funktion notwendig, kann das Interface `Runnable` verwendet werden.

```java
public class ThreadCls implements Runnable {
  ...
  @Override public void run() {...}
}
```

für das Starten des Threads muss ein Thread-Objekt erzeugt werden:

```java
...
Thread myThread = new Thread( new ThreadCls() );   // hier muss von der Thread-Klasse erzeugt werden
myThread.start();
...
```

Ansonsten ist das Verhalten zur Ableitung von der Thread-Klasse gleich.

> - Klassen die das Interface `Runnable` implementieren müssen die nebenläufige Funktion `public void run()` überschreiben.
> - Erzeugt werden muss der Thread mit der `Thread`-Klasse direkt.
> - Das übrige Verhalten ist gleich wie in der `Thread`-Klasse.

## Thread Abbrechen

Ein Thread kann nur aus dem Thread selber beendet werden. Dazu gibts die folgende Logik:

- `public void interrupt()` ist eine Funktion mittels welcher ein Interrupt-Flag gesetzt werden kann (public -> auch von außerhalt)
- `public boolean isInterrupted()` diese Funktion liefert den Status des Interrupt-Flags
- die Exception `InterruptedException` wird in der `sleep()`-Methode ausgeführt

```java
class CounterThread extends Thread {
    @Override public void run(){
        int i = 0;
        while (isInterrupted() == false) { // Endlosschleife solange nicht aktives Int-Flag
            System.out.println(i++);
        }
    }
}
 
public class Counter {
    public static void main(String[] args) {
        CounterThread myThread = new CounterThread();
        myThread.start();

	    try {
            Thread.sleep(2000);               // main waits 2 sec (myThread counts up)
        } catch (InterruptedException e){}    // check for Int-Flag of main-Thread

        myThread.interrupt();                 // Request Stop of myThread -> set Int-Flag
   }
}
```

Zu beachten ist, dass wenn sich ein Thread mittels `sleep()` schlafen legt und durch einen Interrupt in die Exception-Behandlung aufgeweckt wird, dann wird das Flag sofort automatisch zurückgesetzt.

Daher muss im Exception-Handler das Interrupt-Flag wieder gesetzt werden:

```java
class CounterThread extends Thread {
    @Override public void run(){
        int i = 0;
        while (isInterrupted() == false) {     // Loop runs until Int-Flag is set
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) { // Interrupt detected and cleared
                interrupt();                   // Set Interrupt newly
            }
            System.out.println(i++);
        }
    }
}
```

(hängt auch ein wenig von der Art der Thread-Erzeugung ab, evtl. ist `Thread.CurrentThread.isInterrupted()` notwendig)

Das gleiche Verhalten ist notwendig für eine Unterbrechung mittels `join()` oder `wait()`.

> - Abbrechen eines Threads durch Anfordern mittels `interrupt()`.
> - Prüfen auf Unterbrechung durch Prüfen mittels `isInterrupted()`.
> - Sicherstellen ob das *Flag* nicht durch eine `InterruptedException` in `sleep()`, `join()` oder `wait()` übersehen wird durch erneutes Setzen des Flags.

## Funktionen

`public final boolean isAlive()` prüft ob ein Thread noch läuft.

## Fragen

- Unterschied Thread/Prozess
- Wird eine Berechnung durch das Aufteilen auf mehrere Threads schneller (wodurch/warum/wann/wann nicht…)?
- Unterschied Thread/Runnable
- Wie kann ein Thread von außen beendet werden?

# Prozesse / Threads

Das Java-Programm welches auf dem Rechner läuft, wird als **Prozess** bezeichnet. Ein Prozess erhält einen eigenen Speicherbereich in dem kein weiterer auf dem Rechner laufender Prozess Zugriff hat. Das wird vom [Betriebssystem](../Betriebssysteme/index.md) sichergestellt. Weiters teilt das [Betriebssystem](../Betriebssysteme/index.md) den Prozessen Rechnerzeit zu.

Innerhalb eines Prozesses (unser Java-Programm) läuft im einfachsten Fall ein einzelner Ablauf ab. Dieser Ablauf wird als **Thread** bezeichnet. In einem Prozess können aber auch mehrere Threads parallel ablaufen. Diese teilen sich dann den gemeinsamen Speicher (Adressraum) des Prozesses. Wirklich parallel (gleichzeitig) können die Threads natürlich nur laufen wenn mehrere Rechnerkerne verfügbar sind, ansonsten laufen sie quasiparallel, d.h. es wird ständig zwischen ihnen "hin und hergeschalten". Durch eine gute Organisation bzw. eine entsprechend leistungsstarke Umgebung merkt der Anwender im Idealfall nichts davon. Die parallelen Threads können entweder durch das [Betriebssystem](../Betriebssysteme/index.md) organisiert werden oder durch die JVM (je nach Anforderung).

## Thread-Klasse

```java
public class MyThread extends Thread {
  @Override public void run() {
    for (int i = 0; i < 15; i++) {
      System.out.println(i);
    }
  }
}
```

Der Thread *MyThread* wird von der Klasse Thread abgeleitet. Die Methode `run()` wird beim Start eines Thread mit der Methode start() automatisch ausgeführt:

```java
public static void main(String[] args) {
	MyThread t = new MyThread();
	t.start();
}
```

### Thread unterbrechen

Mit der Methode `interrupt()` kann in einem Thread ein Interrupt-Flag gesetzt werden. Dieses Flag kann im Thread zyklisch mit den Methoden `interrupted()` oder `isInterrupted()` abgefragt werden. Wobei bei Abfrage von `interrupted()` gleichzeitig das Flag gelöscht wird und bei `isInterrupted()` das Flag weiter gesetzt bleibt. Wenn im Thread eine *InterruptedException* ausgelöst wird, dann wird das Flag ebenfalls gelöscht. Dann sollte im Catch-Block dieser Exception das Flag mit der Methode `interrupt()` erneut gesetzt werden:

```java
@Override public void run() {
  for (int i = 0; i < 1000; i++) {
    try {
      TimeUnit.SECONDS.sleep(2);				// 2 Sek. Pause: wird durch Interrupt unterbrochen --> löst Exception aus
    } catch (InterruptedException e) {
      interrupt();								// rückgesetztes Flag wird wieder gesetzt
    }
    if (interrupted())							// Überprüfung ob Unterbrochen
      System.out.println("Unterbrechung");
    }
  }
}
```

### Thread Methoden

Für Thread-Objekte gibt es folgende Instanzmethoden:

`getName()`		Während der Erzeugung kann einem Thread ein Name gegeben werden. Der Name eines Threads kann in einem Thread-Konstruktor mit `super(threadName)` gesetzt werden.

`setPriority(Thread.MAX_PRIORITY)`	setzt die entsprechende Priorität (max = 10). Standardmäßig wird das 5 gesetzt. Die Auswirkung hängt vom [Betriebssystem](../Betriebssysteme/index.md) ab.

`getPriority()`	liefert die Ausführungspriorität zurück.

`getState()`		liefert den Zustand des Threads: NEW - vor .start(), RUNNABLE - läuft in der JVM, BLOCKED, WAITING, TIMED_WAITING, TERMINATED - Ausführung beendet (ausgelaufen oder stop()).

`sleep(2000)`	hält den Thread für eine gewisse Zeit an. Statische Methode um den eigenen Thread anzuhalten: `TimeUnit.SECONDS.sleep(2);`.

`setDaemon(true)`	wenn diese Methode vor dem Start des Threads ausgeführt wird, dann wird der Thread als Dämon gestartet. Dadurch läuft der Thread auch weiter, wenn der Haupt-Thread beendet wurde.

`isDaemon()`			liefert true, wenn der Thread als Dämon gestartet wurde.

`stop()`				beendet den Thread sofort. Soll nicht verwendet werden, besser mit interrupt() Ende anfordern.

`interrupt()`		setzt ein Interruptflag im Thread. Im entsprechenden Thread wird eine InterruptedException ausgelöst.

`isInterrupted()`  	Prüfung ob interrupt-Flag gesetzt wurde, das Flag bleibt dabei gesetzt.

`Interrupted()`		Prüfung ob Interrupt-Flag gesetzt wurde, das Flag wird dabei gelöscht.

`join(msZeit)`		wartet maximal msZeit auf die Beendigung des Threads, ohne msZeit Angabe wird endlos gewartet.				

Beendet wird ein Thread:

- Wenn er ausläuft (siehe Beispiel oben: Schleife läuft aus).
- RuntimeException: Eine Ausnahme tritt auf, weitere Threads im Prozess werden dadurch nicht beeinflußt.
- Mit der Instanzmethode stop().
- JVM wird beendet

`Thread.sleep(1000)`	Statische *wait*-Methode

### Kommunikation

Die einfachste Möglichkeit der Kommunikation zwischen einem Thread und einem Zweiten sind der Austausch über Variable.

### Synchronized

Beispiel:

```java
public void setPt(int x, int y) {
  this.x = x;
  this.y = y;
}
```

Die Methode setPt() legt die Koordinaten eines Punkts fest. Wird diese Methode allerdings annähernd gleichzeitig von den unterschiedlichen Threads t1 und t2 aufgerufen, dann kann passieren:

- t1 ist früher als t2, dann überschreibt t2 die Werte von t1. Beziehungsweise umgekehrt
- t1 beginnt früher als t2, setzt x, in Folge beginnt t2 und schreibt x und auch y und abschließend schreibt t2 y. Der Punkt hat dann eine x-Koordinate von t2 und eine y Koordinate von t1.

Es kann zu einer unzulässiges Mischen von Daten kommen. Gelöst werden kann dieses Dilema durch ein Sperren eines Code-Bereichs. Dieser Bereich kann immer nur von einem Thread gleichzeitig betrieben werden.

Um gewisse Teile zu sperren, können sie ein einen synchronized-Block zusammengefasst werden bzw. können gesammte Methoden mit dem Schlüsselwort synchronized versehen werden:

``` java
synchronized void foo() {
  ...
}
```

bzw.

```java
synchronized {this}			// this = monitor
{
  ...
}
```

## Runnable

Soll eine abgeleitete Klasse in einem eigenem Thread laufen, dann kann sie nicht auch von der Klasse Thread abgeleitet werden. Abhilfe schafft die Runnable-Schnittstelle. Sie schreibt nur eine run() Methode vor:

```java
public class DateCommand implements Runnable {	// impl. die Schnittst. Runnable
  @Override public void run() {					// run-Methode der Klasse
    for ( int i = 0; i < 20; i++ )
      System.out.println( new java.util.Date() );
  }
}
```

Die run-Methode wird automatisch gestartet, wenn ein Objekt mit der Runnable-Schnittstelle als Thread gestartet wird:

```java
Thread t1 = new Thread( new DateCommand() );
t1.start();							// run-Methode wird im t1-Thread gestartet
```

## Zeitgesteuerte Abläufe

Mit `java.util.Timer` kann zeitlich gesteuert ein `java.util.TimerTask` ausgeführt werden:

```java
class MyTask extends TimerTask {
    @Override public void run() {
        System.out.println( "Make my day." );
    }
}
public class TimerTaskDemo {
    public static void main( String[] args ) {
        Timer myTimer = new Timer();
        
        myTimer.schedule(new MyTask(), 2000); // Start in 2 s
        myTimer.schedule(new MyTask(), 1000, 5000); // Start in 1 s dann Ablauf alle 5 s
    }
}
```

Alternative: `scheduleAtFixedRate`

Beendet kann der Timer werden mit timer.cancel();
