---
tags: 
aliases:
  - Maximumnorm
  - Tschebyscheff-Norm
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

Für eine $p$-[Norm](Norm.md) bei der $p\to \infty$, erhält man die *Maximumnorm*. Die Maximumnorm konvergiert gegen das Supremum eines gegebenen endlich dimensionalen Vektors.

 > [!satz] Maximumnorm
> 
> $$
> \|\mathbf{x}\|_{\infty}=\sup \left\{\left|x_1\right|,\left|x_2\right|, \ldots,\left|x_n\right|\right\}
> $$

>[!example] Beispiel
> $$\left\| \begin{pmatrix} -5\\ -7\\ 4\\ -9\end{pmatrix} \right\|_\max = \max(|-5| , |7| , |4|, |-9|) = 9 $$


Im gegensatz zur [euklidschen Norm](Norm.md) entsteht bei der Maximums norm kein Einheitskreis, sondern ein Einheitsquader

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
