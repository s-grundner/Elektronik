---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18th November 2024
professor:
---
 
# Basisschaltung

> [!quote] Bei der Basisschaltung ist die Basis der gemeinsame Bezugspunkt von Ein- und Ausgang. 


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, font=\Large, scale=1.5]
% Begin Schematic

\draw (0, 0) node[npn](npn){};

\draw (npn.B) to[short, i_<=$I_B$] (-6, 0);

\draw (-6, 0) to[short, *-] (-7, 0) to[C, l_=$C_B$] (-7, -3) node[tlground]{};
\draw (-6, 0) to[R, l_=$R_2$] (-6, -3) node[tlground]{};
\draw (-6, 0) to[R, l=$R_1$] (-6, 3) node[vcc]{$U_0$};

\draw (npn.E) to[short] (0, -1)
    to[C, l_=$C_{e}$, *-o] (-2, -1)
    to[R, l_=$R_i$] (-4,-1)
    to[V, l_=$U_{g}$] (-4,-3) node[tlground]{};

\draw (-2, -1) to[open, v=$u_e$, color=red] (-2, -2.5) to[short, o-] (-2, -3) node[tlground]{};

\draw (npn.C) to[short] (0, 1)
    to[C, l=$C_a$, *-o] (2, 1)
    to[short] (3, 1)
    to[R, l_=$R_L$] (3, -3) node[tlground]{};

\draw (2, 1) to[open, v=$u_a$, color=red] (2, -2) to[short, o-] (2, -3) node[tlground]{};

\draw (0,-1) to[R, l_=$R_{E}$] (0, -3) node[tlground]{};
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

\begin{document}
\begin{circuitikz}[thick]
% Begin Schematic

\draw (0, 0) node[npn, invert, rotate=90](npn){};



\end{circuitikz}
\end{document}
```
![](assets/Pasted%20image%2020241118042259.png)

