---
title: Admittanzmatrix
tags:
aliases:
created: 15th January 2026
release: true
---

# Admittanzmatrix

${I}_{1}= {U}_{1}\cdot{Y}_{11}+{U}_{2}\cdot{Y}_{12}$  
${I}_{2}= {U}_{1}\cdot{Y}_{21}+{U}_{2}\cdot{Y}_{22}$

Als [Matrix](../../Mathematik/Algebra/Matrix.md): (Zeile $\cdot$ Spalte)

$$
\begin{pmatrix}
    {I}_{1} \\ 
    {I}_{2}
\end{pmatrix}
=
\begin{pmatrix}
    {Y}_{11} & {Y}_{12} \\
    {Y}_{21} & {Y}_{22}
\end{pmatrix}
\cdot
\begin{pmatrix}
    {U}_{1} \\ 
    {U}_{2}
\end{pmatrix}
\\
$$

$$
\mathbf{i} = \mathbf{Y} \cdot \mathbf{u}
$$

$$
\begin{align}
Y_{11} = \frac{I_{1}}{U_{1}} \Bigg|_{U_{2}=0} &&
Y_{12} = \frac{I_{1}}{U_{2}} \Bigg|_{U_{1}=0} \\
Y_{21} = \frac{I_{2}}{U_{1}} \Bigg|_{U_{2}=0} &&
Y_{22} = \frac{I_{2}}{U_{2}} \Bigg|_{U_{1}=0} \\
\end{align}
$$