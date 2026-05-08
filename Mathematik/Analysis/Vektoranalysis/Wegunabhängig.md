---
tags:
aliases:
  - konservativ
  - Wegunabhängigkeit
  - Gradientensatz
  - Gradientenfeld
keywords:
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 25. September 2024
professor:
satz:
  - GRAS
title: Wegungabhänigkeit
---
 
# Wegunabhängigkeit

Ein Gradientenfeld oder konservatives Feld ist ein [Vektorfeld](index.md), das aus einem Skalarfeld durch Differentiation nach dem Ort abgeleitet wurde. Dieses Vektorfeld hat die Eigenschaft, dass sein Kurvenintegral wegunabhängig ist.

## Gradientensatz

Der Gradientensatz ist die Erweiterung des [Fundamentalsatzes der Analysis](../Fundamentalsatz%20der%20Analysis.md) auf [Linienintegrale](Linienintegral.md)

> [!satz] **S1 - GRAS)** Gradientensatz. ^GRAS
> 
> Sei $\varphi:A\to \mathbb{R}$ eine differenzierbare Funktion und $\gamma$ eine differenzierbare Kurve in $A$
> 
> 1. Hat $\gamma$ einen Startpunkt $\mathbf{p}$ und dem Endpunkt $\mathbf{q}$, mit $\mathbf{p},\mathbf{q} \in A$. Dann gilt für das [Kurvenintegral](Linienintegral.md):
> 
> $$
> \int_\gamma \nabla \varphi(\mathbf{r}) \cdot \mathrm{d} \mathbf{r}=\varphi(\mathbf{q})-\varphi(\mathbf{p})
> $$
> 
> 1. Hat $\gamma$ den *gleichem* Start und Endpunkt in $\mathbf{p} \in A$ (*geschlossene Kurve*). Dann gilt für das [Ringintegral](Linienintegral.md#Ringintegrale):
> 
> $$
> \oint_\gamma \nabla \varphi(\mathbf{r}) \cdot \mathrm{d} \mathbf{r} = 0
> $$
> 
> $\varphi$ ist ein Skalarfeld mit dem Zugehörigen [Gradient](Gradient.md)-Vektorfeld $\nabla \varphi$.
> 

> [!hint] In einem beliebigen konservativen [Kraftfeld](../../../Physik/Kinematik/Kräfte.md) ist $\varphi$ ein *Potenzial*.

## Referenzen

- [Spezialfall: Integration in einem Gradientenfeld](Linienintegral.md#Spezialfall%20Integration%20in%20einem%20Gradientenfeld)
