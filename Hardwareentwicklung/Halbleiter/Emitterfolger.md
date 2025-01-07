---
tags:
  - Halbleiter/BJT
  - incomplete
aliases:
  - Kollektorschaltung
created: 21st November 2022
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
professor:
  - Bernhard Jakoby
---
 

# Emitterfolger / Kollektorschaltung

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1.5, font=\Large, transform shape]
% Begin Schematic

\draw (0,0) node[npn](npn){};
\draw (npn.C) node[vcc]{$U_0$};
\draw (npn.E) to[R, l_=$R_{E}$, *-] (0,-3) node[rground]{};
\draw (npn.E) to[C] ++(2,0) to[short, -o] ++(1,0) -- ++1,0


\end{circuitikz}
\end{document}
```

![](assets/Pasted%20image%2020241118013237.png)

> [!warning] Anders als bei der [Emitterschaltung](Kollektorfolger.md) gibt es **keine** Phasenverschiebung.


![Pasted image 20221121145313](../assets/1NoteEmittSCh.png)

## Eingangswiderstand

![Pasted image 20221121145330](../assets/1NoteKollSchRE.png)

## Kollektorschaltung Als Impedanzwandler

Eine Berechnung der Spannungsverstärkung liefert $\approx 1$. Jedoch ist hier die Stromverstärkung sehr hoch sodass auch hohe Lasten angesteuert werden können, ohne dass die Spannugsverstärkung sinkt. Diese Schaltung ist relevant als [Endstufe](BJT%20als%20Verstärker%20bzw%20Endstufe.md) für große Leistungen

![Pasted image 20221121145351](../assets/1NoteKollSchIW.png)

## Arbeitspunkt

$R_{E}$ ist fester Bestandteil der Kollektorschaltung, daher besitzt diese immer eine Stabilisierung durch Stromgesteuerte Spannungsgegenkopplung

> [!WARNING] Für stabilen Arbeitspunkt soll $U_{RE}>1V$

## Kleinsignalverhalten

![ksv_kollektorschaltung](../assets/ksv_kollektorschaltung.png)
