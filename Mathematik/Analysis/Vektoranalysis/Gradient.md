---
tags:
  - Analysis/Differenzieren
aliases:
  - Jacobi-Matrix
  - Funktionalmatrix
  - Gradienten
  - Hessematrix
  - Hesse-Matrix
keywords:
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 19. März 2024
professor:
  - Andreas Neubauer
def:
  - GRAD
title: GRadient
---

# Gradient

> [!def] **D1 - GRAD)** Gradient. Sei $f: A \rightarrow \mathbb{R}, x=\left(x_1, \ldots, x_n\right) \in A$
> Ist $f$ [partiell](../Partielle%20Ableitung.md) differenzierbar in $x$, liefert der Gradient von $f$ den [Vektor](../../Algebra/Vektor.md) aller partiellen Ableitungen an der Stelle $x$:
> 
> $$
> \operatorname{grad} f(\mathbf{x}):=\left[\frac{\partial f}{\partial x_1}(\mathbf{x}), \ldots, \frac{\partial f}{\partial x_n}(\mathbf{x})\right]=\nabla f(\mathbf{x})=\mathbf{J}_{f}(\mathbf{x})
> $$
> 
> der *Gradient* von $f$ an der Stelle $x$.
 
Statt $\operatorname{grad} f(\mathbf{x})$ verwendet man auch den [Nabla Operator](Nabla%20Operator.md) $\nabla f(\mathbf{x})$ (lies: Nabla $f$ ) oder die Jacobimatrix $\mathbf{J}_{f}(\mathbf{x})$ für eindimensionale Funktionen.

Die Funktion $f:A\to \mathbb{R}$ ist ein **Skalarfeld**. Wendet man den Gradienten darauf an, so erhält man ein Vektorfeld mit der Besonderen Eigenschaft der [Wegunabhängigkeit](Wegunabhängig.md)

## Jacobi Matrix

> [!def] **D2 - JACM)** Jakobi [Matrix](../../Algebra/Matrix.md). Sei $A \subset \mathbb{R}^n$ offen. Sei $\mathbf{f}=\left(f_1, \ldots, f_m\right): A \rightarrow \mathbb{R}^m$ und $\mathbf{x} \in A$. ^JACM
> 
> Falls $\dfrac{\partial f_i}{\partial x_j}(x)$ für alle $i \in\{1, \ldots, m\}$ und $j \in\{1, \ldots, n\}$ existiert, so heißt die Matrix
> 
> $$
> \mathbf{J_{f}}(\mathbf{x}):=\begin{bmatrix}
> \dfrac{\partial f_1}{\partial x_1}(\mathbf{x}) & \ldots & \dfrac{\partial f_1}{\partial x_n}(\mathbf{x}) \\
> \vdots & \ddots & \vdots \\
> \dfrac{\partial f_m}{\partial x_1}(\mathbf{x}) & \ldots & \dfrac{\partial f_m}{\partial x_n}(\mathbf{x})
> \end{bmatrix}
> $$
> 
> *Jacobi-Matrix* (oder *Funktionalmatrix*) von $\mathbf{f}$ an der Stelle $\mathbf{x}$.

Die Jacobimatrix ist die verallgemeinerung des Gradienten auf Mehrdimensionale Funktionen. Es gilt daher auch

$$
\mathbf{J}_{f}(\mathbf{x}) = \operatorname{grad}f(\mathbf{x}) = \nabla f(\mathbf{x})
$$

(Man beachte dass das Subscript $f$ der Jacobimatrix nicht Fett geschrieben ist.)

## Hesse Matrix

> [!def] **D2 - HESM)** Die Matrix die sich bei der zweiten partiellen Ableitung ergibt ist die Hessematrix
> 
> $$
> H_f(x):=\begin{pmatrix}
> \dfrac{\partial^2 f}{\partial x_1^2} & \cdots & \dfrac{\partial^2 f}{\partial x_1 \partial x_n} \\
> \vdots & \ddots & \vdots \\
> \dfrac{\partial^2 f}{\partial x_n \partial x_1} & \cdots & \dfrac{\partial^2 f}{\partial x_n^2}
> \end{pmatrix}
> $$
> 
> Die Symmetrie der Hessematrix ist durch den [Satz von Schwarz](../Partielle%20Ableitung.md) gegeben.


> [!example] $f: \mathbb{R}^{n}\mapsto \mathbb{R}, \quad \vec{x}=(x,y)$
> 
> $$
> \begin{gather}
> f(x,y):=x^{2}y+3x^{2}-\sin(xy) \\
> 
> \downarrow \frac{\partial }{\partial \vec{x}} \\
> 
> \nabla f(x,y) = J_{f} = \begin{pmatrix}
> 2 x y+6 x-\cos (x y) \cdot y \\
> x^2-x \cdot \cos (x y) \\
> \end{pmatrix} \\
> 
> \downarrow \frac{\partial }{\partial \vec{x}} \\
> 
> \boxed{ H_{f(x, y)} = \begin{pmatrix}
> 2 y+6+\sin (x y) y^2 & 2 x+\sin (x y) \cdot y^2 \\
> x-(\cos (x y)+x \cdot \sin (x y) \cdot y & \sin (x y) x^2
> \end{pmatrix} } 
> \end{gather}
> $$

