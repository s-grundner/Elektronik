---
tags: 
aliases: 
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 27. Januar 2024
professor:
  - Andreas Neubauer
---
 

# Vertauschungsmatrix

Vertauschungsmatrix $T_{i, j}$: für ihre Zeilenvektoren $\vec{z_1}, \ldots, \vec{z_n}$ gilt:

$$
\vec{z_k}=\left\{
\begin{array}{ll}
\vec{e_j} & \text { falls } k=i, \\
\vec{e_{i}} & \text{ falls } k=j,\\
\vec{e_k} & \text { sonst} \\
\end{array} \right.
$$

## Beispiel in Wolfram Mathematica

Probieren Sie in einem ersten Schritt aus, wie eine [Matrix](Matrix.md) `B` aussehen muss, damit in Ihrer [Matrix](Matrix.md) `A` nach Ausführung der [Matrixmultiplikation](Matrixmultiplikation.md) `B.A` zweiter und dritter Zeilenvektor vertauscht sind.

``` mathematica
Clear[A]
A = ({
    {1, 2, 1, 3, 6, 6, 1, 0},
    {1, 2, 2, 2, 2, 2, 2, 1},
    {1, 2, 3, 1, 7, 1, 5, 8},
    {1, 1, 9, 2, 6, 2, 9, 5}
  });
```

$$
A=\left(
\begin{array}{cccccccc}
 1 & 2 & 1 & 3 & 6 & 6 & 1 & 0 \\
 1 & 2 & 2 & 2 & 2 & 2 & 2 & 1 \\
 1 & 2 & 3 & 1 & 7 & 1 & 5 & 8 \\
 1 & 1 & 9 & 2 & 6 & 2 & 9 & 5 \\
\end{array}
\right)
$$

```mathematica
Clear[B]
B = ({
    {1, 0, 0, 0},
    {0, 0, 1, 0},
    {0, 1, 0, 0},
    {0, 0, 0, 1}
   });
B.A // MatrixForm
```

> [!success] Output

$$
\left(
\begin{array}{cccccccc}
 1 & 2 & 1 & 3 & 6 & 6 & 1 & 0 \\
 1 & 2 & 3 & 1 & 7 & 1 & 5 & 8 \\
 1 & 2 & 2 & 2 & 2 & 2 & 2 & 1 \\
 1 & 1 & 9 & 2 & 6 & 2 & 9 & 5 \\
\end{array}
\right)
$$