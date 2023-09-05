---
tags: ["Algorithmus"]
aliases: []
created: 29th November 2022
---

# Rekursion - Übungen

## Selbstaufruf Ohne Abbruchbedingung

Wenn sich eine Funktion selbst aufruft, dann ist es notwendig, dass eine Abbruchbedingung den Selbstaufruf beendet. Ansonsten läuft der Speicher (Stack) voll und das Programm wird aufgrund eines Speicherüberlaufs beendet (Stack-Overflow, Fehler-Code 0xC00000FD).

```c
void cntup(int num) {
    printf("%i\n", num++);
  	cntup(num);
}
```

## Zaehlen

Zählen von einer Zahl bis zu einer zweiten Zahl iterativ:

```C
void cntup(int von, int bis) {
  while (von < bis)
      printf("%i\n", von++);
}
```

Zählen von einer Zahl bis zu einer zweiten Zahl rekursiv:

```c
void cntup(int von, int bis) {
    if (von > bis) return;	// Abbruchbedingung
    printf("%i\n", von++);
  	cntup(von, bis);
}
```

Wird hier ein entsprechend großer Bereich eingeben, dann bricht auch hier das Programm aufgrund eines Stack-Overflow ab (Rekursiv häufig ineffizient).

## Ganzzahlige Addition

​	sum(a, b) = a					für b = 0

​	sum(a, b) = 1 + sum(a, b-1)		sonst

## Ganzzahlige Multiplikation

Rekursiv kann eine Multiplikation sehr einfach in eine Addition überführt werden (so machen wir das auch wenn wir im Kopf rechnen):

​	mult(a, b) = 0						für b = 0

​	mult(a, b) = a + mult(a, b-1)		sonst

Typischer Fehler: Abbruchbedingung wird nie erreicht wenn b<0 ist.

## Ganzzahlige Division

Auch eine Division kann durch eine Rekursion relativ einfach gelöst werden (ohne Verwendung von "%" und "/").

​	div(a, b) = 0					für b > a
​	div(a, b) = 1 + div(a-b, b)		sonst

## Ganzzahlige Subtraktion

Subtraktion rekursiv:

​	sub(a, b) = a					für b = 0

​	sub(a, b) = sub(a, b-1) - 1		sonst

## Faktorielle

> [!EXAMPLE] In der Wahrscheinlichkeitsrechnung oder in Taylorreihen findet sich die Faktorielle (oder auch Fakultät) einer Zahl:
​n! = 1 * 2 * … * (n-1) * (n)		mit		0! = 1, 1! = 1
und mit:
​n! = (n-1)! * n
eine typisch rekursive Formulierung.

```c
int fact(int n) {
	if (n == 1) return 1;	// Abbruchbedingung
  	return n * fact(n-1);
}
```

Iterative Lösung der Faktoriellen:

```c
int fact(int n) {
	int res = 1;
	for (; n > 1; n--) {
		res *= n;
	}
	return res;
}
```

- [Mandelbrot](Mandelbrot.md)

## Größter Gemeinsamer Teiler (ggT)

Bereits Euklid erkannte: der ggT zweier Zahlen a und b (Voraussetzung a > b) ist der Gleiche wenn stattdessen das ggT aus (a-xb) und b ermittelt wird. x sei eine beliebige positive Ganzzahl. Da (a-xb) aber kleiner als b ist können damit die Parameter vertauscht werden und das Spiel wiederholt werden. Gefunden ist der ggT wenn einer der Parameter 0 ist, der ggT ist dann der jeweils andere Parameter. (Euklidscher Algorithmus)

Beispiel:

```
ggT(49,14)
49-14*3=7 ggT(7,14)
14-7=7 ggT(7,7)=7 --> GGT=7
```

## Fibonacci-Zahlen

Die Fibonacci-Zahlen ergeben sich als Summe der beiden nächst kleineren (vorhergehenden) Fibonaccizahlen:

​	0, 1, 1, 2, 3, 5, 8, 13 …

​	0+1 = 1; 1+2 = 3; 2+3 = 5 …

​	fib(n) = fib(n-1) + fib(n-2) wobei fib(0) = 0 und fib(1) = 1

Diese Folge von Zahlen findet sich in der Natur sehr häufig: in Wachstumsformen von Pflanzen (Blattanordnung …), in Wachstumsraten von Kaninchenpopulationen …

## Potenzieren

​	pow(x, n) = 1					wenn n = 0  
​	pow(x, n) = x * pow(x, n-1)		sonst

## Potenzieren Schnell

