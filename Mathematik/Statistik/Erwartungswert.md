---
tags: 
aliases: 
keywords: 
subject:
  - KV
  - Übertragungstechnik
semester: WS25
created: 27th February 2025
professor:
release: false
title: Erwartungswert
---

# Erwartungswert


## OLD

- Der Erwartungswert ist ein Konzept aus der Statistik, das beschreibt, wie wahrscheinlich es ist, dass ein bestimmtes [Ereignis](Ereignis.md) eintritt.
- Es wird auch als Erwartung, Durchschnitt oder Mittelwert bezeichnet und wird in der Regel mit dem griechischen Buchstaben μ symbolisiert.
- Der Erwartungswert einer [Zufallsvariable](Zufallsvariable.md) X ist der Wert, den man erwarten würde, wenn man die [Zufallsvariable](Zufallsvariable.md) X viele Male beobachtet und ihren Wert in jedem Durchgang notiert. Dieser Wert wird berechnet, indem man alle möglichen Werte der [Zufallsvariable](Zufallsvariable.md) X mit ihren jeweiligen Wahrscheinlichkeiten multipliziert und dann alle diese Produkte addiert.

## Erwartungswert einer [Zufallsvariable](Zufallsvariable.md)

Ist $X$ eine diskrete [Zufallsvariable](Zufallsvariable.md) mit $M_{x}=\{x_{1};\dots;x_{n}\}$ und $p_{i}=P(X=x)$ so heißt:

>[!summary] $$E(X)=\sum_{i=1}^{n}p_{i}\cdot x_{i}$$


Erwartungswert von $X$ beim Würfelbeispiel:
$$
\begin{align*}
E(X)&= \frac{1}{36}\cdot2+\frac{2}{36}\cdot3+\frac{3}{36}\cdot4+\frac{4}{36}\cdot5+\frac{5}{36}\cdot6+\frac{6}{36}\cdot7\\
&+\frac{1}{36}\cdot12+\frac{2}{36}\cdot11+\frac{3}{36}\cdot10+\frac{4}{36}\cdot9+\frac{5}{36}\cdot8\\
&= 7
\end{align*}
$$

### Rechenregeln für den Erwartungswert

$p_{1};\dots ;p_{n}\in \mathbb{R}$ und $X_{1}; \dots X_{n}\dots$ [Zufallsvariable](Zufallsvariable.md)  
$$E\left(\sum\limits^{n}_{i=1}p_{i}X_{i}\right) = \sum\limits_{i=1}^{h} p_{i}\cdot x_{i}$$  
$$E(X_{1}+X_{2})=E(X_{1})+E(X_{2})$$
> [!EXAMPLE] Bsp  
> $X_{1}\dots$ Augensumme Würfeln mit 1 Würfel  
> $X_{1}\dots$ Augensumme Würfeln mit 1 Würfel


> [!EXAMPLE] Spiel mit Gewinnen von $X=\{-10,0,15,40\}$
> $$
> \begin{align*}
> E(X) &= \sum\limits_{i=0}^{n}p_{i}\cdot x_{i}=\qquad X=\{-10,0,15,40\}\\
> &= \left(\frac{5}{6}\right)^{3}\cdot(-10)+P (X=1)\cdot(0) +\underbrace{\left(\binom{3}{2}\cdot\left(\frac{1}{6}\right)^{2}\cdot\left(\frac{5}{6}\right)\right)}_{P(X=2)}\cdot (15)+ \binom{3}{3}\cdot \frac{1}{6}^{3}\cdot(40)
> \end{align*}
> $$
> 
> Durchschnittlicher Gewinn pro spiel:  
> $E(X)=$ -4,56€
> 
> Ein Spiel ist dann Fair, wenn der erwartungswert $0$ ist.

