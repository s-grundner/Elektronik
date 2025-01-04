---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 28. Mai 2024
professor: 
cited: 
def:
  - NABL
---
 

# Nabla Operator

> [!def] **D1 - NABL)** Nabla Operator
> Der Nabla Operator ($\nabla$) ist alleinstehend folgendermaßend definiert (hier im kartesischen Koordinaten system $\mathbb{R}^{3}$)
> $$
> \nabla:=\left(\begin{array}{c}
> \frac{\partial}{\partial x} \\
> \frac{\partial}{\partial y} \\
> \frac{\partial}{\partial z}
> \end{array}\right)=
> $$
> 

Im Kartesischen Koordinatensystem $\mathbb{R}^{3}$ ist der Nabla-Operator definiert als:

$$
\frac{\partial}{\partial x} \mathbf{e}_x+\frac{\partial}{\partial y} \mathbf{e}_y+\frac{\partial}{\partial z} \mathbf{e}_z
$$

wobei $\mathbf{e}_{x, y, z}$ die Einheitsvektoren in $x, y, z$-Richtungen sind (manchmal auch $\mathbf{\hat{i}}, \mathbf{\hat{j}}, \mathbf{\hat{k}}$ genannt).

- Der Nabla-Operator ist Operator und [Vektor](Analysis/Vektor.md) in einem, d.h. mit inm lässt sich wie mit einem [Vektor](Analysis/Vektor.md) rechnen. 
   Das Heißt es Gelten die Verknüpfungen wie [Skalarprodukt](../Algebra/Skalarprodukt.md) und [Kreuzprodukt](../Algebra/Kreuzprodukt.md)
   
Der Nabla-Operator lässt sich sowohl auf partiell differenzierbare
**Skalarfelder** ($f:A\to \mathbb{R}$)
als auch auf partiell differenzierbare
**Vektorfelder** ($f_{}$) anwenden

> [!important] Verknüpfungen des Nabla Operators mit dem Vektorfeld $\mathbf{F}$
> - [Gradient](Analysis/Gradient.md) - $\mathrm{grad} \,\mathbf{F} = \nabla \mathbf{F}$
> - Divergenz - $\mathrm{div}\, \mathbf{F} = \nabla \cdot\mathbf{F}$
> - Rotation - $\mathrm{rot}\, \mathbf{F} = \nabla \times \mathbf{F}$

---

- [[Analysis/Laplace Operator]]