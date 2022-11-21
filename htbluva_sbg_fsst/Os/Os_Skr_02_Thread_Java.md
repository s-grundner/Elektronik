# 2 Os - Threads - Java

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

**Kommunikation** zwischen den Threads (Datenaustausch ...) kann mittels **Instanz- oder Klassenvariablen** oder durch Aufruf von **Methoden** erfolgen. 

Zur **Synchronisation** stellt Java das aus der Betriebssystemtheorie bekannte Konzept des **Monitors** zur Verfügung, das es erlaubt, **kritische** **Abschnitte** innerhalb von Programmblöcken und **Methoden** zu kapseln und so den Zugriff auf gemeinsam benutzte Daten zu koordinieren. 

## Thread-Klasse (701)

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

## Runnable (702)

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

## Thread Abbrechen (703)

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
> - Sicherstellen ob das Flag nicht durch eine `InterruptedException` in `sleep()`, `join()` oder `wait()` übersehen wird durch erneutes Setzen des Flags.

## Funktionen (703)

`public final boolean isAlive()`  prüft ob ein Thread noch läuft.

## Fragen

- Unterschied Thread/Prozess
- Wird eine Berechnung durch das Aufteilen auf mehrere Threads schneller (wodurch/warum/wann/wann nicht...)?
- Unterschied Thread/Runnable
- Wie kann ein Thread von außen beendet werden?

## Referenzen

- Java->Insel
  http://openbook.rheinwerk-verlag.de/javainsel9/javainsel_14_001.htm#mj8c6f381221d805dd6fbe480731ac0c58