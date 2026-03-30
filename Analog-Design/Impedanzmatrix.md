---
title: Impedanzmatrix
---
# Impedanzmatrix

$\underline{U}_{1}= \underline{I}_{1}\cdot\underline{Z}_{11}+\underline{I}_{2}\cdot\underline{Z}_{12}$  
$\underline{U}_{2}= \underline{I}_{1}\cdot\underline{Z}_{21}+\underline{I}_{2}\cdot\underline{Z}_{22}$

Als [Matrix](../Mathematik/Algebra/Matrix.md): (Zeile $\cdot$ Spalte)

$$
\begin{pmatrix}
    \underline{U}_{1} \\ 
    \underline{U}_{2}
\end{pmatrix}
=
\begin{pmatrix}
    \underline{Z}_{11} & \underline{Z}_{12} \\
    \underline{Z}_{21} & \underline{Z}_{22}
\end{pmatrix}
\cdot
\begin{pmatrix}
    \underline{I}_{1} \\ 
    \underline{I}_{2}
\end{pmatrix}
\\
$$

$$
\mathbf{u} = \mathbf{Z} \cdot \mathbf{i}
$$

| $\underline{Z}_{11}$ | Leerlauf Eingangswiderstand     |
| -------------------- | ------------------------------- |
| $\underline{Z}_{12}$ | Leerlauf Rückwirkunswiderstand  |
| $\underline{Z}_{21}$ | Leerlauf Übertragungswiderstand |
| $\underline{Z}_{22}$ | Leerlauf Ausgangswiderstand     |