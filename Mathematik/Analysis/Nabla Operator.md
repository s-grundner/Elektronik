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

> [!def] **D1 - NABL)**  Nabla Operator
> Der Nabla Operator ($\nabla$) ist alleinstehend folgendermaßend definiert (hier im kartesischen Koordinaten system $\mathbb{R}^{3}$)
> $$
> \nabla:=\left(\begin{array}{c}
> \frac{\partial}{\partial x} \\
> \frac{\partial}{\partial y} \\
> \frac{\partial}{\partial z}
> \end{array}\right)=\frac{\partial}{\partial x} \mathbf{e}_x+\frac{\partial}{\partial y} \mathbf{e}_y+\frac{\partial}{\partial z} \mathbf{e}_z,
> $$
> wobei $\mathbf{e}_{x, y, z}$ die Einheitsvektoren in $x, y, z$-Richtungen sind
> - Der Nabla-Operator ist Operator und [Vektor](Analysis/Vektor.md) in einem, d.h. mit inm lässt sich wie mit einem [Vektor](Analysis/Vektor.md) rechnen
> - Der Nabla-Operator lässt sich sowohl auf partiell differenzierbare Skalarfelder als auch auf partiell differenzierbare Vektorfelder anwenden

> [!important] Verknüpfungen des Nabla Operators mit dem Vektorfeld $F$
> - [Gradient](Analysis/Gradient.md) - $\mathrm{grad} \,\mathbf{F} = \nabla \mathbf{F}$
> - Divergenz - $\mathrm{div}\, \mathbf{F} = \nabla \cdot\mathbf{F}$
> - Rotation - $\mathrm{rot}\, \mathbf{F} = \nabla \times \mathbf{F}$

---

- [[Analysis/Laplace Operator]]