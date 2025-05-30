---
tags:
  - Halbleiter/BJT
  - tikz/circuitikz
aliases:
  - Stromgesteuerte Spannungsgegenkopplung
  - Basis-Spannungsteiler
  - Basisspannungsteiler
keywords:
  - $\Delta B$ Stabil
  - $\Delta T$ empfindlich
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 9. November 2024
professor:
---
 

# [BJT](Bipolartransistor.md) Spannungseinstellung

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[very thick, scale=2, transform shape]
\coordinate (g) at (0, -2);
\coordinate (v) at (0, 2.5);
\draw (0,0) node[npn](npn){};
\draw (npn.C) to[R=$R_C$] (npn.C |- v) -- ++(2,0) coordinate(v0) to[V_=$U_0$] (g -| v0) node[rground]{};
\draw (0,-0.5) to[short] (0,-2) node[rground]{};
\draw (npn.B) -- ++(-1,0) coordinate(vbe) to[V_=$U_{\mathrm{BE,0}}$] (g -| vbe) node[rground]{};

\end{circuitikz}
\end{document}
```

## Basis-Spannungsteiler


> [!warning] Spannungseinstellung: Transistor mit Basisspannungsteiler
> $U_{BE}$ ist *Konstant* (Muss daher genau dem DB entnommen werden. Annahme $\approx 0.7 V$ unzulässig)
> - Instabil gegenüber ungenaue Dimensionierung: Spannung muss **genauest möglich** stimmen
>  


Da $I_{B,0}$ sehr viel kleiner als $I_{2}$ (Dimensionieren, sodass $I_{2}=100\cdot I_{B,0}$) ist, lässt sich die Spannung am $R_{2}$ so dimensionieren, dass der Spannungsteiler von $U_{0}$ gleich $U_{BE}$ ist.

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[very thick, scale=1.5, transform shape]
\coordinate (g) at (0, -2);
\coordinate (v) at (0, 2.5);
\draw (0,0) node[npn](npn){};
\draw (npn.C) to[R=$R_C$, i<=$I_{C,0}$] (npn.C |- v)node[vcc]{$U_0$};
\draw (npn.B |- 0,-0.3) to[open, v=$U_{BE,0}$] (npn.E);
\draw (npn.B) to[short, i<=$I_{B,0}$, -*] ++(-1,0) coordinate(k1);
\draw (npn.E) to[short] (npn.E |- g) node[rground]{};
\draw (k1) to[R, l=$R_1$] (v -| k1) node[vcc]{$U_0$};
\draw (k1) to[R, l_=$R_2$, i=$I_2$] (g -| k1) node[rground]{};
\end{circuitikz}
\end{document}
```

> [!warning] Vor und Nachteile
> - ✅Unempfindlich gegenüber Verstärkungsabweichungen 
> - ❌Temparatur instabil 

> [!info] Warum wird $I_{2}$ so groß ($\cdot 100$) gewählt?
> - **Vorteil**: Vom Spannungsteiler gelieferte Spannung ist stabiler: Variierender Basisstrom hat weniger einfluss auf die Spannung $U_{BE}$
> - **Nachteil**: Spannungsteiler belastet den Generator. (höherer Strom)

## Stromgesteuerte Spannungsgegenkopplung

Durch Einbau einer Gegenkopplung kann der Arbeitspunkt stabilisiert werden. Eine Möglichkeit ist die stromgesteuerte Spannungsgegenkopplung. Dabei wird über einen Emitterwiderstand ein Spannungsabfall proportional zum Kollektorstrom erzeugt, welcher in der Eingangsmasche die Steuerspannung $U_{BE}$ reduziert.

> [!success] Lösung zur Temparaturempfindlichkeit

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\ctikzset{bipoles/length=1cm}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.3, transform shape]
\begin{scope}
\draw (0,0) node[npn](npn){};
\draw (npn.B) to[short, i<=$I_{B}$, -*] ++(-1, 0) coordinate(b);
\draw (npn.C) to[R, l_=$R_{C}$] ++(0, 2) coordinate(v) node[vcc]{$U_0$};
\draw[green] (npn.E) to[R, l_=$R_{E}$, v^=$U_{RE}$, color=green, *-*] ++(0, -2) coordinate(g) node[color=black, rground]{};
\draw (b) to[R, l_=$R_{2}$, -|] ++(g) node[rground]{};
\draw (b) to[R=$R_{1}$, i<=$I_{q}$, -|] ++(v) node[vcc]{$U_0$};
\end{scope}
\begin{scope}[xshift=-5cm]
\draw (0,0) node[npn](npn){};
\draw (npn.B) to[short, i<=$I_{B}$] ++(-1, 0) coordinate(b);
\draw (npn.C) to[R, l_=$R_{C}$] ++(0, 2) coordinate(v) node[vcc]{$U_0$};
\draw[green] (npn.E) to[R, l_=$R_{E}$, v^=$U_{RE}$, color=green, *-*] ++(0, -2) coordinate(g) node[color=black, rground]{};
\draw (b) to[open, v=$U_q'$,o-o] ++(g) node[rground]{};
\draw (b) to[R=$R_{q}$] ++(-2,0) to[V, v_=$U_q$] ++(g) node[rground]{};
\end{scope}
\end{circuitikz}
\end{document}
```

> [!info] Gegenkopplungs Funktionsprinzip
> > [!warning] **Annahme:** Die Spannung am Widerstand $R_{2}$ ist nahezu konstant
> 
> Steigt nun $I_{C,0}$ (also auch $I_{E}$) zufolge einer Temparaturerhöhung, fällt am Emitterwiderstand $R_{E}$ eine *höhere* Spannung ab. Demzufolge sinkt $U_{BE,0}$, was der $I_{C}$-Zunahme entgegenwirkt.
> 
> Der **Strom** $I_{E}$ steuert die Gegenkopplung der **Spannung** $U_{BE}$.

> [!error] ❌**Nachteil**: Die Gegenkopplung wirkt sich auch auf die Verstärkung aus.
> > [! success] Lösung dazu ist die [Emitterschaltung](Kollektorfolger.md)

---

# Related

[Stromeinstellung](Stromeinstellung.md)