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
 

# Hauptsatz über inverse Funktionen

$$
f(x,y) = \begin{bmatrix}
2x^{2}+y^{3}-3xy \\
2y^{3}-2xy+x^{5}
\end{bmatrix} \qquad x=y=1
$$

![[Hauptsatz der inversen Funktionen 2024-04-16 18.32.36.excalidraw]]

$$
\begin{align}
f&: \mathbb{R}^{n}\to \mathbb{R}^{m}\implies \frac{ \partial f }{ \partial x } \in \mathbb{R}^{m\times n} \\
\\
\frac{ \partial f }{ \partial x } &=
\begin{bmatrix}
4x-3y & 4y^{2}-3x \\
5x^{4} & 6y^{2}-2x
\end{bmatrix} \\
\frac{ \partial f }{ \partial x } (1,1) &= \begin{bmatrix}
1 & 0 \\
3 & 4
\end{bmatrix}
\end{align}
$$

- [Jacobi-Matrix](Gradient.md)
- [Determinante](Determinante.md) der Jacobi-Matrix
- Ist matrix überall regulär (außer 0,0)?
  - Ja $\to$ Funktion ist Lokal invertierbar
- Ist die Funktion bijektiv?
  - Ja $\to$ Funktion ist Global invertierbar
- Sonst nicht invertierbar