---
tags: ["Java"]
aliases: []
created: 29th November 2022
---

# 13 Prozesse / Threads

Das Java-Programm welches auf dem Rechner läuft, wird als **Prozess** bezeichnet. Ein Prozess erhält einen eigenen Speicherbereich in dem kein weiterer auf dem Rechner laufender Prozess Zugriff hat. Das wird vom [Betriebssystem](../Betriebssysteme/{MOC}%20Operating%20Systems.md) sichergestellt. Weiters teilt das [Betriebssystem](../Betriebssysteme/{MOC}%20Operating%20Systems.md) den Prozessen Rechnerzeit zu.

Innerhalb eines Prozesses (unser Java-Programm) läuft im einfachsten Fall ein einzelner Ablauf ab. Dieser Ablauf wird als **Thread** bezeichnet. In einem Prozess können aber auch mehrere Threads parallel ablaufen. Diese teilen sich dann den gemeinsamen Speicher (Adressraum) des Prozesses. Wirklich parallel (gleichzeitig) können die Threads natürlich nur laufen wenn mehrere Rechnerkerne verfügbar sind, ansonsten laufen sie quasiparallel, d.h. es wird ständig zwischen ihnen "hinund hergeschaltet". Durch eine gute Organisation bzw. eine entsprechend leistungsstarke Umgebung merkt der Anwender im Idealfall nichts davon. Die parallelen Threads können entweder durch das [Betriebssystem](../Betriebssysteme/{MOC}%20Operating%20Systems.md) organisiert werden oder durch die JVM (je nach Anforderung).

## Thread-Objekt

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
###Thread Methoden

Für Thread-Objekte gibt es folgende Instanzmethoden:

`getName()`		Während der Erzeugung kann einem Thread ein Name gegeben werden. Der Name eines Threads kann in einem Thread-Konstruktor mit `super(threadName)` gesetzt werden.

`setPriority(Thread.MAX_PRIORITY)`	setzt die entsprechende Priorität (max = 10). Standardmäßig wird das 5 gesetzt. Die Auswirkung hängt vom [Betriebssystem](../Betriebssysteme/{MOC}%20Operating%20Systems.md) ab.

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

### Kommunikation

Die einfachste Möglichkeit der Kommunikation zwischen einem Thread und einem zweiten sind der Austausch über Variable.

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

Soll eine abgeleitete Klasse in einem eigenem Thread laufen, dann kann sie nicht auch von der Klasse Thread abgeleitet werden. Abhilfe schaft die Runnable-[Schnittstelle](../../Digitaltechnik/Interfaces/{MOC}%20Schnittstellen.md). Sie schreibt nur eine run() Methode vor:

```java
public class DateCommand implements Runnable {	// impl. die Schnittst. Runnable
  @Override public void run() {					// run-Methode der Klasse
    for ( int i = 0; i < 20; i++ )
      System.out.println( new java.util.Date() );
  }
}
```

Die run-Methode wird automatisch gestartet, wenn ein Objekt mit der Runnable-[Schnittstelle](../../Digitaltechnik/Interfaces/{MOC}%20Schnittstellen.md) als Thread gestartet wird:

```java
Thread t1 = new Thread( new DateCommand() );
t1.start();							// run-Methode wird im t1-Thread gestartet
```

## ?Excecutor

Ein Executor stellt einen Pool an Threads zur Verfügung. Der gleiche Executor kann weitere Threads starten:

```java
Runnable r1 = new Runnable () {
  @Override public void run() {
    for (int i = 0; i < 20; i++)
      System.out.println(new java.util.Date());
  }
}
```

Zum Starten:

```java
ExecutorService ex = Executors.newCachedThreadPool();
ex.execute(r1);
ex.shutdown();
```

## ?Callable

Beispiel:

```java
class SorterCallable implements Callable<byte[]> {     // Rückgabewert byte[]
  private final byte[] b;
  SorterCallable(byte[] b) {
    this.b = b;
  }
  @Override public byte[] call() {                  // byte[]
    Arrays.sort(b);
    return b;
  }
}
```

Ausführung:

```java
byte[] b = new byte[ 4000000 ];
new Random().nextBytes( b );
Callable<byte[]> c = new SorterCallable( b );
ExecutorService executor = Executors.newCachedThreadPool();
Future<byte[]> result = executor.submit( c );
```

## ?Synchronisation

### Sperren / Entsperren

```java
Final Lock lock = new ReentrantLock();
lock.lock();       // hier wird gewartet bis Bereich nicht mehr gesperrt
...                // gesperrter Bereich
lock.unlock();
```

### Prüfen auf Sperre

```java
System.out.println(Lock.tryLock());  // Sperrt und gibt true zurück wenn offen
```

### Prüfen auf Sperre für maximale Zeit

```java
System.out.println(Lock.tryLock(time, unit));  // wie oben mit max-Zeit
```

### Synchronized

Methoden die nur einfach aufgerufen werden können:

```java
synchronized void foo() {i++;}
```

oder auch Blöcke im Code:

```java
synchronized(objectMitMonitor) {
  ...
}
```

### Wait

```java
public class Waiter extends Thread {
  private Object ob;

  public Waiter(Object ob) {
    this.ob = ob;
  }

  public void run() {
    synchronized(ob) {
      try {
        System.out.println(this.getName() + " waits");
        ob.wait();
        System.out.println(this.getName() + " ends waiting");
      }
      catch(InterruptedException ex) {
        System.out.println(this.getName() + " " +ex);
      }
    }
  }
}
```

..

```java
public class Wait_Notify_1 {
  public static void main(String[] args) {
    Object ob = new Object();
    Waiter wt1 = new Waiter(ob);
    Waiter wt2 = new Waiter(ob);
    Waiter wt3 = new Waiter(ob);
    wt1.start();
    wt2.start();
    wt3.start();
    try { TimeUnit.SECONDS.sleep(1); } catch(InterruptedException ex) {}
    synchronized(ob) {
      System.out.println("main calls notify");
      ob.notify();
    }
    try { TimeUnit.SECONDS.sleep(2); } catch(InterruptedException ex) {}
    System.out.println("main interrupts all waiting threads");

    wt1.interrupt();
    wt2.interrupt();
    wt3.interrupt();
  }
}
```

Ausgabe:

```
Thread-0 waits
Thread-1 waits
Thread-2 waits
main calls notify
Thread-0 ends waiting
main interrupts all waiting threads
Thread-1 java.lang.InterruptedException
Thread-2 java.lang.InterruptedException
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
