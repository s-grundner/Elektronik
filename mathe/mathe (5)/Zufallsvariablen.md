# Zufallsvariablen

## [[Wahrscheinlichkeitsverteilungen|Wahrscheinlichkeitsverteilung]]
Jedem $x_{i}$ wird eine [[Wahrscheinlichkeit|WSK]] zugeordnet :
$M_{x}\rightarrow [0;1]$
(Diag verteilung würfeln mit 2 würfel)
## Erwartungswert einer Zufallsvariable
Ist $X$ eine diskrete Zufallsvariable mit $M_{x}=\{x_{1};\dots;x_{n}\}$ und $p_{i}=P(X=x)$ so heißt:
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
$c_{1};\dots ;c_{n}\in \mathbb{R}$ und $X_{1}; \dots X_{n}\dots$ Zufallsvariable
$$E\left(\sum\limits^{n}_{i=1}c_{i}X_{i}\right) = \sum\limits_{i=1}^{h}\cdot c_{i}\cdot E(X_{i})$$
$$E(X_{1}+X_{2})=E(X_{1})+E(X_{2})$$
nicht nur der erwartete *mittlere* Wert einer Zufallsvariable ist interessant, sondern auch die erwartete durchschnittliche Abweichung vom Erwartungswert.
Sozusagen: wie weit streuen die Ergebnisse durchschnittlich?
Sei $X$ eine diskrete Zufallsvariable mit $M_{x}=\{x_{1};\dots;x_{n}\}$
und $p_{i}=P(X=x_{i})$
$$
V(X)=\sum\limits_{i=1}^{n}p_{i}\cdot(x_{i}-E(X))^{2} \qquad \text{Varianz}
$$
Die [[Standardabweichung]] oder die Streuung von $X$ ist:
$$\sigma(X)=\sqrt{V(X)}\qquad \text{Einheit wie }X$$
```ad-example
title: Würfel mit 1 Würfel
$E(X)=3.5$
$p_{i}:$ für jeden Wurf $\frac{1}{6}$
$$
\begin{align*}
V(X)=\sum\limits_{i=1}^{6} \frac{1}{6}\cdot(x_{i}-E(X))
\end{align*}
$$
```



---