---
tags: []
aliases: ["Kettenmatrizen"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 14th November 2022
---

# Ketten[matrix](../Mathe/mathe%20(4)/Matrixrechnung.md)

$$
\begin{pmatrix}
U_{1}\\I_{1}
\end{pmatrix}
=
\begin{pmatrix}
A_{11} & A_{12}\\
A_{21} & A_{22}
\end{pmatrix}
\cdot
\begin{pmatrix}
U_{2}\\I_{2}
\end{pmatrix}
$$
$$
\begin{align*}
&&\left.A_{11}=\frac{U_{1}}{U_{2}}\right|_{I_{2}=0, \text{ Leerlauf}}
&&\left.A_{12}=\frac{U_{1}}{I_{2}}\right|_{U_{2}=0, \text{ Leerlauf}}
&&\left.A_{21}=\frac{I_{1}}{U_{2}}\right|_{I_{2}=0, \text{ Kurzschluss}}
&&\left.A_{22}=\frac{I_{1}}{I_{2}}\right|_{U_{2}=0, \text{ Kurzschlus}}
\end{align*}
$$

# [Impedanz](Impedanz.md)[matrix](../Mathe/mathe%20(4)/Matrixrechnung.md)

$\underline{U}_{1}= \underline{I}_{1}\cdot\underline{Z}_{11}+\underline{I}_{2}\cdot\underline{Z}_{12}$  
$\underline{U}_{2}= \underline{I}_{1}\cdot\underline{Z}_{21}+\underline{I}_{2}\cdot\underline{Z}_{22}$

Als [Matrix](../Mathe/mathe%20(4)/Matrixrechnung.md): (Zeile $\cdot$ Spalte)
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
\mathbb{U} = \mathbb{Z} \cdot \mathbb{I}
$$
|                      |                                 |
| -------------------- | ------------------------------- |
| $\underline{Z}_{11}$ | Leerlauf Eingangswiderstand     |
| $\underline{Z}_{12}$ | Leerlauf Rückwirkunswiderstand  |
| $\underline{Z}_{21}$ | Leerlauf Übertragungswiderstand |
| $\underline{Z}_{22}$ | Leerlauf Ausgangswiderstand     | 

# Admittanz[matrix](../Mathe/mathe%20(4)/Matrixrechnung.md)

$\underline{I}_{1}= \underline{U}_{1}\cdot\underline{Y}_{11}+\underline{U}_{2}\cdot\underline{Y}_{12}$  
$\underline{I}_{2}= \underline{U}_{1}\cdot\underline{Y}_{21}+\underline{U}_{2}\cdot\underline{Y}_{22}$

Als [Matrix](../Mathe/mathe%20(4)/Matrixrechnung.md): (Zeile $\cdot$ Spalte)
$$
\begin{pmatrix}
    \underline{I}_{1} \\ 
    \underline{I}_{2}
\end{pmatrix}
=
\begin{pmatrix}
    \underline{Y}_{11} & \underline{Y}_{12} \\
    \underline{Y}_{21} & \underline{Y}_{22}
\end{pmatrix}
\cdot
\begin{pmatrix}
    \underline{U}_{1} \\ 
    \underline{U}_{2}
\end{pmatrix}
\\
$$
$$
\mathbb{I} = \mathbb{Y} \cdot \mathbb{U}
$$

# Quellen