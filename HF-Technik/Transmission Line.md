---
tags:
  - RF
  - tikz/circuitikz
aliases:
  - HF-Übertragungsleitung
  - Leitungstheorie
  - Leitermodell
keywords: 
subject:
  - KV
  - HF-Systemtechnik 1
  - EMV und SI
  - VL
semester: WS24
created: 4. Oktober 2024
professor:
  - Reinhard Feger
---
 

# Transmission Line (TL)

> [!important] Eine Leitung wird als TL behandelt wenn das Signal auf dieser Leitung als ein [RF-Signal](RF-Signal.md) klassifiziert wird.

Hier kann die Verbindung zwischen Toren/Komponenten nicht mehr Vernachlässigt werden und wird in der Schaltung mit modelliert:

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=2]
	% Paths, nodes and wires:
	\draw (3, 5) to[sinusoidal voltage source, l={$V_{\text{in}}(t)$}] (3, 7);
	\node[ocirc] at (4, 7) {};
	\node[ocirc] at (4, 5) {};
	\node[ocirc] at (8, 7) {};
	\node[ocirc] at (8, 5) {};
	\draw (9, 5) to[american resistor, l={$R_{\text{load}}$}] (9, 7);
	\draw (4, 7) to[mstline] (8, 7);
	\draw (4, 5) to[mstline] (8, 5);
	\node[ground] at (3, 5) {};
	\draw (3, 7) -- (4, 7);
	\draw (3, 5) -- (4, 5);
	\draw (8, 7) -- (9, 7);
	\draw (8, 5) -- (9, 5);
	\draw (9, 5) to[american resistor, l={$R_{\text{load}}$}] (9, 7);
	\draw (4, 7) to[mstline] (8, 7);
	\draw (4, 5) to[mstline] (8, 5);
	\draw (3, 7) -- (4, 7);
	\draw (3, 5) -- (4, 5);
	\draw (8, 7) -- (9, 7);
	\draw (8, 5) -- (9, 5);

\end{circuitikz}
\end{document}
```


Eine TL ist elektrisch kurz: ${ l > \dfrac{\lambda}{10} }$

Eine TL wird mit serien induktivitäten und parallel kapazitäten modelliert (Leitermodell)

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick]
	% Paths, nodes and wires:
	\draw (6, 5) to[C, v^=$V(z.\, t)$] (6, 2);
	\draw (8, 5) to[L] (11, 5);
	\draw (11, 5) to[C, v^=$V(z+\Delta z.\, t)$] (11, 2);
	\draw (15, 5) to[L] (18, 5);
	\draw (18, 2) to[C] (18, 5);
	\node[ground] at (4, 2) {};
	\draw (3, 5) to[L] (6, 5);
	\node[circ] at (6, 5) {};
	\node[circ] at (11, 5) {};
	\node[circ] at (18, 5) {};
	\node[circ] at (18, 2) {};
	\node[circ] at (11, 2) {};
	\node[circ] at (6, 2) {};
	\node[circ] at (4, 2) {};
	\node[ocirc] at (3, 5) {};
	\node[ocirc] at (3, 2) {};
	\node[ocirc] at (19, 5) {};
	\node[ocirc] at (19, 2) {};
	\draw (3, 2) -- (4, 2);
	\draw (4, 2) -- (6, 2) -- (10.75, 2) -- (18, 2) -- (19, 2);
	\draw (19, 5) -- (18, 5);
	\draw (11, 5) to[short, i>^=$I(z+\Delta z.\, t)$] (15, 5);
	\draw (6, 5) to[short, i>^=$I(z.\, t)$] (8, 5);
	\draw[dashed] (8, 6) -- (8, 1);
	\draw[dashed] (15, 6) -- (15, 1);
	\draw (8.2, 1) node[label={$z$}] {};
	\draw (15.6, 1) node[label={$z+\Delta z$}] {};
\end{circuitikz}
\end{document}
```

## TL in LTSpice

T. Lossless Transmission Line

Symbol Name: `TLINE`
Syntax: `Txxx L+ L- R+ R- Zo=<value> Td=<value>`
$L+$ and $L-$ are the nodes at one port.
$R+$ and $R-$ are the nodes for the other port.
Zo is the characteristic impedance.
The length of the line is given by the propagation delay Td.

In diesem Zusammenhang wird das propagation delay $\operatorname{Td}\left(t_d\right.$ oder $t_p$ ) als die Zeit definiert, die ein Signal benötigt sich auf einer Transmission Line eine Länge I auszubreiten (vgl. „ähnliche" Definition von propagtion delay $\mathrm{t}_{\mathrm{pLH}}, \mathrm{t}_{\mathrm{pHL}}$ bei Digital Schaltungen/Gattern).