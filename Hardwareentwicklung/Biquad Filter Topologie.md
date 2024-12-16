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

\draw (0,0) node[op amp] (opvA) {$A$};
\draw (opvA.out -| 4, 0) node[op amp, anchor=-] (opvB) {$B$};
\draw (opvB.out -| 9, 0) node[op amp, anchor=-] (opvC) {$C$};

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

Zwischenspannungen können ermittelt werden durch die einzelne Betrachtung jeder OPV Stufe.

> [!question] **(A)** [Umkehrsummierer](OPV-Addierer.md): liefert $U_{1}(U_{E}, U_{TP})$
> 
> ```tikz
> \usepackage[european, straightvoltages]{circuitikz}
> \usepackage{amsmath}
> 
> \begin{document}
> \begin{circuitikz}[thick, scale=1, font=\Large]
> % Begin Schematic
> 
> \draw (0,0) node[op amp] (opv) {};
> \draw (opv.+) to[short] ++(0,-0.5) node[tlground] {};
> \draw (opv.-)
>     to [R, l_=$R_1$, *-o] (opv.- -| -3,0)
>     node[left] {$U_{TP}$};
> \draw (opv.-)
>     to[short, *-*] (opv.- |- 0, 2)
>     to[R, l_=$R_2$, -o] (-3, 2)
>     node[left] {$U_{E}$};
> \draw (opv.- |- 0, 2)
>     to[R=$R_1$] (opv.out |- 0, 2)
>     to[short, -*] (opv.out)
>     to[short, -o] ++(1,0) node[right] {$U_1$};
> 
> \end{circuitikz}
> \end{document}
> ```
> 
> Aus der Knotenregel folgt:
> 
> $$
> \frac{U_{1}}{R_{1}}=-\left( \frac{U_{E}}{R_{1}}+\frac{U_{TP}}{R_{2}} \right) \iff U_{1}=-\left( \frac{R_{1}}{R_{2}}U_{E}+U_{TP} \right)
> $$


> [!question] **(B)** [Integrator 1](OPV-Integrator.md): liefert $U_{BP}(U_{1})$

