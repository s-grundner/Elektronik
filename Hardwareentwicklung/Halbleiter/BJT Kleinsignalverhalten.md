---
tags:
  - tikz/circuitikz
aliases:
  - Kleinsignalverhalten
  - KSESB
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18. November 2024
professor:
---
 

# Kleinsignalverhalten von BJT

```tikz
\usepackage[european]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1.5]

% Begin Schematic

\draw (0,0) to[I, i_<=$S\cdot u_{BE}$] (0,2);
\draw (2,0) to[R, l=$g_{EA}$, i_<=$i_C''$] (2,2);
\draw (-2,0) to[R, l=$r_{BE}$] (-2,2);

\draw (0,2) to[short, i<=$i_C'$] (2,2);
\draw (2,0) to[short, -*] (0,0);
\draw (0,0) to[short] (-2,0);

\draw (-1, 0) to[short, *-o, i=$i_E$] (-1, -1);
\draw (-2,2) to[short, -o] (-4,2);
\draw (4,2) to[short, o-*, i_=$i_C$] (2,2);

\node[right] at (4, 2) {$C$};
\node[left] at (-4, 2) {$B$};
\node[below] at (-1, -1) {$E$};


% Voltage Arrows

\draw (4, 2) to[open, v^=$u_{CE}$, voltage/bump b=7] (-1, -1);
\draw (-4, 2) to[open, v=$u_{BE}$, voltage/bump b=5] (-1, -1);

\end{circuitikz}
\end{document}
```

Beim Kleinsignalverhalten von [BJT](Bipolartransistor.md) wird die Transistorgleichung am Arbeitspunkt linearisiert.


![](assets/Pasted%20image%2020241118024435.png)

$$
\begin{array}[b]{|c|c|c}
\text{Linearisierung der} &
\text{Linearisierung der} &
\text{Linearisierung des} &
\\
\text{Eingangskennlinie} &
\text{Transferkennlinie} &
\text{Ausgangskennlinienfelds} &
\\
\begin{aligned}
\left.\frac{\partial I_{\mathrm{B}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}}&=\frac{1}{r_{\mathrm{BE}}} \approx \frac{\Delta I_{\mathrm{B}}}{\Delta U_{\mathrm{BE}}}\\ \\
\Rightarrow r_{\mathrm{BE}} & =\left.\frac{\partial U_{\mathrm{BE}}}{\partial I_{\mathrm{B}}}\right|_{\mathrm{AP}} \\
& =\underbrace{\left.\frac{\partial U_{\mathrm{BE}}}{\partial I_{\mathrm{C}}}\right|_{\mathrm{AP}}}_{\frac{1}{S}} \cdot\underbrace{\left.\frac{\partial I_{\mathrm{C}}}{\partial I_{\mathrm{B}}}\right|_{\mathrm{AP}}}_{\approx B}
\end{aligned}
&
\begin{aligned}
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}}&=S \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{BE}}} \\ \\
&=\frac{1}{U_{\mathrm{T}}} \underbrace{I_{\mathrm{S}} e^{\frac{U_{\mathrm{BE}, 0}}{U_{\mathrm{T}}}}}_{\approx I_{\mathrm{C}, 0}} \approx \frac{I_{\mathrm{C}, 0}}{U_{\mathrm{T}}} \\ \\ \\
\end{aligned}
&
\begin{aligned}
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{CE}}}\right|_{\mathrm{AP}}&=g_{\mathrm{EA}} \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{CE}}} \\ \\
&=\frac{I_{\mathrm{C}, 0}}{U_{\mathrm{CE}, 0}+U_{\mathrm{EA}}} \\ \\ \\ \\
\end{aligned} \\ \\
\boxed{ r_{\mathrm{BE}} \approx \frac{B}{S} } & \boxed{ S\approx \frac{I_{C,0}}{U_{T}} } & \boxed{ g_{\mathrm{EA}}= \frac{I_{C,0}}{U_{CE,0}+U_{EA}} } 
\end{array}
$$


Diese Kleinsignal-Größen heißen:

$r_{B E}\dots$ Basis-Emitter-Kleinsignalwiderstand in $\Omega$
$S\dots$ Steilheit in S (Siemens)
$g_{E A}\dots$ Early-Leitwert in S

Die Kleinsignal-Stromverstärkung $\beta=\frac{\partial I_C}{\partial I_B}$ ist wegen der fast linearen Stromsteuerkennlinie näherungsweise gleich der Gleichstromverstärkung $\beta \approx B$. In Datenblättern wird $B$ oft $h_{21}$ oder $h_{F E}$ genannt. Dabei bedeutet $h$ Element der Hybridmatrix, $F$ Betrieb in Vorwärtsrichtung (forward) und E Emitterschaltung (eine der Grundschaltungen, wird später erklärt). Die Kleinsignalspannungen und -ströme werden im Folgenden klein geschrieben

$$
\Delta U_{\mathrm{BE}}=u_{\mathrm{BE}} \quad \Delta I_{\mathrm{B}}=i_{\mathrm{B}} \quad \Delta U_{\mathrm{CE}}=u_{\mathrm{CE}} \quad \Delta I_{\mathrm{C}}=i_{\mathrm{C}}
$$

und werden durch folgende Zusammenhänge im KSESB miteinander verknüpft:

$$
u_{\mathrm{BE}}=r_{\mathrm{BE}} i_{\mathrm{B}} \quad i_{\mathrm{C}}^{\prime} \approx S u_{\mathrm{BE}}=\beta i_{\mathrm{B}} \quad i_{\mathrm{C}}^{\prime \prime}=g_{\mathrm{EA}} u_{\mathrm{CE}} \quad i_{\mathrm{C}}=i_{\mathrm{C}}^{\prime}+i_{\mathrm{C}}^{\prime \prime} \quad i_{\mathrm{E}}=i_{\mathrm{B}}+i_{\mathrm{C}}
$$

## Praktische Bestimmung von KS-Parametern

> [!info] Die Kleinsignalparameter können entsprechend ihrer Definition als Steigung der Kennlinien im AP bestimmt werden.
> Glücklicherweise sind die Zusammenhänge beim BJT so einfach, dass die Parameter sehr viel einfacher aus dem **Kollektorstrom**, der $CE$-**Spannung** im AP und den üblichen Transistorkennwerten bestimmt werden können.

