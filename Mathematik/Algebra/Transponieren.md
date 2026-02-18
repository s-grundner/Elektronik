---
tags:
aliases:
  - Hermitesche Matrix
  - Symmetrische Matrix
  - Hermitesche Transposition
  - Transposition
keywords:
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 14th January 2026
professor:
  - Andreas Neubauer
release: true
title: Transponieren
---


# Transponieren von Matrizen

> [!question] Siehe definition der [Matrix](Matrix.md)

> [!def] **D - Transposition)** Sei $\mathbf{A} = (a_{ij}) \in \mathbb{K}^{m\times n}$, dann ist die zu $\mathbf{A}$ **hermitesch transponierte** Matrix gegeben durch 
> 
> $$
> \mathbf{A}^T := (a_{ji})
> $$
> 
> - Gilt $\mathbf{A}^T = \mathbf{A}$, heißt die Matrix **symmetrisch**. Dabei gilt implizit, dass $m=n$ (Die Matrix ist quadratisch).

Werte werden um die Diagonale gespiegelt:

$$
\begin{align*}
&\mathbf{A} = \begin{pmatrix}
A_{11} & A_{12}\\
A_{21} & A_{22}
\end{pmatrix}
&&\mathbf{A}^{T} = \begin{pmatrix}
A_{11} & A_{21}\\
A_{12} & A_{22}
\end{pmatrix}
\\\\
&\mathbf{B} = \begin{pmatrix}
B_{11} & B_{12} & B_{13}\\
B_{21} & B_{22} & B_{23}
\end{pmatrix}
&&\mathbf{B}^{T} = \begin{pmatrix}
B_{11} & B_{21}\\
B_{12} & B_{22}\\
B_{13} & B_{23}\\
\end{pmatrix}
\end{align*}
$$

## Hermitsche Transposition

> [!def] **D - Hermitesche Transposition)** Sei $\mathbf{A} = (a_{ij}) \in \mathbb{C}^{m\times n}$, dann ist die zu $\mathbf{A}$ **hermitesche** Matrix gegeben durch 
> 
> $$
> \mathbf{A}^H := (a_{ji}^*)
> $$
> 
> - Gilt $\mathbf{A}^H = \mathbf{A}$, heißt die Matrix **hermitesch**. Dabei gilt implizit, dass $m=n$ (Die Matrix ist quadratisch).


d.h. Konjugation $(\cdot)^*$ und Transposition $(\cdot)^T$ zusammen.