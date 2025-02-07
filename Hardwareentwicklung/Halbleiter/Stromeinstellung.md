---
tags:
  - Halbleiter/BJT
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
> ![](assets/{F2EEDB5A-E1B8-4012-B917-D3D2D968B286}.png)


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\draw node[npn](npn){} (0,0);
\draw (npn.E) -- ++(2,0) to[V, v<^=$U_0$] ++(0,4) -- ++(-2,0) coordinate(k1) to[R=$R_C$, *-] (npn.C);
\draw (k1) -- ++(-2,0) to[I, i=$I_{B,0}$] (-2,0 |- npn.B) -- (npn.B);
\end{circuitikz}
\end{document}
```

## Basisvorwiderstand

Eine simple Art dieses Prinzip zu realisieren ist mittels eines Basisvorwiderstandes.



![](assets/{95B107D5-DC3F-45C8-ABCE-0060B795A7D9}.png)


> [!warning] Vor und Nachteile
> ✅Kaum Abhängig von Temparaturschwankungen
> ❌Stark Abhängig von der $B$-Streuung (wegen konstantem $I_{B}$)

## Spannungsgsteuerte Stromgegenkopplung

 Durch Einbau einer Gegenkopplung kann der Arbeitspunkt stabilisiert werden. Hierbei wird das Kollektorpotential über einen Widerstand einen Basisstrom erzeugen, welcher sich bei Vergrößerung des Kollektorstromes und daher Absinken des Kollektorpotentials verringert. Es handelt sich dabei also um eine spannungsgesteuerte Stromgegenkopplung, oft fälschlicherweise Spannungsgegenkopplung genannt.


> [!success] Robustheit gegenüber der $B$-Streuung:
> 
>Da hier $I_{B}$ nicht mehr konstant in die Basis eingeprägt wird, wirkt diese Regelung auch gegen die $B$-Streuung.

![](assets/{91DF9C54-BF68-4756-9EA2-3DBE4D82F6E2}.png)

> [!warning] **Annahme:** Die Basis-Emitterspannung ist nahezu konstant.
> Steigt nun $I_{C,0}$ zur Folge einer Temparaturerhöhung, fällt am Kollektorwiderstand $R_{C}$ eine höhere Spannung ab.
> 
> Dadurch sinkt auch die Spannung am Basisvorwiderstand $R$ welches den Basisstrom verringert. Somit wird auch $I_{C}$ verringert.

---

# Related

[Spannungseinstellung](Spannungseinstellung.md)