---
tags:
  - Algebra/LineareAlgebra
aliases:
  - LGS
  - Lineares Gleichungssystem
subject:
  - mathe
source:
  - Christa Sartorius
created: 19th August 2022
---

# Lineare Gleichungssysteme

Viele interessante Aufgabenstellungen führen auf sogenannte lineare Gleichungssysteme:

$$
A x=b
$$

Dabei sind die [Matrix](Matrix.md) $A \in \mathbb{K}^{m \times n}$ und der *Störvektor* $b \in \mathbb{K}^m$ gegeben und $x \in \mathbb{K}^n$ gesucht. Sowohl $x$ als auch $b$ werden hier als Spaltenvektoren aufgefasst. Ist $b=0$, so spricht man von einem *homogenen* Gleichungssystem, ansonsten von einem *inhomogenen*.  

Ist $A=\left(a_{i j}\right)$, so lautet das System aus multipliziert wie folgt:

$$
\begin{aligned}
a_{11} x_1+a_{12} x_2+\ldots+a_{1 n} x_n & =b_1 \\
a_{21} x_1+a_{22} x_2+\ldots+a_{2 n} x_n & =b_2 \\
& \vdots \\
a_{m 1} x_1+a_{m 2} x_2+\ldots+a_{m n} x_n & =b_m
\end{aligned}
$$

> [!info] Lösbarkeit:  
> Das LGS heißt $\begin{cases}\text { unlösbar, } & \text { falls }|L(A, \vec{b})|=0, \\ \text { eindeutig lösbar, } & \text { falls }|L(A, \vec{b})|=1 \\ \text { mehrdeutig lösbar, } & \text { falls }|L(A, \vec{b})|>1\end{cases}$

> [!info] Anzahl der Gleichungen:  
> Das LGS heißt $\begin{cases}\text { bestimmt, } & \text { falls } m=n, \\ \text { überbestimmt, } & \text { falls } m>n, \\ \text { unterbestimmt, } & \text { falls } m<n\end{cases}$

> [!info] Art des Störvektors:  
> Das LGS heißt $\begin{cases}\text { homogen, } & \text { falls } \vec{b}=\overrightarrow{0} \\ \text { inhomogen, } & \text { sonst. }\end{cases}$

# Tags