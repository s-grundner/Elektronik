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
wobei $X(t)$ die Fundamentalmatrix ist.

Ableiten:

$$
\begin{align}
\dot{x}_{p}(t) = \dot{X}(t)\cdot c(t)+X(t)\cdot \dot{c}(t) &= A(t)\cdot \underbrace{ X(t)\cdot c(t) }_{ x_{p}(t) }+ X(t)\cdot \dot{c}(t) \\
&\overset{ ! }{ = } A(t)\cdot x_{p}(t)+b(t) \\
\end{align}
$$

$$
\implies b(t) = X(t) \dot{c}(t)\implies c(t) = \int_{t_{0}}^{t}X(\uptau)^{-1}b(\uptau)\mathrm{~d}\uptau
$$

Also löst: 

$$
x_{p}(t)= 
$$

