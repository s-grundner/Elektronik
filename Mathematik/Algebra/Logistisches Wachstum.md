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

> [!important] Mit der DGL
> 
> $$
> \frac{dP}{dt}=\lambda \cdot P\cdot(K-P)
> $$
> wird das Logistische Wachstum beschrieben
>

Die Lösung dieser DGL ist:

$$
P(t)=\frac{K}{1+\left( \frac{K}{P_{0}}-1 \right)e^{ -\lambda \cdot K\cdot t }}
$$

$K=100$, $P_{0}=2$, $\lambda=0.05$

>[!example] Beispiel mit Anfangswerten

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}[scale=2.5]
\begin{axis}[
    colormap/viridis,
    title=$K=100$, $P_{0}=2$, $\lambda=0.05$
]
\newcommand\K{100};
\newcommand\Pz{2};
\newcommand\Lamb{0.05};
\addplot[
	domain=0:2
]
{\K / (1+((\K/\Pz)-1) * exp(-\Lamb*\K*x))};
\end{axis}

\end{tikzpicture}

\end{document}
```