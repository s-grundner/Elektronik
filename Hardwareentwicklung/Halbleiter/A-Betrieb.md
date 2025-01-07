---
tags:
  - Halbleiter/BJT
aliases: 
created: 22. September 2023
---

# A-Betrieb

Ein [Transistor-Verstärker](BJT%20als%20Verstärker%20bzw%20Endstufe.md) im A-Betrieb hat nur eine geringe Spitze-Spitze-Ausdehnung.  
Der Arbeitspunkt liegt in der Mitte der Kennlinie.  
Das wird durch die Aufteilung der Betriebsspannung bestimmt ($U_{B}= U_{C} + U_{CE}$).  
Dabei wird die Betriebsspannung zwischen Kollektorwiderstand und [Transistor]({MOC}%20Transistor.md) aufgeteilt.  
Auf diese Weise fällt die Hälfte der [Leistung](../../Elektrotechnik/elektrische%20Leistung.md), die vom Verstärker abgegeben wird, im Verstärker selbst ab und wird in Wärme umgesetzt.

> [!important] Aus diesem Grund eignet sich ein Verstärker im A-Betrieb nur als Kleinsignal oder als Vorverstärker

Alle Transistorverstärker mit primitiver Arbeitspunkteinstellung arbeiten im A-Betrieb.  

## Kollektorschaltung

Eine Eigenschaft der Kollektorschaltung ist, dass sie zwar eine Spannungsverstärkung von $\approx 1$ hat, jedoch eine hohe Stromverstärkung. Daher eignet sie sich als Endstufe für große Leistungen, da sie den Strom liefern kann ohne dass die Spannung einbricht. (Impedanzwandlung)


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{tikz}
\usepackage{amsmath}
\usetikzlibrary{arrows.meta}
\ctikzset{bipoles/length=0.8cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=2, transform shape]
% NPN

\draw (0,0) node[npn](npn){};
\draw (npn.C) node[vcc]{$U_0$};
\draw (npn.E) to[R, l_=$R_{E}$, *-] (0,-3) node[vee]{$-U_0$};
\draw (npn.E) -- ++(1,0) to[R, l_=$R_L$, v^=$U_a$, o-o] (1, -3) node[rground]{};
\draw (npn.E) -- ++(-1,0) coordinate(a);
\draw (npn.B) -- (a |- -1,0);
\draw[dashed, -Triangle] (a) -- ++(-1,0) node[font=\small, text width=3cm, align=center, below]{zum Gegenkopplungsnetzwerk (hochohmig)};
\draw[dashed, Triangle-] (a |- -1,0) -- ++(-1, 0) node[font=\small, text width=3cm, align=center, above]{vom Ausgange der Vorherigen Stufe};

\end{circuitikz}
\end{document}
```

> [!question] Leistungsumsetzung
$$\hat{U}_{a, \text { max }}=U_0 \frac{R_L}{R_E+R_L} \Rightarrow P_L=\frac{U_0^2}{2} \frac{R_L}{\left(R_E+R_L\right)^2}$$
Maximale Leistung bei $R_L=R_E$ ([Leistungsanpassung](../../Elektrotechnik/Leistungsanpassung.md)):
$$R_L=R_E \Rightarrow P_{L, \text{max}}=\frac{\hat{U}_{a, \text{max}}^2}{2 R_L}=\frac{U_0^2}{8 R_L}$$
$$P_{\text{ges}}=\underbrace{ P_{L} }_{ \text{Verbraucher} }+\underbrace{ P_{T} }_{ \text{Transistor} }+\underbrace{ P_{RE} }_{ \text{Emitterwiderstand} }$$
Das heißt dass die hälfte der maximalen Leistung an dem Verstärker selbst abfällt.

> [!info] Wirkungsgrad $\eta$:
> $$\eta=\frac{P_{L,\text{max}}}{P_{\text{ges}}}=\frac{1}{16}=6,25\%$$
> Der geringe Wirkungsgrad führt uns zum [B-Betrieb](B-Betrieb.md)
