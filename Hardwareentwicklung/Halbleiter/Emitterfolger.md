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
\draw (npn.C) to[short, i<=$I_C$] ++(0,2) coordinate(v) node[vcc]{$U_0$};
\draw (npn.E) to[R, l_=$R_{E}$, *-] (0,-3) coordinate(g) node[rground]{};
\draw (npn.E) to[C, l=$C_a$] ++(2,0) coordinate(a) -- ++(1,0) to[R, l=$R_L$] (g -| 3,0) node[rground]{};
\draw (a) to[open, v=$u_a$, o-o] (g -| 2,0) node[rground]{};
\draw (npn.B) to[short, i_<=$I_B$] ++(-1,0) coordinate(b) to[R, l_=$R_2$] ++(g -| 0,0) node[rground]{};
\draw (b) to[R, l=$R_1$] ++(v -| 0, 0) node[vcc]{$U_0$};
\draw (b) to[C, l_=$C_e$, *-] ++(-2,0) coordinate(c) to[R, l_=$R_i$] ++(-2,0) to[V, v_=$U_g$] ++(g -| 0,0) node[rground]{};
\draw (c) to[open, v=$u_e$, o-o] ++(g -| 0,0) node[rground]{};
\draw (npn.B |- 0,-0.3) to[open, v=$U_{BE}$, font=\small] (npn.E);

\end{circuitikz}
\end{document}
```


> [!warning] Anders als bei der [Emitterschaltung](Kollektorfolger.md) gibt es **keine** Phasenverschiebung.

## Arbeitspunkt

$R_{E}$ ist fester Bestandteil der Kollektorschaltung, daher besitzt diese immer eine Stabilisierung durch [Stromgesteuerte Spannungsgegenkopplung](Spannungseinstellung.md#Stromgesteuerte%20Spannungsgegenkopplung)

> [!WARNING] Für stabilen Arbeitspunkt soll $U_{RE}>1V$

## Kleinsignalverhalten

![ksv_kollektorschaltung](../assets/ksv_kollektorschaltung.png)

## Betriebsparameter

> [!question] [Betriebsparameter](Betriebsparameter.md)
> - Eingangswiderstand $r_e$
> - Ausgangswiderstand $r_a$
> - Leerlaufspannungsverstärkung $A_0$ 

![Pasted image 20221121145330](../assets/1NoteKollSchRE.png)

### Kollektorschaltung Als Impedanzwandler

Eine Berechnung der Spannungsverstärkung liefert $\approx 1$. Jedoch ist hier die Stromverstärkung sehr hoch sodass auch hohe Lasten angesteuert werden können, ohne dass die Spannugsverstärkung sinkt. Diese Schaltung ist relevant als [Endstufe](BJT%20als%20Verstärker%20bzw%20Endstufe.md) für große Leistungen

