---
tags: ["Statistik"]
aliases: ["Wahrscheinlichkeitsverteilungen"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 30th November 2022
---
# Wahrscheinlichkeitsverteilung

- Wahrscheinlichkeitsverteilung beschreibt [[Wahrscheinlichkeit]] von [[Ereignis|Ereignissen]]
- Jedem $x_{i}$ wird eine [[Wahrscheinlichkeit]] zugeordnet
- verschiedene Arten:
	- Diskrete Verteilung: [[Binomialverteilung]]
	- Stetige Verteilung: [[Normalverteilung]]

Die Gesamtheit der Werte $x_{i}$ einer diskreten [[Zufallsvariable|Zufallsvariable]] $X$ zusammen mit den zugehörigen Wahrscheinlichkeiten $p_{i}$ heißt Wahrscheinlichkeitsverteilung dieser [[Zufallsvariable|Zufallsvariable]].
$$
G(X)=\sum\limits_{k=0}^{x_{1}}P(X=k) = P(0) + P(1) +\dots +P(x_{1})
$$
$M_{x}\rightarrow [0;1]$

>[!example] [[Erwartungswert]] von 2 Würfeln
> ![[erw_wert_zfv.png]]

# Tags
[[Erwartungswert]]
[[Varianz#Varianz einer Zufallsvariable]]
[[Binomialverteilung]]
[[Normalverteilung]]

## Erwartungswert
### Erwartungswert einer [[Zufallsvariable|Zufallsvariable]]
Ist $X$ eine diskrete [[Zufallsvariable|Zufallsvariable]] mit $M_{x}=\{x_{1};\dots;x_{n}\}$ und $p_{i}=P(X=x)$ so heißt:
$$
E(X)=\sum_{i=1}^{n}p_{i}\cdot x_{i}
$$
Erwartungswert von $X$ beim Würfelbeispiel:
$$
\begin{align*}
E(X)&= \frac{1}{36}\cdot2+\frac{2}{36}\cdot3+\frac{3}{36}\cdot4+\frac{4}{36}\cdot5+\frac{5}{36}\cdot6+\frac{6}{36}\cdot7\\
&+\frac{1}{36}\cdot12+\frac{2}{36}\cdot11+\frac{3}{36}\cdot10+\frac{4}{36}\cdot9+\frac{5}{36}\cdot8\\
&= 7
\end{align*}
$$
### Rechenregeln für den Erwartungswert
$c_{1};\dots ;c_{n}\in \mathbb{R}$ und $X_{1}; \dots X_{n}\dots$ [[Zufallsvariable|Zufallsvariable]]
$$E\left(\sum\limits^{n}_{i=1}c_{i}X_{i}\right) = \sum\limits_{i=1}^{h}\cdot c_{i}\cdot E(X_{i})$$
$$E(X_{1}+X_{2})=E(X_{1})+E(X_{2})$$

## Varianz einer Zufallsvariable
nicht nur der erwartete *mittlere* Wert einer [[Zufallsvariable|Zufallsvariable]] ist interessant, sondern auch die erwartete durchschnittliche Abweichung vom Erwartungswert.

- Sozusagen: wie weit streuen die Ergebnisse durchschnittlich?

Sei $X$ eine diskrete [[Zufallsvariable|Zufallsvariable]] mit $M_{x}=\{x_{1};\dots;x_{n}\}$ und $p_{i}=P(X=x_{i})$, so heißt:

>[!summary] $$V(X)=\sum\limits_{i=1}^{n}p_{i}\cdot(x_{i}-E(X))^{2}$$
>
> - $V(X)\dots$ Varianz
> 



> [!note] [[Binomialverteilung|Binom]]: $h=5\qquad p=0.3$
> $$
> \begin{align*}
> P(0)&= 0.7^{5}\\
> P(1)&= \binom{5}{1}\cdot 0.7^{4}\cdot 0.3\\
> P(2)&= \binom{5}{2}\cdot 0.7^{3}\cdot 0.3^{2}\\
> &\vdots\\
> P(5)&= \binom{5}{5}0.3^{5}\\
> \end{align*}
> $$

| Wahrscheinlichkeitsdichte                 | Wahrscheinlichkeitsverteilung             |
| ----------------------------------------- | ----------------------------------------- |
| ![[Pasted image 20221210150102.png\|350]] | ![[Pasted image 20221210150004.png\|300]] |
| Summe aller $=1$                          | w                                          |

# Tags