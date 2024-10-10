---
tags:
  - RF
aliases:
  - HF-Übertragungsleitung
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

## Geometrien von HF-Leitungen

### TEM-Moden

siehe: [Transversale EM-Welle](Transversale%20Elektromagnetische%20Welle.md)

> [!success] Nicht frequenzabhängig. Funktionieren für Alle frequenzen (auch DC) gleich


![invert_dark](assets/TEM-Moden.png)

### Andere Moden

HF-Leitungen höherer ordnung

> [!warning] Funktionieren nicht für alle Frequenzen gleich

![invert_dark](assets/nonTEM.png)

- Rectangular Waveguide (Rechteck Hohlleiter)
- [LWL](Lichtwellenleiter.md) - Dielektrischer Wellenleiter Licht Als EM-Welle durch nicht leitendes Dielektrikum
- Coplanarer Microstrip