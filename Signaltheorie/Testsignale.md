---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 8. Oktober 2024
professor:
---
 
# Testsignale

1. Sprung
2. Rechteck
3. Rampen
4. Sinus
5. Dirac

## Sprung

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


## Reckteckfunktion

Die diskrete Rechteckfunktion $\operatorname{rect}_N[n]$ wird, um Probleme bei der Skalierung als auch mit der Symmetrie zu vermeiden, folgendermaßen definiert:

$$
\operatorname{rect}_N[n]= \begin{cases}1 & \text { für } 0 \leq n<N \\ 0 & \text { sonst }\end{cases}
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


## Rampenfunktion

Die Rampenfunktion $\rho(t)$ steigt für $t>0$ linear mit der Zeit an.

## reelle Exponentialfunktion

Die reelle Exponentialfunktion $x(t)=e^{\alpha t}=e^{\dfrac{t}{T}}$ besitzt die Zeitkonstante $T=\frac{1}{\alpha}$, welche die Länge der Subtangente, bzw. den Abfall auf $\dfrac{1}{e}=36,8 \%$ beschreibt.

$$
e^{\alpha t} \begin{cases}\alpha>0 & \text { anklingend } \\ \alpha<0 & \text { abklingend, gedämpft }\end{cases}
$$


```tikz
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=newest}

\begin{document}

% Plot for both growing and decaying exponential functions
\begin{tikzpicture}

% Ansteigende Exponentialfunktion (alpha > 0)
\begin{axis}[
    axis lines=middle,
    xlabel={$t$},
    ylabel={},
    xtick=\empty,
    ytick={1},
    ymin=-0.5,
    ymax=3,
    xmin=-2,
    xmax=2,
    width=7cm,
    height=6cm,
    domain=-2:2,
    samples=100,
    title={Anklingende Exponentialfunktion},
    axis line style={->}
]
    % Growing exponential function
    \addplot[domain=-2:0, red, thick] {exp(x)};
    % Line at t = 0 and |T|
    \addplot[dashed] coordinates {(0,1) (-1,1)};
    \node at (axis cs: -1,0.7) {$|T|$};
    % Label for 1
    \node at (axis cs: 0.2,1.1) {1};
    \node at (axis cs: 0.2,2.5) {$e^{\alpha t}$};
    \node at (axis cs: 0.8,2.1) {($\alpha > 0$)};
\end{axis}

% Abklingende Exponentialfunktion (alpha < 0)
\begin{axis}[
    axis lines=middle,
    xlabel={$t$},
    ylabel={},
    xtick=\empty,
    ytick={1},
    ymin=-0.5,
    ymax=3,
    xmin=-2,
    xmax=2,
    width=7cm,
    height=6cm,
    at={(8cm,0)},
    domain=-2:2,
    samples=100,
    title={Abklingende Exponentialfunktion},
    axis line style={->}
]
    % Decaying exponential function
    \addplot[domain=0:2, red, thick] {exp(-x)};
    % Line at t = 0 and |T|
    \addplot[dashed] coordinates {(0,1) (1,1)};
    \node at (axis cs: 1,0.7) {$|T|$};
    % Label for 1
    \node at (axis cs: 0.2,1.1) {1};
    \node at (axis cs: 0.2,2.5) {$e^{\alpha t}$};
    \node at (axis cs: 0.8,2.1) {($\alpha < 0$)};
\end{axis}

\end{tikzpicture}

\end{document}
```

## Komplexe Exponentialfunktion

## Sinusfunktion
