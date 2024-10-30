---
tags: 
aliases:
  - Matrizant
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 30. Oktober 2024
professor:
---
 

# Fundamentalmatrix

Seien $x_{1},\dots ,x_{m}: I \to \mathbb{R}^{m}$ linear unabhängige Lösungen von $x'=A(t)x$

$$\begin{align}
X(t):=(x_{1}(t)\dots x_{m}(t)) \in \mathbb{R}^{m\times m}
\end{align}
$$

$$
X'(t) = \begin{pmatrix}
x_{1}'(t) & \dots  & x_{k}'(t)
\end{pmatrix} = \begin{pmatrix}
A(t)x_{1}  & \dots  & A(t)x_{k}
\end{pmatrix}
$$
Gilt $X(t_{0})= \mathbb{1}_{m}$ (Einheitsmatrix), so heißt die Fundamntalmatrix $X(t)$ **Matrizant** 

> [!important] Sei $x(t;t_{0};x_{0})$ die eindeutige Lösung von $x'=A(t)x,\quad x(t_{0}) = x_{0}$
> 
> Dann Gilt:
> 
> $$
> \begin{align}
> x(t;t_{0},x_{0})=X(t)\cdot X(t_{0})^{-1}\cdot x_{0} =X_{t_{0}}(t)\cdot x_{0} \implies \boxed{ X(t)\cdot X(t_{0})^{-1} =X_{t_{0}}(t) } \\
> \end{align}
> $$
> 
> für  $t=t_{0}$ ist $X(t)\cdot X(t_{0})^{-1}=X_{t_{0}}(t)=\mathbb{1}_{m}$
> 
