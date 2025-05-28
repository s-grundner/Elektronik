---
tags:
  - Systeme/LTI
  - Systeme/Kontinuierlich
aliases:
  - Rekonstruierbarkeit
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 25. Mai 2025
professor: 
release: false
title: Beobachtbarkeit
---

# Beobachtbarkeit von LTI-Systemen

:LiArrowBigRightDash: [Erreichbarkeit](Erreichbarkeit.md) 
:LiRefreshCcw: [Beobachtbarkeit Zeitdiskreter LTI-Systeme](Zeitdiskrete%20Beobachtbarkeit.md)

---

> [!def] **D1 - BEOB)** Beobachtbarkeit eines zeitkontinuierlichen LTI-Systems ^BEOB
> Man nennt das [LTI-System](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO) vollständig beobachtbar, wenn aus der Kenntnis der Ein- und Ausgangsgrößen $\mathbf{u}(t)$ und $\mathbf{y}(t)$ im Intervall $0 \leq t \leq T_{e}$ sowie der Systemmatrizen der Anfangszustand $\mathbf{x}_{0}$ errechnet werden kann.

## Testen auf Beobachtbarkeit

> [!satz] **S1 - MIMO)** Beobachtbarkeitskriterium für $n$-dimensionale [MIMO](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO)-Systeme.
> Das LTI-System ist vollständig beobachtbar, wenn die Beobachtbarkeits-Matrix $\mathbf{M}_{\mathcal{O}}$ den [Rang](../Mathematik/Algebra/Rang%20einer%20Matrix.md) $n$ hat.
>
> $$
> \mathbf{M}_{\mathcal{O}} = \begin{bmatrix}
> \mathbf{C} \\ \mathbf{CA} \\ \vdots \\ \mathbf{CA}^{n-1}
> \end{bmatrix}
> $$

> [!satz]- **S2 - SISO)** Beobachtbarkeitskriterium für $n$-dimensionale [SISO](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-SISO)-Systeme.
> Das LTI-System ist vollständig beobachtbar, wenn die Beobachtbarkeits-Matrix $\mathbf{M}_{\mathcal{O}}$ [regulär](../Mathematik/Algebra/Reguläre%20Matrizen.md) ist.
>
> $$
> \mathbf{M}_{\mathcal{O}} = \begin{bmatrix}
> \mathbf{c}^\mathrm{T} \\ \mathbf{c}^\mathrm{T}\mathbf{A} \\ \vdots \\ \mathbf{c}^\mathrm{T}\mathbf{A}^{n-1}
> \end{bmatrix}
> $$

^09806d

$\mathcal{O}$ steht für *observable*. 

## Nicht-Beobachtbarer Unterraum

> [!def] **D2)** Der *nicht-beobachtbare Unterraum* $\mathcal{O}^{\perp}$ ist definiert als
> $$ \mathcal{O}^{\perp} := \ker \mathbf{M}_{\mathcal{O}} $$
> Der [Kern](../Mathematik/Algebra/Lineare%20Abbildungen.md#^KERN) von $\mathbf{M}_{\mathcal{O}}$ sind alle $\mathbf{x} \in \mathbb{R}^n$, welche das Lineare Gleichungssystem $\mathbf{M}_{\mathcal{O}}\mathbf{x}=\mathbf{0}$ lösen

Sind alle **Zeilen** von $\mathbf{M}_{\mathcal{O}}$ linear unabhängig ist $\dim\mathcal{O}^{\perp} = 0$. Das heißt das System ist gemäß [D1](#^BEOB) vollständig Beobachtbar.

## Kalman-Zerlegung bezüglich der Beobachtbarkeit

![BEOB](Kalman-Zerlegung.md#^BEOB)

Das Resultierende System hat **immer** die Form (mit $\mathbf{\bar{A}}$ und $\mathbf{\bar{B}}$ wie in [ZTRF](Zustandstransformation.md#^ZTRF))

![BEOB-KONT](Kalman-Zerlegung.md#^BEOB-KONT)

## Rekonstruierbarkeit

> [!question] [Rekonstruierbarkeit zeitdiskreter LTI-Systeme](Zeitdiskrete%20Beobachtbarkeit.md#Rekonstruierbarkeit)

---

> [!def] **D - REKO)** Rekonstruierbarkeit eines zeitkontinuierlichen LTI-Systems ^REKO
>Man nennt das [LTI-System](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO) vollständig rekonstruierbar, wenn aus der Kenntnis der Eingangs- und Ausgangsgrößen $\mathbf{u}(t)$ und $\mathbf{y}(t)$ auf dem Intervall $0\leq t \leq T_{e}$ sowie der Systemmatrizen $\mathbf{A}$, $\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ der Zustand $\mathbf{x}(T_{e})$ errechnet werden kann. 

> [!hint] Im kontinuierlichen gilt: **vollst. rekonstruierbar** $\iff$ **vollst. beobachtbar**
> Ist das System vollständig Erreichbar ist es ebenso vollständig Steuerbar. Die Steuerbarkeit ist also genauso durch den vollen [Rang](../Mathematik/Algebra/Rang%20einer%20Matrix.md) von $\mathbf{M}_{\mathcal{O}}$ gegeben

Warum? $\to$ Zeitinvarianz eines LTI Systems: Vergleicht man beide Definitionen, stellt man fest, dass die Rekonstruierbarkeit genau die inverse Eigenschaft zur Beobachtbarkeit ist. 

Die Fundamentallösung des Systems hat [besondere Eigenschaften](../Mathematik/Analysis/Fundamentalmatrix.md#^TRSM-Eigenschaften)

- Die Transitionsmatrix ist immer [regulär](../Mathematik/Algebra/Reguläre%20Matrizen.md) (d.h. Invertierbar)
- Folgt man dem Fluss einer Lösung in die umgekehrete Richtung ist das äquivalent zum inversen Fluss 

## Detektierbarkeit

Das System ist detektierbar, wenn $\mathbf{\bar{A}}_{11}$ der Dreickszerlegung eine [Hurwitz-Matrix](../Mathematik/Analysis/Hurwitz-Matrix.md) ist.