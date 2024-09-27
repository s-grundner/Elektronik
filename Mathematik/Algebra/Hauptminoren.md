---
tags: 
aliases:
  - Satz 10.24
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 23. September 2024
professor:
---
 

# Hauptminoren

> [!important] Definition 10.24. Sei $A=\left(a_{i k}\right) \in \mathbb{R}^{n \times n}$. Unter den Hauptminoren von $A$ versteht man die $n$ Zahlen:
> 
> $$
> \forall i \in\{1, \ldots, n\}: M_i:=\operatorname{det}\left(\begin{array}{lll}
> a_{11} & \ldots & a_{1 i} \\
> \vdots & \vdots & \vdots \\
> a_{i 1} & \ldots & a_{i i}
> \end{array}\right)
> $$
> 
> (Also $M_1:=a_{11}$ und $M_n:=\operatorname{det} A$.)

Für eine symmetrische $n \times n$-[Matrix](Matrix.md) $A$ definieren wir die führenden Hauptminoren $M_{1}, M_{2}, \ldots, M_{n}$ durch

$$
M_{1}=a_{11}, \quad M_{2}=\left|\begin{array}{ll}
a_{11} & a_{12} \\
a_{21} & a_{22}
\end{array}\right|, \quad M_{3}=\left|\begin{array}{lll}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{array}\right|, \ldots, \quad M_n=\operatorname{det} A
$$

--- 

- [Determinante](Determinante.md)