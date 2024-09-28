---
tags:
  - Infinitesimalrechnung/Differenzieren
aliases:
  - Jacobi-Matrix
  - Funktionalmatrix
  - Gradienten
  - Definition 11.7
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 19. März 2024
professor:
  - Andreas Neubauer
---

# Gradient

> [!important] **Definition 11.7 (a)** Sei $A \subset \mathbb{R}^n$ offen.
> Sei $f: A \rightarrow \mathbb{R}, x=\left(x_1, \ldots, x_n\right) \in A$ und $j \in\{1, \ldots, n\}$. $f$ heißt in $x$ partiell nach $x_j$ differenzierbar, wenn folgender [[Grenzwert]] existiert:
> $$
> \lim _{t \rightarrow 0} \frac{f\left(x_1, \ldots, x_{j-1}, x_j+t, x_{j+1}, \ldots, x_n\right)-f(x)}{t}=: \frac{\partial f}{\partial x_j}(x)
> $$
> 
> Dieser heißt dann [[partielle Ableitung]] von $f$ nach $x_j$ (auch bezeichnet mit $f_{x_j}(x)$ ). Falls in $x$ alle partiellen Ableitungen existieren, so heißt $f$ partiell differenzierbar in $x$ und
> 
> $$
> \operatorname{grad} f(x):=\left(\frac{\partial f}{\partial x_1}(x), \ldots, \frac{\partial f}{\partial x_n}(x)\right)=\nabla f(x)
> $$
> der *Gradient* von $f$ an der Stelle $x$; statt $\operatorname{grad} f(x)$ verwendet man auch das Symbol $\nabla f(x)$ (lies: *[Nabla](Nabla%20Operator.md)* $f$ ).

## Jacobi [[Matrix]]

> [!important] **Definition 11.7 (b)** Sei $A \subset \mathbb{R}^n$ offen.
>  (b) Sei $f=\left(f_1, \ldots, f_m\right): A \rightarrow \mathbb{R}^m$ und $x \in A$.
> Falls $\frac{\partial f_i}{\partial x_j}(x)$ für alle $i \in\{1, \ldots, m\}$ und $j \in\{1, \ldots, n\}$ existiert, so heißt die [[Matrix]]
> 
> $$
> \begin{pmatrix}
> \frac{\partial f_1}{\partial x_1}(x) & \ldots & \frac{\partial f_1}{\partial x_n}(x) \\
> \vdots & & \vdots \\
> \frac{\partial f_m}{\partial x_1}(x) & \ldots & \frac{\partial f_m}{\partial x_n}(x)
> \end{pmatrix}
> $$
> 
> *Jacobi-[[Matrix]]* (oder *Funktionalmatrix*) von $f$ an der Stelle $x$; Symbole: $D f(x)$ oder $J_f(x)$.

## Hesse [[Matrix]]

> [!info] Falls $f \in C^3(A)$ ist, stimmen also etwa $\frac{\partial^3 f}{\partial x \partial y \partial x}$ und $\frac{\partial^3 f}{\partial x^2 \partial y}$ überein. Ist $f \in C^2(A)$, so ist die sogenannte Hessematrix
> $$
> H_f(x):=\left(\begin{array}{ccc}
\frac{\partial^2 f}{\partial x_1^2} & \cdots & \frac{\partial^2 f}{\partial x_1 \partial x_n} \\
\vdots & \vdots & \vdots \\
\frac{\partial^2 f}{\partial x_n \partial x_1} & \cdots & \frac{\partial^2 f}{\partial x_n^2}
\end{array}\right)
> $$
> symmetrisch.


$f: \mathbb{R}^{n}\mapsto \mathbb{R}, \quad \vec{x}=(x,y)$

$$
\begin{align}
f(x,y)&:=x^{2}y+3x^{2}-\sin(xy) \\
\downarrow &\frac{\partial }{\partial \vec{x}}\\
\nabla f(x,y) &= J_{f} = \begin{pmatrix}
2 x y+6 x-\cos (x y) \cdot y \\
x^2-x \cdot \cos (x y) \\
\end{pmatrix} \\
\downarrow &\frac{\partial }{\partial \vec{x}}\\
H_{f(x, y)} &= \begin{pmatrix}
2 y+6+\sin (x y) y^2 & 2 x+\sin (x y) \cdot y^2 \\
x-(\cos (x y)+x \cdot \sin (x y) \cdot y & \sin (x y) x^2
\end{pmatrix}
\end{align}
$$



# Beispiele

![4000](assets/Excalidraw/Gradient%202024-03-19%2017.18.35.excalidraw.md)
