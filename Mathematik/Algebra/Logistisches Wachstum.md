---
tags: 
aliases: 
subject:
  - Mathematik 3
  - VL
created: 29th August 2022
professor:
  - Markus Passenbrunner
semester: WS24
---

# Logistisches Wachstum

Reales Populationswachstum ist nicht Aufgrund von Sterberaten nicht Exponenziell und kann durch Logistisches Wachtum Modelliert werden.

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[colormap/viridis]
\k = 10,
\addplot[
	surf,
	domain=-3:3
]
{\k};
\end{axis}
\end{tikzpicture}

\end{document}
```