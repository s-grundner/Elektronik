---
tags:
  - Infinitesimalrechnung/Differenzieren
aliases:
  - Nabla
  - Jacobi-Matrix
  - Funktionalmatrix
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

> [!important] Sei $A \subset \mathbb{R}^n$ offen.
> (a) Sei $f: A \rightarrow \mathbb{R}, x=\left(x_1, \ldots, x_n\right) \in A$ und $j \in\{1, \ldots, n\}$. $f$ heißt in $x$ partiell nach $x_j$ differenzierbar, wenn folgender [[Grenzwert]] existiert:
> $$
> \lim _{t \rightarrow 0} \frac{f\left(x_1, \ldots, x_{j-1}, x_j+t, x_{j+1}, \ldots, x_n\right)-f(x)}{t}=: \frac{\partial f}{\partial x_j}(x)
> $$
> 
> Dieser heißt dann [[partielle Ableitung]] von $f$ nach $x_j$ (auch bezeichnet mit $f_{x_j}(x)$ ). Falls in $x$ alle partiellen Ableitungen existieren, so heißt $f$ partiell differenzierbar in $x$ und
> 
> $$
> \operatorname{grad} f(x):=\left(\frac{\partial f}{\partial x_1}(x), \ldots, \frac{\partial f}{\partial x_n}(x)\right)=\nabla f(x)
> $$
> der *Gradient* von $f$ an der Stelle $x$; statt $\operatorname{grad} f(x)$ verwendet man auch das Symbol $\nabla f(x)$ (lies: *Nabla* $f$ ).

## Jacobi [[Matrix]]

> [!important] Sei $A \subset \mathbb{R}^n$ offen.
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

# Beispiele

![4000](assets/Excalidraw/Gradient%202024-03-19%2017.18.35.excalidraw.md)
