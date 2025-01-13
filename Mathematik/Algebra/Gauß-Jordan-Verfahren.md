---
tags:
  - Algorithmus/Mathe
aliases:
  - Inverse
  - Invertierbarkeit
  - Gauß-Jordan
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 27. Januar 2024
professor:
  - Andreas Neubauer
satz:
  - INVB
---
 

# Invertieren einer Matrix


> [!satz] **S1 - INVB)** Invertierbarkeit
> 
> Eine quadratische [Matrix](Matrix.md) ($A \in \mathbb{R}^{n\times n}$) ist genau dann invertierbar, wenn ihr Rang gleich $n$ ist.
> Eine Matrix ist nur invertierbar, wenn ihre [Determinante](Determinante.md) ungleich 0 ist.

Systematisch lässt sich eine [Matrix](Matrix.md) mit dem Gauß-Jordan-Verfahren Invertieren


## 2x2 Matrix

$$
\mathbf{A}^{-1}=\begin{pmatrix}
a & b \\ c & d
\end{pmatrix}^{-1}= \frac{1}{\underbrace{ ad-bc }_{ \det \mathbf{A} }} \begin{pmatrix}
d & -b \\ -c & a
\end{pmatrix}
$$