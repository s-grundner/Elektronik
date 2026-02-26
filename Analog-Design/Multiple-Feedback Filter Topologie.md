---
tags:
  - Baugruppe/Filter
aliases:
  - Multiple-Feedback
  - Mehrfach-Gegenkopplung
keywords:
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 13. Dezember 2024
professor:
release: false
---
 

# Filter mit Mehrfach-Gegenkopplung

> [!question] Siehe: [Aktiver Filter](Filter-Verstärker/Aktiver%20Filter.md), [Gegenkopplung](Kopplungsarten.md)

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]

\draw (0,0) node[op amp](opv){};
\draw (opv.-) -- ++(0,1) coordinate(c1)
    to[C, l=$C_1$, -*] (c1 -| opv.out) -- (opv.out)
    to[short, *-] ++(1, 0)
    to[open, v=$U_A$, o-o] ++(0, -2) coordinate(g) node[rground]{};
\draw (opv.+) -- (opv.+ |- g) node[rground] {};
\draw (opv.-) to[R, l_=$R_3$, *-*] ++(-2, 0) coordinate(k1)
    to[R, l_=$R_1$] ++(-2, 0) coordinate(a)
    to[open, v=$U_E$, o-o] (a |- g) node[rground]{};
\draw (k1) -- ++(0,2) coordinate (r1) to[R, l=$R_1$] (r1 -| c1) -| (c1 -| opv.out);
\draw (k1) to[C, l_=$C_2$] (k1 |- g) node[rground]{};

\end{circuitikz}
\end{document}
```



## Übertragungsfunktion

## Funktionsweise