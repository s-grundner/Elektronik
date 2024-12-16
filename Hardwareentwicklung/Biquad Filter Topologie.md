---
tags:
  - Baugruppen/Filter
aliases:
  - Tow-Thomas
  - Biquad
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 13. Dezember 2024
professor:
---
 

# Biquad Filter Topologie nach Tow-Thomas

Ein Tow-Thomas Filter ist eine schaltungstechnische Realisierung eines [Integratorfilters](OPV-Integrator.md#Integratorfilter).

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1, font=\Large]
% Begin Schematic

\draw (0,0) node[op amp] (opvA) {};
\draw (opvA.out -| 4, 0) node[op amp, anchor=-] (opvB) {};
\draw (opvB.out -| 9, 0) node[op amp, anchor=-] (opvC) {};

\draw (opvA.+) to[short] ++(0,-1) node[tlground] {};
\draw (opvA.-) to [R, l_=$R_2$, *-o] ++(-2,0) node[left] {$U_E$};
\draw (opvA.-) to[short, -*] (opvA.- |- 0, 2) to[R=$R_1$, -] (opvA.out |- 0, 2) to[short, -o] ++(0,-2) to[short](opvA.out) node[below] {$U_1$};

\draw (opvA.out) to[R, l=$R$, -*] (opvB.-) to[short] (opvB.- |- 0, 1) to[C, l=$C$] (opvB.out |- 0, 1) to[short, -o] (opvB.out) node[below] {$U_{BP}$} to[R] (opvC.-);
\draw (opvB.- |- 0, 1) to[short, *-] (opvB.- |- 0, 2.5) to[R] (opvB.out |- 0, 2.5) to[short, -*] (opvB.out |- 0, 1);
\draw (opvB.+) to[short] ++(0,-1) node[tlground] {};



\end{circuitikz}
\end{document}
```

![](assets/Pasted%20image%2020241213044618.png)

## Übertragungsfunktion

<center><a href="./Simulationen/Biquad.nb" class="internal-link">📈Mathematica Notebook</a></center>

## Funktionsweise