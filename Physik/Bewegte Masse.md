---
tags:
aliases:
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 26th February 2026
professor:
release: false
title: Bewegte Masse
---

# Bewegte Masse

Eine Bewegte Masse $m(v)$ ist Schwerer als die Ruhemasse $m_{0}$, gegeben durch die Beziehung[^1]

$$
m(v) = \frac{m_{0}}{\sqrt{ 1- \frac{v^{2}}{c^{2}} }}
$$

Demnach kann eine Masse niemals auf die Lichtgeschwindigkeit beschleunigt werden, da diese sonst $\to \infty$ gehen würde.

> [!hint] Daraus folgt dass
> Photonen des Lichts selbst eine Ruhemasse von $m_{0}=0$ haben müssen, damit diese Beziehug gilt. Die beschleunigte Masse des Photons selbst ist jedoch wiederum ein Wert $> 0$.

Eine [Taylorreihenentwicklung](../Mathematik/Analysis/Taylorreihe.md) von $m(v)$ um $0$ bzgl. $v$ ist

$$
m(v) = m_{0}+\frac{m_{0} v^2}{2 c^2}+\frac{3 m_{0} v^4}{8 c^4}+O\left(v^5\right)
$$

$E=mc^{2}$ ist die gesamte Energie die in einer Masse steckt. Eingesetzt in die Beziehung erhält man

$$
E=m(v)\cdot c^{2} = m_{0} c ^{2}+\frac{m_{0} v^2}{2}+\dots
$$

Man erkennt, dass in diesem Ausdruck auch die Kinetische Energie enthalten ist.


[^1]: Diese Beziehung wurde von Einsteinmithilfe der Elektrodynamik hergeleitet.
