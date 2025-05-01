---
tags:
  - Baugruppe/Oszillator
  - tikz/circuitikz
aliases:
  - Colpitts
keywords: 
subject:
  - Einführung Elektronik
  - VL
semester: WS24
created: 4. September 2023
professor:
---


# Colpitts Oszillator

Besteht aus Emitter/Basis/Kollektor Schaltung mit einer Rückkopplung:

| Colpitts: [kapazitiv](../../Elektrotechnik/Kapazität.md) | Hartley: [induktiv](../../Elektrotechnik/Induktivität.md) | Meissner: transformatorisch                              |
| -------------------------------------------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| ![invert_dark\|300](assets/ColpittsKapazitiv.svg)        | ![invert_dark\|300](assets/HartleyInduktiv.svg)             | ![invert_dark\|200](assets/meissnerTransfomatorisch.svg) |

Häufigste Kombination: Colpitts Oszillator (mit kapazitiver Rückkopplung)  
Vorteil: 
- einfache [Kapazitäten](../../Elektrotechnik/Kapazität.md)
- nur eine [Induktivität](../../Elektrotechnik/Induktivität.md)  
Schwingt wenn die Schleifenverstärkung $=1$ und die Phasendrehung über die Schlefe $0\degree$ bzw. $k\cdot2\pi$ ist.

$$V_{ges}=1 \qquad \varphi = k\cdot2\pi \qquad k=0\dots n$$

## Schaltung

Ob die Schaltung als Kollektor, Basis oder Emitter schaltung bezeichnet wird, ist davon abhängig wo Ein- und Ausgang definiert ist.


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{transistors/scale=2}
\begin{document}

\begin{circuitikz}[thick, transform shape, font=\Large]
\coordinate (g) at (0,2);
\coordinate (v) at (0,10);

\draw (5, 6) node[npn](npn){};

\draw (npn.C) to[L={$L_{\text{RFC}}$}, *-] (npn.C |- v) node[vcc]{$U_0$};
\draw (npn.B) to[short, -*] ++(-0.5,0) coordinate(k1);
\draw (npn.C) -- ++(4,0) coordinate(k2) --
    ++(2,0) coordinate(k3) to[C, l=$C_{\text{out}}$]
    ++(2,0) coordinate(ua) to[open, v^=$U_{\text{out}}$, o-o]
    ($(ua)!0.5!(ua |- g)$) node[rground]{};

\draw (k1) -- (k1 |- npn.C) to[R, l=$R_1$] (k1 |- v) node[vcc]{$U_0$};
\draw (k1) -- (k1 |- npn.E) to[R, l_=$R_2$] (k1 |- g) node[rground]{};
\draw (npn.E) to[R, l_=$R_E$, *-] (npn.E |- g) node[rground]{};
\draw (npn.E) -- ++(2,0) coordinate(ce) to[C, l_=$C_E$] (ce |- g) node[rground]{};
\draw (k1) to[C, l_=$C_B$] ++(-2,0) -- ++(0,-5) coordinate(g2);

\draw (k2) to[L, l_=$L$, *-] (k2 |- g) |- (g2);
\draw (k3) to[C, l_=$C_1$, *-*]
    ($(k3)!0.5!(k3 |- g)$) coordinate(gc) to[C, l_=$C_2$]
    (k3 |- g) -- (k3 |- g2) to[short, -*] (k2 |- g2);
\draw (gc) -| ++(0.5,0) node[rground]{};

\end{circuitikz}
\end{document}
```

$$
\begin{gathered}
C_{r} = \frac{C_{1}\cdot C_{2}}{C_{1}+C_{2}} \\
f_{r} = \frac{1}{2\pi \cdot \sqrt{ L\cdot C_{r} }}
\end{gathered}
$$

### Herleitung

### Kapazitive 3-Punktschaltung

Ein Teil der [Schwingkreis](../../Physik/Schwingkreise.md) Spannung muss phasenrichtig rückgekoppelt werden.

![500](../assets/ColpittsCalc.png)  
![Pasted image 20221128104421](../assets/ColpittsCalc2.png)
