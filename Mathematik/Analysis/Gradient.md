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
---

# Gradient

> [!def] **D1 - GRAD)** Gradient. Sei $f: A \rightarrow \mathbb{R}, x=\left(x_1, \ldots, x_n\right) \in A$
> Ist $f$ [partiell](Partielle%20Ableitung.md) differenzierbar in $x$, liefert der Gradient von $f$ den [Vektor](../Algebra/Vektor.md) aller partiellen Ableitungen an der Stelle $x$:
> 
> $$\operatorname{grad} f(x):=\left(\frac{\partial f}{\partial x_1}(x), \ldots, \frac{\partial f}{\partial x_n}(x)\right)=\nabla f(x)$$
> der *Gradient* von $f$ an der Stelle $x$; statt $\operatorname{grad} f(x)$ verwendet man auch den [Nabla Operator](Nabla%20Operator.md) $\nabla f(x)$ (lies: Nabla $f$ ).

Die Funktion $f:A\to \mathbb{R}$ ist ein Skalarfeld. Wendet man den Gradienten darauf an, so erhält man ein Vektorfeld mit der Besonderen Eigenschaft der [Wegunabhängigkeit](Wegunabhängig.md)

## Jacobi [Matrix](Algebra/Matrix.md)

> [!def] **D2 - JACM)** Jakobi Matrix. Sei $A \subset \mathbb{R}^n$ offen. Sei $f=\left(f_1, \ldots, f_m\right): A \rightarrow \mathbb{R}^m$ und $x \in A$.
> Falls $\frac{\partial f_i}{\partial x_j}(x)$ für alle $i \in\{1, \ldots, m\}$ und $j \in\{1, \ldots, n\}$ existiert, so heißt die [[Matrix]]
> 
> $$
> J_{f}(x):=\begin{pmatrix}
> \frac{\partial f_1}{\partial x_1}(x) & \ldots & \frac{\partial f_1}{\partial x_n}(x) \\
> \vdots & & \vdots \\
> \frac{\partial f_m}{\partial x_1}(x) & \ldots & \frac{\partial f_m}{\partial x_n}(x)
> \end{pmatrix}
> $$
> 
> *Jacobi-[[Matrix]]* (oder *Funktionalmatrix*) von $f$ an der Stelle $x$; Symbole: $D f(x)$ oder $J_f(x)$.

## Hesse [Matrix](Algebra/Matrix.md)

> [!def] **D2 - HESM)** Die Matrix die sich bei der zweiten partiellen Ableitung ergibt ist die Hessematrix
> $$
> H_f(x):=\left(\begin{array}{ccc}
\frac{\partial^2 f}{\partial x_1^2} & \cdots & \frac{\partial^2 f}{\partial x_1 \partial x_n} \\
\vdots & \ddots & \vdots \\
\frac{\partial^2 f}{\partial x_n \partial x_1} & \cdots & \frac{\partial^2 f}{\partial x_n^2}
\end{array}\right)
> $$
> Die Symmetrie der Hessematrix ist durch den [Satz von Schwarz](Analysis/Partielle%20Ableitung.md) gegeben.

> [!example] $f: \mathbb{R}^{n}\mapsto \mathbb{R}, \quad \vec{x}=(x,y)$
> 
> 
> $$f(x,y):=x^{2}y+3x^{2}-\sin(xy)$$
> $$\downarrow \frac{\partial }{\partial \vec{x}}$$
> $$\nabla f(x,y) = J_{f} = \begin{pmatrix}
> 2 x y+6 x-\cos (x y) \cdot y \\
> x^2-x \cdot \cos (x y) \\
> \end{pmatrix} $$
> $$\downarrow \frac{\partial }{\partial \vec{x}}$$
> $$\boxed{ H_{f(x, y)} = \begin{pmatrix}
> 2 y+6+\sin (x y) y^2 & 2 x+\sin (x y) \cdot y^2 \\
> x-(\cos (x y)+x \cdot \sin (x y) \cdot y & \sin (x y) x^2
> \end{pmatrix} }$$
>

