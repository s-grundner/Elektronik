---
tags:
aliases:
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 16th January 2026
professor:
  - Reinhard Feger
release: true
title: Verlustwinkel
---


# Verlustwinkel

Ein material, das gemischt konduktive und dielektrische Verluste aufweist, charakterisiert man mit dessen Verlustwinkel bzw. dessen Tangens.

![invert_dark|300](../_assets/Excalidraw/Verlustwinkel%202026-01-16%2019.40.26.excalidraw.svg)

%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/Verlustwinkel%202026-01-16%2019.40.26.excalidraw.md)%%

Der Verlustwinkel ist ein Maß zur Güte von [reaktiven](Elektrische%20Netzwerke/Impedanz.md) Bauelementen ([Induktivität](Elektrische%20Netzwerke/Induktivität.md), [Kapazität](Elektrische%20Netzwerke/Kapazität.md)). Mit ihm lässt sich das Verhältnis des Reakiven anteils zum Resistiven anteil ausdrücken. 

## Dielektrische Materialien

#Elektrodynamik 

Verluste in einem [dielektrischen Medium](Dielektrikum.md) können zwei Ursachen haben:

- *Intrinsischer Leitwert* $\sigma$: Ein Dielektrikum soll idealerweise nichtleitend sein. Kann sich jedoch ein gewisser Teil der polarisierenden Ladungen frei bewegen, weist das Material eine gewisse Leitfähigkeit auf. Dadurch baut sich die Feldstärke im Material zu einem Teil ab.
- *Dämpfung des Dipolmomentes*: In einem Material, das in ein Wechselndes E-Feld eingebracht ist, schwingen die Dipole mit. Die Dipole weisen eine gewisse Ladungsträgheit auf. Ist diese im Verhältnis zur Frequenz des Feldes sehr hoch, **eilen** die Ladungen dem externen Feld **nach**. Die Schwingung ist gedämpft, wodurch die Feldstärke im Material geschwächt wird.

Diese beiden ursachen können Makroskopisch nicht unterschieden werden. Da die dielektrische Dämpfung und der intrinsische Leitwert nicht unterschieden werden kann, definiert man einzig und allein $\epsilon''$ *oder* $\sigma$ als verlustwirkende Eigenschaft (nur bei konstanter Frequenz).

> [!def] **D)** Verlustwinkel $\tan\delta$ ^LOSS-TAN
>
> $$
> \tan\delta := \frac{\epsilon''}{\epsilon'} \quad \text{bzw.} \quad \tan\delta := \frac{\sigma}{\omega\epsilon}
> $$

Der Verlustwinkel ist ein Wert zur beschreibung der [Güte](../Analog-Design/Filter-Verstärker/Güte.md). Dieser muss immer zusammen mit einer Frequenz gegeben sein.

Mit dem Verlustwinkel lässt sich die permittivität $\epsilon_{r} \in \mathbb{C}$  als Komplexwertiges Skalar definieren, um die Verluste in dielektrika zu modellieren:

$$
\epsilon =\epsilon_{0}\epsilon_{r}(1-j\tan\delta)
$$

### Herleitung

Aus

- dem [Durchflutungssatz (MW1)](Maxwell.md#1.%20MWG%20-%20Durchflutungssatz) in [Phasorschreibweise](Elektrische%20Netzwerke/Wechselstromtechnik.md#Phasorschreibweise%20der%20Maxwellgleichungen),
- der [komplexen Permittivität](Dielektrikum.md#Elektrodynamik%20-%20Allgemein)
- und dem Materialgesetz [M2](Materialgesetze.md#^MATG) und [M3](Materialgesetze.md#^MATG)

In den Durchflutungssatz ist nun das

erhält man

$$
\begin{align}
\nabla \times \mathbf{\underline{H}} &= j\omega \mathbf{\underline{D}} + \mathbf{\underline{J}} \\
&= j\omega \epsilon\mathbf{\underline{E}} + \sigma\mathbf{\underline{E}} \\
&= j\omega(\epsilon'-j\epsilon'') \mathbf{\underline{E}} + \sigma\mathbf{\underline{E}} \\
&= j\omega\left( \epsilon'-j\epsilon'' - j\frac{\sigma}{\omega} \right)\mathbf{\underline{E}} \\
&= (\omega\epsilon''+\sigma + j\omega\epsilon')\mathbf{\underline{E}}
\end{align}
$$

Man kann erkennen, dass das die dielektrische Dämpfung bei einer einzigen frequenz nicht mehr unterscheidbar vom Verlust des Leitwertes ist. Wenn ein dielektrisches Medium verlustbehaftet ist, weiß man also nicht, ob der verlust von einem intrinsischen Leitwert $\sigma$, oder der Dämpfung des Dipolmoments $\epsilon''$ kommt. Der komplexe Faktor vor dem elektrischen Feld kann nun in Real und Imaginärteil  zerlegt werden. Dieser Faktor gilt noch für die gekoppelte MWG. Entkoppelt man die Gleichungen, erhält man für den Faktor die [komplexe Fortpflanzungskonstante](../Physik/Feldtheorie/Wellenzahl.md) $\gamma$.  Dieser ist in der [Helmholtzsche Differenzialgleichung](../HF-Technik/Helmholtzsche%20Differenzialgleichung.md) genauer erläutert.

Die gekoppelte Betrachtung ist trotzdem sinnvoll, da diese Herangehensweise dann direkt auf die Strom und Spannungsbeziehung über komplexe [Impedanzen](Elektrische%20Netzwerke/Impedanz.md) um gemünzt werden kann. Beachtet man, dass der Verlustwinkel zwischen **Zeiger und Abzisse** (nicht der Ordinate!) liegt, berechnet sich der Winkel mit

$$
\begin{gather}
\delta = \arctan \left( \frac{\mathrm{Re}}{\mathrm{Im}}\right) =\arctan \left( \frac{\omega \epsilon'' + \sigma}{\omega\epsilon'} \right)  \\
\tan\delta = \frac{\omega\epsilon''+\sigma}{\omega\epsilon'}
\end{gather}
$$
Man wählt nun $\omega\epsilon''$ oder $\sigma$ zur Modellbildung.