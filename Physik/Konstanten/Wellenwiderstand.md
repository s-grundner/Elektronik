---
tags:
  - Konstante
  - Physik
aliases:
  - Feldwellenwiderstand
  - intrinsische Impedanz
  - Freiraumwellenwiderstand
symbol: $Z_{F}$
value: $376.730313412(59)$
unit: $\Omega$
subject:
  - EMV und SI
  - VL
  - Grundlagen der Hochfrequenztechnik
rel-uncertainty: 1.6e-10
keywords:
semester: WS25
created: 15th January 2026
professor:
  - Reinhard Feger
release: true
title: Freiraumwellenwiderstand
---

# Freiraumwellenwiderstand

> [!def] $\eta_{0}=376.730313412(59)~\Omega$
> $=\mu_{0} \cdot c\approx 120\pi ~\Omega$
> - $\mu$ ... [Permeabilitätskonstante](Permeablität.md)

# Wellenwiderstand

Wenn entweder $\mathbf{E}$ oder $\mathbf{H}$ bekannt ist, kann der andere Feldvektor mit den [Maxwell](../../Elektrotechnik/Maxwell.md)-Gleichungen 1 oder 2 berechnet werden. Der Zusammenhang der felder ist die intrinsische Impedanz $\eta$ des dielektrischen Mediums.

> [!satz] **S)** Wellenwiderstand in Medien
> $$
> \eta = \frac{j\omega\mu}{\gamma} \in \mathbb{C}
> $$

Für Verscheidene Medien lässt sich die [Fortpflanzungskonstante](../Feldtheorie/Wellenzahl.md)  $\gamma = j\omega \sqrt{ \mu\epsilon (1-j\tan\delta) }$ vereinfachen. Der allgemeinste fall ist der für verlustbehaftete Medien.

![invert_dark](../../_assets/Excalidraw/ZusammenfassungWellenwiderstand.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/ZusammenfassungWellenwiderstand.md)%%

Wobei $\delta_{S}$ die [Eindringtiefe](../../HF-Technik/Skineffekt.md) ist.

