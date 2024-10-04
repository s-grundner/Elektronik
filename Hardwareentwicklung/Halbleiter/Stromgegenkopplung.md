---
tags:
  - Halbleiter/BJT
aliases: 
created: 21. September 2023
---

# Stromgegenkopplung

Die beste bzw. gebräuchlichste Variante der Temperaturstabilisierung des Arbeitspunktes ist die Stromgegenkopplung.

> [!WARNING] Die AP Einstellung eines Transistors ist ein Regeltechnisches Problem
> Wenn $I_{E}$ steigt, steigt $U_{BE}$ und $I_{C}$ wird begrenzt.

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}

\begin{circuitikz}[thick]

% Paths, nodes and wires:
\node[tlground] at (0, 0) {};
\node[tlground] at (2, 0) {};

\node[npn] at (2, 3) {};

\draw (0, 2) to[R, l^=$R_{2}$] (0, 0);
\draw (0, 6) to[R=$R_{1}$, i>^=$I_{q} + I_{B}$] (0, 4);
\draw (2, 6) to[R=$R_{C}$, v=$U_{E}$] (2, 4);
\draw (2, 2) to[R=$R_{E}$, v=$U_{E}$, color=red] (2, 0);

\node[vcc] at (0, 6) {$+12V$};
\node[vcc] at (2, 6) {$+12V$};

\draw (2, 4) -- (2, 3.75);
\draw (1.16, 3) -| (0, 4);
\draw (0, 2) -- (0, 3);
\draw (2, 2) -- (2, 2.23);

\end{circuitikz}
\end{document}
```

![](assets/Pasted%20image%2020230921213942.png)
