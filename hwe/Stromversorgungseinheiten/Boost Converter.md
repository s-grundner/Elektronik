---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 8th June 2022
---

# Boost Converter
## Schaltung
![Boostconverter](../assets/Boostconverter.svg)

$$
U_{a}\approx U_{e} \cdot \frac{1}{1-DC}
$$
Während der Einschaltphase des [Transistors](../{MOC}%20Transistor.md) $(T)$ Fällt die Eingangsspannung $U_{e}$ an der Indukitivät $(L)$ ab.
Schaltet der [Transistor](../{MOC}%20Transistor.md) $(T)$ ab, so fließt der Strom $I_{L}$ über die Diode (D) weiter und lädt den [Kondensator](../Kapazität.md) $C_{a}$.

## Impuls-Zeit Diagramm
> ![425](boost_converter_IZdiag.svg)

## Schalter $S$ bzw. [Transistor](../{MOC}%20Transistor.md) $T$
### $0<t<t_{1}$: $S_{geschlossen}$
Bei geschlossenen Schalter $S$ $(T)$ liegt $U_{e}$ über $L$ an und treibt $I_{L}$ durch die [Spule](../Induktivitäten.md).
 - Dabei *speichert die [Spule](../Induktivitäten.md) Energie*.
 - Die Diode sperrt in dieser Zeit.
 - Der [Kondensator](../Kapazität.md) $C_{A}$ liefert den Strom für den Verbraucher.

### $t_{1}<t<T_{s}$: $S_{geöffnet}$
Nach dem öffnen von $S$ $(T)$ treibt die [Spule](../Induktivitäten.md), aufgrund der in ihr gespeicherten Energie den Strom $I_{L}$, durch die, jetzt in *Druchlass-Richtung* liegende, Diode.

Ein Teil der in der [Spule](../Induktivitäten.md) gespeicherten Energie, wird in der Sperrphase auf den [Kondensator](../Kapazität.md) übertragen.
$\rightarrow$ **[Sperrwandler](Sperrwandler.md)**, Da die [Spule](../Induktivitäten.md) dem [Kondensator](../Kapazität.md) nur in dieser Phase Strom liefert.

### Herleitung der Dimensionierung
#### $0<t<t_{1}$: $S_{geschlossen}$
$$
\begin{align*}
	\Delta I_{L1} &= \frac{1}{L}\int^{t_{1}}_{0} U_{e}dt = \frac{1}{L}\cdot U_{e}\cdot t_{1} \qquad (1)\\
\end{align*}
$$
#### $t_{1}<t<T_{s}$: $S_{geöffnet}$
$$U_{L} = -(U_{a}+U_{FO}-U_{e})$$
$$
\begin{align*}
\Delta I_{L2} &= \frac{1}{L}\int_{t_{1}}^{T_{S}}- (U_{a}+U_{FO}-U_{e})dt
\\
&= -\frac{1}{L}\Big(U_{a}+U_{FO}-U_{e}\Big)\cdot\Big(T_{S}-t_{1}\Big) \qquad (2)
\end{align*}
$$
#### $\Delta I_{L1}= -\Delta I_{L2}$
$$
\begin{align*}\\
\frac{1}{L}\cdot U_{e}\cdot t_{1} &= \frac{1}{L}\Big(U_{a}+U_{FO}-U_{e}\Big)\cdot\Big(T_{S}-t_{1}\Big)
\\
&\dots
\\
U_{A} &= \frac{U_{e}\cdot T_{s}}{t_{aus}}-U_{Fo}
\\
&\approx U_{e} \cdot \frac{1}{1-DC}
\end{align*}
$$
$t_{aus}= T_{S} - t_{1}$
$DC = \frac{t_{ein}}{T_{S}}$
$1-DC = \frac{t_{aus}}{T_{S}}$
## [Induktivität](../Induktivitäten.md)
Die Mindestinduktivität wird mittelt de, Mindestlaststrom Berechnet
>![BuckBoostDisconID](../assets/BuckBoostDisconID.png)
>$\overline{I_{D}} = I_{a,min}$
><mark style="background: #FFB86CA6;">$A_{+}$</mark> = <mark style="background: #ADCCFFA6;">$A_{-}$</mark> (Fläche zwischen dem Stromverlauf von $\Delta I_{L}$ und $I_{a,min}$)

>![BoostIminLmin](../assets/BoostIminLmin.png)

## [Kapazität](../Kapazität.md)
>![BuckBoostDisconID](../assets/BuckBoostDisconID.png)
> <mark style="background: #FF5582A6;">$I_{a,min}$</mark> = <mark style="background: #FFB86CA6;">$\overline{I_{D}}$</mark> 

$Q=C\cdot U$
$C_{min}= \dfrac{\Delta Q}{\Delta U_{a}} = \dfrac{I_{a,max}-t_{ein}}{\Delta U_{a}}$
Mit etwas Überdimensionierung ($\rightarrow T_{S}$ statt $t_{ein}$) erhält man:
$C_{min}= \dfrac{\Delta Q}{\Delta U_{a}} = \dfrac{I_{a,max}-T_{S}}{\Delta U_{a}}$

---
# Tags
![Schaltnetzteile_Schmidt-Walter](../assets/pdf/Schaltnetzteile_Schmidt-Walter.pdf)