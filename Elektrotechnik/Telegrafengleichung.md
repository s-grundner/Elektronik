---
tags:
  - RF
aliases:
subject:
  - HF-Systemtechnik 1
  - KV
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
professor:
  - Reinhard Feger
created: 15th January 2026
def:
keywords:
release: true
title: Telegraphengleichung
---


# Telegrafengleichung - Ausbreitung des E und H-Feldes in einem Medium

> [!question] Vergleiche [Telegrafenleitungsgleichung](Telegrafenleitungsgleichung.md)

Für eine Ausbreitung der gekoppelten [Vektorfelder](Vektoranalysis/index.md) $\mathbf{E}$ ([elektrisches Feld](../../Elektrotechnik/Elektrisches%20Feld.md)) und $\mathbf{H}$ ([magnetisches Feld](../../Elektrotechnik/Magnetisches%20Feld.md)), dessen Zusammenhang mit den [Maxwell](../../Elektrotechnik/Maxwell.md) Gleichungen beschreiben werden, lässt sich die Wellengleichung für die Feldkomponenten herleiten.

> [!hint] Die gleiche herangehensweise kann auch bei der [Frequenzberechsbetrachtung](../../HF-Technik/Helmholtzsche%20Differenzialgleichung.md) verwendet werden.

## Verlustloses Medium

> [!warning] Damit die Vereinfachung gilt, muss dass Material des Wellenleiters **linear** und **isotrop** sein.
>
> - $\mu$ und $\varepsilon$ sind konstante skalare und reelle Werte und nicht ortsabhängig.

Man betrachtet die [Materialgesetze](../../Elektrotechnik/Materialgesetze.md) und [Maxwell](../../Elektrotechnik/Maxwell.md)-Gleichungen in einem *Verlustlosen* dielektrischen Medium ($\sigma = 0$) und erhält folgende gekoppelte DGLen:

- [M1](../../Elektrotechnik/Materialgesetze.md#^MATG) $\to$ [MW1](../../Elektrotechnik/Maxwell.md#^MW1): $\nabla\times\mathbf{E} = -\mu\dfrac{\partial \mathbf{H}}{\partial t}$
- [M2](../../Elektrotechnik/Materialgesetze.md#^MATG) $\to$ [MW2](../../Elektrotechnik/Maxwell.md#^MW2): $\nabla\times\mathbf{H} = \epsilon\dfrac{\partial \mathbf{E}}{\partial t}$

Indem man den [Rotor](Vektoranalysis/Rotor.md) auf eine der Gleichungen anwendet (z.B. MW1) erhält man

$$
\nabla\times\nabla\times\mathbf{E} = \mu \frac{\partial}{\partial t}(\underbrace{\nabla\times\mathbf{H}}_{\text{MW2}}) = \mu\epsilon\frac{\partial^{2}}{\partial t^{2}}\mathbf{E}
$$

Die [Rechenregel für den Rotor des Rotors (xi)](Vektoranalysis/Nabla%20Operator.md#Allgemeine%20Rechenregeln) eines Vektorfeldes:

$$
\nabla \times \nabla \times\mathbf{E} = \nabla(\underbrace{ \nabla\cdot \mathbf{E} }_{ \text{MW3} }) - \nabla^{2}\mathbf{E}
$$

[MW3](../../Elektrotechnik/Maxwell.md#^MW3) besagt, dass $\nabla\cdot\mathbf{E} = \frac{\rho}{\epsilon}$. Da sich im idealen dielektrikum keine Ladungsquellen befinden ist $\rho=0$, wodurch man für die Wellengleichung im Zeitbereich erhält:

$$
\nabla^{2}\mathbf{E} = \mu\epsilon\frac{\partial^{2} }{\partial t^{2}}\mathbf{E}
$$

Durch dieselbe Betrachtung für das H-Feld erhält man parallel

$$
\nabla^{2}\mathbf{H} = \mu\epsilon\frac{\partial^{2}}{\partial t^{2}}\mathbf{H}
$$

Vergleicht man mit der allgemeinen Form der Wellengleichung erkennt man, dass die Ausbreitungsgeschwindigkeit

$$
c = \frac{1}{\sqrt{ \mu\epsilon }}
$$

ist. Aus den gekoppelten DGL hat man nun nur noch eingrößen DGL erhalten und man kann die Feldausbreitung separat betrachten.

### Lösung der Wellengleichung

Für eine eindimensionale Raumwelle, die Lösung der DGL

$$
\mathbf{E}(t,z)
$$

## Verlustbehaftetes Medium