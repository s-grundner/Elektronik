---
tags:
  - Systeme/LTI
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 25th March 2025
professor: 
draft: true
title: Erreichbarkeit
---

# Erreichbarkeit

Betrachtet wird ein zeitkontinuierliches LTI-System

![](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO)


Mit den Zustandsgrößen

![ZSGR](Zustandsraum.md#^ZSGR)

Gibt es einen Eingangsvektor $\mathbf{u}$, sodass alle Werte zu einem gegebenen Zeitpunkt $T_{e}$ alle Zustände erreicht werden können?

> [!satz] **S - MIMO)** Erreichbarkeitskriterium für MIMO[^1]-Systeme.
> Das [LTI](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO)-System ist genau dann vollständig erreichbar, wenn die Matrix
> $$\mathbf{M}_{k} = \begin{bmatrix}
> \mathbf{B} & \mathbf{AB} & \mathbf{A}^{2}\mathbf{B} & \dots &  \mathbf{A}^{n-1}\mathbf{B}\\
> \end{bmatrix}$$
> den Rang $n$ hat. Wobei $\mathbf{x}\in \mathbb{R}^n$



> [!satz] **S - SISO)** Erreichbarkeitskriterium für SISO[^2]-Systeme.
> $$\mathbf{M}_{k} = \begin{bmatrix}
> \mathbf{b} & \mathbf{Ab} & \mathbf{A}^{2}\mathbf{b} & \dots &  \mathbf{A}^{n-1}\mathbf{b}\\
> \end{bmatrix}$$

> [!def] **D - )** Gramsche Erreichbarkeitsmatrix

---

- Dreieckszerlegung / Kalman-Zerlegung

[^1]: Multiple Input, Multiple Output
[^2]: Single Input, Single Output