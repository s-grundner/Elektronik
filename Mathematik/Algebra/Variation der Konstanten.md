---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 17. Oktober 2024
professor:
---
 

# Variation der Konstanten

Mit der Methode Variation der Konstanten können Lösungsansätze zu inhomogenen Differenzialgleichungen 1. Ordnung gefunden werden.

- [math-grain.de/download/m2/dgl/variation/variation-konst-1.pdf](http://math-grain.de/download/m2/dgl/variation/variation-konst-1.pdf)
- [Inhomogene lineare DG erster Ordnung](https://statmath.wu.ac.at/~leydold/MOK/HTML/node182.html)

## Inhomogene 

$$
x_{p}(t)= X(t)\cdot c(t)
$$
wobei $X(t)$ die [Fundamentalmatrix](../Fundamentalmatrix.md) ist.

Durch ableiten unter anwendung der Produktregel:

$$
\begin{align}
\dot{x}_{p}(t) &= \dot{X}(t)\cdot c(t)+X(t)\cdot \dot{c}(t) = A(t)\cdot \underbrace{ X(t)\cdot c(t) }_{ x_{p}(t) }+ X(t)\cdot \dot{c}(t) \overset{ ! }{ = } A(t)\cdot x_{p}(t)+b(t)  \\
&\implies b(t) = X(t) \dot{c}(t)\implies c(t) = \int_{t_{0}}^{t}X(\uptau)^{-1}b(\uptau)\mathrm{~d}\uptau
\end{align}
$$

Alle Lösungen des inhomogenen Systems sind dann gegeben durch

$$
x(t)=X(t)\left[c+\int_{t_0}^t X(\tau)^{-1} b(\tau) d \tau\right]
$$

mit $c \in \mathbb{R}^m$. Die eindeutige Lösung des inhomogenen AWP ist gegeben durch (siehe (6.5))

$$
x\left(t ; t_0, x_0\right)=X(t)\left[X\left(t_0\right)^{-1} x_0+\int_{t_0}^t X(\tau)^{-1} b(\tau) d \tau\right]
$$

oder mit Hilfe des Matrizanten durch

$$
x\left(t ; t_0, x_0\right)=X_{t_0}(t)\left[x_0+\int_{t_0}^t X_{t_0}(\tau)^{-1} b(\tau) d \tau\right] .
$$