---
tags:
  - tikz/pgfplot
aliases:
  - Einheitskreis
created: 11. Oktober 2024
cited:
---

# Kreis

Gleichung zum Ursprungskreis

$$
r^{2}= x^{2}+y^{2}
$$

Gleichung zum Verschobenen Kreis mit radius $r$ und Mittelpunkt $(M_{x}, M_{y})$
$$
r^{2}=(x-M_{x})^{2}+(y-M_{y})^{2}
$$


```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}
\newcommand\MX{2}
\newcommand\MY{2}
\newcommand\RC{3}

\begin{tikzpicture}[thick]

\draw[very thick] (\MX,\MY) circle(\RC);
\draw[->] (-1, 0) -- (6, 0) node[anchor=west] {\Huge$x$};
\draw[->] (0, -1) -- (0, 6) node[anchor=south] {\Huge$y$};
\draw[dashed] (0, \MY) -- (\MX, \MY);
\draw[dashed] (\MX, 0) -- (\MX, \MY);
\filldraw (\MX, \MY) circle (1pt);
\draw (\MX, \MY) node[right] {\Huge $(M_{x}, M_{y})$};
\draw[->, red] (\MX, \MY) -- (\MX+\RC*0.707, \MY+\RC*0.707);
\draw (\MX+\RC*0.707, \MY+\RC*0.707) node[above right] {\Huge $r$};

\end{tikzpicture}

\end{document}
```

Die Kreisgleichung ist oft eine Lösung komplexer Gleichungen und Ungleichungen

## Einheitskreis

## Kreis durch 3 Punkte

Durch umformen der Kreisgleichung erhält man ein Lineares Gleichungssystem 3. Ordnung

$$
\begin{align}
r^{2}&=(x-M_{x})^{2}+(y-M_{y})^{2} \\
&=x^{2}-2M_{x}x+M_{x}^{2} + y^{2}-2M_{y}y+M_{y}^{2} \quad \Bigg| -(x^{2}+y^{2})-r^{2} \\
-(x^{2}+y^{2})&=M_{x}^{2}+M_{y}^{2}-r^{2}-2M_{x}x-2M_{y}y
\end{align}
$$

Nun kann man ein LGS mit dem Lösungsvektor $(A,B,C)$ aufstellen, indem man Substituiert:

$$
\begin{align}
A &:= M_{x}^{2}+M_{y}^{2}-r^{2} \\
B &:= 2M_{x} \\
C &:= 2M_{y}
\end{align}
$$

Das LGS Lautet:

$$
\begin{align}
A-B\cdot x_{1}-C\cdot y_{1} &= -(x_{1}^{2}+y_{1}^{2}) \\
A-B\cdot x_{2}-C\cdot y_{2} &= -(x_{2}^{2}+y_{2}^{2}) \\
A-B\cdot x_{3}-C\cdot y_{3} &= -(x_{3}^{2}+y_{3}^{2}) \\
&\Downarrow \\
\begin{pmatrix}
-1 & x_{1} & y_{2}\\
-1 & x_{2} & y_{2}\\
-1 & x_{3} & y_{3}
\end{pmatrix} \cdot \begin{pmatrix}
A \\ B \\ C
\end{pmatrix} &= \begin{pmatrix}
x_{1}^{2}+y_{1}^{2} \\
x_{2}^{2}+y_{2}^{2} \\
x_{3}^{2}+y_{3}^{2}
\end{pmatrix}
\end{align}
$$

Mit dem Lösen des Gleichungssystems folgt:

$$
\begin{gathered}
M_{y} = \frac{C}{2},\quad M_{x} = \frac{B}{2} \\
r^{2} = \frac{C^{2}}{4}+\frac{B^{2}}{4}-A\quad\text{bzw} \quad r = \sqrt{ M_{y}^{2}+M_{x}^{2}-{A} }
\end{gathered}
$$
