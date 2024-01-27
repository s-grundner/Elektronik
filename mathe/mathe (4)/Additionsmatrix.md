---
tags: 
aliases: 
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - WS23
created: 27. Januar 2024
professor:
---
 

# Additionsmatrix

> [!info] Mit einer Multiplikation mit der Additionsmatrix wird 

 Additionsmatrix $R_{i, j}(\lambda)$ mit $i \neq j$ und $\lambda \neq 0$ (Linearkombination): für ihre Zeilenvektoren $\vec{z_1}, \ldots, \vec{z_n}$ gilt:

$$
\vec{z_k}=\left\{\begin{array}{ll}
\vec{e_i}+\lambda \vec{e_j} & \text { falls } k=i, \\
\vec{e_k} & \text { falls } k \neq i,
\end{array} \right.
$$

also:

$$
R_{i, j}(\lambda):=\begin{pmatrix}
1 & 0 &  &  &  & &  \cdots  & 0 \\
0 & \ddots  &  &  &  &  &  & \vdots\\
 &  & 1  & 0 & \cdots  & \lambda\\
 &  &  & \ddots  &  & \vdots \\
 &  &  &  & \ddots  & 0 \\
 &  &  &  &  & 1\\
 \vdots&  &  &  &  &  & \ddots & 0 \\
0 & \cdots &  &  &  &  &   0 & 1
\end{pmatrix}
\begin{aligned}
\\ \\ \\ \\
\leftarrow i-te\text{ Zeile}
\\ \\ \\ \\ \\ \\ \\ \\ \\
\end{aligned}
$$

## Beispiel in Wolfram Mathematica

Probieren Sie zuerst aus, wie eine Matrix `B2 aussehen muss, damit nach Ausführung der Matrixmultiplikation `B.A ` zur zweiten Zeile Ihrer Matrix A das Doppelte der dritten Zeile hinzugefügt wurde.

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
    {0, 1, 2, 0},
    {0, 0, 1, 0},
    {0, 0, 0, 1}
   });
B.A //MatrixForm
```

> [!success] Output

$$
\left(  
\begin{array}{cccccccc}  
 1 & 2 & 1 & 3 & 6 & 6 & 1 & 0 \\  
 3 & 6 & 8 & 4 & 16 & 4 & 12 & 17 \\  
 1 & 2 & 3 & 1 & 7 & 1 & 5 & 8 \\  
 1 & 1 & 9 & 2 & 6 & 2 & 9 & 5 \\  
\end{array}  
\right)
$$