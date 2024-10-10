# Tikz

## Pgfplots examples

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

# Convert to Tikz Pic

```dataview
LIST FROM #tikz
```
