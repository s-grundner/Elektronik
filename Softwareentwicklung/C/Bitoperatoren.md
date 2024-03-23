---
tags:
  - C
  - Bitmath
aliases:
  - Bitmath
keywords: 
subject:
  - PR
  - Networked Embedded Systems
semester:
  - SS24
  - B2
created: 29. November 2022
professor:
---

# Bitoperatoren

Oft wird die Sprache C im hardwarenahen Bereich eingesetzt. Dadurch werden zusätzlich zu den üblichen Operatoren gerade die Bit-Operatoren häufig verwendet.

## Links Schieben <<

> [!important] Jede Verschiebung um 1 Bit nach Links entspricht einer Multiplikation mit 2
> - *linker* Operand als Binärzahl betrachten
> - *rechter* Operand als Integer (Dezimalzahl) betrachten.



> [!example] `3 << 2` 	bedeutet 3 um 2 Bit Positionen nach Links schieben.
> b11 ($=3$) verschoben ergibt b**1100** ($=12$). 
> $3\cdot 2 \cdot 2 = 12$

## Rechts Schieben >>

> [!important] Jede Verschiebung um 1 Bit nach Rechts entspricht einer Division durch 2.
> - *linker* Operand als Binärzahl betrachten
> - *rechter* Operand als Integer (Dezimalzahl) betrachten.

> [!example] `7 >> 2` 	bedeutet 7 um 2 Bit Positionen nach Links schieben.
> b**111** ($=7$) um 2 verschoben ergibt **1bin** (= 1dez). 
> $7 / 2 / 2 = 1$

## Bitweise Verundung &

> [!example] `7 & 5`	 	(**111bin** & **101bin**)	ergibt	**101bin**.
> 1te Stelle der 1ten Zahl mit 1ter Stelle der 2ten Zahl verundet usf.

## Bitweise Veroderung |

> [!example] `0x34 | 0x22`	 	(b**0011 0100** | b**0010 0010**)	ergibt	b**0011 0110**.
1te Stelle der 1ten Zahl mit 1ter Stelle der 2ten Zahl *verodert* usf.

## Bitweise Exor ^

`0x34 ^ 0x22`	 	(**0110bin** ^ **0010bin**)	ergibt	**0100bin**. 1te Stelle der 1ten Zahl mit 1ter Stelle der 2ten Zahl verexort usf.

## Bitweise Negation ~

`~0x22`	 	(**\~0010 0010bin**)	ergibt	**1101 1101bin**. An jeder Stelle wird aus 1 -> 0 und aus 0 -> 1.

## Typische Aufgaben:

- es soll das nte Bit eines Registers r auf 1 gesetzt werden. Die verbleibenden Stellen sollen ihren Wert beibehalten.  
  `r | (1 << (n-1))`	Eine 1 wird um (n-1) Stellen nach Links verschoben --> ntes Bit ist 1. Bitweise Veroderung mit Registerwert setzt das nte Bit auf 1.​

- es soll das nte Bit eines Registers r invertiert gesetzt werden. Die verbleibenden Stellen sollen ihren Wert beibehalten.  
  `r ^ (1 << (n-1))`	Eine 1 wird um (n-1) Stellen nach Links verschoben --> ntes Bit ist 1. Exor mit Registerwert: an allen Stellen von r in denen eine 0 steht bleibt eine 0 (0^0). An Stellen an denen eine 1 steht bleibt eine 1 (1^0). An der Stelle an der der Wert auf 0 gesetzt werden soll wird für r=1 mit 1^1=0 und für r=0 mit 0^1=1.

- es soll das nte Bit eines Registers r auf 0 gesetzt werden. Die verbleibenden Stellen sollen ihren Wert beibehalten.  
  `r & ~(1 << (n-1))`	Eine 1 wird um (n-1) Stellen nach Links verschoben --> ntes Bit ist 1. Durch Bitweise invertierung werden sämtliche Werte auf 1 gesetzt bis auf die nte Stelle. Verundung mit Registerwert: an allen Stellen von r wird der Wert beibehalten bis auf die nte Stelle, dort wird eine 0 gesetzt.

Sollen entsprechend mehrere Bitpositionen auf einmal gesetzt oder rückgesetzt werden, dann sind entsprechend mehrere Bits zu setzen.

### Boolsche Ausdrücke

In C wird auf logisch Wahr oder Falsch geprüft bei:

- Verzweigungen `if (expr) {…`
- Schleifen `when (expr) {…`, `for (i = 0; expr; i++) {…` …

In C gibt's allerdings keinen Boolschen Datentyp. Dadurch ist zu klären was unter Wahr und Falsch zu verstehen ist:

- Falsch = 0
- Wahr = Nicht(Falsch)

Für C ist alles Wahr was ungleich 0 ist. Das wirkt vieleicht kompliziert ist aber logisch: 0 ist immer Falsch (FALSE), alles Andere (1, 10, 50 …) ist somit Wahr. Wann spielt das eine Rolle:

```c
if (a == TRUE) {        // mit z.B. #define TRUE 1
```

Diese Prüfung ist zu vermeiden, sie läßt sich leicht ersetzen:

```c
if (a != FALSE) {       // mit z.B. #define FALSE 0 : alles was nicht 0 ist ist wahr
```

Sonst hat man keine reine 2-Wertigkeit sondern 0, 1 und alles Andere (undefiniert).

# Flashcards

Setzen Sie das $n$-te Bit der Variable reg auf 1.
Belassen Sie sämtliche anderen Bits gleich.
? 

Setzen Sie das $n$-te Bit der Variable `reg` auf `0`.
Belassen Sie sämtliche anderen Bits gleich.
? 

Setzen Sie das $n$-te Bit der Variable reg auf `1`.
Setzen Sie sämtliche anderen Bits auf `0`.
?

Invertieren Sie den Wert des $n$-ten Bits der Variable `reg` (0->1 bzw 1->0)
Belassen Sie sämtliche anderen Bitwerte gleich.
?

Setzten Sie sämtliche Bits der Variable `reg` auf `1` ausgenommen dem $n$-te Bit, welches den Wert `0` erhalten soll.
?

Ermitteln Sie den Zustand des $n$-ten Bits der Variable `reg`.
?
