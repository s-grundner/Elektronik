---
tags: 
aliases:
  - Bode-Diagramm
  - Bode-Plot
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Signale und Systeme
semester: SS25
created: 6th May 2025
professor: 
draft: true
title: Übertragungsfunktion
---

# Übertragungfunktion

## Eingrößensysteme

> [!info] Da hier speziell nur Matrizen Großgeschrieben werden,
> wird die Korrespondenz im Bildbereich mit $\mathbf{x}\circ\mkern-7px-\mkern-7px\bullet \mathbf{\hat{x}}$ bezeichnet

Wendet man die [Laplacetransformation](Laplacetransformation.md) auf das System

![LTI-SISO](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-SISO)

an, folgt

$$
\begin{align}
s\mathbf{\hat{x}} - \mathbf{x}_{0} &= \mathbf{A\hat{x}} + \mathbf{b}\hat{u}  \\
\hat{y} &= \mathbf{c^\mathrm{T}\hat{x}} + d \hat{u}.
\end{align}
$$

Umgeformt auf $\mathbf{\hat{x}}$ und in $\hat{y}$ eingesetzt erhält man

$$
\begin{align}
\mathbf{\hat{x}}(s) &= (s \mathbb{1}-\mathbf{A})^{-1}(\mathbf{x}_{0}+\mathbf{b}\hat{u}) \\
\hat{y}(s) &= \mathbf{c}^\mathrm{T}(s\mathbb{1}-\mathbf{A})^{-1}(\mathbf{x}_{0}+\mathbf{b}\hat{u}) + d \hat{u}
\end{align}
$$

### Lösung des Systems

Aus der Allgemeinen Lösung des Systems 

![[Kontinuierlicher LTI-Zustandsraum.md#^LTI-LSG]]

folgt



