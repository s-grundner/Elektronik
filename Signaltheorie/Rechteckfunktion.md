---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 12. November 2024
professor:
---
 

# Rechteckfunktion

## Definition

Die Rechteckfunktion ist definiert als:

$$
\operatorname{rect}(t) = \begin{cases}
0 & \text { wenn }|t|>\frac{1}{2} \\
\frac{1}{2} & \text { wenn }|t|=\frac{1}{2} \\
1 & \text { wenn }|t|<\frac{1}{2} 
\end{cases}
$$

Mit [Skalierung](Elementare%20Operationen%20auf%20Signalen.md):

$$
\operatorname{rect}\left( \frac{t}{T} \right) = \begin{cases}
0 & \text { wenn }|t|>\frac{T}{2} \\
\frac{1}{2} & \text { wenn }|t|=\frac{T}{2} \\
1 & \text { wenn }|t|<\frac{T}{2} 
\end{cases}
$$
```tikz
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=newest}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    axis lines=middle,
    xlabel={$t$},
    ylabel={$\mathrm{rect}\left( \frac{t}{T} \right)$},
    xtick={-1,1},
    xticklabels={$-\frac{T}{2}$,$\frac{T}{2}$},
    ytick={0,1},
    ymin=-0.5,
    ymax=1.5,
    xmin=-1.5,
    xmax=1.5,
    width=8cm,
    height=6cm,
    enlargelimits
]
    % Rectangle function
    \addplot[red,thick,domain=-1.5:-1] {0};
    \addplot[red,thick,domain=-1:1] {1};
    \addplot[red,thick,domain=1:1.5] {0};
\end{axis}
\end{tikzpicture}

\end{document}

```
