---
tags:
aliases:
keywords:
  - GHFT-V1
subject:
  - VL
  - Mathematik 2
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 9th December 2025
professor:
  - Reinhard Feger
  - Andreas Neubauer
release: true
title: Divergenz
---
 


# Divergenz

> [!def] **D)** Sei $\mathbf{F}$ ein $\mathbb{K}^n$ [Vektorfeld](index.md) dann ist dessen Divergenz definiert als
> 
> $$
> \operatorname{div} \mathbf{F} := \nabla \cdot \mathbf{F} = \sum_{i=1}^{n} \frac{\partial F_{i}}{\partial x_{i}}
> $$
>

ist $\mathbf{F}=(F_{1},F_{2},F_{3})$:

$$
\operatorname{div}\mathbf{F}= \frac{\partial F_{1}}{\partial x_{1}} + \frac{\partial F_{2}}{\partial x_{2}} + \frac{\partial F_{3}}{\partial x_{3}}
$$

> [!info] Bedeutung
> Die Divergenz eines Vektorfeld ist ein Skalarfeld und gibt an, wie stark dass Feld *auseinander strebt*.

## Physikalische Interpretation

Die Divergenz ist ein Wichtiger Operator auf Vektorfelder und spielt vorallem bei den [Maxwell](../../../Elektrotechnik/Maxwell.md)-Gleichungen eine wichtige Rolle.

Die Divergenz liefert ein Maß für ein Vektorfeldes (z.B. das Elektrische Feld), mehr Vektoren zu einem bestimmten Punkt hinzeigen (negative divergenz) oder wegzeigen (positive Divergenz). Ist die divergenz positiv, so befindet sich an dem Punkt eine quelle für dieses Vektorfeld. Ist die Divergenz negativ, eine Senke.

> [!exmple]  Beispiel: An einem einzigen Punkt $(x,y,z)$ im Raum $\mathbb{R}^3$ befindet sich eine Punkladung $\rho(x,y,z,t) = \rho_{\text{const}}\delta(x)\delta(y)\delta(z)$.
> 
> (Im Ursprung des Koordinaten system befindet sich hier ein drei-dimensionaler [Dirac](../../Delta-Impuls.md), gewichtet mit der Ladung $\rho_{\text{const}}$).
> 
> Das Elektrische Feld lässt sich einfach in Polarkoordinaten beschreiben
> 
> $$
> \mathbf{E}(r, \theta, \varphi) = \frac{1}{4\pi \epsilon_{0}} \frac{Q}{r_{2}} \vec{e}_{r}
> $$
> 
> $\vec{e}_{r}$ ist dabei der Einheitsvektor der in radiale Richtung zeigt:
> 
> - In Polarkoordinaten:
> 
> $$
> \vec{e}_{r} = \begin{pmatrix}1\\0\\0\end{pmatrix}
> $$
> 
> - In Kartesischen Koordinaten:
> 
> $$
> \vec{e}_{r} = \frac{1}{\sqrt{ x^{2}+y^{2}+z^{2} }}\begin{pmatrix} x\\ y\\ z \end{pmatrix}
> =\frac{1}{r}\begin{pmatrix} x\\ y\\ z \end{pmatrix}
> $$

## Referenzen

- [Wikipedia](https://de.wikipedia.org/wiki/Divergenz_eines_Vektorfeldes)