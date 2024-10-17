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
 

# Skalierungsmatrix

Skalierungsmatrix $S_i(\lambda)$ mit $\lambda \neq 0$ : für ihre Zeilenvektoren $\vec{z_1}, \ldots, \vec{z_n}$ gilt

$$
\vec{z_k}=\left\{\begin{array}{ll}
\lambda \vec{e_i} & \text { falls } k=i, \\
\vec{e_k} & \text { falls } k \neq i,
\end{array} \right.
$$

$$
S_i(\lambda):=
\begin{pmatrix}
1 & & & & & \cdots & 0 \\
0 & \ddots & & & & & \vdots \\
& & 1\\
& & & \lambda\\
& & & & 1 \\
\vdots & & & & & \ddots & 0 \\
0 & \cdots & & & & 0 & 1
\end{pmatrix}
\leftarrow i\text {-te Zeile }
$$