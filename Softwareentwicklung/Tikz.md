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

## Circuitikz Examples

```tikz
\usepackage[european]{circuitikz}
\begin{document}

\begin{circuitikz}[scale=2.0]
\draw (0,0)
to[isource, l=$I_0$, v=$V_0$] (0,3)
to[short, -*, i=$I_0$] (2,3)
to[R=$R_1$, i>_=$i_1$] (2,0) -- (0,0);
\draw (2,3) -- (4,3)
to[R=$R_2$, i>_=$i_2$]
(4,0) to[short, -*] (2,0);
\end{circuitikz}

\end{document}
```

[Circuitikz Manual](https://ctan.dcc.uchile.cl/graphics/pgf/contrib/circuitikz/doc/circuitikzmanual.pdf)

# Convert to Tikz Pic

```dataview
LIST FROM #tikz
```

```
	
	
	\draw (8, 0.75) -- (8, 1) -| (8, 1);
	\draw (3, 1) -- (5, 1) -- (8, 1) -- (12, 1);
	\draw (10, 4) -| (12, 4) -- (14, 4);
	\draw (12, 6.23) -- (12, 4);
	\draw (8, 7) -- (10, 7);
	\draw (10, 7) -- (11.16, 7);
	\draw (8, 8) |- (8.25, 7);
	\draw (5, 7) -| (3.25, 7) -| (3, 7);
	\draw (8, 10) -- (10, 10);
	\draw (10, 10) |- (12, 10);
	\draw (12, 8) -- (12, 7.77);
```