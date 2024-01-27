---
tags: 
aliases:
  - linearen Abbildung
  - lineare Abbildung
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - WS23
created: 23. Januar 2024
professor:
---
 

# Lineare Abbildungen

> [!important] Definition 10.1. Seien $X$ und $Y$ $\mathbb{K}$-Vektorräume. Eine Abbildung $L: X \rightarrow Y$ heißt linear: $\Longleftrightarrow$
>
> $$\forall x_1, x_2 \in X: L\left(x_1+x_2\right)=L\left(x_1\right)+L\left(x_2\right)$$
>
> $$\wedge$$
>
> $$\forall x \in X ,\forall \lambda \in \mathbb{K}: L(\lambda x)=\lambda L(x)$$
>
> - Bei linearen Abbildungen schreibt man statt $L(x)$ meist $L x$.
> - Eine lineare Abbildung heißt auch linearer Operator oder *Homomorphismus*.
> 	- Ist die Abbildung zusätzlich [bijektiv](Abbild.md), so nennt man sie *Isomorphismus*.
> - Gilt $X=Y$, so heißt eine lineare Abbildung auch *Endomorphismus*.
> - Die Menge aller linearen Abbildungen von $X$ nach $Y$ bezeichnen wir mit $L(X, Y)$.
> 	- Für $L(X, X)$ schreiben wir kurz: $L(X)$

> [!tldr] $\forall x_1, x_2 \in X: L\left(x_1+x_2\right)=L\left(x_1\right)+L\left(x_2\right)$  
> für alle $x_{1}$ und alle $x_{2}$ im $X$-Vektorraum gilt, dass die Abbildung $L$ von $x_{1}+x_{2}$ gleich der Summe von $L(x_{1})$ und $L(x_{2})$ ist.

> [!tldr] $\forall x \in X, \forall \lambda \in \mathbb{K}: L(\lambda x)=\lambda L(x)$  
> für alle $x$ im $X$ Vektorraum und alle $\lambda$ aus $\mathbb{K}$ gilt, dass die Abbildung $L$ von $\lambda \cdot x$ gleich $\lambda$ mal die Abbildung $L(x)$ ist

## Kern (kernel) und Bild

> [!INFO] sei $X$ und $Y$ ein $\mathbb{K}$ Vektorraum (also entweder $\mathbb{R}$ oder $\mathbb{C}$), $L: X \to Y$
> 
> Das Bild das auf die Null abbildet (*Urbild der $0$*) ist der *Kern* (oder *Nullraum*)  
> Kern: $\mathcal{N}(L):=\{x \in X: L x=0\}=L^{-1}(\{0\})$ oft auch $im(L)$  
> Bild: $\mathcal{R}(L)= L(X)$ oft auch $ker(L)$

>[!important] Die Dimension des Kerns plus die Dimension des Bildes ist die Dimension des Defnitionsvektorraum $X$  
> $dim(\mathcal{R}(L))+dim(\mathcal{N}(L))=dim(X)$  

### Injektivität, Surjektivität und Bijektivität

1. Nur wenn der Kern der Nullvektor ist, dann ist die Lineare Abbildung Injektiv.
2. Wenn das Bild einer Linearen Abbildung dem Zielvektorraum ($Y$) entspricht, ist die Lineare Abbildung surjektiv.
3. Trifft beides zu, ist die Lineare Abbildung *bijektiv* 

> [!info] $L: X \to Y$  
> Injektiv: $ker(L) = \boldsymbol{0}$, $dim(ker(L)) = 0$  
> Surjektiv: $im(L) = Y$  
> Bijektiv: $ker(L) = \boldsymbol{0} \wedge im(L) = Y$

# Tags

[Homomorphismus ...](https://www.youtube.com/watch?v=0wKsFNLR15g)  
[Nützliche Sätze zu Bild und Kern](https://www.youtube.com/watch?v=ub4hx65xpHM)