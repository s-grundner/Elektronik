---
tags:
  - tikz/circuitikz
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 7. Januar 2025
professor:
---
 

# Differenzverstärker

Ein Differenzverstärker ist ein Verstärker, der die Differenz zweier Eingangssignale verstärkt. 

Die Schaltung wird mit zwei Emitterschaltungen (Kollektorfolgern), deren Emitter gemeinsam an eine Stromquelle angeschlossen sind realisiert.

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[very thick, transform shape, scale=1.5, font=\large]
\draw (-1,0) node[npn](npnLeft){};
\draw (1,0) node[npn, xscale=-1](npnRight){};
\draw (npnLeft.text) node[right]{$T_1$};
\draw (npnRight.text) node[left]{$T_2$};
\draw (npnLeft.C) to[short, i<=$I_{C1}$] ++(0,0.5) coordinate(cLeft) to[R, l=$R_C$, *-] ++(0,1) coordinate(v) node[vcc]{$U_0$};
\draw (npnRight.C) to[short, i<_=$I_{C2}$] ++(0,0.5) coordinate(cRight) to[R, l_=$R_C$, *-] ++(0,1) node[vcc]{$U_0$};
\draw (npnLeft.E) to[short, i=$I_{E1}$] (npnLeft.E -| 0,0) coordinate(e) to[short, i<=$I_{E2}$] (npnRight.E);
\draw (e) to[short, *-o] ++(0,-0.5) coordinate (iin) -- ++(0.5,0) to[R,l=$R_i$] ++(0,-2) -- ++(-0.5,0) to[short, o-] ++(0,-0.5) node[vee]{$-U_0$};
\draw (iin) -- ++(-0.5, 0) to[I, i=$ $, l_=$I_0$] ++(0,-2) -- ++(0.5,0);
\draw (npnLeft.B) to[open, v^=$U_{e1}$, o-o] ++(0,-2) coordinate(g) node[rground]{};
\draw (npnRight.B) to[open, v^=$U_{e2}$, o-o] ++(0,-2) node[rground]{};
\draw (cLeft) -- ++(-3,0) coordinate(a1) to[open, v^=$U_{a1}$, o-o] (g -| a1) node[rground]{};
\draw (cRight) -- ++(3,0) coordinate(a2) to[open, v^=$U_{a2}$, o-o] (g -| a2) node[rground]{};
\end{circuitikz}
\end{document}
```

- 2 Eingänge $U_{\mathrm{e}1}$ und $U_{\mathrm{e}2}$ jeweils an den Basen der Transistoren $T_1$ und $T_2$
- 2 Ausgänge $U_{\mathrm{a}1}$ und $U_{\mathrm{a}2}$ jeweils an den Kollektoren der Transistoren $T_1$ und $T_2$
- Symmetrische Versorgung $\pm U_0$ bezüglich des Bezugspotenzials 0
- Stromquelle $I_0$ mit Innenwiderstand $R_{i}$ zur Einstellung des AP

## Funktionsweise

> [!hint] Es werden (idealerweise, d. h. für $R_{\mathrm{i}} \rightarrow \infty$ ) nur:
> - **Eingangsspannungsdifferenzen** $U_{\mathrm{ed}}=U_{e, 1}-U_{e, 2} \neq 0$ verstärkt.
> - **Gleichtaktaussteuerungen** $U_{\mathrm{gl}}=U_{\mathrm{e}, 1}=U_{\mathrm{e}, 2}$ bewirken am Ausgang idealerweise keine Änderungen.

## Vorteile

1. Verstärkung von DC-Signalen. (Andere Verstärker können das aufgrund des Hochpassverhaltens der Koppelkondensatoren nicht!)
2. Die Subtraktion zweier Eingangssignale ermöglicht *gegengekoppelte* Schaltungen.
3. Großer linearer Aussteuerbereich bei Verstärkern, da die Auswirkungen der Nichtlinearitäten in den Transistorkennlinien verringert werden.

## Betriebsparameter

> [!question] [Betriebsparameter](Betriebsparameter.md)

> [!hint] Anmerkung: Jede beliebige Kombination von $U_{\mathrm{e}, 1}$ und $U_{\mathrm{e}, 2}$ kann als Überlagerung einer Gleichtaktund einer Gegentaktaussteuerung betrachtet werden:
> 
> **Differenzspannung** $u_{\mathrm{d}}=u_{\mathrm{e}, 1}-u_{\mathrm{e}, 2} \quad \Rightarrow \quad u_{\mathrm{e}, 1}=u_{\mathrm{gl}}+\dfrac{u_{\mathrm{d}}}{2}$
> **Gleichtaktspannung** $u_{\mathrm{gl}}=\dfrac{u_{\mathrm{e}, 1}+u_{\mathrm{e}, 2}}{2} \quad \Rightarrow \quad u_{\mathrm{e}, 2}=u_{\mathrm{gl}}-\dfrac{u_{\mathrm{d}}}{2}$
> 
> Sind die Differenzverstärkung $A_{\text {ed }}$ und die Gleichtaktverstärkung $A_{\mathrm{gl}}$ bekannt, dann kann die Ausgangsspannung als Überlagerung der Spannungen
> 
> $$
> \begin{rcases}
> & u_{\mathrm{a,d}}=A_{\mathrm{ed}}\left(u_{\mathrm{e}, 1}-u_{\mathrm{e}, 2}\right) \\
> & u_{\mathrm{a}, \mathrm{gl}}=\dfrac{A_{\mathrm{gl}}}{2}\left(u_{\mathrm{e}, 1}+u_{\mathrm{e}, 2}\right) 
> \end{rcases}\ u_{\mathrm{a}}=u_{\mathrm{a,d}}+u_{\mathrm{a}, \mathrm{gl}}
> $$
> 
> berechnet werden.
> 
> Demnach kann der Differenzverstärker folgendermaßen dargestellt werden:
> 
> ![](assets/Pasted%20image%2020250109012906.png)

### Gegentakt-Aussteuerung

$$\boxed{ U_{e1} = -U_{e2} = \frac{U_{d}}{2} }$$

> [!important] Schiefsymmetrische Aussteuerung mit Differenzspannung $U_{d}$
> 
> $$
> \begin{align}
> U_{e 1} \uparrow \implies I_{C 1} \uparrow \implies U_{a 1} \downarrow \\
> U_{e 2} \downarrow \implies I_{C 2} \downarrow \implies U_{a 2} \uparrow
> \end{align}
> $$

| Beitriebsparameter                         | Formel                                                                                                                      |
| ------------------------------------------ | :-------------------------------------------------------------------------------------------------------------------------- |
| **Differenzverstärkung**                   | $A_{\mathrm{ed}}=\dfrac{u_{a 1}}{u_{e 1}-u_{e 2}} = \frac{u_{a 1}}{u_{d}}\implies u_{a 1}=A_{\mathrm{ed}}(u_{e 1}-u_{e 2})$ |
| **Differenzen-**<br>**eingangswiderstand** | $r_{d}=\dfrac{u_{e 1}-u_{e 1}}{i_{B 1}}=\dfrac{u_{d}}{i_{B 1}}$                                                             |
| **Ausgangswiderstand**                     | $r_{a}=\dfrac{u_{a 1}}{i_{a 1}}$                                                                                            |

### Gleichtakt-Aussteuerung

$$\boxed{ U_{e1} = U_{e2} = U_{\mathrm{gl}} }$$

> [!important] Symmetrische Aussteuerung mit Gleichtaktspannung $U_{\mathrm{gl}}$
> $$I_{E 1}=I_{E 2} = \frac{I_{0}}{2}\implies U_{a 1}=U_{a 2}=U_{0}-R_{C}\cdot I_{C}\approx U_{0}-R_{C} \frac{I_{0}}{2}$$

| Beitriebsparameter                | Formel                                                                                                                                                      |                                        |
| --------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| **Gleichtaktverstärkung**         | $A_{\mathrm{gl}}=2\cdot \dfrac{u_{a 1}}{u_{e 1}+u_{e 2}}=\dfrac{u_{a 1}}{u_{\mathrm{gl}}}\implies u_{a 1}=\dfrac{A_{\mathrm{gl}}}{2}\cdot(u_{e 1}+u_{e 2})$ | $A_{\mathrm{gl}}$ ist idealerweise $0$ |
| **Gleichtakt-Eingangswiderstand** | $r_{\mathrm{gl}}=\dfrac{u_{e 1}+u_{e 2}}{2\cdot i_{B 1}} = \dfrac{u_{\mathrm{gl}}}{i_{B 1}}$                                                                |                                        |

### Gleichtaktunterdrückung (CMRR)

> [!question] Common-Mode Rejection Ratio (CMRR)

> [!def] Das Gleichtaktunterdrückungsverhältnis ist gegeben durch:
>
> $$CMRR = \left\lvert \frac{A_{\mathrm{ed}}}{A_{\mathrm{gl}}} \right\rvert$$

Es gibt an wie gut der Differenzenverstärker ungleiche Eingangssignale verstärkt während er gleichanteile unterdrückt.
Das Verhältnis der Differenzenverstärkung $A_{\mathrm{ed}}$ zur Gleichtaktverstärkung $A_{\mathrm{gl}}$ ist im idealfall für $R_{i}\to \infty$ unendlich groß.

$$
CMRR_{\text{ideal}} \to \infty\Bigg|_{R_{i}\to \infty}
$$

## Schaltungsentwurf

### Einfache Gegenkopplung

Die Einfachste Möglichkeit die Stromquelle zu realisieren ist mittels eines einfachen Widerstandes ([Stromgesteuerte Spannungsgegenkopplung](Spannungseinstellung.md))

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[very thick, transform shape, scale=1.5]
\draw (-1,0) node[npn](npnLeft){};
\draw (1,0) node[npn, xscale=-1](npnRight){};
\draw (npnLeft.text) node[right]{$T_1$};
\draw (npnRight.text) node[left]{$T_2$};
\draw (npnLeft.C) to[short, i<=$I_{C1}$] ++(0,0.5) coordinate(cLeft) to[R, l=$R_C$, *-] ++(0,1) coordinate(v) node[vcc]{$U_0$};
\draw (npnRight.C) to[short, i<_=$I_{C2}$] ++(0,0.5) coordinate(cRight) to[R, l_=$R_C$, *-] ++(0,1) node[vcc]{$U_0$};
\draw (npnLeft.E) to[short, i=$I_{E1}$] (npnLeft.E -| 0,0) coordinate(e) to[short, i<=$I_{E2}$] (npnRight.E);
\draw[color=orange] (e) to[R,l=$R_i$, o-o] ++(0,-2) node[black, vee]{$-U_0$};
\draw (npnLeft.B) to[open, v^=$U_{e1}$, o-o] ++(0,-2) coordinate(g) node[rground]{};
\draw (npnRight.B) to[open, v^=$U_{e2}$, o-o] ++(0,-2) node[rground]{};
\draw (cLeft) -- ++(-3,0) coordinate(a1) to[open, v^=$U_{a1}$, o-o] (g -| a1) node[rground]{};
\draw (cRight) -- ++(3,0) coordinate(a2) to[open, v^=$U_{a2}$, o-o] (g -| a2) node[rground]{};
\end{circuitikz}
\end{document}
```

> [!warning] Dabei Treten jedoch einige Probleme auf:
> - Um einen möglichst konstanten Strom zu erhalten, muss der Innenwiderstand $R_i$ sehr groß sein. 
> - Ein großer $R_{i}$ führt jedoch zu einem schlechten Arbeitspunkt: Die Meiste Spannung fällt am Widerstand ab, was zu einer geringen **gegentakt** Verstärkung führt (kleiner Aussteuerbereich). 
> 
> Fazit: Für Sinnvollen Arbeitspunkt $R_{i}\approx R_{C}$ $\implies$ damit ist aber das CMRR niedrig, was aber Relevant für die Verstärkung der **Differenz** ist.

### Stromspiegel

Eine weitere Möglichkeit ist die Verwendung eines Stromspiegels