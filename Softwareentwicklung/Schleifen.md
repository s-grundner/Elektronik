# Wiederholungen/Schleifen

Größte Stärke von Rechnersystemen: Wiederholen von gleichen Berechnungen. Grundsätzlich würde man mit einer einzigen Art von Schleifen das Auslangen finden. Zur Steigerung der Lesbarkeit gibt es jedoch unterschiedliche Formen.

## While-Schleife

Führe einen Programmteil solange aus bis eine bestimmte Bedingung nicht mehr erfüllt ist.

```java
while (Ausdruck)			// while (=während): solange Ausdruck true liefert wird die folgende Anweisung ausgeführt
  Anweisung;
```

 Auch hier: Anweisung kann durch einen Block ersetzt werden.

```java
i = 0;
while (i < 5)
  i = i + 1;		// wird mit 0 ausgeführt, mit 1, mit 2, mit 3, mit 4 - dabei auf 5 erhöht - somit Ausdruck false und Ende
```

Speziell bei dieser Schleife: die Ausführungsbedingung wird schon vor der ersten Ausführung geprüft. Wenn der Ausdruck dabei *false* liefert wird der Inhalt der Schleife gar nie ausgeführt. Man nennt diese Art der Schleife daher auch **Kopfgesteuerte Schleife**.

Man nennt den Inhalt der Schleife (den wiederholten Teil) den **Schleifenkörper**.

Diese Art der Schleife verwendet man, wenn die Anzahl der Wiederholungen nicht abschätzbar ist und die Schleife eventuell gar nicht ausgeführt werden soll.

## Do-While-Schleife

Unterschied zur *While*-Schleife: die Bedingung zur Ausführung erfolgt am Ende der Schleife (am Fuß --> **Fußgesteuerte Schleife**).

```java
do
  Anweisung;
while (Ausdruck);			// while (=während): solange Ausdruck true liefert wird die obige Anweisung ausgeführt
```

 Auch hier: Anweisung kann durch einen Block ersetzt werden.

```java
i = 0;
do
  i = i + 1;	// wird mit 0 ausgeführt, mit 1, mit 2, mit 3, mit 4 - dabei auf 5 erhöht - somit Ausdruck false und Ende
while (i < 5);

```

Speziell bei dieser Schleife: die Ausführungsbedingung wird nach Ausführung des Körpers zum ersten mal geprüft. Und zwar unabhängig vom Ergebnis der Prüfung. 

Diese Art der Schleife verwendet man wenn die Anzahl der Wiederholungen nicht abschätzbar ist und die Schleife auf jeden Fall einmal ausgeführt werden soll. Beispiele: Mach etwas wiederholt, bis eine Taste gedrückt wird, Lese aus einer Datei bis das Ende erreicht ist.

## For-Schleife

Bei dieser Schleife kann im Kopf die Ausführungs-Bedingung aber auch eine Anweisung angegeben werden um die Bedingung zu beeinflussen:

```java
for (InitialAnweisung; Ausdruck; UpdateAnweisung)
  Anweisung;
```

*InitialAnweisung:* Anweisung die als Erstes beim ersten Betreten der Schleife ausgeführt wird (und dann nie wieder).

*Ausdruck:* wie bei den übrigen Schleifen die Bedingung unter der die Anweisung wiederholt wird. Die Prüfung erfolgt auch vor der ersten Ausführung des Schleifenkörpers.

*UpdateAnweisung:* Anweisung die jedes mal nach Ausführung des Schleifenkörpers und vor Prüfung der Schleifenbedingung automatisch ausgeführt wird.

Eine *For*-Schleife kann folgenderweise in eine *While*-Schleife übersetzt werden:

```java
InitialAnweisung;
while (Ausdruck) {
  Anweisung;
  Update;
}
```

Wie man hier sieht, können mit *For*-Schleifen sehr kompakte Schleifen gebaut werden. Typische Anwendungen - Zählschleifen:

```java
for (int i=0; i < 10; i++)	// Beim Ersten Mal: Definition von i und Init mit 0;
  						 // Ausführen bis i 10 wird
  						 // nach jeder Ausgabe wird i inkrementiert (um 1 erhöht)
  System.out.println(i);
```

Allgemein gilt jedoch: als Initialanweisung kann irgendeine Anweisung eingebaut werden, auch wenn diese nichts mit der Schleife zu tun hat. Das gleiche gilt für die Updateanweisung. Die *For*-Schleife bietet damit auch hervorragend Möglichkeit unlesbaren Code zu schreiben:

```java
for (i = 0, System.out.println("Countdown"); i < 10; System.out.println(++i));
```

Diese Schleife gibt folgendes aus:

```java
Countdown
1
2
3
4
5
6
7
8
9
10
```

In der *For*-Schleife darf eine Folge von Anweisungen nicht in einen Block geschrieben werden, hier wird ausnahmsweise mit Beistrichen getrennt.

> Jede Schleife kann in eine jeweils andere übergeführt werden.
>
> *While*-Schleifen: wenn Anzahl Durchläufe völlig offen (bis Taste gedrückt) und evtl. kein einziger Durchlauf nötig ist
>
> *Do-While*-Schleife: wenn Anzahl Durchläufe offen und Schleife auf alle Fälle einmal durchlaufen werden muss.
>
> *For*-Schleife: Zählschleifen, wenn Verpackung in Schleifenkopf die Übersicht steigert.