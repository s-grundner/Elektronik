---
tags: ["Statistik"]
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 30th November 2022
---

# Erwartungswert

## [[Wahrscheinlichkeitsverteilung|Wahrscheinlichkeitsverteilung]]
Jedem $x_{i}$ wird eine [[Wahrscheinlichkeit|WSK]] zugeordnet :
$M_{x}\rightarrow [0;1]$
(Diag verteilung würfeln mit 2 würfel)
## Erwartungswert einer [[Zufallsvariablen|Zufallsvariable]]
Ist $X$ eine diskrete [[Zufallsvariablen|Zufallsvariable]] mit $M_{x}=\{x_{1};\dots;x_{n}\}$ und $p_{i}=P(X=x)$ so heißt:
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
## Rechenreglen für den Erwartungswert
$c_{1};\dots ;c_{n}\in \mathbb{R}$ und $X_{1}; \dots X_{n}\dots$ [[Zufallsvariablen|Zufallsvariable]]
$$E\left(\sum\limits^{n}_{i=1}c_{i}X_{i}\right) = \sum\limits_{i=1}^{h}\cdot c_{i}\cdot E(X_{i})$$
$$E(X_{1}+X_{2})=E(X_{1})+E(X_{2})$$
nicht nur der erwartete *mittlere* Wert einer [[Zufallsvariablen|Zufallsvariable]] ist interessant, sondern auch die erwartete durchschnittliche Abweichung vom Erwartungswert.
Sozusagen: wie weit streuen die Ergebnisse durchschnittlich?
Sei $X$ eine diskrete [[Zufallsvariablen|Zufallsvariable]] mit $M_{x}=\{x_{1};\dots;x_{n}\}$
und $p_{i}=P(X=x_{i})$


# Beispiele

```ad-example 
title: Spiel mit Gewinnen von $X=\{-10,0,15,40\}$
$$
\begin{align*}
E(X) &= \sum\limits_{i=0}^{n}p_{i}\cdot x_{i}=\qquad X=\{-10,0,15,40\}\\
&= \left(\frac{5}{6}\right)^{3}\cdot-10+P (X=1)\cdot0 +\underbrace{\left(\binom{3}{2}\cdot\left(\frac{1}{6}\right)^{2}\cdot\left(\frac{5}{6}\right)\right)}_{P(X=2)}\cdot 15+ \binom{3}{3}\cdot \frac{1}{6}^{3}\cdot40
\end{align*}
$$


Durchschnittlicher Gewinn pro spiel:
$E(X)=$ -4,56€

Ein Spiel ist dann Fair, wenn der erwartungswert $0$ ist.
```
