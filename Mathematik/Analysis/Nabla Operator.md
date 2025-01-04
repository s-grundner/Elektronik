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
> Sei $x = (x_{1}, \dots, x_n) \in \mathbb{R}^{n}$. Der Nabla Operator ($\nabla$) ist alleinstehend folgendermaßend definiert
> $$
> \nabla_{x}:= \left(\begin{array}{c} \frac{\partial}{\partial x_{1}} \\ \vdots \\ \frac{\partial}{\partial x_{n}} \end{array}\right)
> $$
> Ist offensichtlich wonach differenziert wird kann das $x$ weggelassen werden.

Im oft gebräuchlichen kartesischen Koordinatensystem $\mathbb{R}^{3}$ Lässt sich der Nabla Operator Schreiben wie:

$$
\nabla = \left(\begin{array}{c}
\frac{\partial}{\partial x} \\
\frac{\partial}{\partial y} \\
\frac{\partial}{\partial z}
\end{array}\right) = \frac{\partial}{\partial x} \mathbf{e}_x+\frac{\partial}{\partial y} \mathbf{e}_y+\frac{\partial}{\partial z} \mathbf{e}_z
$$

wobei $\mathbf{e}_{x, y, z}$ die Einheitsvektoren in $x, y, z$-Richtungen sind (manchmal auch $\mathbf{\hat{i}}, \mathbf{\hat{j}}, \mathbf{\hat{k}}$ genannt).
   
> [!hint] Der Nabla-Operator lässt sich sowohl auf
> - partiell differenzierbare **Skalarfelder** ($f:A\to \mathbb{R}$)
> - als auch auf partiell differenzierbare **Vektorfelder** ($f:A \to \mathbb{R}^{n}, n>1$)
> 
> anwenden

Der Nabla-Operator ist Operator und [Vektor](Analysis/Vektor.md) in einem, d.h. mit inm lässt sich wie mit einem Vektor rechnen, d.h. es gelten die Verknüpfungen wie [Skalarprodukt](../Algebra/Skalarprodukt.md) und [Kreuzprodukt](../Algebra/Kreuzprodukt.md)

> [!important] Verschiedene Vektorielle Verknüpfungen des Nabla Operators mit dem Vektorfeld $\mathbf{F}$ haben spezielle Namen:
> - [Gradient](Analysis/Gradient.md): $\mathrm{grad} \,\mathbf{F} = \nabla \mathbf{F}$
> - [Divergenz](../../Elektrotechnik/Vektorfeld.md): $\mathrm{div}\, \mathbf{F} = \nabla \cdot\mathbf{F}$
> - Rotation: $\mathrm{rot}\, \mathbf{F} = \nabla \times \mathbf{F}$

---

- [[Analysis/Laplace Operator]]