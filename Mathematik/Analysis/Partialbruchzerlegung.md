---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 4. März 2024
professor: 
cited:
---
 

# Partialbruchzerlegung

Rational gebrochene Polynome der Form

$$ F(s) = \frac{Z(s)}{N(s)} $$

können je nach der Nullstelleneigenschaften von $N(s)$ in eine Partialbruchdarstellung gebracht werden.

### Einfache Nullstellen

$$ F(s) = A_{0} + \sum_{i=1}^{n} \frac{A_{i}}{s-s_{\infty i}} $$

> [!warning] Funktioniert nur solange der Grad des Zählerpolynoms nicht größer ist als der Grad des Nennerpolynoms und die Pole nur Einfach sind.
> - Ist $\operatorname{grad}Z(s)\geq \operatorname{grad}N(s)$ lässt sich eine [Polynomdivision](../Algebra/Polynomdivision.md) druchführen.

### Mehrfache und konjugiert komplexe Polstellen

$$ F(s) = A_{0} + \sum_{i=1}^{n} p_{i}(s) $$

Kommt beim index $i$ eine der Folgenden Polstellenarten vor, wird dieser Summen Term mit dem genannten Ansatz ersetzt:

- Ansatz für *eine* einfache **reelle Polstelle** (wie oben)
$$p_{i}(s) = \frac{A}{s-s_{\infty i}}$$
- Ansatz für *eine* mehrfache **reelle Polstelle** $s_{\infty i}$ der algebraischen Vielfachheit $l$
$$p_{i}(s)=\frac{A_{1}}{s-s_{\infty i}} + \frac{A_{2}}{(s-s_{\infty i})^{2}} + \dots + \frac{A_{l}}{(s-s_{\infty i})^{l}}$$ 
- Ansatz für *ein* einfaches **konjugiert komplexes Polstellenpaar**
$$p_{i}(s)=\frac{Bs+C}{s^{2}+ps+q}$$
- Ansatz für *ein* mehrfaches **konjugiert komplexes Polstellenpaar** der algebraischen Vielfachheit $l$

$$p_{i}(s)=\frac{B_{1}s+C_{1}}{s^{2}+ps+q} + \frac{B_{2}s+C_{2}}{(s^{2}+ps+q)^{2}} + \dots + \frac{B_{l}s+C_{l}}{(s^{2}+ps+q)^{l}}$$

## Anwendungen 

- [Laplacetransformation](../../Systemtheorie/Laplacetransformation.md)
- [z-Transformation](../../Systemtheorie/z-Transformation.md)

# Beispiele

$$
\begin{align}
y(x) &= \frac{x^2+4x+10}{(x^2-4)\underbrace{ (x^2+2x+2) }_{ \text{irreduzibler Term} }} \\
&= \frac{x^{2}+4x+10}{(x-2)(x+2)(x^{2}+2x+2)}
\end{align}
$$

Ansatz für Partialbruch mit dem rationalen [Polynom](Polynom.md) Gleichsetzen.

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

[Polynom](Polynom.md) Auflösen um die Faktoren $A$, $B$, $C$ und $D$ zu ermitteln. Zur Vereinfachung werden die Polynome separat betrachtet und absteigend nach ihrer [Potenz](../Algebra/Potenzen.md) sortiert:

$$
\begin{align}
(a)\quad Ax^{3}&+A\cdot4 x^{2}+ A\cdot 6x + A\cdot 4\\
(b)\quad Bx^{3}& -B \cdot2 x -B\cdot 4\\
(c)\quad Cx^{3}&+D\cdot x^{2}-C\cdot 4 x -D\cdot 4
\end{align}
$$

da jeder Faktor vor einer [Potenz](../Algebra/Potenzen.md) in einer Polynomgleichung übereinstimmen muss, lässt sich ein [lineares Gleichungssystem](Lineare%20Gleichungssysteme.md) aufstellen.

$$
\begin{align}
x^{3}:\quad &0=A+B+C\\
x^{2}:\quad &1=4A+D\\
x:\quad &4=6A-2B-4C\\
1:\quad &10=4A-4B-4D
\end{align}
$$

Das [LGS](Lineare%20Gleichungssysteme.md) lässt sich als [Matrix](Matrix.md) anschreiben:

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

Lässt sich nun leicht mit dem [Gauß-Algorithmus](../Algebra/Gauß-Algorithmus.md) Lösen:

$$
\begin{align}
\left[\begin{array}{cccc|c}
1 &  1 &  1 &  0 &  0 \\
4 & -7 &  4 &  0 &  1 \\
6 & -2 & -4 &  0 &  4 \\
4 & -4 &  0 & -4 & 10  
\end{array}\right] &\quad\begin{aligned}
\\
S_{2}'=4S_{1}-S_{2}\\
S_{3}'=6S_{1}-S_{3}\\
S_{4}'=4 S_{1}-S_{4}
\end{aligned} \\ \\

\left[\begin{array}{cccc|c}
1 & 1 & 1 & 0 &  0 \\
0 & 4 & 4 & -1 &  -1 \\
0 & 8 & 8 & 0 &  -4 \\
0 & 8 & 4 & 4 & -10  
\end{array}\right] &\quad\begin{aligned}
\\ \\
S_{3}''=2S_{2}'-S_{3}'\\
S_{4}''=2S_{2}'-S_{4}'
\end{aligned} \\ \\
\begin{aligned}
\\ \\
\downarrow\uparrow
\end{aligned}
\left[\begin{array}{cccc|c}
1 & 1 & 1 & 0 &  0 \\
0 & 4 & 4 & -1 &  -1 \\
0 & 0 & 0 & -2 &  2 \\
0 & 0 & 4 & -6 & 8  
\end{array}\right] 
&\to
\left[\begin{array}{cccc|c}
1 & 1 & 1 & 0 &  0 \\
0 & 4 & 4 & -1 &  -1 \\
0 & 0 & 4 & -6 & 8 \\ 
0 & 0 & 0 & -2 &  2
\end{array}\right]
\end{align}
$$

Mit der unteren linken Stufenform kann das [LGS](Lineare%20Gleichungssysteme.md) von unten nach oben gelöst werden

$$
\begin{align}
-2D&=2 &&\to D=-1\\
4C-6\cdot(-1) &= 8 &&\to C=\frac{1}{2} \\
4B+4\cdot \frac{1}{2}-1\cdot(-1) &= -1 &&\to B=-1\\
A+1\cdot(-1)+1\cdot \frac{1}{2}+0\cdot(-1) &=0 &&\to A=-2
\end{align}
$$