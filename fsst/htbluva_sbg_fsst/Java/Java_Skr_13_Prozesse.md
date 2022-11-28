# 13 Prozesse / Threads

Das Java-Programm welches auf dem Rechner läuft, wird als **Prozess** bezeichnet. Ein Prozess erhält einen eigenen Speicherbereich in dem kein weiterer auf dem Rechner laufender Prozess Zugriff hat. Das wird vom Betriebssystem sichergestellt. Weiters teilt das Betriebssystem den Prozessen Rechnerzeit zu.

Innerhalb eines Prozesses (unser Java-Programm) läuft im einfachsten Fall ein einzelner Ablauf ab. Dieser Ablauf wird als **Thread** bezeichnet. In einem Prozess können aber auch mehrere Threads parallel ablaufen. Diese teilen sich dann den gemeinsamen Speicher (Adressraum) des Prozesses. Wirklich parallel (gleichzeitig) können die Threads natürlich nur laufen wenn mehrere Rechnerkerne verfügbar sind, ansonsten laufen sie quasiparallel, d.h. es wird ständig zwischen ihnen "hin- und hergeschaltet". Durch eine gute Organisation bzw. eine entsprechend leistungsstarke Umgebung merkt der Anwender im Idealfall nichts davon. Die parallelen Threads können entweder durch das Betriebssystem organisiert werden oder durch die JVM (je nach Anforderung).

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

Der Thread *MyThread* wird von der Klasse Thread abgeleitet. Die Methode `run()`  wird beim Start eines Thread mit der Methode start() automatisch ausgeführt:

```java
public static void main(String[] args) {
	MyThread t = new MyThread();
	t.start();
}
```

### Thread unterbrechen

Mit der Methode `interrupt()`  kann in einem Thread ein Interrupt-Flag gesetzt werden. Dieses Flag kann im Thread zyklisch mit den Methoden  `interrupted()`  oder `isInterrupted()`  abgefragt werden. Wobei bei Abfrage von `interrupted()`  gleichzeitig das Flag gelöscht wird und bei `isInterrupted()`  das Flag weiter gesetzt bleibt. Wenn im Thread eine *InterruptedException* ausgelöst wird, dann wird das Flag ebenfalls gelöscht. Dann sollte im Catch-Block dieser Exception das Flag mit der Methode `interrupt()`  erneut gesetzt werden:

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
###Thread Methoden

Für Thread-Objekte gibt es folgende Instanzmethoden:

`getName()`		Während der Erzeugung kann einem Thread ein Name gegeben werden. Der Name eines Threads kann in einem Thread-Konstruktor mit `super(threadName)`  gesetzt werden.

`setPriority(Thread.MAX_PRIORITY)`	setzt die entsprechende Priorität  (max = 10). Standardmäßig wird das 5 gesetzt. Die Auswirkung hängt vom Betriebssystem ab.

`getPriority()`	liefert die Ausführungspriorität  zurück.

`getState()`		liefert den Zustand des Threads: NEW - vor .start(), RUNNABLE - läuft in der JVM, BLOCKED, WAITING, TIMED_WAITING, TERMINATED - Ausführung beendet (ausgelaufen oder stop()).

`sleep(2000)`	hält den Thread für eine gewisse Zeit an. Statische Methode um den eigenen Thread  anzuhalten: `TimeUnit.SECONDS.sleep(2);`.

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

Um gewisse Teile zu sperren, können sie ein einen synchronized-Block zusammengefasst werden bzw. können gesammte Methoden mit dem Schlüsselwort  synchronized versehen werden:

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
