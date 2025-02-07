---
tags:
  - Halbleiter/BJT
  - tikz/circuitikz
aliases:
  - Spannungsgsteuerte Stromgegenkopplung
  - Basis-Vorwiderstand
  - Basisvorwiderstand
keywords:
  - Temparaturkompensation
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 21. September 2023
professor:
  - Bernhard Jakoby
  - Christian Diskus
---
 

# [BJT](Bipolartransistor.md): Stromeinstellung

> [!important] $I_{B}$ wird konstant in die Basis eingespeist um $I_{C}$ zu kontrollieren.

```tikz
\usepackage[european]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\draw node[npn](npn){} (0,0);
\draw (npn.E) -- ++(2,0) to[V, v_<=$U_0$] ++(0,4) -- ++(-2,0) coordinate(k1) to[R=$R_C$, i=$I_{\mathrm{C},0}$, *-] (npn.C);
\draw (k1) -- ++(-2,0) to[I, i=$I_{B,0}$] (-2,0 |- npn.B) -- (npn.B);
\draw (npn.B) to[open, v=$U_{\mathrm{BE},0}$] (npn.E);
\end{circuitikz}
\end{document}
```

## Basisvorwiderstand

Eine simple Art dieses Prinzip zu realisieren ist mittels eines Basisvorwiderstandes.

```tikz
\usepackage[european]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\draw node[npn](npn){} (0,0);
\draw (npn.C) to[R, l=$R_{\mathrm{C}}$, i_<=$I_{\mathrm{C},0}$] ++(0,2) node[vcc]{$U_0$};
\draw (npn.B) to[short, i^<=$I_{\mathrm{B},0}$] ++(-1, 0) -- ++(0,0 |- npn.C) to[R=$R$] ++(0,2) node[vcc]{$U_0$};
\draw (npn.B) to[open, v=$U_{\mathrm{BE},0}$] (npn.E) node[rground]{};
\end{circuitikz}
\end{document}
```


> [!warning] Vor und Nachteile
> ✅Kaum Abhängig von Temparaturschwankungen
> ❌Stark Abhängig von der $B$-Streuung (wegen konstantem $I_{B}$)

## Spannungsgsteuerte Stromgegenkopplung

 Durch Einbau einer Gegenkopplung kann der Arbeitspunkt stabilisiert werden. Hierbei wird das Kollektorpotential über einen Widerstand einen Basisstrom erzeugen, welcher sich bei Vergrößerung des Kollektorstromes und daher Absinken des Kollektorpotentials verringert. Es handelt sich dabei also um eine spannungsgesteuerte Stromgegenkopplung, oft fälschlicherweise Spannungsgegenkopplung genannt.


> [!success] Robustheit gegenüber der $B$-Streuung:
> 
>Da hier $I_{B}$ nicht mehr konstant in die Basis eingeprägt wird, wirkt diese Regelung auch gegen die $B$-Streuung.

```tikz
\usepackage[european]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\draw node[npn](npn){} (0,0);
\draw (npn.C) to[short, i<=$I_{\mathrm{C},0}$] ++(0,1) coordinate (k1);
\draw (npn.B) to[open, v=$U_{\mathrm{BE},0}$] (npn.E) node[rground]{};
\draw (k1) -- ++(-2,0) to[R, l_=$R$] (-2,0 |- npn.B) to[short, i=$I_{\mathrm{B},0}$] (npn.B);
\draw (k1) to[R, l_=$R_{\mathrm{C}}$, *-] ++(0,2) node[vcc]{$U_0$};
\end{circuitikz}
\end{document}
```


> [!warning] **Annahme:** Die Basis-Emitterspannung ist nahezu konstant.
> Steigt nun $I_{C,0}$ zur Folge einer Temparaturerhöhung, fällt am Kollektorwiderstand $R_{C}$ eine höhere Spannung ab.
> 
> Dadurch sinkt auch die Spannung am Basisvorwiderstand $R$ welches den Basisstrom verringert. Somit wird auch $I_{C}$ verringert.

---

# Related

[Spannungseinstellung](Spannungseinstellung.md)