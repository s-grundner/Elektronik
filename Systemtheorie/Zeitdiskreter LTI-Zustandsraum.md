---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 24th March 2025
professor:
draft: true
title: Diskreter LTI-Zustandsraum
---

# Zustandsbeschreibung von zeitdiskreten LTI-Systemen

> [!question] :LiArrowBigLeftDash: [Zeitdiskrete LTI-Systeme](Zeitdiskrete%20LTI-Systeme.md) |📍

[Kontinuierlicher LTI-Zustandsraum](Kontinuierlicher%20LTI-Zustandsraum.md) ***:LiArrowBigRightDash:***

---

> [!satz] **S1 - LTI)** Zeitdiskretes LTI-Übertragungssystem lässt sich in die Form ^LTI
> 
>  $$
> \begin{align}
> \mathbf{x}_{k+1} &= \mathbf{A}\mathbf{x}_{k}+\mathbf{B}\mathbf{u}_{k}, \quad \mathbf{x}(0) = \mathbf{x}_{0}\tag{Zustandsgl.}\\
> \mathbf{y}_{k} &= \mathbf{C} \mathbf{x}_{k} + \mathbf{D} \mathbf{u}_{k} \tag{Ausgangsgl.}
> \end{align}
> $$
> 
> überführen. Die Matrizen $\mathbf{A}$,$\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ sind die Koeffizienten(matrizen) der **Zustandsraumdarstellung** ^ZSRM
> $$
> \begin{align}
> &\mathbf{A} \text{ : Dynamikmatrix } (n\times n)
> &&\mathbf{B} \text{ : Eingangsmatrix } (n \times p) \\
> &\mathbf{C} \text{ : Ausgangsmatrix } (q\times n) && \mathbf{D} \text{ : Durchgangsmatrix } (q\times p)
> \end{align}
> $$


## Lösung der Zustandsgleichung

Die Lösung der Differenzengleichung folgt aus der Rekursionsvorschrift.

$$
\begin{align}
\mathbf{x}_{1} &= \mathbf{Ax}_{0}+\mathbf{Bu}_{0} \\
\mathbf{x}_{2} &= \mathbf{Ax}_{1}+\mathbf{Bu}_{1} \\
&= \mathbf{A}(\mathbf{Ax}_{0}+\mathbf{Bu}_{0}) +\mathbf{Bu}_{1} = \mathbf{A}^{2}\mathbf{x}_{0} + \mathbf{ABu}_{0} + \mathbf{Bu}_{1} \\
&\ \ \vdots
\end{align}
$$

> [!satz] **S2)** Lösung der Zustandsgleichung
> 
> $$
> \begin{align}
> \mathbf{x}_{k} &= \mathbf{A}^{k}\mathbf{x}_{0}+\sum_{i=0}^{k-1} \mathbf{A}^{k-i-1} \mathbf{Bu}_{i} \\
> \mathbf{y}_{k} &= \mathbf{C} \mathbf{x}_{k} + \mathbf{D} \mathbf{u}_{k}
> \end{align}
> $$

Mit der Ähnlichkeit zum kontinuierlichen LTI-System findet man auch hier einen Term mit den Eigenschaften einer [Transitionsmatrix](../Mathematik/Analysis/Fundamentalmatrix.md#Transitionsmatrix):

$$
\mathbf{\Phi}(k) = \mathbf{A}^k \quad \text{erfüllt} \quad \begin{cases}
\mathbf{\Phi}(0) &= \mathbb{1} \\
\mathbf{\Phi}(k+l) &=\mathbf{\Phi}(k)\mathbf{\Phi}(l) \\
\mathbf{\Phi}^{-1}(k) &= \mathbf{\Phi}(-k) \\
\mathbf{\Phi}(k+1) &= \mathbf{A\Phi}(k)
\end{cases}
$$

Im gegensatz zu DGL-Systemen, unterscheidet man hier, dass $\mathbf{\Phi}$ hier nicht immer [regulär](../Mathematik/Algebra/Determinante.md#Reguläre%20Matrizen) sein kann, sondern nur dann, wenn $\mathbf{A}$ ebenfalls regulär ist.