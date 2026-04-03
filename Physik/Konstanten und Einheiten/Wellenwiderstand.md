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
science: Elektromagentismus
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

|                                         |                                  Verlustbehaftet <br> $\tan\delta \neq 0$                                  |                          Verlustlos<br> $\tan\delta = 0$                           |   Guter Leiter<br> $\tan\delta \gg 0$| Perfekter Leiter<br> $\tan\delta \to \infty$    |
| --------------------------------------- | :--------------------------------------------------------------------------------: | :-----------------------------------------------------------: | :------------------------------------------------------------------------------------------: | :---------------: |
| Komplexe Ausbreitungskonstante $\gamma$ | $\gamma = j\omega\sqrt{ \epsilon\mu }\sqrt{ 1 - j\dfrac{\sigma}{\omega\epsilon} }$ |            $\gamma=jk=j\omega\sqrt{ \epsilon\mu }$            |                      $\omega=(1+j)\sqrt{ \dfrac{\omega\mu\sigma}{2} }$                       | $\gamma\to\infty$ |
| Wellenwiderstand $\eta$                 |           $\eta = \sqrt{ \dfrac{j\omega\mu}{\sigma + j\omega\epsilon} }$           | $\eta=\dfrac{\omega\mu}{k}=\sqrt{  \dfrac{\omega}{\epsilon}}$ | $\eta = (1+j)\sqrt{  \dfrac{\omega\mu}{2\sigma}}=(1+j) \dfrac{1}{\sigma\delta_{\mathrm{S}}}$ |    $\eta\to 0$    |
 
Wobei $\delta_{S}$ die [Eindringtiefe](../../HF-Technik/Skineffekt.md) ist.

