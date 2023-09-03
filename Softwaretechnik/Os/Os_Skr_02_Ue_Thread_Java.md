# 2 Os - Threads - Java - Übungen

## Zeitmessung

Die Dauer einer Berechnung kann in Java einfach gemessen werden:

```java
long start = System.currentTimeMillis();
//...
long finish = System.currentTimeMillis();
long timeElapsed = finish - start;
```

## Scheduling - Punktstrich Thread-Klasse (704)

Implementieren Sie ein Programm mit nebenläufigen Funktionen. Eine der Funktionen soll einen Punkt und eine der Funktionen soll einen Bindestrich ausgeben.

Werden die Zeichen gleich oft / gleich gehäuft ausgegeben und warum / warum nicht? 

## Scheduling - Punktstrich Thread-Runnable (705)

Implementieren Sie ein Programm mit nebenläufigen Funktionen unter Verwendung des Runnable-Interface. Eine der Funktionen soll einen Punkt und eine der Funktionen soll einen Bindestrich ausgeben.

Für Runnable kann nicht direkt `isInterrupted()` abgefragt werden, das muss dann so erfolgen:

```
Thread.currentThread().isInterrupted()
```

Werden die Zeichen gleich oft / gleich gehäuft ausgegeben und warum / warum nicht? 

## Beenden von Punktstrich (705)

Erweitern Sie das vorhergehende Programm so, dass das sich das Hauptprogramm nach 10 Sekunden beendet. Beim Beenden sind vorerst die nebenläufigen Threads zu beenden und erst dann der Hauptthread.

Die nebenläufigen Funktionen sind so zu adaptieren, dass sie Zeitweise schlafen.

## Zeitaufwand (706)

Schreiben Sie eine Funktion zum Aufsummieren von Zahlen beginnend von einem Startwert bis hin zu einem Endwert.

Führen Sie diese Funktion für einen großen Wertebereich aus (10000000) und messen die Zeit der Durchführung.

Lösen Sie die Aufgabe zusätzlich durch Verwendung zweier Threads, ein Thread zählt die erste Hälfte während der zweite Thread die zweite Hälfte zählt. 

Experimentieren Sie mit der Verwendung von

- lokaler Variable
- Membervariablen
- Statischer Variable

im Vergleich mit ohne Thread für die Summenbildung. Was für ein Ergebnis ist feststellbar?