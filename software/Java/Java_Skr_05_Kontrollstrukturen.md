# 5 Kontrollstrukturen

## Ausdruck/Anweisung/Sequenz/Block

**Ausdruck:** Berechnung die ein Ergebnis liefert/Nur wenn eine Rechnung ein Ergebnis liefert ist es ein Ausdruck.

```java
2+3					// liefert das Ergebnis 5 - ist also ein Ausdruck
```

**Anweisung:** einzelne Vorschrift die im Rahmen der Ausführung auszuführen ist. Eine Anweisung wird durch einen Strichpunkt (=Semikolon) abgeschlossen.

```java
Anweisung1;
```

**Sequenz:** mehrere Anweisungen hintereinander.

```java
...
Anweisung1;
Anweisung2;
Anweisung3;
...
```

**Block:** Anweisungen/Sequenzen können zu einen Block zusammengefasst werden. In Java geschieht das durch geschwungene Klammern. Zur besseren Erkennbarkeit wird der Inhalt eines Blocks um einen Tabulator eingerückt.

```java
{
  Anweisung1;
  Anweisung2;
  Anweisung3;
}
```

In Java können Anweisungen durch Blöcke ersetzt werden. Sehr speziell: obwohl ein Block als eine Anweisung gesehen werden kann, muss dieser nicht mit einem Semikolon abgeschlossen werden.

## Verzweigungen

Verzweigung: bedingt ausführbarer Code (es muss eine Bedingung erfüllt sein damit ein Code ausgeführt wird). Wenn Programmteile nicht immer ausgeführt werden, dann müssen sie in einer Verzweigung stehen.

### if-Verzweigung

Damit verzweigt werden kann, muss eine logische Bedingung erfüllt sein. Die logische Bedingung ist ein **Ausdruck**. Dieser muss immer *true* als Ergebnis liefern damit eine Anweisung ausgeführt wird.

```java
if (Ausdruck)		// Ausdruck muss eine Berechnung sein, die ein logisches Ergebnis (true/false) liefert.
  Anweisung;		// true-Zweig: Wird nur ausgeführt wenn Ausdruck true liefert.
```

oder:

```java
if (Ausdruck)		// Ausdruck muss eine Berechnung sein, die ein logisches Ergebnis (true/false) liefert.
  Anweisung1;		// true-Zweig: Wird nur ausgeführt wenn Ausdruck true liefert.
else
  Anweisung2;		// false-Zweig: Wird nur ausgeführt wenn Ausdruck false liefert.
```

Zur Erinnerung: Anweisungen können durch Blöcke ersetzt werden.

Beispiel:

```java
if (monat == 2)
  System.out.println("Februar");
...
```

Beispiel:

```java
if (monat > 11)
  System.out.println("Dezember");
else
  if (monat > 10)
    System.out.println("November");
  else
    if (monat > 9)
      System.out.println("Oktober");
...
```

Strukturen wie diese sind oft notwendig, sind jedoch sehr schnell unübersichtlich.

### switch-Verzweigung

Die *switch*-Verzweigung ist speziell für Mehrfachverzweigungen. Grundsätzlich kann sie immer durch geschachtelte *if*-Verzweigungen ersetzt werden:

```java
switch (Ausdruck) {
  case Wert1: Anweisung1; break;
  case Wert2: Anweisung2; break;
  ...
  case WertN: AnweisungN; break;
  default: DefaultAnweisung; break;
}
```

*Ausdruck* in der Mehrfachverzweigung muss vom gleichen Typ sein wie *Wert1* ... *WertN*. Damit *Anweisung1* ausgeführt wird, muss *Ausdruck* gleich *Wert1* sein. Damit *Anweisung2* ausgeführt wird muss *Ausdruck* gleich *Wert2* sein und so fort. Die *DefaultAnweisung* wird ausgeführt wenn *Ausdruck* keinem der Werte *Wert1* ... *WertN* entspricht.

Der *default*-Fall ist optional, das bedeutet er darf entfallen.

> Achtung: wird kein *break* gesetzt, dann werden die folgenden Fälle mit ausgeführt bis zur nächsten *break* Anweisung oder bis die Verzweigung zu Ende ist.

Beispiel:

```java
switch (num) {
  case 10: System.out.println("Zehn");
  case 9: System.out.println("Neun");
  case 8: System.out.println("Acht");
  case 7: System.out.println("Sieben");
  case 6: System.out.println("Sechs");
  case 5: System.out.println("Fünf");
  case 4: System.out.println("Vier");
  case 3: System.out.println("Drei");
  case 2: System.out.println("Zwei");
  case 1: System.out.println("Eins"); break;
  default: System.out.println("Zahl zu groß");
}
```

Aufgrund der fehlenden *break* Anweisungen wird hier für `num = 5` ein Countdown von 5 beginnend ausgegeben. Analog für sämtliche anderen Nummern von 1 bis 10. Nach der Ausgabe von *Eins* wird die Verzweigung mit *break* verlassen. Enthält *num* eine Nummer größer 10, dann wird *Zahl zu groß* ausgegeben.

> Switch-Case-Verzweigungen immer dann, wenn vielfach gleichartige Verzweigungen gesucht.
>
> If kann Switch-Case immer ersetzten --> kann übergeführt werden.

## Wiederholungen/Schleifen

Größte Stärke von Rechnersystemen: Wiederholen von gleichen Berechnungen. Grundsätzlich würde man mit einer einzigen Art von Schleifen das Auslangen finden. Zur Steigerung der Lesbarkeit gibt es jedoch unterschiedliche Formen.

### While-Schleife

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

### Do-While-Schleife

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

### For-Schleife

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

