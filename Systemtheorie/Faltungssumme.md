---
tags:
  - tikz
aliases: 
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 24th March 2025
professor: 
draft: true
title: Faltungssumme
---

# Faltungssumme

[Faltungsintegral](Faltung.md) ***:LiArrowBigRightDash:***

---

> [!def] **D1 - FALT)** Faltungssumme
> $$(y*x)[n] = \sum_{\nu=-\infty}^{\infty} x[\nu-n]y[n]$$

## Faltungsmatrix


Bekannt aus der Systemtheorie ist, dass das Ausgangssignal das Ergebnis der Faltung des Eingangs mit der Impulsantwort ist. 

$$
\mathbf{}
$$

```tikz
\usepackage{tikz}
\usetikzlibrary{shapes, arrows, positioning}
\begin{document}
\begin{tikzpicture}[auto,>=latex', transform shape, scale=2]

\tikzstyle{block} = [draw, shape=rectangle, minimum height=3em, minimum width=3em, node distance=2cm, line width=1pt]

%Creating Blocks and Connection Nodes
\node at (0,0) (input) {$x[n]$};
\node [block, right of=input] (h) {$h[n]$};
\node [above of = h]{LTI-System};
\node [right = of h] (output) {$y[n]$};

%Conecting Blocks
\draw[->] (input) -- (h) -- (output);

\end{tikzpicture}
\end{document}
```


Für ein oft vorliegendes kausales LTI-System mit endlicher Impulsantwort (FIR) $h[n] = (h_{0}, h_{1}, \dots, h_{N_{h}-1})$ der länge $N_{h-1}$ gilt:

$$
\begin{align}
y[n] &= (h*n)[n] = \sum_{\nu=0}^{N_{h}-1} h[\nu-n]x[n] \\
&=h_{0}x[n] + h_{1}x[n-1] + \dots + h_{N_{h}-1}x[n-N_{h}+1]
\end{align}
$$

Liegt ein Eingangssignal $x[n]$ von endlicher Länge $N_{x}$ vor, dann ist die Länge des Ausgangssignals $y[n]$ gleich $N_{x}+N_{h}-1$.

Setzt man auch für $n$ ein, erhält man eine Lineares Gleichungssystem. Die Werte $x[n]$ für $n \notin \{0,1,\dots,N_{x}-1\}$ sind dabei $0$ zu setzen.

$$
\begin{align}
y[0] &= h_{0}x[0] \\
y[1] &= h_{0}x[1] + h_{1}x[0] \\
y[2] &= h_{0}x[2] + h_{1}x[1] + h_{2}x[0]\\
&\ \ \vdots \\
y[n] &= h_{0}x[0] \\
\end{align}
$$