---
tags:
  - RF
aliases:
  - HF-Übertragungsleitung
  - Leitungstheorie
  - Leitermodell
keywords: 
subject:
  - KV
  - HF-Systemtechnik 1
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
\begin{circuitikz}[thick]
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
	\draw (6, 5) to[C, v^=$V(z\, t)$] (6, 2);
	\draw (8, 5) to[L] (11, 5);
	\draw (11, 2) to[C] (11, 5);
	\draw (13, 5) to[L] (16, 5);
	\draw (16, 2) to[C] (16, 5);
	\node[ground] at (4, 2) {};
	\draw (3, 5) to[european inductor] (6, 5);
	\node[circ] at (6, 5) {};
	\node[circ] at (11, 5) {};
	\node[circ] at (16, 5) {};
	\node[circ] at (16, 2) {};
	\node[circ] at (11, 2) {};
	\node[circ] at (6, 2) {};
	\node[circ] at (4, 2) {};
	\node[ocirc] at (3, 5) {};
	\node[ocirc] at (3, 2) {};
	\node[ocirc] at (17, 5) {};
	\node[ocirc] at (17, 2) {};
	\draw (3, 2) -- (4, 2);
	\draw (4, 2) -- (6, 2) -- (10.75, 2) -- (16, 2) -- (17, 2);
	\draw (17, 5) -- (16, 5);
	\draw (13, 5) -- (11, 5);
	\draw (8, 5) -- (6, 5);
	\draw[dashed] (8, 6) -- (8, 1);
	\draw[dashed] (13, 6) -- (13, 1);

\end{circuitikz}
\end{document}
```