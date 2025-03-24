---
tags: 
aliases: 
keywords: 
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 14th March 2025
professor:
draft: true
title: Zustandstransformation
---
 

# Zustandstransformation

> [!question] [Zustandsraum](Zustandsraum.md)

Ein LTI-System wird durch die Zustandsgleichungen Beschrieben: 

![LTI-System](LTI-Systeme.md#^ZLTI)

Oft ist es Sinnvoll den Zustand des Systems zu Transformieren, z.B. um dessen [Ruhelage](../Mathematik/Analysis/Ljapunov.md) in den Ursprung zu setzen. Mit einer **Zustandstransformation** (auch Koordinatentransformation, Basistransformation oder Basiswechsel)

$$ \mathbf{x} = \mathbf{Tz} \iff \mathbf{\dot{x}} = \mathbf{T\dot{z}} $$
^TRF

erhält man durch einsetzten für $\mathbf{x}$ und $\dot{\mathbf{x}}$ das System mit dem **neuen Zustand** $\mathbf{z}$:

$$
\begin{align}
\mathbf{\dot{z}} &= \mathbf{T}^{-1}\mathbf{ATz}+\mathbf{T}^{-1} \mathbf{Bu},\quad \mathbf{z}(0) = \mathbf{z}_{0} \\
\mathbf{y} &= \mathbf{CTz} +\mathbf{Du}
\end{align}
$$

> [!warning] Vorrausgesetzt ist dabei die [Invertierbarkeit](../Mathematik/Algebra/Gauß-Jordan-Verfahren.md#^INVB) von $\mathbf{T}$

Dieses System ist wieder ein LTI-System der Form:

> [!satz] **S1 - ZTRF)** LTI-System des Transformierten Zustands: ^ZTRF
> 
> $$
> \begin{aligned}
> \dot{\mathbf{z}} &= \tilde{\mathbf{A}} \mathbf{z} + \tilde{\mathbf{B}}\mathbf{u}, \quad \mathbf{z}(0) = \mathbf{z}_{0} \\
> \mathbf{y} &= \tilde{\mathbf{C}} \mathbf{z} + \tilde{\mathbf{D}}\mathbf{u}
> \end{aligned}
> \qquad \text{mit} \qquad
> \begin{aligned}
> \tilde{\mathbf{A}} &= \mathbf{T}^{-1} \mathbf{AT} \\
> \tilde{\mathbf{B}} &= \mathbf{T}^{-1} \mathbf{B}\\
> \tilde{\mathbf{C}} &= \mathbf{CT}\\
> \tilde{\mathbf{D}} &= \mathbf{D}\\
> \end{aligned}
> $$

## Lösung der Zustandsgleichung

Die Lösung durch [Variation der Konstanten](../Mathematik/Analysis/Variation%20der%20Konstanten.md) des Transformierten LTI-Systems ist:

$$
\mathbf{z}(t;\mathbf{z}_{0}) = \mathbf{\tilde{\Phi}}(t)\mathbf{z}_{0} + \int_{0}^{t}\mathbf{\tilde{\Phi}}(t-\tau)\tilde{\mathbf{B}}\mathbf{u}\mathrm{~d}\tau
$$

Dabei ist $\mathbf{\tilde{\Phi}}(t)$ die [Transitionsmatrix](../Mathematik/Analysis/Fundamentalmatrix.md#^TRSM) des Zustands. Aus [ZTRF](#^ZTRF) erhält man für den Ursprünglichen Zustandsvektor $\mathbf{x}$

$$
\mathbf{x}(t;\mathbf{z}_{0}) = \mathbf{Tz}(t) = \mathbf{T\tilde{\Phi}}(t)\mathbf{z}_{0} + \mathbf{T}\int_{0}^{t}\mathbf{\tilde{\Phi}}(t-\tau)\mathbf{\tilde{B}u}\mathrm{~d}\tau
$$
und somit
$$
\mathbf{x}(t;\mathbf{x_{0}}) =\mathbf{T\tilde{\Phi}}(t)\mathbf{T}^{-1}\mathbf{x}_{0} + \mathbf{T}\int_{0}^{t}\mathbf{\tilde{\Phi}}(t-\tau)\mathbf{T}^{-1}\mathbf{Bu}\mathrm{~d}\tau
$$

Daraus lässt sich der Zusammenhang erkennen:

$$
\mathbf{\Phi}(t) = \mathbf{T\tilde{\Phi}}\mathbf{T}^{-1}
$$
## Besondere Zustanstransformationen

- [Jordannormalform](../Mathematik/Algebra/Jordannormalform.md)
- [{MOC} Lineare Algebra](../Mathematik/{MOC}%20Lineare%20Algebra.md)
