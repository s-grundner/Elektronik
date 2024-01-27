---
tags: []
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
created: 30th May 2022
---

# Partialbruchzerlegung

## [Polynomdivision](Polynomdivision.md)

## [Nullstellen](Nullstelle.md) Des Nenners bestimmen

## Zerlegung in Partialbrüche

## Koeffizienten der Partialbrüche bestimmen

## Integration der Partialbrüche

# Beispiele

$$
\begin{align}
y(x) &= \frac{x^2+4x+10}{(x^2-4)\underbrace{ (x^2+2x+2) }_{ \text{irreduzibler Term} }} \\
&= \frac{x^{2}+4x+10}{(x-2)(x+2)(x^{2}+2x+2)}
\end{align}
$$

Ansatz für Partialbruch mit dem rationalen Polynom Gleichsetzen.

$$
\begin{align}
y(x) &= \frac{x^{2}+4x+10}{(x-2)(x+2)(x^{2}+2x+2)}= \frac{A}{x-2} +\frac{B}{x+2}+\frac{Cx+D}{x^{2}+2x+2}\Bigg|\cdot N
\end{align}
$$

Anschließend beide Seiten mit dem Nenner des rationalen Polynoms multiplizieren:

$$
\begin{align}
y(x) &= x^{2}+4x+10 = \\
&=\frac{A}{\cancel{ x-2 }}\cdot\cancel{ (x-2) }(x+2)(x^{2}+2x+2)  \\
&+\frac{B}{\cancel{ x+2 }} \cdot (x-2)\cancel{ (x+2)}(x^{2}+2x+2)\\
&+\frac{Cx+D}{\cancel{ x^{2}+2x+2 }}  \cdot (x-2)(x+2)\cancel{ (x^{2}+2x+2) }
\end{align}
$$

Mit den gekürzten Termen ergibt sich:

$$
\begin{align}
y(x) &= x^{2}+4x+10\\
&=\underbrace{ A\cdot (x+2)(x^{2}+2x+2) }_{ (a) } \\
&+\underbrace{ B\cdot(x-2)(x^{2}+2x+2) }_{ (b) } \\
&+\underbrace{ C\cdot(x-2)(x+2) }_{ (c) }
\end{align}
$$

$$y(x) =x^{2}+4x+10 = (a) + (b) + (c)$$

Polynom Auflösen um die Faktoren $A$, $B$, $C$ und $D$ zu ermitteln. Zur Vereinfachung werden die Polynome separat betrachtet und absteigend nach ihrer Potenz sortiert:

$$
\begin{align}
(a)\quad Ax^{3}&+A\cdot4 x^{2}+ A\cdot 6x + A\cdot 4\\
(b)\quad Bx^{3}& -B \cdot2 x -B\cdot 4\\
(c)\quad Cx^{3}&+D\cdot x^{2}-C\cdot 4 x -D\cdot 4
\end{align}
$$

da jeder Faktor vor einer Potenz in einer Polynomgleichung übereinstimmen muss, lässt sich ein lineares Gleichungssystem aufstellen.

$$
\begin{align}
x^{3}:\quad &0=A+B+C\\
x^{2}:\quad &1=4A+D\\
x:\quad &4=6A-2B-4C\\
1:\quad &10=4A-4B-4D
\end{align}
$$

Das LGS lässt sich als Matrix anschreiben:

$$
\begin{pmatrix}
1 & 1 & 1 & 0 \\
4 & 0 & 0 & 1 \\
6 & -2 & -4 & 0 \\
4 & -4 & 0 & -4
\end{pmatrix} \cdot
\begin{pmatrix}
A \\ B \\ C \\ D
\end{pmatrix} =
\begin{pmatrix}
0 \\ 1 \\ 4 \\ 10
\end{pmatrix}
$$

Lässt sich nun leicht mit dem Gauss Algorithmus Lösen:

