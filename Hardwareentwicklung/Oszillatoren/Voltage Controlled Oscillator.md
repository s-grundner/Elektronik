---
tags:
  - Baugruppen/Oszillator
  - tikz/circuitikz
aliases:
  - VCO
subject:
  - hwe
source:
  - Siegbert Schrempf
created: 31st January 2023
---

# Voltage Controlled Oscillator (VCO)

Beim [LC-Oszillator](LC%20Oszillatoren.md) wird ein [Schwingkreis](../../Physik/Schwingkreise.md), bestehend aus einer [Induktivität](../../Elektrotechnik/Induktivitäten.md) und einer [Kapazität](../../Elektrotechnik/Kapazität.md) verwendet. Mittels Kapazitätsdioden, ist die Resonanzfrequenz durch eine Steuerspannung einstellbar.

> [!info] [Colpitts](Colpitts%20Oszillator.md)-Ostillator in [Emitterfolger](../Halbleiter/Emitterfolger.md)  
>

```tikz
\usepackage[european]{circuitikz}
\usepackage{amsmath}
\begin{document}

\begin{circuitikz}[thick]

\node[circ] at (5, 1) {};
\node[circ] at (8, 1) {};
\node[ocirc] at (0, 4) {};
\node[ocirc] at (0, 1) {};
\draw (12, 1) to[resistor, l={$R_E$}] (12, 4);
\draw (10, 1) to[capacitor, l={$C_4$}] (10, 4);
\draw (10, 4) to[capacitor, l={$C_3$}] (10, 7);
\node[tlground] at (10, 8) {};
\draw (5, 7) to[capacitor, l={$C_2$}] (8, 7);
\draw (12, 8) to[resistor, l={$R_C$}] (12, 10);

\draw (12, 7) node[npn](npn){};

\node[circ] at (10, 10) {};
\node[circ] at (10, 4) {};
\node[circ] at (10, 7) {};
\node[circ] at (12, 4) {};
\node[circ] at (10, 1) {};
\draw (0, 4) to[resistor, l={$R_{\text{in}}$}] (3, 4);
\draw (8, 1) to[resistor, l={$R_2$}] (8, 7);
\draw (5, 1) to[inductor, l={$L$}] (5, 7);
\draw (3, 4) to[stroke varcap, l={$D_1$}, invert] (3, 7);
\draw (3, 1) to[stroke varcap, l={$D_2$}] (3, 4);
\draw (10, 8) to[capacitor, l={$C_1$}] (10, 10);
\draw (8, 8) to[resistor, l={$R_1$}] (8, 10);
\node[circ] at (5, 7) {};
\node[circ] at (8, 7) {};
\node[circ] at (3, 4) {};
\draw (0, 1) to[voltage source, l={$U_{\text{ctrl}}$}] (0, 4);
\node[ocirc] at (14, 4) {};
\node[tlground] at (0, 0.75) {};
\node[tlground] at (8, 0.75) {};

\draw (8, 0.75) -- (8, 1);
\draw (0, 0.75) -- (0, 1);
\draw (3, 1) -- (5, 1) -- (8, 1) -- (12, 1);
\draw (10, 4) -| (12, 4) -- (14, 4);
\draw (12, 6.23) -- (12, 4);
\draw (8, 7) -- (10, 7);
\draw (10, 7) -- (11.16, 7);
\draw (8, 8) |- (8.25, 7);
\draw (5, 7) -| (3.25, 7) -| (3, 7);
\draw (8, 10) -- (10, 10);
\draw (10, 10) |- (12, 10);
\draw (12, 8) -- (12, 7.77);

\end{circuitikz}

\end{document}
```

# Tags

[Varicap](../Kapazitäts-Diode.md)  
[PLL](Phase%20Locked%20Loop.md)  
[DTO](Discrete%20Time%20Oscillator.md)
