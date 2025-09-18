---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 16. April 2024
professor: 
cited:
---
 

# Hauptsatz über implizite Funktionen

> [!info] explizite Funktionen
> Normalerweise sind Funktionen Aufgaben immer explizit angegeben, z.B.
> $$f(x,y) = \begin{bmatrix}3x^{2} \\ 4y^{2}-x\end{bmatrix}$$
> -> nicht immer der Fall

## Beispiel

Im falle einer impliziten Funktion z.B.: $x_{0}=1, y_{0}=1,u_{0}=1, v_{1}=-6$

$$
f(x,y) = \begin{bmatrix}
u(x,y)\\ v(x,y)
\end{bmatrix} \implies F(x,y,u,v) = \begin{bmatrix}
3x^{2}+7xyu-4u^{2}+v \\
3y^{2} -7xyv+4v^{3}-6u
\end{bmatrix}
$$

[[Analysis/Vektoranalysis/Gradient|Jacobi-Matrix]]:
$$
\begin{align}
\frac{\partial F}{\partial u, v} &= \begin{bmatrix}
7xy-8u & 1 \\
-6 & -7xy+12v^{2}
\end{bmatrix}
\\

\end{align}
$$