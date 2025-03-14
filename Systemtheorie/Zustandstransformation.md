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

> [!question] [Zustandsgleichungen](Zustandsgleichungen.md)

Ein LTI-System wird durch die Zustandsgleichungen Beschrieben: 

![LTI-System](LTI-Systeme.md#^ZLTI)

Oft ist es Sinnvoll den Zustand des Systems zu Transformieren, z.B. um dessen [Ruhelage](../Mathematik/Analysis/Ljapunov.md) in den Ursprung zu setzen. Mit einer **Zustandstransformation** (auch Koordinatentransformation, Basistransformation oder Basiswechsel)

$$ \mathbf{x} = \mathbf{Tz} \iff \mathbf{\dot{x}} = \mathbf{T\dot{z}}  $$

erhält man das System mit dem **neuen Zustand** $\mathbf{z}$:

$$
\begin{align}
\mathbf{\dot{z}} &= \mathbf{T}^{-1}\mathbf{ATz}+\mathbf{T}^{-1} \mathbf{Bu},\quad \mathbf{z}(0) = \mathbf{z}_{0} \\
\mathbf{y} &= \mathbf{CTz} +\mathbf{Du}
\end{align}
$$

> [!warning] Vorrausgesetzt ist dabei die [Invertierbarkeit](../Mathematik/Algebra/Gauß-Jordan-Verfahren.md#^INVB) von $\mathbf{T}$

Dieses System ist wieder ein LTI-System der Form:

> [!satz] **S1 - ZTRF)** Sei $\mathbf{x} = \mathbf{Tz}$, wobei die Transformationsmatrix $\mathbf{T}$ invertierbar ist, dann ist das LTI-System für die Zustandstransformation:
> 


$$
\begin{align}
\dot{\mathbf{z}} &= \tilde{\mathbf{A}} \mathbf{z} + \tilde{\mathbf{B}}\mathbf{u}, \quad \mathbf{z}(0) = z_{0} \\
\mathbf{y} &= \tilde{\mathbf{C}} \mathbf{z} + \tilde{\mathbf{D}}\mathbf{u}
\end{align}
$$
mit

$$
\begin{align}
\tilde{\mathbf{A}} &= \mathbf{T}^{-1} \mathbf{AT} \\
\tilde{\mathbf{B}} &= \mathbf{T}^{-1} \mathbf{B}\\
\tilde{\mathbf{C}} &= \mathbf{CT}\\
\tilde{\mathbf{D}} &= \mathbf{D}\\
\end{align}
$$

## Lösung der Zustandsgleichung

Die Lösung durch [Variation der Konstanten](../Mathematik/Analysis/Variation%20der%20Konstanten.md#^VARC) des Transformierten LTI-Systems ist:

$$
\mathbf{z}(t; z_{0}) = \tilde{\mathbf{\Phi}}(t)\mathbf{z}_{0}
$$

$$

$$