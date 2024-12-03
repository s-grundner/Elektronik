---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18th November 2024
professor:
---
 
# Basisschaltung

> [!quote] Bei der Basisschaltung ist die Basis der gemeinsame Bezugspunkt von Ein- und Ausgang. 


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick]
% Begin Schematic

\draw (0, 0) node[npn](npn){};
\draw (npn.E) to[C=$C_{E}$, -o] (-2,-1)
    to[R=$R_i$] (-4,-1) to[V=$U_{in}$] (-4,-3) node[tlground]{};
\draw (npn.E) to[R=$R_{E}$] (0, -3) node[tlground]{};

\end{circuitikz}
\end{document}
```

![](assets/Pasted%20image%2020241118041331.png)
$$
\equiv
$$
![](assets/Pasted%20image%2020241118042259.png)

