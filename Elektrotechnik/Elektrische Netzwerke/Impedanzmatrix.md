---
title: Impedanzmatrix
tags:
aliases:
created: 27th March 2026
release: true
---

# Impedanzmatrix

$U_{1}= I_{1}\cdot Z_{11}+ I_{2}\cdot Z_{12}$  
$U_{2}= I_{1}\cdot Z_{21}+ I_{2}\cdot Z_{22}$

$$
\begin{pmatrix}
    {U}_{1} \\ 
    {U}_{2}
\end{pmatrix}
=
\begin{pmatrix}
    {Z}_{11} & {Z}_{12} \\
    {Z}_{21} & {Z}_{22}
\end{pmatrix}
\cdot
\begin{pmatrix}
    {I}_{1} \\ 
    {I}_{2}
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


$$
\begin{align}
Z_{11} = \frac{U_{1}}{I_{1}} \Bigg|_{I_{2}=0} &&
Z_{12} = \frac{U_{1}}{I_{2}} \Bigg|_{I_{1}=0} \\
Z_{21} = \frac{U_{2}}{I_{1}} \Bigg|_{I_{2}=0} &&
Z_{22} = \frac{U_{2}}{I_{2}} \Bigg|_{I_{1}=0} \\
\end{align}
$$