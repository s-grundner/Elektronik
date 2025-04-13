---
tags: 
aliases:
  - "#tikz"
created: 28. September 2024
---

# Tikz

## Pgfplots Examples

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[colormap/viridis]
\addplot3[
	surf,
	samples=16,
	domain=-3:3
]
{exp(-x^2-y^2)*x};
\end{axis}
\end{tikzpicture}

\end{document}
```

```dataview 
LIST FROM #tikz/pgfplot
```

## Circuitikz Examples

```dataview 
LIST FROM #tikz/circuitikz 
```

[Circuitikz Manual](https://ctan.dcc.uchile.cl/graphics/pgf/contrib/circuitikz/doc/circuitikzmanual.pdf)

## How Tos

### Systeme mit Tikz zeichnen

Beispiel code

```tikz
\usepackage{tikz}
\usetikzlibrary{shapes, arrows}
\begin{document}
\begin{tikzpicture}[auto,>=latex', transform shape, scale=2]

\tikzstyle{block} = [draw, shape=rectangle, minimum height=3em, minimum width=3em, node distance=2cm, line width=1pt]
\tikzstyle{sum} = [draw, shape=circle, node distance=1.5cm, line width=1pt, minimum width=1.25em]
\tikzstyle{branch} = [fill,shape=circle,minimum size=4pt,inner sep=0pt]

%Creating Blocks and Connection Nodes
\node at (-2.5,0) (input) {$x[n]$};
\node [block] (h1) {$h_1[n]$};
\node [block, right of=h1] (h2) {$h_2[n]$};
\node [sum, right of=h2] (sum) {};
\node at (sum) (plus) {{\footnotesize$+$}};
\node at (5,0) (output) {$y[n]$};
\path (h1) -- coordinate (med) (h2);
\path (input) -- coordinate(branch1) (h1);
\node [block, below of=med] (h3) {$h_3[n]$};

%Conecting Blocks
\begin{scope}[line width=1pt]
     \draw[->] (input) -- (h1);
     \draw[->] (h1) -- (h2);
     \draw[->] (h2) -- (sum);
     \draw[->] (sum) -- (output);
     \draw[->] (branch1) node[branch] {} |- (h3);
     \draw[->] (h3) -| (sum);
\end{scope}

\end{tikzpicture}
\end{document}
```

### Stromrichtung bei Tikz bipole

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]

\draw (0,0) to[R, i^>=$I$] (0,2);
\draw (1,0) to[R, i^<=$I$] (1,2);
\draw (2,0) to[R, i_>=$I$] (2,2);
\draw (3,0) to[R, i_<=$I$] (3,2);
\draw (4,0) to[R, i>^=$I$] (4,2);
\draw (5,0) to[R, i<^=$I$] (5,2);
\draw (6,0) to[R, i>_=$I$] (6,2);
\draw (7,0) to[R, i<_=$I$] (7,2);

\end{circuitikz}
\end{document}
```

![](assets/Tikz%202025-03-06%2013.02.39.excalidraw)

# Convert to Tikz Pic

```dataview
LIST FROM #tikz/todo
```