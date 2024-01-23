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

## Kern (kernel)

Das Bild das auf die Null abbildet (*Urbild der $0$*) ist der *Kern* (oder *Nullraum*)

$$
\mathcal{N}(L):=\{x \in X: L x=0\}=L^{-1}(\{0\})
$$
> [!INFO] $X$ ist ein $\mathbb{K}$ Vektorraum (also entweder $\mathbb{R}$ oder $\mathbb{C}$)

## Bild

$$
\mathcal{R}(L)= L(X)
$$

> [!INFO] $X$ ist ein $\mathbb{K}$ Vektorraum (also entweder $\mathbb{R}$ oder $\mathbb{C}$)



# Tags

[Homomorphismus ...](https://www.youtube.com/watch?v=0wKsFNLR15g)