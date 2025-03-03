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

> [!important] Differenzialgleichung zur Beschreibung des Logistischen Wachstums 
> 
> $$
> \boxed{ \frac{dP}{dt}=\lambda \cdot P\cdot(K-P) }
> $$
> 
>$\lambda$: Koeffizient wie schnell sich das Wachstum ändert
>$K$: Maximalbevölkerung
>$P_{0}$: Startpopulation

Die Lösung dieser [DGL](../GDGL.md) ist:

$$
P(t)=\frac{K}{1+\left( \frac{K}{P_{0}}-1 \right)e^{ -\lambda \cdot K\cdot t }}
$$



>[!example] Beispiel mit Anfangswerten
> **Links:** Das Wachstum steigt erst schnell an und flacht bei der Maximalbevölkerung ab
> **Rechts:** Die Anfangspopulation ist größer als die maximal Population und sinkt exponentiell
> 
```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}[scale=2]
\begin{axis}[
    title={$K=100$\quad $P_{0}=2$\quad $\lambda=0.01$}
]
\newcommand\K{100};
\newcommand\Pz{2};
\newcommand\Lamb{0.05};
\addplot[
	domain=0:2
]
{\K / (1+((\K/\Pz)-1) * exp(-\Lamb*\K*x))}[thick, cyan];
\draw[dotted, very thick] (0,\K) -- (2,\K);
\end{axis}
\end{tikzpicture}

\begin{tikzpicture}[scale=2]
\begin{axis}[
    title={$K=90$\quad $P_{0}=100$\quad $\lambda=0.05$},
]
\newcommand\K{90};
\newcommand\Pz{100};
\newcommand\Lamb{0.05};
\addplot[
	domain=0:2
]
{\K / (1+((\K/\Pz)-1) * exp(-\Lamb*\K*x))}[thick, red];
\draw[dotted, very thick] (0,\K) -- (2,\K);
\end{axis}

\end{tikzpicture}

\end{document}
```

