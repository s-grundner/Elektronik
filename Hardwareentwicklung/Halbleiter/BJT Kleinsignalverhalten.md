---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18. November 2024
professor:
---
 
# Kleinsignalverhalten von BJT

## Kleinsignal Ersatzschaltbild


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
\draw (2, 6) to[R=$R_{C}$, v=$U_{E}$, i>^=$I_{C}$, -*] (2, 4);
\draw (2, 2) to[R=$R_{E}$, v=$U_{E}$, *-] (2, 0);

\draw (2, 2) -- (4, 2);
\draw (4, 2) to[C=$C_{E}$] (4, 0);

\draw (2, 4) to[C=$C_{A}$] (6, 4);
