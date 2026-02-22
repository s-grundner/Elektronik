---
tags:
aliases:
  - Definition 10.23
  - Satz 10.25
keywords:
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 17. April 2024
professor:
---
 

# Definitheit

Ermittlung mittels [Eigenwerte](Eigenvektor.md)

> [!def] **D1 - DEFI)** Sei $\mathbf{A} \in \mathbb{R}^{n \times n}$ symmetrisch. $A$ heißt ^D1-DEFI
> 
> 1. **positiv semidefinit**
>    - $\mathbf{x}\mathbf{A}\mathbf{x}^{T} \geq 0\quad\forall \mathbf{x} \in \mathbb{R}^{n}$
>    - wenn alle [Eigenwerte](Eigenvektor.md) von $\mathbf{A}$ nicht negativ ($\geq0$) sind. 
> 2. **positiv definit**
>    - $\mathbf{x}\mathbf{A}\mathbf{x}^{T} > 0\quad\forall \mathbf{x} \in \mathbb{R}^{n}$
>    -  wenn alle Eigenwerte von $\mathbf{A}$ positiv ($>0$) sind. 
> 3. **negativ semidefinit**
>    - $\mathbf{x}\mathbf{A}\mathbf{x}^{T} \leq 0\quad\forall \mathbf{x} \in \mathbb{R}^{n}$
>    - wenn alle Eigenwerte von $\mathbf{A}$ nicht positiv ($\leq 0$) sind. 
> 4. **negativ definit**
>    - $\mathbf{x}\mathbf{A}\mathbf{x}^{T} < 0\quad\forall \mathbf{x} \in \mathbb{R}^{n}$
>    - wenn alle Eigenwerte von $\mathbf{A}$ negativ ($<0$) sind. 
> 5. **indefinit** sonst. *(Es gibt positive und negative Eigenwerte)*

Die definitheit symmetrischer Matrizen kann auch mittels [Hauptminoren](Hauptminoren.md) gezeigt werden.

> [!satz] **S1 - DEFI)** Sei $\mathbf{A} \in \mathbb{R}^{n \times n}$ symmetrisch. Dann gelten die Eigenschaften ^S1-DEFI
> 1. $\mathbf{A}$ ist **positiv semidefinit**, wenn $M_i\geq 0$
> 2. $\mathbf{A}$ ist **positiv definit**, wenn $M_i>0$
> 3. $\mathbf{A}$ ist **negativ semidefinit**, wenn $(-1)^i M_i\geq 0$
> 4. $\mathbf{A}$ ist **negativ definit**, wenn $(-1)^i M_i>0$
> 
>  $\forall i \in\{1, \ldots, n\}$
>  



---

[[../../_assets/pdf/definitheit.pdf]]
