---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 25th March 2026
professor:
release: false
title: Collatz-Problem
---

# Collatz Problem

> [!question] [Collatz-Problem - Wikipedia](https://de.wikipedia.org/wiki/Collatz-Problem)

## Rekursive Implementierung

Rekursiver Abstieg: Der Eingangsparameter wird erst jenachdem ob er gerade oder ungerade ist nach folgender Regel reduziert:

$$
\operatorname{steps}(n) = \begin{cases}
0, & n = 1 \\
1 + \operatorname{steps}\left( \frac{n}{2} \right) & n \text{ even} \\
1 + \operatorname{steps}\left( 3n +1 \right) & n \text{ odd}
\end{cases}
$$

Wird nach dem rekursiven abstieg $n=0$, ist die Ankerbedingung erreicht.

Beim rekursiven Aufstieg wird dann in jeder Rekursionsebene $+1$ zu $n$ hinzugezählt. Da der Rekusionsanker bei $n=0$ liegt, hat $n$ nach dem Aufstieg zur obersten ebene genau den Wert der Rekursionstiefe und damit Anzahl an Collatz Schritten.