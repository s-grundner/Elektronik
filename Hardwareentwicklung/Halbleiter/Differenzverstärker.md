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
\draw (npnLeft.C) to[R, l=$R_C$] ++(0,1) coordinate(v) node[vcc]{$U_0$};
\draw (npnRight.C) to[R, l_=$R_C$] ++(0,1) node[vcc]{$U_0$};
\draw (npnLeft.E) -- (npnLeft.E -| 0,0) coordinate(e) -- (npnRight.E);
\draw (e) to[short, *-o] ++(0,-0.5) coordinate (iin) -- ++(0.5,0) to[R,l=$R_i$] ++(0,-2) -- ++(-0.5,0) to[short, o-] ++(0,-0.5) node[vee]{$-U_0$};
\draw (iin) -- ++(-0.5, 0) to[I, i=$ $, l_=$I_0$] ++(0,-2) -- ++(0.5,0);
\draw (npnLeft.B) to[open, v^=$U_{e1}$, o-o] ++(0,-2) coordinate(g) node[rground]{};
\draw (npnRight.B) to[open, v^=$U_{e2}$, o-o] ++(0,-2) node[rground]{};
\draw (npnLeft.C) -- ++(-3,0) to[open, v^=$U_a1$, o-o] ++(g -| 0,0) node[rground]{};
\draw (npnRight.C) -- ++(3,0) to[open, v^=$U_a2$, o-o] ++(g -| 0,0) node[rground]{};
\end{circuitikz}
\end{document}
```