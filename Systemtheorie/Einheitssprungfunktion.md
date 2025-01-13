---
tags: 
aliases:
  - Heaviside
  - Einheitssprung
subject:
  - Signale und Systeme
  - VL
created: 26th April 2022
semester: WS24
professor:
  - Andreas Stelzer
---

# Die Einheitssprungfunktion

Die **Sprungfunktion** $\sigma(t)$ ist 1 in der **rechten** Halbebene.

$$
\sigma(t)=\begin{cases}
1 & \text { für } t \geq 0 \\
0 & \text { für } t<0
\end{cases} \qquad
\sigma[n]=\begin{cases}
1 & \text { für } & n \geq 0 \\
0 & \text { für } & n<0
\end{cases}
$$

```tikz
\usepackage{pgfplots}
\begin{document}

\begin{tikzpicture}[scale=1.0]

% Continuous plot for sigma(t)
\begin{axis}[
    axis lines=middle,
    xlabel={$t$},
    ylabel={$\sigma(t)$},
    xtick=\empty,
    ytick={0,1},
    ymin=-0.5,
    ymax=1.5,
    xmin=-1,
    xmax=2,
    width=7cm,
    height=5cm,
    enlargelimits]
    % Step function
    \addplot[domain=-1:0, thick] {0};
    \addplot[domain=0:2, thick] {1};
\end{axis}

\end{tikzpicture}

\begin{tikzpicture}[scale=1.0]

% Discrete plot for sigma[n]
\begin{axis}[
    axis lines=middle,
    xlabel={$n$},
    ylabel={$\sigma[n]$},
    xtick={-3,-2,-1,0,1,2,3},
    ytick={0,1},
    ymin=-0.5,
    ymax=1.5,
    xmin=-3,
    xmax=5,
    width=7cm,
    height=5cm,
    enlargelimits]
    % Discrete step function
    \addplot[ycomb, thick, mark=*] coordinates {(-3,0) (-2,0) (-1,0) (0,1) (1,1) (2,1) (3,1) (4,1)};
\end{axis}

\end{tikzpicture}

\end{document}

```

Sie wird zur Beschreibung von Einschaltvorgängen verwendet.

---

# Tags

[Elementare Operationen auf Signalen](Elementare%20Operationen%20auf%20Signalen.md)
[Delta-Impuls](Delta-Impuls.md)
