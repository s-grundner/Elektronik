---
tags: 
aliases:
  - Einheitskreis
created: 11. Oktober 2024
cited:
---

# Kreis

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

\begin{tikzpicture}[thick, scale=2]
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

## Kreis durch 3 Punkte

Durch umformen der Kreisgleichung erhält man ein Lineares Gleichungssystem 3. Ordnung

$$
\begin{align}
r^{2}=(x-M_{x})^{2}+(y-M_{y})^{2} \\

\end{align}
$$