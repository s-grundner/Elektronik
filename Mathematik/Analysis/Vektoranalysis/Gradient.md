---
tags:
  - Analysis/Differenzieren
aliases:
  - Gradienten
keywords:
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 19. März 2024
professor:
  - Andreas Neubauer
title: Gradient
---

# Gradient

> [!def] **D1 - GRAD)** Gradient. Sei $f: A \rightarrow \mathbb{R}, x=\left(x_1, \ldots, x_n\right) \in A \subseteq \mathbb{R}^{n}$
> Ist $f$ [partiell](../Partielle%20Ableitung.md) differenzierbar in $x$, liefert der Gradient von $f$ den [Vektor](../../Algebra/Vektor.md) aller partiellen Ableitungen an der Stelle $x$:
> 
> $$
> \operatorname{grad} f(\mathbf{x}):=\left[\frac{\partial f}{\partial x_1}(\mathbf{x}), \ldots, \frac{\partial f}{\partial x_n}(\mathbf{x})\right]=\nabla f(\mathbf{x})=\mathbf{J}_{f}(\mathbf{x})
> $$
> 
> der *Gradient* von $f$ an der Stelle $x$.
 
Statt $\operatorname{grad} f(\mathbf{x})$ verwendet man auch den [Nabla Operator](Nabla%20Operator.md) $\nabla f(\mathbf{x})$ (lies: Nabla $f$ ) oder die Jacobimatrix $\mathbf{J}_{f}(\mathbf{x})$ für eindimensionale Funktionen.

Die Funktion $f:A\to \mathbb{R}$ ist ein **Skalarfeld**. Wendet man den Gradienten darauf an, so erhält man ein Vektorfeld mit der Besonderen Eigenschaft der [Wegunabhängigkeit](Wegunabhängig.md)

## Referenzen

- [Partielle Ableitung](../Partielle%20Ableitung.md)
- [Jacobi Matrix](Jacobi%20Matrix.md)
- [Hesse Matrix](Hesse%20Matrix.md)
