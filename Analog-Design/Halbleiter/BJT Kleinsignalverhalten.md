---
tags:
  - tikz/circuitikz
aliases:
  - KSESB-BJT
keywords:
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18. November 2024
professor:
release: false
---
 

# Kleinsignalverhalten von BJT

> [!info] Kleinsignal Ersatzschaltbild (KSESB) eines Bipolartransistors
>

```tikz
\usepackage[european]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, font=\Large, transform shape]

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

**Linearisierung der Eingangskennlinie**

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}
\begin{document}
\newcommand{\IAP}{1.5}
\newcommand{\UAP}{3}
\newcommand{\DR}{1.5}

\begin{tikzpicture}[very thick, font=\LARGE]

\coordinate (AP) at (\UAP,\IAP);
\coordinate (BEZ1) at (\UAP-\IAP/\DR,0);
\coordinate (BEZ2) at (\UAP+1,\IAP+\DR);
\draw[->] (0,0) -- (5,0) node[right] {$U_{\mathrm{BE}}$};
\draw[->] (0,0) -- (0,7) node[above] {$I_{\mathrm{B}}$};
\draw (0,0) .. controls (1,0) and (BEZ1) ..
    (AP) .. controls (BEZ2) and (\UAP+1,5) ..
    (\UAP+1,7) node[above]{$U_{\mathrm{CE}}$ fix};
\draw (BEZ1) -- (BEZ2) -- (\UAP+1.5*1,\IAP+1.5*\DR);
\draw[dashed] (0,\IAP) node[left]{$I_{\mathrm{B,0}}$} --
    (AP) node[circle, fill=black, minimum size=1pt]{} -- 
    (\UAP,0) node[below]{$U_{\mathrm{BE,0}}$};
\draw (AP) node[anchor=north west]{$\Delta U_{\mathrm{BE}}$} -- (\UAP+1,\IAP) -- (\UAP+1,\IAP+\DR) node[anchor=north west]{$\Delta I_{\mathrm{B}}$};

\end{tikzpicture}
\end{document}
```

$$
\begin{aligned}
\left.\frac{\partial I_{\mathrm{B}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}}&=\frac{1}{r_{\mathrm{BE}}} \approx \frac{\Delta I_{\mathrm{B}}}{\Delta U_{\mathrm{BE}}}
\quad\implies\quad
r_{\mathrm{BE}} =\left.\frac{\partial U_{\mathrm{BE}}}{\partial I_{\mathrm{B}}}\right|_{\mathrm{AP}}
=\underbrace{\left.\frac{\partial U_{\mathrm{BE}}}{\partial I_{\mathrm{C}}}\right|_{\mathrm{AP}}}_{\frac{1}{S}} \cdot\underbrace{\left.\frac{\partial I_{\mathrm{C}}}{\partial I_{\mathrm{B}}}\right|_{\mathrm{AP}}}_{\approx B}
\end{aligned}
$$
**Linearisierung der Transferkennlinie**


```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}
\begin{document}
\newcommand{\IAP}{1.5}
\newcommand{\UAP}{3}
\newcommand{\DR}{1.5}

\begin{tikzpicture}[very thick, font=\LARGE]

\coordinate (AP) at (\UAP,\IAP);
\coordinate (BEZ1) at (\UAP-\IAP/\DR,0);
\coordinate (BEZ2) at (\UAP+1,\IAP+\DR);
\draw[->] (0,0) -- (5,0) node[right] {$U_{\mathrm{BE}}$};
\draw[->] (0,0) -- (0,7) node[above] {$I_{\mathrm{C}}$};
\draw (0,0) .. controls (1,0) and (BEZ1) ..
    (AP) .. controls (BEZ2) and (\UAP+1,5) ..
    (\UAP+1,7) node[above]{$U_{\mathrm{CE}}$ fix};
\draw (BEZ1) -- (BEZ2) -- (\UAP+1.5*1,\IAP+1.5*\DR);
\draw[dashed] (0,\IAP) node[left]{$I_{\mathrm{C,0}}$} --
    (AP) node[circle, fill=black, minimum size=1pt]{} -- 
    (\UAP,0) node[below]{$U_{\mathrm{BE,0}}$};
\draw (AP) node[anchor=north west]{$\Delta U_{\mathrm{BE}}$} -- (\UAP+1,\IAP) -- (\UAP+1,\IAP+\DR) node[anchor=north west]{$\Delta I_{\mathrm{C}}$};

\end{tikzpicture}
\end{document}
```

