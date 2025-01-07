---
tags:
  - Baugruppen/Leistung
  - Halbleiter/BJT
aliases: 
created: 21. September 2023
---

# Stromspiegel

> [!QUESTION] Mit einem Stromspiegel wird ein eingestellter [Strom](../../Elektrotechnik/elektrischer%20Strom.md) im Regelzweig auf den zweiten, geregelten Zweig *gespiegelt*, somit fließt durch diesen Zweig ein konstanter [Strom](../../Elektrotechnik/elektrischer%20Strom.md).
> Ein Stromspiegel ist eine stromgesteuerte Stromquelle

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=0.8cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\coordinate (v) at (0,4);
\coordinate (g) at (0,-1);
\coordinate (m) at (0,0);
\draw (-2,0) node[npn, xscale=-1](t1){};
\draw (2,0) node[npn](t2){};
\draw (t1.text) node[anchor=east]{$T_1$};
\draw (t2.text) node[anchor=west]{$T_2$};
\draw (t1.B) to[short, i<=$I_B$] (m) to[short, i=$I_B$] (t2.B);
\draw (t1.E) node[rground]{};
\draw (t2.E) node[rground]{};
\draw (t1.C) to[short,i<=$I_1-2\cdot I_B$, -*] ++(0,1) to[R, l=$R_1$] (v -| t1.C) node[vcc]{$U_B$};
\end{circuitikz}
\end{document}
```