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
  - Linearität
keywords:
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 23. Januar 2024
professor:
  - Andreas Neubauer
title: Lineare Abbildungen
---
 

# Lineare Abbildungen

> [!def] **D1 - LINA)** Seien $X$ und $Y$ $\mathbb{K}$-[Vektorräume](Vektorraum.md). ^LINA
> Eine [Abbildung](Abbildung.md) $L: X \rightarrow Y$ heißt linear, wenn sie *Additivität* und *Homogenität* erfüllen.
>
> > [!info]- **(a)** Additivität: $\forall x_1, x_2 \in X: L\left(x_1+x_2\right)=L\left(x_1\right)+L\left(x_2\right)$ 
> > für alle $x_{1}$ und alle $x_{2}$ im $X$-[Vektorraum](Vektorraum.md) gilt, dass die Abbildung $L$ von $x_{1}+x_{2}$ gleich der Summe von $L(x_{1})$ und $L(x_{2})$ ist.
>
> > [!info]- **(b)** Homogenität: $\forall x \in X, \forall \lambda \in \mathbb{K}: L(\lambda x)=\lambda L(x)$  
> für alle $x$ im $X$ [Vektorraum](Vektorraum.md) und alle $\lambda$ aus $\mathbb{K}$ gilt, dass die Abbildung $L$ von $\lambda \cdot x$ gleich $\lambda$ mal die Abbildung $L(x)$ ist


1. Eine lineare Abbildung heißt auch linearer Operator oder *Homomorphismus*.
	- Ist die Abbildung zusätzlich [bijektiv](Abbildung.md), so nennt man sie *Isomorphismus*.
2. Gilt $X=Y$, so heißt eine lineare Abbildung auch *Endomorphismus*.
3. Die Menge aller linearen Abbildungen von $X$ nach $Y$ bezeichnen wir mit $L(X, Y)$.
	- Für $L(X, X)$ schreiben wir kurz: $L(X)$
4. Die kombination aus Homogenität und Additivität heißt **Superposition**.

## Kern und Bild

Seien $X$ und $Y$ ein $\mathbb{K}$ [Vektorraum](Vektorraum.md) (also entweder $\mathbb{R}$ oder $\mathbb{C}$), $\mathbf{A}: X \to Y$

> [!def] **D1 - BILD)** Das Bild sind alle linear Unabhängige **Spalten** der Linearenabbildung $\mathbf{A}$. ^BILD
>
> $$
> \mathcal{R}(\mathbf{A}) := \mathbf{A}(X)
> $$
> 
> - oft auch $\operatorname{im}(L)$ (von *image*)
> - Mit einer Linearkombination des Bildes, Lässt sich aus $X$ der gesamte Raum $Y$ erreichen.

Die Dimension des Bild ist die Anzahl der Linear Unabhängigen Spalten

> [!def] **D2 - KERN)** Das System $\mathbf{Ax}$ das auf die Null abbildet (*Urbild der $0$*) ist der **Kern** (oder *Nullraum*) ^KERN
>$$\mathcal{N}(\mathbf{A}):=\{\mathbf{x} \in X: \mathbf{Ax}=0\}=A^{-1}(\{0\})$$ 
> 
> - oft auch $\operatorname{ker}(\mathbf{A})$ (von *kernel*)
> - Der Ausdruck $\mathbf{Ax}=0$ wird als Kerngleichung bezeichnet

Der Kern ist immer eine [Lineare Hülle](Lineare%20Hülle.md) aus Vektoren in $X$. Die Dimension des Kerns sind die Anzahl an Vektoren die das System $\mathbf{Ax}=0$ lösen. Pro Lineare Abhängigkeit der **Zeilenvektoren** von $\mathbf{A}$ steigt die Dimension des Kerns um eins.


>[!important] Die Dimension des Kerns plus die Dimension des Bildes ist die Dimension des Defnitionsvektorraum $X$  
> $\operatorname{dim}(\mathcal{R}(\mathbf{A}))+\operatorname{dim}(\mathcal{N}(\mathbf{A}))=\operatorname{dim}(X)$  

### Injektivität, Surjektivität und Bijektivität

1. Nur wenn der Kern der Nullvektor ist, dann ist die Lineare Abbildung [Injektiv](Abbildung.md).
2. Wenn das Bild einer Linearen Abbildung dem Zielvektorraum ($Y$) entspricht, ist die Lineare Abbildung [surjektiv](Abbildung.md).
3. Trifft beides zu, ist die Lineare Abbildung *[bijektiv](Abbildung.md)* 

> [!info] $L: X \to Y$  
> [Injektiv](Abbildung.md): $\operatorname{ker}(\mathbf{A}) = \boldsymbol{0}$, $\operatorname{dim}(\operatorname{ker}(\mathbf{A})) = 0$  
> [Surjektiv](Abbildung.md): $\operatorname{im}(\mathbf{A}) = Y$  
> [Bijektiv](Abbildung.md): $\operatorname{ker}(\mathbf{A}) = \boldsymbol{0} \wedge \operatorname{im}(A) = Y$

# Tags

[Homomorphismus ...](https://www.youtube.com/watch?v=0wKsFNLR15g)  
[Nützliche Sätze zu Bild und Kern](https://www.youtube.com/watch?v=ub4hx65xpHM)
[3b1b](https://www.youtube.com/watch?v=v8VSDg_WQlA)