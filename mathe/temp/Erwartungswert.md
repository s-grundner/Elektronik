---
tags: ["Statistik"]
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 30th November 2022
---

# Erwartungswert
Der Erwartungswert ist ein Konzept aus der Statistik, das beschreibt, wie wahrscheinlich es ist, dass ein bestimmtes [[Ereignis]] eintritt.
Es wird auch als Erwartung, Durchschnitt oder Mittelwert bezeichnet und wird in der Regel mit dem griechischen Buchstaben μ (Mu) symbolisiert.
Der Erwartungswert einer [[Zufallsvariable]] X ist der Wert, den man erwarten würde, wenn man die [[Zufallsvariable]] X viele Male beobachtet und ihren Wert in jedem Durchgang notiert. Dieser Wert wird berechnet, indem man alle möglichen Werte der [[Zufallsvariable]] X mit ihren jeweiligen Wahrscheinlichkeiten multipliziert und dann alle diese Produkte addiert.


## [[Wahrscheinlichkeitsverteilung|Wahrscheinlichkeitsverteilung]]
Jedem $x_{i}$ wird eine [[Wahrscheinlichkeit|WSK]] zugeordnet :
$M_{x}\rightarrow [0;1]$
(Diag Verteilung würfeln mit 2 Würfel)

# Beispiele

tSpiel mit Gewinnen von $X=\{-10,0,15,40\}$
$$
\begin{align*}
E(X) &= \sum\limits_{i=0}^{n}p_{i}\cdot x_{i}=\qquad X=\{-10,0,15,40\}\\
&= \left(\frac{5}{6}\right)^{3}\cdot-10+P (X=1)\cdot0 +\underbrace{\left(\binom{3}{2}\cdot\left(\frac{1}{6}\right)^{2}\cdot\left(\frac{5}{6}\right)\right)}_{P(X=2)}\cdot 15+ \binom{3}{3}\cdot \frac{1}{6}^{3}\cdot40
\end{align*}
$$


Durchschnittlicher Gewinn pro spiel:
$E(X)=$ -4,56€

Ein Spiel ist dann Fair, wenn der erwartungswert $0$ ist.
