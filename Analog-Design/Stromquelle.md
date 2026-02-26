---
tags:
  - Baugruppe/Versorgung/Stromquelle
aliases:
keywords:
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 8. Januar 2025
professor:
release: false
---
 

# Stromquelle

Prinzip einer Stromquelle

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\begin{document}
\begin{circuitikz}[very thick, scale=2, transform shape]
\draw (0,0) to[I=$I_0$] (0,2) -- (1,2) to[R, l=$R_{i}$,*-*] (1,0) -- (0,0);
\draw (1,2) -- (2,2) to[short, o-, i=$I_a$] (3,2) to[R, l_=$R_{a}$, v^=$U_a$] (3,0) to[short, -o] (2,0) -- (1,0);
\end{circuitikz}
\end{document}
```

Stromquellen sollen möglichst unabhängig von der Last (d.h. unabhängig von der Spannung, die an der Last abfällt) einen konstanten Strom $I_a$ liefern. Dafür soll der Innenwiderstand der Stromquelle $R_i$ möglichst groß sein. (Idealfall: $R_i \to \infty$ )

## Bipolartransistor als Stromquelle

Bipolartransistoren sind aufgrund ihrer Charakteristik im Ausgangskennlinienfeld gut zur Realisierung einer (spannungs- bzw. stromgesteuerten) Stromquelle geeignet, da $I_C(U_{CE})$ rechts vom Sättigungsbereich annähernd unabhängig von $U_{\mathrm{CE}}$ ist.

```tikz
\usepackage{amsmath}
\begin{document}
\begin{tikzpicture}[very thick, scale=1.5,font=\Large]
\node[align=center, font=\LARGE, xshift=9cm] at (0,5) {Vergleich der BJT Kennlinie zu einer lin. Stromquelle};
\begin{scope}
\node[align=center] at (2.5,-0.5) {Bipolartransistor als Stromquelle};
\draw[->] (0,0) -- (5,0) node[right] {$U_{CE}$};
\draw[->] (0,0) -- (0,4) node[above] {$I_C$};
\draw[thick, color=red] (0,0.2) to[out=80,in=180] (0.5,0.5) -- (4,0.6) node[right, black]{$I_{B1}$};
\draw[thick, color=blue] (0,0.5) to[out=80,in=180] (1,1.2) -- (4,1.4) node[right, black]{$I_{B2}$};
\draw[thick, color=green] (0,0.8) to[out=80,in=180] (1,1.9) -- (4,2.2) node[right, black]{$I_{B3}$};
\draw[thick, color=orange] (0,1.1) to[out=80,in=185] (1,2.6) -- (4,3) node[right, black]{$I_{B4}$};
\draw[dashed] (0,0) to[out=40,in=-100] (1,3) node[align=left, anchor=south, text width=2cm]{Sättigungs-bereich};
\end{scope}
\begin{scope}[xshift=7cm]
\node[align=center] at (2.5,-0.5) {lineare Stromquelle};
\draw[->] (0,0) -- (5,0) node[right] {$U_{a}$};
\draw[->] (0,0) -- (0,4) node[above] {$I_a$};
\draw[thick, color=red] (0,3) -- (4,3) node[right, black]{$R_i\to\infty$};
\draw[thick, color=cyan] (0,3) -- (4,2) node[right, black]{$R_i$ endlich (real)};
\end{scope}
\end{tikzpicture}
\end{document}
```


Oder anders formuliert: Bipolartransistoren sind gut für die Realisierung einer laststabilen Stromquelle geeignet, da die Transferkennlinie nahezu unabhängig von $U_{\mathrm{CE}}$ ist. D.h. der zu treibende Strom kann unabhängig von der Last über die Spannung $U_{\mathrm{BE}}$ eingestellt werden.
Der Transistor selbst ist natürlich keine Quelle. Er entnimmt lediglich den von ihm bereitgestellten Strom einer Versorgungsquelle.

> [!error] Bei der Verwendung eines BJT als Stromquelle muss der **Early-Leitwert** des Transistors berücksichtigt werden.
> Dieser Bestimmt die Güte der Stromquelle, da er in den Ausgangswiderstand mit einfließt.
> Er kann durch dieses Modell mittels der Early-Spanung berücksichtigt werden
> $$I_{C}=I_{s} e^{\frac{U_{BE}}{n U_{T}}}\left(1+\frac{U_{CE}}{U_{EA}}\right)$$

### Stromspiegel

> [!success] Weiterführend: [Stromspiegel](Stromversorgungseinheiten/Stromspiegel.md)

### Transistorstromquellen mit stromgesteuerter Gegenkopplung

> [!question]- [Stromgesteuerte Spannungsgegenkopplung](Halbleiter/Spannungseinstellung.md#Stromgesteuerte%20Spannungsgegenkopplung)
> 
> ```tikz
> \usepackage[european, straightvoltages]{circuitikz}
> \ctikzset{bipoles/length=1cm}
> \ctikzset{transistors/scale=1.6}
> \usepackage{amsmath}
> \begin{document}
> \begin{circuitikz}[thick, scale=1.5, transform shape, font=\Large]
> \draw (0,0) node[npn](npn){};
> \draw (npn.B) to[short, i<=$I_{B}$] ++(-1, 0) coordinate(b);
> \draw (npn.C) to[R, l=$R_{L}$, v<=$U_{a}$, i<=$I_a$, o-o] ++(0, 2) coordinate(v) node[vcc]{$U_0$};
> \draw (npn.E) to[R, l_=$R_{E}$] ++(0, -2) coordinate(g) node[color=black, rground]{};
> \draw (b) to[open, v=$U_q'$,o-o] ++(g) node[rground]{};
> \draw (b) to[R=$R_{q}$] ++(-2,0) to[V, v_=$U_q$] ++(g) node[rground]{};
> \end{circuitikz}
> \end{document}
> ```
> 
>

#### Stromquellen für Diskrete Schaltungen

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\ctikzset{bipoles/length=1cm}
\ctikzset{transistors/scale=1.6}
\usepackage{amsmath}
\newcommand{\bjtSource}[1]{{
\draw (0,0) node[npn](npn){};
\draw (npn.B) to[short, i<_=$I_{B}$, -*] ++(-1, 0) coordinate(b);
\draw (npn.C) to[R, l=$R_{L}$, v<=$U_{a}$, i<=$I_a$, o-o] ++(0, 2) coordinate(v) node[vcc]{$U_0$};
\draw (npn.E) to[R, l_=$R_{E}$] ++(0, -2) coordinate(g) node[color=black, rground]{};
\draw (b) -- ++(npn.C) to[R=$R_{1}$] (b |- v) node[vcc]{$U_0$};
}}
\begin{document}
\begin{circuitikz}[thick, scale=1.6, transform shape, font=\Large]
\begin{scope}
\bjtSource{}
\draw (b) -- ++(npn.E) to[R, l_=$R_{2}$] (b |- g) node[rground]{};
\end{scope}
\begin{scope}[xshift=5cm]
\bjtSource{}
\draw (b) to[D-] ++(npn.E) to[R, l_=$R_{2}$] (b |- g) node[rground]{};
\end{scope}
\begin{scope}[xshift=10cm]
\bjtSource{}
\draw (b |- g) node[rground]{} to[zD-, mirror] (b |- npn.E) -- (b);
\end{scope}
\end{circuitikz}
\end{document}
```

| 1   | Stromgesteuerte Gegenkopplung<br>mit Basisspannungsteiler |                                                                            |
| --- | --------------------------------------------------------- | -------------------------------------------------------------------------- |
| 2   | Diode in Serie zu $R_{2}$                                 | Erhöhte Temperaturstabilität bis hin<br>zur totalen Temperaturkompensation |
| 3   | Zenerdiode statt $R_{2}$                                  | Robust gegen $U_0$ Schwankungen                                            |

---

## OPV als Stromquelle

> [!success] Weiterführend: [Konstantstromquelle](OPV/Konstantstromquelle.md)