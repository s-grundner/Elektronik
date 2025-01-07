---
tags:
  - Halbleiter/BJT
aliases: 
created: 22. September 2023
---

# AB-Betrieb

Der AB-Betrieb wird bei Gegentakt-Endstufen verwendet, bei denen mit vorgeschalteter [Diode](Diode.md) eine Basisvorspannung erzeugt wird, welche auch bei Spannungen unter $0.7V$ leitend macht.  
Im AB-Betrieb werden kleine Signale wie im [A-Betrieb](A-Betrieb.md) und große Signale wie im [B-Betrieb](B-Betrieb.md) verstärkt.

> [!IMPORTANT] Der Gegentaktverstärker abreitet im AB-Betrieb besonders verzerrungsarm, aber mit schlechterem Wirkungsgrad als beim [B-Betrieb](B-Betrieb.md).

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\ctikzset{diodes/scale=0.6}
\usepackage{amsmath}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, font=\Large, transform shape]
\draw (0,1) node[npn](npn){};
\draw (0,-1) node[pnp](pnp){};
\draw (npn.C) -- ++(0,1) coordinate(v) node[vcc]{\small$U_0$};
\draw (pnp.C) -- ++(0,-1) coordinate(g) node[vee]{\small$-U_0$};
\draw (npn.E) -- (pnp.E);
\draw (npn.B) to[D-, *-*] (pnp.B) node[npn, anchor=C](npn2){};
\draw (npn2.E) |- (g) node[vee]{\small$-U_0$};
\draw (npn.B) to[R, l=$R_C$]

\end{circuitikz}
\end{document}
```