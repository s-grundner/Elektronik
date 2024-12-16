---
tags:
  - Baugruppen/Filter
  - tikz/circuitikz
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
\ctikzset{bipole voltage style/.style={color=green}, bipole current style/.style={color=red}}
% Begin Schematic

\newcommand{\gndlvl}{-3}

\draw (0,0) node[op amp] (opvA) {};
\draw (opvA.out -| 4, 0) node[op amp, anchor=-] (opvB) {};
\draw (opvB.out -| 9, 0) node[op amp, anchor=-] (opvC) {};

% Umkehrsummierer
\draw (opvA.+) to[short] (opvA.+ |- 0, \gndlvl) node[tlground] {};
\draw (opvA.-) to [vR, l_=$R_2$, *-o] ++(-2,0) node[left] {$U_E$};
\draw (opvA.-)
    to[short, -*] (opvA.- |- 0, 2)
    to[R=$R_1$] (opvA.out |- 0, 2)
    to[short, -o] ++(0,-2)
    to[short] (opvA.out);
\draw (opvA.out)
    to[open, v=$U_1$] (opvA.out |- 0, \gndlvl+0.5)
    to[short, o-] (opvA.out |- 0, \gndlvl) node[tlground] {};

% Mitkopplungszweig
\draw (opvA.- |- 0, 2)
    to[short] (opvA.- |- 0, 4)
    to[R=$R_1$] (opvA.out |- 0, 4)
    to[short] (opvC.out |- 0, 4)
    to[short, -o] (opvC.out);

% Integrator 1
\draw (opvA.out)
    to[R=$R$, -*] (opvB.-)
    to[short] (opvB.- |- 0, 1)
    to[C, l=$C$] (opvB.out |- 0, 1)
    to[short, -o] (opvB.out)
    to[vR=$R$] (opvC.-);
\draw (opvB.- |- 0, 1)
    to[short, *-] (opvB.- |- 0, 2.5)
    to[vR, l_=$R_3$] (opvB.out |- 0, 2.5)
    to[short, -*] (opvB.out |- 0, 1);
\draw (opvB.+) to[short] (opvB.+ |- 0, \gndlvl) node[tlground] {};
\draw (opvB.out)
    to[open, v=$U_{BP}$] (opvB.out |- 0, \gndlvl+0.5)
    to[short, o-] (opvB.out |- 0, \gndlvl) node[tlground] {};

% Integrator 2
\draw (opvC.out)
    to[short, -*] (opvC.- |- 0, 1)
    to[C, l=$C$] (opvC.- |- 0, 1);

\end{circuitikz}
\end{document}
```

![](assets/Pasted%20image%2020241213044618.png)

## Übertragungsfunktion

<center><a href="./Simulationen/Biquad.nb" class="internal-link">📈Mathematica Notebook</a></center>

## Funktionsweise