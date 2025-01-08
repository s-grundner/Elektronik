---
tags:
  - Algebra/LineareAlgebra
aliases:
  - linearen Abbildung
  - lineare Abbildung
  - Definition 10.1
  - Bemerkung 10.11
  - Kern
  - Bild
  - Kernel
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 23. Januar 2024
professor:
  - Andreas Neubauer
---
 

# Lineare [Abbildungen](Algebra/Abbild.md)

> [!def] **D1 - LINA)** Seien $X$ und $Y$ $\mathbb{K}$-[Vektorräume](Algebra/Vektorraum.md). Eine [Abbildung](Algebra/Abbild.md) $L: X \rightarrow Y$ heißt linear
> 
> wenn sie **(a)** *Additivität* und **(b)** *Homogenität* erfüllen.
> 
> 1. Bei linearen Abbildungen schreibt man statt $L(x)$ meist $L x$.
> 2. Eine lineare Abbildung heißt auch linearer Operator oder *Homomorphismus*.
> 	- Ist die Abbildung zusätzlich [bijektiv](Algebra/Abbild.md), so nennt man sie *Isomorphismus*.
> 1. Gilt $X=Y$, so heißt eine lineare Abbildung auch *Endomorphismus*.
> 2. Die Menge aller linearen [Abbildungen](Algebra/Abbild.md) von $X$ nach $Y$ bezeichnen wir mit $L(X, Y)$.
> 	- Für $L(X, X)$ schreiben wir kurz: $L(X)$

> [!tldr]- **(a)** Additivität oder : $\forall x_1, x_2 \in X: L\left(x_1+x_2\right)=L\left(x_1\right)+L\left(x_2\right)$  
> für alle $x_{1}$ und alle $x_{2}$ im $X$-[Vektorraum](Algebra/Vektorraum.md) gilt, dass die Abbildung $L$ von $x_{1}+x_{2}$ gleich der Summe von $L(x_{1})$ und $L(x_{2})$ ist.

> [!tldr]- **(b)** Homogenität: $\forall x \in X, \forall \lambda \in \mathbb{K}: L(\lambda x)=\lambda L(x)$  
> für alle $x$ im $X$ [Vektorraum](Algebra/Vektorraum.md) und alle $\lambda$ aus $\mathbb{K}$ gilt, dass die Abbildung $L$ von $\lambda \cdot x$ gleich $\lambda$ mal die Abbildung $L(x)$ ist

---

## Kern (kernel) und Bild

> [!INFO] sei $X$ und $Y$ ein $\mathbb{K}$ [Vektorraum](Algebra/Vektorraum.md) (also entweder $\mathbb{R}$ oder $\mathbb{C}$), $L: X \to Y$
> 
> Das Bild das auf die Null abbildet (*Urbild der $0$*) ist der **Kern** (oder *Nullraum*) 
>  
> **Kern**: $\mathcal{N}(L):=\{x \in X: L x=0\}=L^{-1}(\{0\})$ oft auch $\operatorname{ker}(L)$ (von *kernel*)
> **Bild**: $\mathcal{R}(L)= L(X)$ oft auch $\operatorname{im}(L)$ (von *image*)

>[!important] Die Dimension des Kerns plus die Dimension des Bildes ist die Dimension des Defnitionsvektorraum $X$  
> $\operatorname{dim}(\mathcal{R}(L))+\operatorname{dim}(\mathcal{N}(L))=\operatorname{dim}(X)$  

### Injektivität, Surjektivität und Bijektivität

1. Nur wenn der Kern der Nullvektor ist, dann ist die Lineare Abbildung [Injektiv](Algebra/Abbild.md).
2. Wenn das Bild einer Linearen Abbildung dem Zielvektorraum ($Y$) entspricht, ist die Lineare Abbildung [surjektiv](Algebra/Abbild.md).
3. Trifft beides zu, ist die Lineare Abbildung *[bijektiv](Algebra/Abbild.md)* 

> [!info] $L: X \to Y$  
> [Injektiv](Algebra/Abbild.md): $\operatorname{ker}(L) = \boldsymbol{0}$, $\operatorname{dim}(\operatorname{ker}(L)) = 0$  
> [Surjektiv](Algebra/Abbild.md): $\operatorname{im}(L) = Y$  
> [Bijektiv](Algebra/Abbild.md): $\operatorname{ker}(L) = \boldsymbol{0} \wedge \operatorname{im}(L) = Y$


---

## Bemerkung 10.11

Aus den Sätzen 10.6 und 10.10 folgt übrigens, dass jede lineare Abbildung $L: X \rightarrow Y$ [Lipschitz-stetig](Analysis/Stetigkeit.md) ist, wenn $X, Y$ endlich-dimensional sind:
Seien $B, C$ irgendwelche Basen für $X$ bzw. $Y$ und seien $n$ bzw. $m$ die Dimensionen von $X$ bzw. $Y$.

Dann folgt mit dem jeweiligen [Skalarprodukt](Skalarprodukt.md) und der davon induzierten Norm aus [Satz 10.10](Skalarprodukt.md) sowie der Koordinatenmatrix $A_L$ unter Verwendung der Cauchy-Schwarzschen Ungleichung (siehe Satz 6.15 (a)):

$$
\|L x\|^2=\sum_{i=1}^m\left(\sum_{j=1}^n a_{i j}^L x_j\right)^2 \leq \sum_{i=1}^m\left(\sum_{j=1}^n\left(a_{i j}^L\right)^2\right)\left(\sum_{j=1}^n x_j^2\right)=\left(\sum_{i=1}^m \sum_{j=1}^n\left(a_{i j}^L\right)^2\right)\|x\|^2
$$

Also:

$$
\|L x\| \leq c\|x\| \quad \text { mit } \quad c:=\left(\sum_{i=1}^m \sum_{j=1}^n\left(a_{i j}^L\right)^2\right)^{\frac{1}{2}}
$$

Diese Zahl hängt natürlich von den gewählten Basen ab, existiert aber für jede Wahl.

# Tags

[Homomorphismus ...](https://www.youtube.com/watch?v=0wKsFNLR15g)  
[Nützliche Sätze zu Bild und Kern](https://www.youtube.com/watch?v=ub4hx65xpHM)
[3b1b](https://www.youtube.com/watch?v=v8VSDg_WQlA)