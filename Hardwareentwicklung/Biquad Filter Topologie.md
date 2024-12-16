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

Dieser Filter kombiniert einen aktiven Tiefpass und Bandpass 2. Ordnung.

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
\draw (opvA.-)
    to [vR, l_=$R_2$, *-o] (opvA.- -| -3, 0)
    to[open, v=$U_E$] (-3, \gndlvl + 0.5)
    to[short, o-] (-3, \gndlvl) node[tlground] {};
\draw (opvA.-)
    to[short, -*] (opvA.- |- 0, 2.5)
    to[R=$R_1$] (opvA.out |- 0, 2.5)
    to[short, -o] (opvA.out);
\draw (opvA.out)
    to[open, v=$U_1$] (opvA.out |- 0, \gndlvl+0.5)
    to[short, o-] (opvA.out |- 0, \gndlvl) node[tlground] {};

% Mitkopplungszweig
\draw (opvA.- |- 0, 2)
    to[short] (opvA.- |- 0, 4)
    to[R, l=$R_1$] (opvA.out |- 0, 4)
    to[short] (opvC.out |- 0, 4)
    to[short, -o] (opvC.out);

% Integrator 1
\draw (opvA.out)
    to[vR=$R$, -*] (opvB.-)
    to[short] (opvB.- |- 0, 1)
    to[C, l=$C$] (opvB.out |- 0, 1)
    to[short, -o] (opvB.out)
    to[vR=$R$] (opvC.-);
\draw (opvB.- |- 0, 1)
    to[short, *-] (opvB.- |- 0, 2.5)
    to[vR, l=$R_3$] (opvB.out |- 0, 2.5)
    to[short, -*] (opvB.out |- 0, 1);
\draw (opvB.+) to[short] (opvB.+ |- 0, \gndlvl) node[tlground] {};
\draw (opvB.out)
    to[open, v=$U_{BP}$] (opvB.out |- 0, \gndlvl+0.5)
    to[short, o-] (opvB.out |- 0, \gndlvl) node[tlground] {};

% Integrator 2
\draw (opvC.-)
    to[short, *-] (opvC.- |- 0, 1)
    to[C, l=$C$, -*] (opvC.out |- 0, 1);
\draw (opvC.out)
    to[open, v=$U_{TP}$] (opvC.out |- 0, \gndlvl+0.5)
    to[short, o-] (opvC.out |- 0, \gndlvl) node[tlground] {};
    
\end{circuitikz}
\end{document}
```

> [!info] Die einzelnen Widerstände bestimmen praktischerweise größtenteils separat die Kenngrößen $V_{0}, Q$ und $\omega_{0}$:
> 
> $$V_{0}=f(R_{2}), \quad Q = f(R_{3}), \quad \omega_{0}=f(R)$$

## Übertragungsfunktion

<center><a href="./Simulationen/Biquad.nb" class="internal-link">📈Mathematica Notebook</a></center>

## Funktionsweise