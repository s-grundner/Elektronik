---
tags:
  - Algebra/LineareAlgebra
aliases:
  - linearen Abbildung
  - lineare Abbildung
  - Kern
  - Kernel
  - Superposition
  - Bild
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

> [!tldr]- **(a)** Additivität: $\forall x_1, x_2 \in X: L\left(x_1+x_2\right)=L\left(x_1\right)+L\left(x_2\right)$  
> für alle $x_{1}$ und alle $x_{2}$ im $X$-[Vektorraum](Algebra/Vektorraum.md) gilt, dass die Abbildung $L$ von $x_{1}+x_{2}$ gleich der Summe von $L(x_{1})$ und $L(x_{2})$ ist.

> [!tldr]- **(b)** Homogenität: $\forall x \in X, \forall \lambda \in \mathbb{K}: L(\lambda x)=\lambda L(x)$  
> für alle $x$ im $X$ [Vektorraum](Algebra/Vektorraum.md) und alle $\lambda$ aus $\mathbb{K}$ gilt, dass die Abbildung $L$ von $\lambda \cdot x$ gleich $\lambda$ mal die Abbildung $L(x)$ ist

Die kombination der beiden eigenschaften **(a)** und **(b)** führt zur **Superposition**

---

## Kern und Bild

> [!INFO] sei $X$ und $Y$ ein $\mathbb{K}$ [Vektorraum](Algebra/Vektorraum.md) (also entweder $\mathbb{R}$ oder $\mathbb{C}$), $L: X \to Y$
> 
> Das Bild das auf die Null abbildet (*Urbild der $0$*) ist der **Kern** (oder *Nullraum*) 
>  
> **Kern**: $\mathcal{N}(L):=\{x \in X: L x=0\}=L^{-1}(\{0\})$ oft auch $\operatorname{ker}(L)$ (von *kernel*)
> **Bild**: $\mathcal{R}(L)= L(X)$ oft auch $\operatorname{im}(L)$ (von *image*)

Der Ausdruck $Lx=0$ wird als Kerngleichung bezeichnet

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


# Tags

[Homomorphismus ...](https://www.youtube.com/watch?v=0wKsFNLR15g)  
[Nützliche Sätze zu Bild und Kern](https://www.youtube.com/watch?v=ub4hx65xpHM)
[3b1b](https://www.youtube.com/watch?v=v8VSDg_WQlA)