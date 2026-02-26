---
tags:
  - tikz/circuitikz
aliases:
  - Basis-Schaltung
keywords:
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18th November 2024
professor:
  - Bernhard Jakoby
release: false
---
 

# Basisschaltung

> [!quote] Bei der Basisschaltung ist die Basis der gemeinsame Bezugspunkt von Ein- und Ausgang. 


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, font=\LARGE, scale=1.5]
% Begin Schematic

\draw (0, 0) node[npn](npn){};

\draw (npn.B) to[short, i_<=$I_B$] (-6, 0);

\draw (-6, 0) to[short, *-] (-7, 0) to[C, l_=$C_B$] (-7, -3) node[rground]{};
\draw (-6, 0) to[R, l_=$R_2$] (-6, -3) node[rground]{};
\draw (-6, 0) to[R, l=$R_1$] (-6, 3) node[vcc]{$U_0$};

\draw (npn.E) to[short] (0, -1)
    to[C, l_=$C_{e}$, *-o] (-2, -1)
    to[R, l_=$R_i$] (-4,-1)
    to[V, l_=$U_{g}$] (-4,-3) node[rground]{};

\draw[color=red] (-2, -1) to[open, v=$u_e$] (-2, -2.5);
\draw (-2, -2.5) to[short, o-] (-2, -3) node[rground]{};

\draw (npn.C) to[short] (0, 1)
    to[C, l=$C_a$, *-o] (2, 1)
    to[short] (3, 1)
    to[R, l_=$R_L$] (3, -3) node[rground]{};

\draw[color=red] (2, 1) to[open, v=$u_a$] (2, -2.5);
\draw (2, -2.5) to[short, o-] (2, -3) node[rground]{};

\draw (0,-1) to[R, l_=$R_{E}$] (0, -3) node[rground]{};
\draw (0, 1) to[R, l=$R_{C}$, i<=$I_C$] (0, 3) node[vcc]{$U_0$};

\end{circuitikz}
\end{document}
```

$$
\equiv
$$
```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, font=\LARGE, scale=1.5]
% Begin Schematic

\draw (0, 1) node[npn, xscale=-1, rotate=90](npn){};

\draw (npn.B) to[short, i<=$I_B$, -*] (0, -1) to[R, l=$R_2$] (0, -3) node[rground]{};
\draw (0, -1) to[short](-1, -1) to[C, l_=$C_B$] (-1, -3) node[rground]{};
\draw (0, -1) to[R, l=$R_1$, -*] (2, -1) to[R, l=$R_C$, i=$I_C$] (2, 1);
\draw (2, -1) to[short]
    (3, -1) to[short]
    (3, -0.75) node[vcc]{$U_0$};

\draw (npn.C) to[short]
    (2, 1) to[C, l=$C_a$, *-o]
    (4, 1) to[short]
    (5, 1) to[R, l=$R_L$]
    (5, -3) node[rground]{};

\draw[color=red] (4, 1) to[open, v=$u_a$] (4, -2.5);
\draw (4, -2.5) to[short, o-] (4, -3) node[rground]{};

\draw (npn.E) to[short]
    (-2, 1) to[C, l_=$C_e$, *-o]
    (-4, 1) to[R, l_=$R_i$]
    (-6, 1) to[V, v_=$U_g$]
    (-6, -3) node[rground]{};

\draw (-2, 1) to[R, l=$R_E$] (-2, -3) node[rground]{};
\draw[color=red] (-4, 1) to[open, v=$u_e$] (-4, -2.5);
\draw (-4, -2.5) to[short, o-] (-4, -3) node[rground]{};



\end{circuitikz}
\end{document}
```

