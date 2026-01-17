---
tags:
  - Schaltungsanalyse
aliases:
  - Ohmschen Gesetz
created: 15th January 2026
keywords:
subject:
  - VL
  - Einführung Elektrotechnik
semester: WS25
professor:
  - Bernhard Jakoby
release: true
title: Ohmsches Gesetz
---


# Das Ohmsche "Gesetz" - ein Modell

> [!question] [Materialgesetze](Materialgesetze.md)

---

Das Ohmsche Gesetz besagt, dass Strom linear über eine Materialeigenschaft - dem Widerstand - mit der elektrischen Spannung zusammenhängen

> [!satz] **S)** Ohmsches Gesetz ^S1-OHM
> 
> $$
> I = \tfrac{1}{R}U
> $$

Aus sicht der Feldtheorie ist diese beziehung äquivalent zu

> [!satz] **S)** Ohmsches Gesetz ^S2-OHM
> 
> $$
> \mathbf{J} = \sigma \mathbf{E}
> $$
> 

## Hintergrund

> [!info] Das [Drude-Modell](Drude-Modell.md) hat uns gelehrt,
> dass wir uns nicht wundern müssen, dass die Elektronen nicht kontinuierlich beschleunigen, sondern im mittel eine konstante Geschwindikgeit annehmen.

$$
\begin{align}
U&=\int_l \vec{E} \cdot d \vec{s} \qquad\vec{E}=\frac{\vec{J}}{\sigma}\implies \vec{E}\mid\mid d\vec{s}\\
U&=\int_l E d s=E \int_l d s=E l=\frac{J}{\sigma} l=I \frac{1}{\sigma A} l\\
&\implies R=\frac{U}{I}=\frac{1}{\sigma A} l=\frac{\rho}{A} l
\end{align}
$$

# Übung

![[../_assets/Excalidraw/Ohmsches Gesetz 2024-03-18 22.31.23.excalidraw]]

# Tags

[Spannungsteiler](Spannungsteiler.md)
[TDR](../Hardwareentwicklung/Temperatur%20abhängiger%20Widerstand.md)