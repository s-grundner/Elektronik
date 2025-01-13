---
tags:
  - Halbleiter/BJT
  - tikz/circuitikz
aliases: 
created: 22. September 2023
---

# AB-Betrieb

Der AB-Betrieb wird bei Gegentakt-Endstufen verwendet, bei denen mit vorgeschalteter [Diode](Diode.md) eine Basisvorspannung erzeugt wird, welche auch bei Spannungen unter $0.7V$ leitend macht.  
Im AB-Betrieb werden kleine Signale wie im [A-Betrieb](A-Betrieb.md) und große Signale wie im [B-Betrieb](B-Betrieb.md) verstärkt.

> [!IMPORTANT] Der Gegentaktverstärker abreitet im AB-Betrieb besonders verzerrungsarm, aber mit schlechterem Wirkungsgrad als beim [B-Betrieb](B-Betrieb.md).

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\ctikzset{bipoles/length=0.8cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\usepackage{amsmath}
\begin{document}
\centering
\begin{circuitikz}[thick, scale=1.5, font=\small, transform shape]
\draw (0,1) node[npn](npn){};
\draw (0,-1) node[pnp](pnp){};
\draw (npn.C) -- ++(0,1) coordinate(v) node[vcc]{$U_0$};
\draw (pnp.C) -- ++(0,-1) coordinate(g) node[vee]{$-U_0$};
\draw (npn.E) -- (pnp.E);
\draw (npn.B) -- ++(-0.5,0) coordinate(d) to[D-, *-*] (pnp.B -| d) node[npn, anchor=C](npn2){} -- (pnp.B);
\draw (npn2.E) -- (npn2.E |- g) node[vee]{$-U_0$};
\draw (d) to[R, l=$R_C$] (d |- v) node[vcc]{$U_0$};
\draw (0,0) to[short, *-*] ++(1,0) coordinate(a) -- ++(0,-5) coordinate(l);
\draw[dashed, -Triangle] (l) -- ++(-4,0) coordinate(in)
    node[text width=4cm, align=center, anchor=north west]{zum Gegenkopplungsnetzwerk (hochohmig)};
\draw (a) -- ++(1,0) to[R, l_=$R_L$, v^=$U_a$, o-o] ++(0,-3)node[rground]{};
\draw[dashed, Triangle-] (npn2.B) -- (npn2.B -| in)
    node[text width=3cm, align=right, left]{vom Ausgang der Vorherigen Stufe};
\end{circuitikz}
\begin{circuitikz}[thick, scale=1.5, font=\small, transform shape]
\draw (0,2) node[npn](npn){};
\draw (0,-2) node[pnp](pnp){};
\draw (npn.C) -- ++(0,1) coordinate(v) node[vcc]{$U_0$};
\draw (pnp.C) -- ++(0,-1) coordinate(g) node[vee]{$-U_0$};
\draw (npn.E) to[R, l=$R_E$] (0,0) to[R, l=$R_E$] (pnp.E);
\draw (npn.B) -- ++(-0.5,0) coordinate(d)
    to[D-, *-] ++(0,-4/3) to[D-] ++(0,-4/3) to[D-, -*] (pnp.B -| d) 
    node[npn, anchor=C](npn2){} -- (pnp.B);
\draw (npn2.E) -- (npn2.E |- g) node[vee]{$-U_0$};
\draw (d) to[R, l=$R_C$] (d |- v) node[vcc]{$U_0$};
\draw (0,0) to[short, *-*] ++(1,0) coordinate(a) -- ++(0,-5) coordinate(l);
\draw[dashed, -Triangle] (l) -- ++(-4,0) coordinate(in)
    node[text width=4cm, align=center, anchor=north west]{zum Gegenkopplungsnetzwerk (hochohmig)};
\draw (a) -- ++(1,0) to[R, l_=$R_L$, v^=$U_a$, o-o] ++(0,-3)node[rground]{};
\draw[dashed, Triangle-] (npn2.B) -- (npn2.B -| in)
    node[text width=3cm, align=right, left]{vom Ausgang der Vorherigen Stufe};
\end{circuitikz}
\end{document}
```