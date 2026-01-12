---
tags:
  - C
  - Bitoperatoren
aliases:
  - Bitmath
keywords:
  - C-Programmiersprache
subject:
  - PR
  - VL
  - Networked Embedded Systems
semester:
  - SS24
  - B2
created: 29. November 2022
professor:
---

# Bitoperatoren

Oft wird die Sprache C im hardwarenahen Bereich eingesetzt.
Dadurch werden zusätzlich zu den üblichen Operatoren gerade die Bit-Operatoren häufig verwendet.

## Links Schieben `<<`

> [!important] Jede Verschiebung um 1 Bit nach Links entspricht einer Multiplikation mit 2
> - *linker* Operand als Binärzahl betrachten
> - *rechter* Operand als Integer (Dezimalzahl) betrachten.

Nützlich für die Erzeugung von Bitmasken (hier - Bit an der 5ten Stelle):
$1<<(5 - 1) \equiv 2^{4} \equiv b 0010000$

> [!example] `3 << 2` 	bedeutet 3 um 2 Bit Positionen nach Links schieben.
> b11 ($=3$) verschoben ergibt b**1100** ($=12$). 
> $3\cdot 2 \cdot 2 = 12$

## Rechts Schieben `>>`

> [!important] Jede Verschiebung um 1 Bit nach Rechts entspricht einer Division durch 2.
> - *linker* Operand als Binärzahl betrachten
> - *rechter* Operand als Integer (Dezimalzahl) betrachten.

> [!example] `7 >> 2` 	bedeutet 7 um 2 Bit Positionen nach Links schieben.
> b**111** ($=7$) um 2 verschoben ergibt **1bin** (= 1dez). 
> $7 / 2 / 2 = 1$

## Bitweise Verundung `&`

> [!info]- Die *Verundung* ist die "Multiplikation" in der Booleschen Algebra:
> $$A\wedge B = Y\qquad A\cdot B = Y\qquad A \& B = Y$$
>
> > |  A  |  B  |  Y  |
> > |:---:|:---:|:---:|
> > |  0  |  0  |  0  |
> > |  0  |  1  |  0  |
> > |  1  |  0  |  0  |
> > |  1  |  1  |  1  | 

> [!example] `7 & 5`	 	(**111bin** & **101bin**)	ergibt	**101bin**.
> 1te Stelle der 1ten Zahl mit 1ter Stelle der 2ten Zahl verundet usf.

## Bitweise Veroderung `|`

> [!info]- Die *Veroderung* ist die "Addition" in der Booleschen Algebra
> $$A \vee B = Y\qquad A + B = Y\qquad A \mid B = Y$$
>
> > |  A  |  B  |  Y  |
> > |:---:|:---:|:---:|
> > |  0  |  0  |  0  |
> > |  0  |  1  |  1  |
> > |  1  |  0  |  1  |
> > |  1  |  1  |  1  |

> [!example] `0x34 | 0x22`	 	(b**0011 0100** | b**0010 0010**)	ergibt	b**0011 0110**.
1te Stelle der 1ten Zahl mit 1ter Stelle der 2ten Zahl *verodert* usf.

## Bitweise Exor `^`

> [!info]- Die exklusive *Veroderung* ist die "Addition" in der Booleschen Algebra, wobei die beiden Operanden Unterschiedlich sein müssen
> $$A \oplus B = Y\qquad A \hat{\text{ }} B = Y$$
>
> > |  A  |  B  |  Y  |
> > |:---:|:---:|:---:|
> > |  0  |  0  |  0  |
> > |  0  |  1  |  1  |
> > |  1  |  0  |  1  |
> > |  1  |  1  |  0  |

> [!example] `0x34 ^ 0x22`	 	(b**0110** ^ b**0010**)	ergibt	b**0100**.
> 1te Stelle der 1ten Zahl mit 1ter Stelle der 2ten Zahl verexort usf.

## Bitweise Negation `~`

> [!example] `~0x22`	 	(b**~0010 0010**)	ergibt	b**1101 1101**.
> An jeder Stelle wird aus 1 -> 0 und aus 0 -> 1.

---

# Typische Anwendungen:

- es soll das nte Bit eines Registers r auf 1 gesetzt werden. Die verbleibenden Stellen sollen ihren Wert beibehalten.  
  `r | (1 << (n-1))`	Eine 1 wird um (n-1) Stellen nach Links verschoben --> ntes Bit ist 1. Bitweise Veroderung mit Registerwert setzt das nte Bit auf 1.​

- es soll das nte Bit eines Registers r invertiert gesetzt werden. Die verbleibenden Stellen sollen ihren Wert beibehalten.  
  `r ^ (1 << (n-1))`	Eine 1 wird um (n-1) Stellen nach Links verschoben --> ntes Bit ist 1. Exor mit Registerwert: an allen Stellen von r in denen eine 0 steht bleibt eine 0 (0^0). An Stellen an denen eine 1 steht bleibt eine 1 (1^0). An der Stelle an der der Wert auf 0 gesetzt werden soll wird für r=1 mit 1^1=0 und für r=0 mit 0^1=1.

- es soll das nte Bit eines Registers r auf 0 gesetzt werden. Die verbleibenden Stellen sollen ihren Wert beibehalten.  
  `r & ~(1 << (n-1))`	Eine 1 wird um (n-1) Stellen nach Links verschoben --> ntes Bit ist 1. Durch Bitweise invertierung werden sämtliche Werte auf 1 gesetzt bis auf die nte Stelle. Verundung mit Registerwert: an allen Stellen von r wird der Wert beibehalten bis auf die nte Stelle, dort wird eine 0 gesetzt.

Sollen entsprechend mehrere Bitpositionen auf einmal gesetzt oder rückgesetzt werden, dann sind entsprechend mehrere Bits zu setzen.

## Boolsche Ausdrücke

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

Setzen Sie das $n$-te Bit der Variable `reg` auf `1`.
Belassen Sie sämtliche anderen Bits gleich.
? 
`reg = reg | (1 << (n-1))`

Setzen Sie das $n$-te Bit der Variable `reg` auf `0`.
Belassen Sie sämtliche anderen Bits gleich.
? 
`reg = reg & ~(1 << (n-1))`

Setzen Sie das $n$-te Bit der Variable `reg` auf `1`.
Setzen Sie sämtliche anderen Bits auf `0`.
?
`reg = 1 << (n-1)`

Invertieren Sie den Wert des $n$-ten Bits der Variable `reg` (0->1 bzw 1->0)
Belassen Sie sämtliche anderen Bitwerte gleich.
?
`reg = reg ^ (1 << (n-1))`
<!--SR:!2024-03-24,1,230-->

Setzten Sie sämtliche Bits der Variable `reg` auf `1` ausgenommen dem $n$-te Bit, welches den Wert `0` erhalten soll.
?
`reg = ~(1 << (n-1))`

Ermitteln Sie den Zustand des $n$-ten Bits der Variable `reg`.
?
`zustand = reg & (1 << (n-1))`
