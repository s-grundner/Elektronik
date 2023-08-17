---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 8th June 2022
---

# Boost Converter
## Schaltung
![[Boostconverter.svg]]

$$
U_{a}\approx U_{e} \cdot \frac{1}{1-DC}
$$
Während der Einschaltphase des [[{MOC} Transistor|Transistors]] $(T)$ Fällt die Eingangsspannung $U_{e}$ an der Indukitivät $(L)$ ab.
Schaltet der [[{MOC} Transistor|Transistor]] $(T)$ ab, so fließt der Strom $I_{L}$ über die Diode (D) weiter und lädt den [[Kapazität|Kondensator]] $C_{a}$.

## Impuls-Zeit Diagramm
> ![[boost_converter_IZdiag.svg|425]]

## Schalter $S$ bzw. [[{MOC} Transistor|Transistor]] $T$
### $0<t<t_{1}$: $S_{geschlossen}$
Bei geschlossenen Schalter $S$ $(T)$ liegt $U_{e}$ über $L$ an und treibt $I_{L}$ durch die [[Induktivitäten|Spule]].
 - Dabei *speichert die [[Induktivitäten|Spule]] Energie*.
 - Die Diode sperrt in dieser Zeit.
 - Der [[Kapazität|Kondensator]] $C_{A}$ liefert den Strom für den Verbraucher.

### $t_{1}<t<T_{s}$: $S_{geöffnet}$
Nach dem öffnen von $S$ $(T)$ treibt die [[Induktivitäten|Spule]], aufgrund der in ihr gespeicherten Energie den Strom $I_{L}$, durch die, jetzt in *Druchlass-Richtung* liegende, Diode.

Ein Teil der in der [[Induktivitäten|Spule]] gespeicherten Energie, wird in der Sperrphase auf den [[Kapazität|Kondensator]] übertragen.
$\rightarrow$ **[[Sperrwandler]]**, Da die [[Induktivitäten|Spule]] dem [[Kapazität|Kondensator]] nur in dieser Phase Strom liefert.

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
## [[Induktivitäten|Induktivität]]
Die Mindestinduktivität wird mittelt de, Mindestlaststrom Berechnet
>![[BuckBoostDisconID.png]]
>$\overline{I_{D}} = I_{a,min}$
><mark style="background: #FFB86CA6;">$A_{+}$</mark> = <mark style="background: #ADCCFFA6;">$A_{-}$</mark> (Fläche zwischen dem Stromverlauf von $\Delta I_{L}$ und $I_{a,min}$)

>![[../../assets/Pasted image 20221001154620.png]]

## [[Kapazität]]
>![[BuckBoostDisconID.png]]
> <mark style="background: #FF5582A6;">$I_{a,min}$</mark> = <mark style="background: #FFB86CA6;">$\overline{I_{D}}$</mark> 

$Q=C\cdot U$
$C_{min}= \dfrac{\Delta Q}{\Delta U_{a}} = \dfrac{I_{a,max}-t_{ein}}{\Delta U_{a}}$
Mit etwas Überdimensionierung ($\rightarrow T_{S}$ statt $t_{ein}$) erhält man:
$C_{min}= \dfrac{\Delta Q}{\Delta U_{a}} = \dfrac{I_{a,max}-T_{S}}{\Delta U_{a}}$

---
# Tags
![[Schaltnetzteile_Schmidt-Walter.pdf]]