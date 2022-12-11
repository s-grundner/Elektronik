---
tags: ["Statistik"]
aliases: ["Wahrscheinlichkeitsverteilungen"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 30th November 2022
---
# Wahrscheinlichkeitsverteilung

-   Wahrscheinlichkeitsverteilung beschreibt [[wahrscheinlichkeit]] von Ereignissen
-   verschiedene Arten: binomial, Poisson, Normalverteilung
-   Form hängt von Faktoren ab: Anzahl Ergebnisse, Häufigkeit von Ergebnissen
-   wichtiges Werkzeug in Statistik: Berechnung von Wahrscheinlichkeiten, Vorhersagen
-   kann in Stickpunkten zusammengefasst werden:

Die Gesamtheit der Werte $x_{i}$ einer diskreten [[Zufallsvariable|Zufallsvariable]] $X$ zusammen mit den zugehörigen Wahrscheinlichkeiten $p_{i}$ heißt Wahrscheinlichkeitsverteilung dieser [[Zufallsvariable|Zufallsvariable]].
$$
G(X)=\sum\limits_{k=0}^{x_{1}}P(X=k) = P(0) + P(1) +\dots +P(x_{1})
$$
:
```ad-info
title: [[Binomialverteilung|Binom]]: $h=5\qquad p=0.3$
$$
\begin{align*}
P(0)&= 0.7^{5}\\
P(1)&= \binom{5}{1}\cdot 0.7^{4}\cdot 0.3\\
P(2)&= \binom{5}{2}\cdot 0.7^{3}\cdot 0.3^{2}\\
&\vdots\\
P(5)&= \binom{5}{5}0.3^{5}\\
\end{align*}
$$
```

| Wahrscheinlichkeitsdichte                 | Wahrscheinlichkeitsverteilung             |
| ----------------------------------------- | ----------------------------------------- |
| ![[Pasted image 20221210150102.png\|350]] | ![[Pasted image 20221210150004.png\|300]] |
| Summe aller $=1$                          | w                                          |

# Tags