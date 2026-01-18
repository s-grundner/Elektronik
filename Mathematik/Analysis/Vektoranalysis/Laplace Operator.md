---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 2. Oktober 2024
professor:
  - Markus Passenbrunner
def:
  - LAPO
---
 

# Laplace Operator



> [!def] **D1 - LAPO)** Laplace Operator: Sei $u:A\to \mathbb{R}$ (Ein Skalarfeld)
> Der Laplace Operator ist definiert als die Divergenz des Gradienten
> 
> $$\Delta u := \operatorname{div} (\nabla u) = \nabla \cdot \nabla u = \nabla^2 u$$
>
> Speziell im  $\mathbb{R}^3$
> $$\Delta u=\frac{\partial^{2}u}{\partial x^{2}}+\frac{\partial^{2}u}{\partial y^{2}}+\frac{\partial^{2}u}{\partial z^{2}}$$
>

## Vektorieller Laplace Operator

Beim Anwenden des Laplace Operators $\Delta=\nabla^{2}$ auf z.B. ein $\mathbb{R}^3$ Vektorfeld $\mathbf{F}$, mit den kartesischen Koordinaten $x,y,z$, muss beachtet werden, dass die dimension des Vektors erhalten bleibt. Der Laplaceoperator wird komponentenweise angewandt.

$$
\nabla^{2}\mathbf{F}
= \Delta F_{x}\hat{x} + \Delta F_{y}\hat{y} + \Delta F_{z}\hat{z}
= \begin{pmatrix}
\Delta F_{x} \\ \Delta F_{y} \\ \Delta F_{z}
\end{pmatrix}
$$

- $\hat{x}, \hat{y}, \hat{z}$ sind die Einheitsvektoren der Achsen.

---

[Nabla Operator](Nabla%20Operator.md)