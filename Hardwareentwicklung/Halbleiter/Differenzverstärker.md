---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 7. Januar 2025
professor:
---
 

# Differenzverstärker

Ein Differenzverstärker ist ein Verstärker, der die Differenz zweier Eingangssignale verstärkt. 

Die Schaltung wid mit zwei Emitterschaltungen (Kollektorfolgern), deren Emitter gemeinsam an eine Stromquelle angschlossen sind realisiert.

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=0.8cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\draw (-1,0) node[npn](npnLeft){};
\draw (1,0) node[npn, xscale=-1](npnRight){};
\draw (npnLeft.text) node[right]{$T_1$};
\draw (npnRight.text) node[left]{$T_2$};
\draw (npnLeft.C) to[short, i<=$I_{C1}$] ++(0,0.5) coordinate(cLeft) to[R, l=$R_C$, *-] ++(0,1) coordinate(v) node[vcc]{$U_0$};
\draw (npnRight.C) to[short, i<_=$I_{C2}$] ++(0,0.5) coordinate(cRight) to[R, l_=$R_C$, *-] ++(0,1) node[vcc]{$U_0$};
\draw (npnLeft.E) to[short, i=$I_{E1}$] (npnLeft.E -| 0,0) coordinate(e) to[short, i<=$I_{E2}$] (npnRight.E);
\draw (e) to[short, *-o] ++(0,-0.5) coordinate (iin) -- ++(0.5,0) to[R,l=$R_i$] ++(0,-2) -- ++(-0.5,0) to[short, o-] ++(0,-0.5) node[vee]{$-U_0$};
\draw (iin) -- ++(-0.5, 0) to[I, i=$ $, l_=$I_0$] ++(0,-2) -- ++(0.5,0);
\draw (npnLeft.B) to[open, v^=$U_{e1}$, o-o] ++(0,-2) coordinate(g) node[rground]{};
\draw (npnRight.B) to[open, v^=$U_{e2}$, o-o] ++(0,-2) node[rground]{};
\draw (cLeft) -- ++(-3,0) coordinate(a1) to[open, v^=$U_{a1}$, o-o] (g -| a1) node[rground]{};
\draw (cRight) -- ++(3,0) coordinate(a2) to[open, v^=$U_{a2}$, o-o] (g -| a2) node[rground]{};
\end{circuitikz}
\end{document}
```

- 2 Eingänge $U_{\mathrm{e}1}$ und $U_{\mathrm{e}2}$ jeweils an den Basen der Transistoren $T_1$ und $T_2$
- 2 Ausgänge $U_{\mathrm{a}1}$ und $U_{\mathrm{a}2}$ jeweils an den Kollektoren der Transistoren $T_1$ und $T_2$
- Symmetrische Versorgung $\pm U_0$ bezüglich des Bezugspotenzials 0
- Stromquelle $I_0$ mit Innenwiderstand $R_{i}$ zur Einstellung des AP

## Funktionsweise

> [!hint] Es werden (idealerweise, d. h. für $R_{\mathrm{i}} \rightarrow \infty$ ) nur:
> - **Eingangsspannungsdifferenzen** $U_{\mathrm{ed}}=U_{e, 1}-U_{e, 2} \neq 0$ verstärkt.
> - **Gleichtaktaussteuerungen** $U_{\mathrm{gl}}=U_{\mathrm{e}, 1}=U_{\mathrm{e}, 2}$ bewirken am Ausgang idealerweise keine Änderungen.

## Vorteile

1. Verstärkung von DC-Signalen. (Andere Verstärker können das aufgrund des Hochpassverhaltens der Koppelkondensatoren nicht!)
2. Die Subtraktion zweier Eingangssignale ermöglicht *gegengekoppelte* Schaltungen.
3. Großer linearer Aussteuerbereich bei Verstärkern, da die Auswirkungen der Nichtlinearitäten in den Transistorkennlinien verringert werden.

## Schaltungsentwurf

Die EInfachste Möglichkeit die Stromquelle zu realisieren it mittels eines einfachen Widerstandes

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=0.8cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\draw (-1,0) node[npn](npnLeft){};
\draw (1,0) node[npn, xscale=-1](npnRight){};
\draw (npnLeft.text) node[right]{$T_1$};
\draw (npnRight.text) node[left]{$T_2$};
\draw (npnLeft.C) to[short, i<=$I_{C1}$] ++(0,0.5) coordinate(cLeft) to[R, l=$R_C$, *-] ++(0,1) coordinate(v) node[vcc]{$U_0$};
\draw (npnRight.C) to[short, i<_=$I_{C2}$] ++(0,0.5) coordinate(cRight) to[R, l_=$R_C$, *-] ++(0,1) node[vcc]{$U_0$};
\draw (npnLeft.E) to[short, i=$I_{E1}$] (npnLeft.E -| 0,0) coordinate(e) to[short, i<=$I_{E2}$] (npnRight.E);
\draw (e) to[R,l=$R_i$] ++(0,-2) node[vee]{$-U_0$};
\draw (npnLeft.B) to[open, v^=$U_{e1}$, o-o] ++(0,-2) coordinate(g) node[rground]{};
\draw (npnRight.B) to[open, v^=$U_{e2}$, o-o] ++(0,-2) node[rground]{};
\draw (cLeft) -- ++(-3,0) coordinate(a1) to[open, v^=$U_{a1}$, o-o] (g -| a1) node[rground]{};
\draw (cRight) -- ++(3,0) coordinate(a2) to[open, v^=$U_{a2}$, o-o] (g -| a2) node[rground]{};
\end{circuitikz}
\end{document}
```