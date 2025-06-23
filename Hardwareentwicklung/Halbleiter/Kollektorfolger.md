---
tags:
  - Baugruppe/Verstärker
  - Halbleiter/BJT
  - tikz/circuitikz
aliases:
  - Emitterschaltung
subject:
  - Einführung Elektronik
  - VL
created: 21st November 2022
semester: WS24
professor:
  - Christian Diskus
  - Bernhard Jakoby
---

# Kollektorfolger / Emitterschaltung

> [!info] Auch **Emitterschaltung** genannt,
> da der gemeinsame Bezugspunkt von Einund Ausgang der Emitter ist.

> [!quote] Die Emitterschaltung bewirkt eine Gleichstromgesteuerte [Spannungsgegenkopplung](Spannungseinstellung.md)
> Die Parallelkapazität $C_{\mathrm{E}}$ am Emitterwiderstand $R_{\mathrm{E}}$ bewirkt eine frequenzabhängige Gegenkopplung, die nur für Gleichgrößen und Frequenzen unterhalb der kleinsten interessierenden Signalfrequenz wirkt und für höhere Frequenzen teilweise (oder sogar komplett) unwirksam ist.
> 
> $C_{\mathrm{E}}$ bewirkt mit zunehmender Frequenz einen Kurzschluss von $R_{\mathrm{E}}$ und hebt damit die Gegenkopplung für höhere Frequenzen auf. Dies bewirkt eine Erhöhung der Verstärkung und einen größeren Aussteuerbereich.


![](assets/Pasted%20image%2020241111093628.png)

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}

\begin{circuitikz}[thick]

% Paths, nodes and wires:
\node[tlground] at (0, 0) {};
\node[tlground] at (2, 0) {};
\node[tlground] at (-4, 0) {};
\node[tlground] at (4, 0) {};
\node[tlground] at (6, 0) {};

\node[npn] at (2, 3) {};

\draw (-4, 0) to[sV, v<=$U_{\text{in}}$] (-4, 3);
\draw (-2, 3) to[C, l^=$C_{i}$, -*] (0, 3);
\draw (-4, 3) to[R, l^=$R_{i}$] (-2, 3);)

\draw (0, 2) to[R, l^=$R_{2}$] (0, 0);
\draw (0, 6) to[R=$R_{1}$, i>^=$I_{q} + I_{B}$] (0, 4);
\draw (2, 6) to[R=$R_{C}$, v=$U_{E}$, i>^=$I_{C}$, -*] (2, 4);
\draw (2, 2) to[R=$R_{E}$, v=$U_{E}$, *-] (2, 0);

\draw (2, 2) -- (4, 2);
\draw (4, 2) to[C=$C_{E}$] (4, 0);

\draw (2, 4) to[C=$C_{A}$] (6, 4);
\draw (6, 4) to[R=$R_{L}$] (6, 0);

\node[vcc] at (0, 6) {$U_0$};
\node[vcc] at (2, 6) {$U_0$};

\draw (2, 4) -- (2, 3.75);
\draw (1.16, 3) -| (0, 4);
\draw (0, 2) -- (0, 3);
\draw (2, 2) -- (2, 2.23);

\end{circuitikz}
\end{document}
```

## Kleinsignal Ersatzschaltbild

> [!question] [Kleinsignalverhalten](BJT%20Kleinsignalverhalten.md)

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick]
% Begin Schematic





\end{circuitikz}
\end{document}
```

# Quellen

[Elektronik Kompendium](https://www.elektronik-kompendium.de/sites/slt/0204302.htm)