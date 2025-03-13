---
tags: 
aliases:
  - Matrix-Exponential
  - Matrixexponential
keywords: 
subject:
  - Mathematik 3
  - VL
semester: WS24
created: 22. Februar 2025
professor:
---
 

# Matrix-Exponentialfunktion

Erinnerung an die Potenzreihe der Exponentialfunktion.

![](Exponentialfunktion.md#^EXP)

Die Potenz-Reihe der Exponentialfunktion kann auf Matrizen erweitert werden:

> [!def] **D1 - EXPM)** Matrix-Exponentialfunktion ^EXPM
> $$ e^{ \mathbf{B} } := \sum_{k=0}^{\infty}\frac{\mathbf{B}^{k}}{k!} $$


$$
\begin{align}
e^{ \mathbf{B} } &= \frac{\mathbf{B}^0}{0!} + \frac{\mathbf{B}^1}{1!} + \frac{\mathbf{B}^2}{2!} + \cdots + \frac{\mathbf{B}^n}{n!} + \cdots \\
&= \mathbb{1} + \mathbf{B} +\frac{\mathbf{B}^2}{2} + \cdots + \frac{\mathbf{B}^n}{n!} + \cdots
\end{align}
$$

Für das Matrixexponential gilt $e^{0}=\mathbb{1}$.

> [!question] Warum?
> $$ e^{0} = \sum_{k=0}^{\infty}\frac{0^k}{k!} = \mathbb{1} $$
> Da $0^{0}$ als $1$ definiert ist, ergibt sich $\mathbb{1}$ für $k=0$.
> 
> Alternative Begründung: $e^{0}=e^{A - A}=e^{A} \cdot e^{ -A }$
> Da für beliebeige Matrizen gilt $A \cdot A^{-1} = \mathbb{1}$, gilt das auch für das Matrix-Exponential.

## Spezialfall: Exponent ist eine Diagonalmatrix


$$
\mathbf{B} = \begin{pmatrix}
\lambda_{1} & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & \lambda_{m}
\end{pmatrix} \implies \mathbf{B}^k = \begin{pmatrix}
\lambda_{1}^k & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & \lambda_{m}^k
\end{pmatrix}
$$

> [!hint] Dass der Exponent der Matrix auf die Einzelkomponenten übergeht Funktioniert nur für Diagonalmatrizen! 
> Das kann mit der Matrixmultiplikation gezeigt werden.

$$
e^{\mathbf{B}} = \sum_{k=0}^{\infty}\frac{\mathbf{B}^k}{k!} = \sum_{k=0}^{\infty}\frac{1}{k!}
\underbrace{ \begin{pmatrix} 
\lambda_{1}^k & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & \lambda_{m}^k
\end{pmatrix} }_{ \operatorname{diag}(\lambda_{1}^{k},\dots,\lambda_{m}^{k}) } = \begin{pmatrix}
e^{ \lambda_{1} } & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & e^{ \lambda_{m} }
\end{pmatrix}
$$
Durch das hineinziehen der Summe in die Matrix, erhalten wir eine Diagonalmatrix mit den Exponentialfunktionen der Diagonalelemente. 