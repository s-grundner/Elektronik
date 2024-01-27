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

Polynom Auflösen um die Faktoren $A$, $B$, $C$ und $D$ zu ermitteln

$$
\begin{align}
(a)\quad Ax^{3}+&\\
(b)\quad &\\
(c)\quad &
\end{align}
$$

![](assets/Pasted%20image%2020240127141009.png)

---

# Tags