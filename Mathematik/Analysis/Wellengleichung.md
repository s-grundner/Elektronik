---
tags:
aliases:
  - D'Alembert
keywords:
  - Telegrafengleichung
  - Telegrafenleitungsgleichung
  - Zeitbereichsbetrachtung
subject:
  - VL
  - Mathematik 3
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 9th December 2025
professor:
  - Reinhard Feger
release: true
title: Wellengleichung
---

# Wellengleichung

Die Wellengleichung ist eine [Partielle DGL](Partielle%20Differenzialgleichung.md) und dient zur mathematischen Beschreibung der Ausbreitung von Raumwellen. In der Elektrotechnik vorallem der Ausbreitung von [elektromagnetischen Wellen](../../Physik/Elektromagnetische%20Wellen.md)

> [!def] **D)** eindimensionale, homogene Wellengleichung
> 
> $$
> \frac{\partial^{2}u}{\partial t^{2}}=c^{2}\cdot \frac{\partial^{2}u}{\partial x^{2}}
> $$

- $c$ ist die Ausbreitungsgeschwindigkeit der Welle
- und $u(x,t)$ als Wellenfunktion.

Erweitert auf eine Allgemeine Dimension $n$:

> [!def] **D)** mehrdimensionale homogene Wellengleichung
> 
> $$
> \frac{\partial^{2}u}{\partial t^{2}}=c^{2}\cdot \left(\frac{\partial^2 u}{\partial x_1^2}+\frac{\partial^2 u}{\partial x_2^2}+\cdots+\frac{\partial^2 u}{\partial x_n^2}\right)  = c^{2}\Delta u
> $$
> Mit dem [Laplace Operator](Vektoranalysis/Laplace%20Operator.md) $\Delta = \nabla^{2}$.

Auch in anderen Schreibweisen 

- Subskript als notation für die Ableitung:

$$
u_{tt} = c^{2}u_{\mathbf{xx}} = f(\mathbf{x},t)
$$

- Einführen des D'Alembert Operators $\Box$:

$$
\Box u = 0 \quad \text{mit} \quad \Box = \frac{1}{c^{2}} \frac{\partial^{2}}{\partial t^{2}} - \sum_{i=1}^{n} \frac{\partial^{2}}{\partial x_{i}^{2}}
$$

## Telegrafengleichung - Ausbreitung des E und H-Feldes in einem Medium

Für eine Ausbreitung der gekoppelten [Vektorfelder](Vektoranalysis/index.md) $\mathbf{E}$ ([elektrisches Feld](../../Elektrotechnik/Elektrisches%20Feld.md)) und $\mathbf{H}$ ([magnetisches Feld](../../Elektrotechnik/Magnetisches%20Feld.md)), dessen Zusammenhang mit den [Maxwell](../../Elektrotechnik/Maxwell.md) Gleichungen beschreiben werden, lässt sich die Wellengleichung für die Feldkomponenten herleiten.

> [!hint] Die gleiche herangehensweise kann auch bei der [Frequenzberechsbetrachtung](../../HF-Technik/Helmholzsche%20Differenzialgleichung.md) verwendet werden.

### Verlustloses Medium

> [!warning] Damit die Vereinfachung gilt, muss dass Material des Wellenleiters **linear** und **isotrop** sein. 
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

$$c = \frac{1}{\sqrt{ \mu\epsilon }}$$ 

ist. Aus den gekoppelten DGL hat man nun nur noch eingrößen DGL erhalten und man kann die Feldausbreitung separat betrachten.

### Verlustbehaftetes Medium



## Telegrafenleitungsgleichung


$$\frac{\partial }{\partial z} I(z,t)= -C' \frac{\partial}{\partial t}V(z,t),\quad\frac{\partial }{\partial z}V(z,t)= -L' \frac{\partial}{\partial t}I(z,t)$$

$$
\frac{\partial}{\partial t} \frac{\partial V(z, t)}{\partial z}=-L^{\prime} \frac{\partial^2 I(z, t)}{\partial t^2},\quad \frac{\partial^2 I(z, t)}{\partial z^2}=-C^{\prime} \frac{\partial}{\partial z} \frac{\partial V(z, t)}{\partial t}
$$

Die Lösung für die Ausbreitungs-Wellen von Strom und Spannung auf einer Leitung, ist eine Überlagerung von Hin und Rücklaufender Welle:

$$
\begin{align}
u(z)&= U_{h}\left( t-\tfrac{z}{c} \right)+ U_{r}\left( t+\tfrac{z}{c} \right)\\
i(z)&= I_{h}\left( t-\tfrac{z}{c} \right) - I_{r} \left( t+\tfrac{z}{c} \right)
\end{align}
$$

Die Grenzbedingungen sind hier der Anfang und das Ende der Leitung (die Eingangs und Abschluss impedanz). Dabei haben $U_{h}, U_{r}, I_{h}$ und $I_{r}$ eine **beliebige** Wellenform

> [!question] Das $-$ vor $I_{r}\left( t+\frac{z}{c} \right)$ ist durch die Zählpfeilrichtung für [Zweitore](../../Hardwareentwicklung/Vierpol.md) gegeben, da in die Tore hineinfließende Ströme positiv sind.
