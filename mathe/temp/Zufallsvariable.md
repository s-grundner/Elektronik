---
tags: ["Statistik"]
aliases: ["Zufallsvariable"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 30th November 2022
---

# Zufallsvariable
Ein Merkmal $X$, dessen numerische Werte die Ergebnisse eines Zufallsvorgangs sind, heißt Zufallsvariable oder Zufallsgröße.
## Diskrete Zufallsvariablen
Eine diskrete Zufallsvariable kann nur einzelne Werte annehmen.
Eine Funktion $X$, die $X:\Omega\rightarrow\mathbb{R}$

>[!hint] Jedem Ereignis wird ein Wert zugeordnet (Diskret)

>[!example] Werfen von 2 Würfeln
>$\Omega=\{(1,1);(1,2);\dots;(6,6)\}$ Werte der einzelnen Wür
>$X=\{2;3;\dots;12\}$

## Stetige Zufallsvariablen
Eine stetige Zufallsvariable nimmt jeden Wert in einem bestimmten Intervall an.
Die Gesamtheit dieser Werte $x_{i}$ einer diskreten Zufallsvariable $X$ zusammen mit den zugehörigen Wahrscheinlichkeiten $p_{i}$ heißt [[Wahrscheinlichkeitsverteilung]] dieser Zufallsvariable.

- Bisher waren [[Wahrscheinlichkeitsverteilung|Wahrscheinlichkeitsverteilungen]] gegeben (z.B. [[Binomialverteilung]]).
- jetzt nurmehr eine Funktion, die die Verteilung angibt

$F: M_{x}\rightarrow[0;1]$ mit $F(x)=P(X\leq x)$

Ist $F$ dfferenzierbar, so nennt man die [[Differenzialrechnung|Ableitung]] von $F$ die Dichtefunktion von $X$, kurz Dichte.

Anstelle von $F'$ schreibt man sie als $f$

$$
\int^{b}_{a} f(x)dx= F(b)-F(a) = P(a\leq X\leq b)
$$
Ist die Dichtefunktion gegeben, so ist:
$$
F(x)=\int^{x}_{c}f(t)dt\qquad M_{x}=[c;d]\text{ z.B. } \mathbb{R}
$$
> [!example] Binomialverteilung
> $f\dots$ Dichtefunktion
> (Graph mitschrift)
> $\downarrow\int\downarrow$
> (Graph mitschrift)
> $F\dots$ Verteilungsfunktion

Verteilungen können unterschiedlicher Wertebereiche annehmen.

>[!example] Lebensdauer

# Tags