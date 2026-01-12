---
tags:
  - Algebra/LineareAlgebra
  - Systeme/LTI
aliases:
  - Dreieckszerlegung
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 25. Mai 2025
professor: 
release: false
title: Dreieckszerlegung
---

# Kalman-Zerlegung 

## Erreichbarkeit

Ist ein System nicht vollständig Erreichbar, kann es in ein erreichbares- und ein nicht-erreichbares Teilsystem zerlegt werden. Anwendbar für

> [!satz] **S)** Kalmanzerlegung bzgl der Erreichbarkeit ^ERRE
> 
> Man betrachtet die [Zustandstransformation](../Zustandstransformation.md) mit $\mathbf{T} = [\mathbf{U}\quad \mathbf{U}_{C}]$
> 
> $$
> \mathbf{x} = \begin{bmatrix}
> \mathbf{U} & \mathbf{U}_{C}
> \end{bmatrix} \begin{bmatrix}
> \mathbf{z}_{1} \\ \mathbf{z}_{2}
> \end{bmatrix}
> $$
> 
> - $\mathbf{U}$ ... linear unabhängigen **Spalten** der Erreichbarkeitsmatrix $\mathbf{M}_{\mathcal{R}}$ 
> - $\mathbf{U}_{C}$ ... Komplement von $\mathbf{U}$ bestehend aus $n-n_{\mathcal{R}}$ Spalten. Wird so gewählt, dass $[\mathbf{U}\quad \mathbf{U}_{C}]$ [regulär](../../Mathematik/Algebra/Reguläre%20Matrizen.md) ist.
> -  $n$ ... Dimension des Zustandes $\mathbf{x}$
> - $n_{\mathcal{R}}$ ... Dimension des erreichbaren Unterraums $\mathcal{R}$

