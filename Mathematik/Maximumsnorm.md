---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
  - Signale und Systeme
semester: WS24
created: 22. Oktober 2024
professor:
---
 

# Maximumnorm

$$
\lvert\lvert x \rvert\rvert _{\infty} = \operatorname{sup}\{\lvert x_{1} \rvert ,\lvert x_{2} \rvert, \dots \lvert x_{n} \rvert \}
$$

>[!example] $x := \{-1, -5, 3, 4\}$
> $$\operatorname{max} | | x | | = 5$$

Im gegensatz zur [euklidschen Norm](Mathematik/Algebra/Norm.md) entsteht bei der Maximums norm kein Einheitskreis, sondern ein Einheitsquader

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[axis lines=middle, xmin=-1.5, xmax=1.5, ymin=-1.5, ymax=1.5]
\draw(-1, -1) rectangle (1, 1);
\end{axis}
\end{tikzpicture}

\end{document} 
```
