---
tags: 
aliases:
  - Basiswechsel
  - Koordinatentransformation
  - Basistransformation
keywords: 
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 14th March 2025
professor: 
release: false
title: Zustandstransformation
---
 

# Zustandstransformation

Ein LTI-System wird durch die Zustandsgleichungen Beschrieben: 

![](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO)

Oft ist es Sinnvoll den Zustand des Systems zu Transformieren, z.B.

- um dessen [Ruhelage](../Mathematik/Analysis/Ljapunov.md) in den Ursprung zu setzen.
- für eine [Kalman-Zerlegung](Kalman-Zerlegung.md)


Mit einer **Zustandstransformation** (auch Koordinatentransformation, Basistransformation oder Basiswechsel)

> [!def] Zustandstranformation ^TRF
> $$ \mathbf{x} = \mathbf{Tz} \iff \mathbf{\dot{x}} = \mathbf{T\dot{z}} $$

erhält man durch einsetzten für $\mathbf{x}$ und $\dot{\mathbf{x}}$ das System mit dem **neuen Zustand** $\mathbf{z}$:

$$
\begin{align}
\mathbf{\dot{z}} &= \mathbf{T}^{-1}\mathbf{ATz}+\mathbf{T}^{-1} \mathbf{Bu},\quad \mathbf{z}(0) = \mathbf{z}_{0} \\
\mathbf{y} &= \mathbf{CTz} +\mathbf{Du}
\end{align}
$$


Manchmal wird auch $\mathbf{T}^{-1} = \mathbf{\bar{T}}$ substituiert.

> [!warning] Vorrausgesetzt ist dabei die [Invertierbarkeit](../Mathematik/Algebra/Reguläre%20Matrizen.md) von $\mathbf{T}$

Dieses System ist wieder ein LTI-System der Form:

> [!satz] **S1 - ZTRF)** LTI-System des Transformierten Zustands: ^ZTRF
> 
> $$
> \begin{aligned}
> \dot{\mathbf{z}} &= \bar{\mathbf{A}} \mathbf{z} + \bar{\mathbf{B}}\mathbf{u}, \quad \mathbf{z}(0) = \mathbf{z}_{0} \\
> \mathbf{y} &= \bar{\mathbf{C}} \mathbf{z} + \bar{\mathbf{D}}\mathbf{u}
> \end{aligned}
> \qquad \text{mit} \qquad
> \begin{aligned}
> \bar{\mathbf{A}} &= \mathbf{T}^{-1} \mathbf{AT} \\
> \bar{\mathbf{B}} &= \mathbf{T}^{-1} \mathbf{B}\\
> \bar{\mathbf{C}} &= \mathbf{CT}\\
> \bar{\mathbf{D}} &= \mathbf{D}\\
> \end{aligned}
> $$

## Lösung der Zustandsgleichung

Die Lösung durch [Variation der Konstanten](../Mathematik/Analysis/Variation%20der%20Konstanten.md) des Transformierten LTI-Systems ist:

$$
\mathbf{z}(t;\mathbf{z}_{0}) = \mathbf{\bar{\Phi}}(t)\mathbf{z}_{0} + \int_{0}^{t}\mathbf{\bar{\Phi}}(t-\tau)\bar{\mathbf{B}}\mathbf{u}\mathrm{~d}\tau
$$

Dabei ist $\mathbf{\bar{\Phi}}(t)$ die [Transitionsmatrix](../Mathematik/Analysis/Fundamentalmatrix.md#^TRSM) des Zustands. Aus [ZTRF](#^ZTRF) erhält man für den Ursprünglichen Zustandsvektor $\mathbf{x}$

$$
\mathbf{x}(t;\mathbf{z}_{0}) = \mathbf{Tz}(t) = \mathbf{T\bar{\Phi}}(t)\mathbf{z}_{0} + \mathbf{T}\int_{0}^{t}\mathbf{\bar{\Phi}}(t-\tau)\mathbf{\bar{B}u}\mathrm{~d}\tau
$$
und somit
$$
\mathbf{x}(t;\mathbf{x_{0}}) =\mathbf{T\bar{\Phi}}(t)\mathbf{T}^{-1}\mathbf{x}_{0} + \mathbf{T}\int_{0}^{t}\mathbf{\bar{\Phi}}(t-\tau)\mathbf{T}^{-1}\mathbf{Bu}\mathrm{~d}\tau
$$

Daraus lässt sich der Zusammenhang erkennen:

$$
\mathbf{\Phi}(t) = \mathbf{T\bar{\Phi}}\mathbf{T}^{-1}
$$

## Besondere Zustanstransformationen

- [Jordannormalform](../Mathematik/Algebra/Jordannormalform.md)
- [Kalman-Zerlegung](Kalman-Zerlegung.md)
- [{MOC} Lineare Algebra](../Mathematik/{MOC}%20Lineare%20Algebra.md)
