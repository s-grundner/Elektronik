# 13 Prozesse / Threads - Übungen

## Stoppuhr (060_01)

In der Konsole soll eine Stoppuhr dargestellt werden. Dazu wird mit jeder Sekunde die Sekunde inkrementiert und entsprechend nach Bedarf die Minuten/Stunden angepasst.

Beispielhafte Ausgabe:

```java
00:02:57
00:02:58
00:02:59
00:03:00
00:03:01
00:03:02
```

Mit `Thread.sleep(ms)` kann eine Anwendung für eine angegebene Zeit angehaltet werden.

Wenn das Programm etwas anderes als eine Uhrzeit ausgeben soll funktioniert das so schon nicht mehr.

## GUI Stoppuhr (60_02)

Eine Stoppuhr soll in einer GUI mittels Window-Builder dargestellt werden:

- Starten der Zeitnehmung mit einer Start-Schaltfläche. Nach Betätigung wird auf dieser Schaltfläche Pause angezeigt.
- Pausieren der Zeitnehmung durch Drücken der Pause-Taste.
- Betätigung der Starttaste nach einer Pausierung lässt den Zähler an der aktuellen Position fortsetzen.
- Eine Reset-Taste setzt den Zähler auf 00:00:00 zurück.

Um die Bedienung auf der GUI aufrechtzuerhalten während der Timer läuft wird ein eigener Thread benötigt.

Hinweise:

- ein eigener Uhr-Thread kann mittels `class UhrThread extends Thread`  realisiert werden. In dieser Klasse muss die run-Methode überschrieben werden: `@Override public void run() {...`.
- Ein Thread kann mittels `uhr.start()` gestartet werden (die run-Methode).
- Das Ende eines Threads kann mittels `uhr.interrupt()` angefordert werden. Im Thread kann ein `Thread.sleep()` eine interrupted-Exception auslösen. Innerhalb dieser muss das Flag erneut gesetzt werden mit `interrupt()` und mit `isinterrupted()` kann das Flag geprüft werden.

## Konkurierende Threads (60_03)

Die folgende Klasse:

```java
public class Konkurierend {
	public static void main(String[] args) {
        Counter counter = new Counter();
        Thread secondThread = new Thread( counter, "second" );
        secondThread.start();
        counter.run();
    }
}
```

ruft die Funktion run direkt und in einem zweiten Thread parallel aus:

```java
public class Counter implements Runnable {
	private long count = 0;
    @Override public void run() {
    	Thread thread = Thread.currentThread();
    	for( ; count <= 1000 ; ++count ) {
    		System.out.println(  thread + "COUNT:" + count );
    	}
    }
}
```

Als Ausgabe (immer unterschiedlich) zeigt sich:

```
Thread[second,5,main]COUNT:171
Thread[second,5,main]COUNT:172
Thread[main,5,main]COUNT:134
Thread[main,5,main]COUNT:174
Thread[main,5,main]COUNT:175
```

Für die JAVA-VM ist keine definierte Ausführungs-Abfolge von Threads vorgeschrieben.