​	pow(x, n) = 1							wenn	n = 0
​	pow(x, n) = pow(x, n/2) * pow(x, n/2)	wenn n geradzahlig
​	pow(x, n) = x * pow(x, n/2) * pow(x, n/2)	sonst

## Umrechnen Dezimale in Duale Zahlen

> [!EXAMPLE] Beispiel:
> 13/2 = 6		Rest: 1
> 6/2 = 3		Rest: 0
> 3/2 = 1		Rest: 1
> 1/2 = 0		Rest: 1
> Ergebnis: 1101

Die Abbruchbedingung: wenn das Ergebnis der ganzzahligen Division 0 ergibt.

## Linie

In einer zweidimensionalen Ebene sollen zwei Punkte s und z (Start, Ziel) mittels einer Linie verbunden werden.

```
 . . . . . . . . . .
 . . . . . . . . . z
 . . . . . . . . . .
 . . . . . . . . . .
 . . . . . . . . . .
 . . . . . . . . . .
 . . . . . . . . . .
 s . . . . . . . . .
 . . . . . . . . . .
 . . . . . . . . . .
```

Erlaubt sind Bewegungen auch in diagonaler Richtung:

```
 . . . . . . . . . .
 . . . . . . x x x z
 . . . . . x . . . .
 . . . . x . . . . .
 . . . x . . . . . .
 . . x . . . . . . .
 . x . . . . . . . .
 s . . . . . . . . .
 . . . . . . . . . .
 . . . . . . . . . .
```

Lösungsstrategie:

- In einer Funktion (move) wird der horizontale Index um 1 verändert um einen Schritt näher Richtung Ziel zu kommen. Gleichzeitig wird analog der vertikale Index verändert (diagonal erlaubt).
- Anschließend ruft sich die Funktion selbst auf um diesen Schritt zu wiederholen
- Abgebrochen wird die Ausführung wenn das Ziel erreicht ist.

## Die Türme Von Hanoi

Ein klassisches Beispiel für eine rekursive Problemlösung sind die Türme von Hanoi. Dabei sind n Scheiben mit Loch auf einer Stange A aufgesteckt. Die Scheiben sind auf eine 2te Stange B umzustecken. Dabei darf immer nur eine Scheibe nach der anderen bewegt werden und es darf keine größere auf eine kleinere Scheibe zum liegen kommen. Als Hilfe steht eine dritte Stange C zur Verfügung:

![hanoi](assets/hanoi.png)

Für einen rekursiven Algorithmus macht man sich keine Gedanken über die umfassende Problemlösung. Man versucht das Problem um "einen Grad" zu vereinfachen:

Für das dargestellte Problem - Verschieben von 4 Scheiben von Stange A nach Stange B:

Man schichtet 3 Scheiben auf die Stange C um (wie ist noch unbekannt). Dann müsste ja die 4te Scheibe lediglich auf B gesteckt werden und anschließend die 3 Scheiben von C auf B. Als Problem bleibt: wie werden 3 Scheiben umgeschichtet.

Dazu wird das Problem wieder vereinfacht: Es werden 2 Scheiben von A auf B umgeschichtet um dann die dritte Scheibe auf C zu stecken. Dann werden wieder die beiden Scheiben von B auf C gesteckt.

Um zwei Scheiben von A auf B zu versetzen kann das Problem wiederum vereinfacht werden: Es wird eine Scheibe von A nach C gesteckt, anschließend die zweite Scheibe von A auf B und dann die erste Scheibe von C nach B.

Mit der Fähigkeit eine Scheibe zu verschieben, können also 2 Scheiben verschoben werden. Mit dieser Fähigkeit wiederum 3 Scheiben, mit dieser wiederum 4 Scheiben und so fort.

In diesem Beispiel ist sehr schön sichtbar, dass eine umfassende Lösung sehr [komplex](../../Mathe/mathe%20(3)/Komplexe%20Zahlen.md) ist, durch eine schrittweise Vereinfachung des Problems kann rekursiv eine sehr einfache Lösung gefunden werden. Das klassische Beispiel sind 64 Scheiben (in Gold und von Priestern zu bewegen). Um die Aufgabenstellung zu lösen, müssen über 500 Milliarden (!) Züge getätigt werden.

Mehr Info: http://www.inf-schule.de/algorithmen/algorithmen/rekursion/problemloesen/einstieg_hanoi

## Visuelle Lösung Von "Die Türme Von Hanoi"

Bauen Sie die gefundene Lösung als JS-Worker in ein gegebenes Template ein um eine graphische Darstellung der Problemlösung zu erhalten.