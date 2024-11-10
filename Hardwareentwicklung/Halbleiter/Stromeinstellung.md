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

## Basisvorwiderstand

Eine simple Art dieses Prinzip zu realisieren ist mittels eines Basisvorwiderstandes.



![](assets/{95B107D5-DC3F-45C8-ABCE-0060B795A7D9}.png)


> [!warning] Vor und Nachteile
> ✅Kaum Abhängig von Temparaturschwankungen
> ❌Stark Abhängig von der $B$-Streuung (wegen konstantem $I_{B}$)

## Spannungsgsteuerte Stromgegenkopplung

> [!success] Robustheit gegenüber der $B$-Streuung:
> 
>Da hier $I_{B}$ nicht mehr konstant in die Basis eingeprägt wird, wirkt diese Regelung auch gegen die $B$-Streuung.

```tikz
\usepackage[european, straightvoltages]{circuitikz}

\begin{document}

\begin{circuitikz}[thick]

% Transistor (npn)
\draw (2,2) node[npn, anchor=E] (Q) {};

% Kollektorwiderstand R_C und Versorgungsspannung U_0
\draw (Q.C) to[R=$R_C$, v=$U_0$] (2,4) -- ++(0,0.5);

% Widerstand R an der Basis mit Strom I_{B,0}
\draw (Q.B) -- ++(-1,0) to[R=$R$, i<=$I_{B,0}$, *-*] ++(-1,1);

% Eingangsspannung U_{BE,0} an der Basis-Emitter-Strecke
\draw[<-] (Q.E) -- ++(-1,0) node[left] {$U_{BE,0}$};

% Ground (Erde) am Emitter
\draw (Q.E) -- ++(0,-1) node[ground] {};

% Kollektorstrom I_{C,0} als Beschriftung
\draw (Q.C) to[open, v^=$I_{C,0}$] ++(0,-1);

\end{circuitikz}

\end{document}
```

![](assets/{91DF9C54-BF68-4756-9EA2-3DBE4D82F6E2}.png)

> [!warning] **Annahme:** Die Basis-Emitterspannung ist nahezu konstant.
> Steigt nun $I_{C,0}$ zur Folge einer Temparaturerhöhung, fällt am Kollektorwiderstand $R_{C}$ eine höhere Spannung ab.
> 
> Dadurch sinkt auch die Spannung am Basisvorwiderstand $R$ welches den Basisstrom verringert. Somit wird auch $I_{C}$ verringert.

---

# Related

[Spannungseinstellung](Spannungseinstellung.md)