Das Resultierende System hat **immer** die Form (mit $\mathbf{\bar{A}}$ und $\mathbf{\bar{B}}$ wie in [ZTRF](../Zustandstransformation.md#^ZTRF))

- [Zerlegung Zeitkontinuierlicher Systeme](Erreichbarkeit.md#Kalman-Zerlegung%20bezüglich%20der%20Erreichbarkeit)

$$
\begin{align}
\begin{bmatrix}
\mathbf{\dot{z}}_{1} \\ \mathbf{\dot{z}}_{2} 
\end{bmatrix} = \begin{bmatrix}
\mathbf{\bar{A}}_{11} & \mathbf{\bar{A}}_{12} \\ \mathbf{0} & \mathbf{\bar{A}}_{22}
\end{bmatrix} \begin{bmatrix}
\mathbf{z}_{1} \\ \mathbf{z}_{2}
\end{bmatrix} + \begin{bmatrix}
\mathbf{\bar{B}}_{1} \\ \mathbf{0}
\end{bmatrix} \mathbf{u} 
\end{align}
$$
^ERRE-KONT

- [Zerlegung Zeitdiskreter Systeme](Zeitdiskrete%20Erreichbarkeit.md#Kalmanzerlegung%20bezüglich%20der%20Erreichbarkeit)

$$
\begin{align}
\begin{bmatrix}
\mathbf{z}_{1, k+1} \\ \mathbf{z}_{2,k+1} 
\end{bmatrix} = \begin{bmatrix}
\mathbf{\bar{A}}_{11} & \mathbf{\bar{A}}_{12} \\ \mathbf{0} & \mathbf{\bar{A}}_{22}
\end{bmatrix} \begin{bmatrix}
\mathbf{z}_{1,k} \\ \mathbf{z}_{2,k}
\end{bmatrix} + \begin{bmatrix}
\mathbf{\bar{B}}_{1} \\ \mathbf{0}
\end{bmatrix} \mathbf{u} 
\end{align}
$$
^ERRE-DISK

Dabei müssen die Matrizen $\mathbf{\bar{A}}_{11}, \mathbf{\bar{A}}_{12}, \mathbf{\bar{A}}_{22}$ **nicht unbedingt quadratisch** sein. Die Teilzustände sind auch wiederum Vektoren (ggf. unterschiedlicher Dimension)

- $\mathbf{z}_{1}$ ... Zustandsvariable des erreichbaren Teilsystems
- $\mathbf{z}_{2}$ ... Zustandsvariable des nicht-erreichbaren Teilsystems

## Beobachtbarkeit

Ist ein System nicht vollständig Beobachtbar, kann es in ein beobachtbares- und ein nicht-beobachtbares Teilsystem zerlegt werden.


> [!satz] **S)** Kalmanzerlegung bzgl der Beobachtbarkeit ^BEOB
> 
> Man betrachtet die [Zustandstransformation](../Zustandstransformation.md) mit $\mathbf{T} = [\mathbf{U}\quad \mathbf{U}_{C}]$
> 
> $$
> \mathbf{x} = \begin{bmatrix}
> \mathbf{U} & \mathbf{U}_{C}
> \end{bmatrix} \begin{bmatrix}
> \mathbf{z}_{1} \\ \mathbf{z}_{2}
> \end{bmatrix}
> $$
> 
> - $\mathbf{U}$ ... linear unabhängigen **Spalten** aus $\ker\mathbf{M}_{O}$ 
> - $\mathbf{U}_{C}$ ... Komplement von $\mathbf{U}$ bestehend aus $n-n_{O}$ Spalten. Wird so gewählt, dass $[\mathbf{U}\quad \mathbf{U}_{C}]$ regulär ist.
> -  $n$ ... Dimension des Zustandes $\mathbf{x}$
> - $n_{O}$ ... Dimension des beobachbaren Unterraums $O$

Das Resultierende System hat **immer** die Form (mit $\mathbf{\bar{A}}$ und $\mathbf{\bar{B}}$ wie in [ZTRF](../Zustandstransformation.md#^ZTRF))

- [Zerlegung Zeitkontinuierlicher Systeme](Beobachtbarkeit.md#Kalman-Zerlegung%20bezüglich%20der%20Beobachtbarkeit)

$$
\begin{align}
\begin{bmatrix}
\mathbf{\dot{z}}_{1} \\ \mathbf{\dot{z}}_{2} 
\end{bmatrix} &= \begin{bmatrix}
\mathbf{\bar{A}}_{11} & \mathbf{\bar{A}}_{12} \\ \mathbf{0} & \mathbf{\bar{A}}_{22}
\end{bmatrix} \begin{bmatrix}
\mathbf{z}_{1} \\ \mathbf{z}_{2}
\end{bmatrix} + \begin{bmatrix}
\mathbf{\bar{B}}_{1} \\ \mathbf{\bar{B}}_{2}
\end{bmatrix} \mathbf{u} \\

\mathbf{y} &= \begin{bmatrix}
\mathbf{0} & \mathbf{\bar{C}}_{2}
\end{bmatrix} \begin{bmatrix}
\mathbf{z}_{1} \\ \mathbf{z}_{2}
\end{bmatrix} + \mathbf{Du}
\end{align}
$$
^BEOB-KONT

- [Zerlegung Zetdiskreter Systeme](Zeitdiskrete%20Beobachtbarkeit.md#Kalmanzerlegung%20bezüglich%20der%20Beobachtbarkeit)

$$
\begin{align}
\begin{bmatrix}
\mathbf{z}_{1, k+1} \\ \mathbf{z}_{2,k+1} 
\end{bmatrix} &= \begin{bmatrix}
\mathbf{\bar{A}}_{11} & \mathbf{\bar{A}}_{12} \\ \mathbf{0} & \mathbf{\bar{A}}_{22}
\end{bmatrix} \begin{bmatrix}
\mathbf{z}_{1,k} \\ \mathbf{z}_{2,k}
\end{bmatrix} + \begin{bmatrix}
\mathbf{\bar{B}}_{1} \\ \mathbf{\bar{B}}_{2}
\end{bmatrix} \mathbf{u}_{k}
\\
\mathbf{y}_{k} &= \begin{bmatrix}
\mathbf{0} & \mathbf{\bar{C}}_{2}
\end{bmatrix} \begin{bmatrix}
\mathbf{z}_{1,k} \\ \mathbf{z}_{2,k}
\end{bmatrix} + \mathbf{Du}_{k}
\end{align}
$$
^BEOB-DISK

Dabei müssen die Matrizen $\mathbf{\bar{A}}_{11}, \mathbf{\bar{A}}_{12}, \mathbf{\bar{A}}_{22}$ **nicht unbedingt quadratisch** sein. Die Teilzustände sind auch wiederum Vektoren (ggf. unterschiedlicher Dimension)

- $\mathbf{z}_{1}$ ... Zustand des nicht-beobachtbaren Teilsystems
- $\mathbf{z}_{2}$ ... Zustand des beobachtbaren Teilsystems

Für die Zerlegung können auch die zustände vertascht werden. In dem Fall sind dann die Spalten der Koeffizienten vertauscht. Nützlich wenn ein system bereits in einer verschleierten Dreieckszerlegung vorliegt.