---
tags: 
aliases:
  - Maximumsnorm
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 16. Oktober 2024
professor:
---
 
# Satz von Peano

## Maximumsnorm

>[!example] $x := \{-1, -5, 3, 4\}$
> $$\operatorname{max} | | x | | = 5$$

Im gegensatz zur [euklidschen Norm](Mathematik/Algebra/Norm.md) entsteht bei der Maximums norm kein EInheitskreis, sondern ein Einheitsquader

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[axis lines=middle, xmin=-6, xmax=6, ymin=-6, ymax=6]
\draw (-5, 5) -- (5, 5);
\draw (5, 5) -- (5, -5);
\draw (5, -5) -- (-5, -5);
\draw (-5, -5) -- (-5, 5);
\end{axis}
\end{tikzpicture}

\end{document}
```