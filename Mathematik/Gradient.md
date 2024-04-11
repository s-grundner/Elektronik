---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 2
semester:
  - SS24
  - B2
created: 19. März 2024
professor:
---
 

# Gradient


!Definition 11.7. Sei $A \subset \mathbb{R}^n$ offen.
(a) Sei $f: A \rightarrow \mathbb{R}, x=\left(x_1, \ldots, x_n\right) \in A$ und $j \in\{1, \ldots, n\}$. $f$ heißt in $x$ partiell nach $x_j$ differenzierbar, wenn folgender Grenzwert existiert:
$$
\lim _{t \rightarrow 0} \frac{f\left(x_1, \ldots, x_{j-1}, x_j+t, x_{j+1}, \ldots, x_n\right)-f(x)}{t}=: \frac{\partial f}{\partial x_j}(x)
$$

Dieser heißt dann partielle Ableitung von $f$ nach $x_j$ (auch bezeichnet mit $f_{x_j}(x)$ ). Falls in $x$ alle partiellen Ableitungen existieren, so heißt $f$ partiell differenzierbar in $x$ und
$$
\operatorname{grad} f(x):=\left(\frac{\partial f}{\partial x_1}(x), \ldots, \frac{\partial f}{\partial x_n}(x)\right)=\nabla f(x)
$$
der Gradient von $f$ an der Stelle $x$; statt $\operatorname{grad} f(x)$ verwendet man auch das Symbol $\nabla f(x)$ (lies: Nabla $f$ ).

![4000](assets/Excalidraw/Gradient%202024-03-19%2017.18.35.excalidraw.md)

$$
\begin{align}
\nabla f\cdot \vec{e} &= 100\% \\
\nabla f=\left( \frac{\partial f}{\partial x},  \right)
\end{align}
$$