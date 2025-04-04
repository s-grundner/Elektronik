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

Mit der Methode Variation der Konstanten können Lösungsansätze zu inhomogenen Differenzialgleichungen 1. Ordnung gefunden werden. Sie ist außerdem die allgemeine Lösungformel zur Lösung von [LTI-Systemen](../../Systemtheorie/LTI-Systeme.md#Lösung%20der%20Zustandsgleichungen)

- [M2, Variation der Konstanten - Lubov, Vassilevskaya](http://math-grain.de/download/m2/dgl/variation/variation-konst-1.pdf)
- [Inhomogene lineare DG erster Ordnung](https://statmath.wu.ac.at/~leydold/MOK/HTML/node182.html)

## Lösungsansatz für Inhomogene lineare DGL-Systeme 1. Ordnung

$$ x_{p}(t)= X(t)\cdot c(t) $$

wobei $X(t)$ die [Fundamentalmatrix](Fundamentalmatrix.md) ist.

> [!hint] Herleitung zur Variation der Konstanten
>  
> Durch ableiten unter anwendung der [Produktregel](Produktregel.md):
> 
> $$
> \begin{align}
> \dot{x}_{p}(t) &= \dot{X}(t)\cdot c(t)+X(t)\cdot \dot{c}(t) = A(t)\cdot \underbrace{ X(t)\cdot c(t) }_{ x_{p}(t) }+ X(t)\cdot \dot{c}(t) \overset{ ! }{ = } A(t)\cdot x_{p}(t)+b(t)  \\
> &\implies b(t) = X(t) \dot{c}(t)\implies c(t) = \int_{t_{0}}^{t}X(\uptau)^{-1}b(\uptau)\mathrm{~d}\uptau
> \end{align}
> $$

### Allgemeine Lösung

Die Allgemeine Lösung ist die Linearkomination aller Lösungen, d.h jene von $x_{h}$ und $x_{p}$:

$$
x(t) = \underbrace{ x_{h}(t) }_{ X(t)c } + \underbrace{ x_{p}(t) }_{ X(t)c(t) }
$$

Damit sind alle Lösungen des inhomogenen Systems gegeben durch

$$
x(t)=X(t)\left[c+\int_{t_0}^t X(\tau)^{-1} b(\tau) d \tau\right]
$$
mit $c \in \mathbb{R}^m$. $c$ ist noch nicht den Anfangswerten angepasst. 



### Eindeutige Lösung

Die eindeutige Lösung des inhomogenen AWP ist gegeben durch (siehe [FM-S1](Fundamentalmatrix.md#^FM-S1))

> [!satz] **S1 - VARK)** Variation der Konstanten ^VARK
> Durch Variation der Konstanten ist eine Eindeutige Lösung des inhomogenen AWP gegeben durch:
> 
> $$x\left(t ; t_0, x_0\right)=X(t)\left[X\left(t_0\right)^{-1} x_0+\int_{t_0}^t X(\tau)^{-1} b(\tau) d \tau\right]\tag{VARK}$$
> 


oder mit Hilfe des [Matrizanten](Fundamentalmatrix.md#^TRSM) $\mathbf{\Phi}$ durch

$$
x\left(t ; t_0, x_0\right)=\mathbf{\Phi}(t)\left[x_0+\int_{t_0}^t  \mathbf{\Phi}(\tau)^{-1} b(\tau) d \tau\right] .
$$
