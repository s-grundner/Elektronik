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
---
 

# Wegunabhängigkeit

Ein Gradientenfeld oder konservatives Feld ist ein [index](index.md), das aus einem Skalarfeld durch Differentiation nach dem Ort abgeleitet wurde. Dieses Vektorfeld hat die Eigenschaft, dass sein Kurvenintegral wegunabhängig ist.

## Gradientensatz

Der Gradientensatz ist die Erweiterung des [Hauptsatzes der Infinitesimalrechnung](../Fundamentalsatz%20der%20Analysis.md) auf Linienintegrale 

> [!satz] **S1 - GRAS)** Gradientensatz.
> Sei $\varphi:A\to \mathbb{R}$ eine differenzierbare Funktion und $\gamma$ eine differenzierbare Kurve in $A$ mit dem Startpunkt $\mathbf{p}$ und dem Endpunkt $\mathbf{q}$, mit $\mathbf{p},\mathbf{q} \in A$. Dann gilt für das Kurvenintegral:
> $$
> \int_\gamma \nabla \varphi(\mathbf{r}) \cdot \mathrm{d} \mathbf{r}=\varphi(\mathbf{q})-\varphi(\mathbf{p})
> $$
> $\varphi$ ist also ein Skalarfeld mit dem Zugehörigen [Gradient](Gradient.md)-Vektorfeld $\nabla \varphi$.
> 

> [!hint] In einem beliebigen konservativen [Kraftfeld](../../../Physik/{MOC}%20Kräfte.md) ist $\varphi$ ein *Potenzial*.