$$
\begin{aligned}
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{BE}}}\right|_{\mathrm{AP}}&=S \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{BE}}} 
=\frac{1}{U_{\mathrm{T}}} \underbrace{I_{\mathrm{S}} e^{\frac{U_{\mathrm{BE}, 0}}{U_{\mathrm{T}}}}}_{\approx I_{\mathrm{C}, 0}} \approx \frac{I_{\mathrm{C}, 0}}{U_{\mathrm{T}}} \\ \\ \\
\end{aligned}
$$

**Linearisierung der Ausgangskennlinie**

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}
\begin{document}
\newcommand{\IAP}{4}
\newcommand{\UAP}{3}
\newcommand{\DR}{.53}

\begin{tikzpicture}[very thick, font=\LARGE]
\coordinate (AP) at (\UAP,\IAP);
\coordinate (BEZ1) at (\UAP-\IAP/\DR,0);
\coordinate (BEZ2) at (\UAP+1,\IAP+\DR);
\draw[->] (-5,0) -- (5,0) node[right] {$U_{\mathrm{CE}}$};
\draw[->] (0,0) -- (0,7) node[above] {$I_{\mathrm{C}}$};
\draw (0,0) .. controls (0,2.5) .. (\UAP+1.5,\IAP+1.5*\DR);
\draw[dashed] (BEZ1) -- (BEZ2) -- (\UAP+1.5*1,\IAP+1.5*\DR);
\draw[dashed] (0,\IAP) node[left]{$I_{\mathrm{C,0}}$} --
    (AP) node[circle, fill=black, minimum size=1pt]{} -- 
    (\UAP,0) node[below]{$U_{\mathrm{CE,0}}$};
\draw (AP) node[anchor=north west]{$\Delta U_{\mathrm{CE}}$} -- (\UAP+1,\IAP) -- (\UAP+1,\IAP+\DR) node[anchor=north west]{$\Delta I_{\mathrm{C}}$};
\draw (BEZ1) node[anchor=north]{$-U_{EA}$} -- ++(0,0.4);

\end{tikzpicture}
\end{document}
```

$$
\begin{aligned}
\left.\frac{\partial I_{\mathrm{C}}}{\partial U_{\mathrm{CE}}}\right|_{\mathrm{AP}}&=g_{\mathrm{EA}} \approx \frac{\Delta I_{\mathrm{C}}}{\Delta U_{\mathrm{CE}}}
=\frac{I_{\mathrm{C}, 0}}{U_{\mathrm{CE}, 0}+U_{\mathrm{EA}}}
\end{aligned}
$$



> [!important] Diese Kleinsignal-Größen heißen:
> $$
> \begin{array}[b]{ccc}
> \boxed{ r_{\mathrm{BE}} \approx \frac{B}{S} }
> & \boxed{ S\approx \frac{I_{C,0}}{U_{T}} }
> & \boxed{ g_{\mathrm{EA}}= \frac{I_{C,0}}{U_{CE,0}+U_{EA}} }
> \end{array}
> $$
> $r_{B E}\dots$ Basis-Emitter-Kleinsignalwiderstand in $\Omega$
> $S\dots$ Steilheit in S (Siemens)
> $g_{E A}\dots$ Early-Leitwert in S
> 

Die Kleinsignal-Stromverstärkung $\beta=\frac{\partial I_C}{\partial I_B}$ ist wegen der fast linearen Stromsteuerkennlinie näherungsweise gleich der Gleichstromverstärkung $\beta \approx B$. In Datenblättern wird $B$ oft $h_{21}$ oder $h_{F E}$ genannt. Dabei bedeutet $h$ Element der Hybridmatrix, $F$ Betrieb in Vorwärtsrichtung (forward) und $E$ [Emitterschaltung](Emitterschaltung.md).

> [!important] Die Kleinsignalspannungen und -ströme werden im Folgenden klein geschrieben
> $$ \Delta U_{\mathrm{BE}}=u_{\mathrm{BE}}, \quad \Delta I_{\mathrm{B}}=i_{\mathrm{B}}, \quad \Delta U_{\mathrm{CE}}=u_{\mathrm{CE}}, \quad \Delta I_{\mathrm{C}}=i_{\mathrm{C}} $$

und werden durch folgende Zusammenhänge im KSESB miteinander verknüpft:

$$
\begin{gathered}
u_{\mathrm{BE}}=r_{\mathrm{BE}}\cdot i_{\mathrm{B}}  \\
i_{\mathrm{C}}' \approx S\cdot u_{\mathrm{BE}}=\beta \cdot i_{\mathrm{B}}, \quad i_{\mathrm{C}}''=g_{\mathrm{EA}} \cdot u_{\mathrm{CE}}, \quad i_{\mathrm{C}}=i_{\mathrm{C}}'+i_{\mathrm{C}}''  \\
i_{\mathrm{E}}=i_{\mathrm{B}}+i_{\mathrm{C}}
\end{gathered}
$$
