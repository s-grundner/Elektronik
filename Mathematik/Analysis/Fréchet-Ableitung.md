---
tags: 
aliases:
  - totale Differenzierbarkeit
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 28. Februar 2024
professor:
---
 

# # Fréchet-Ableitung

> [!info] Die **Fréchet-Ableitung** verallgemeinert den Befgriff der Ableitung



> [!important] Sei $A \subset \mathbb{R}^n$ offen, $f: A \rightarrow \mathbb{R}^m$ und $x_0 \in A$.
> $f$ heißt Fréchet-differenzierbar, [Total Differenzierbar](Total%20Differenzierbar.md) (oder kurz: differenzierbar) in $x_{0}$ wenn: 
> > [!tldr]- $\exists L \in L\left(\mathbb{R}^n, \mathbb{R}^m\right) \exists r: \mathbb{R}^n \rightarrow \mathbb{R}^m$
> > eine [[Lineare Abbildungen|Lineare Abbildung]] $L$ aus der Menge aller Linearen Abbildungen von $\mathbb{R}^n$ nach $\mathbb{R}^m$ existiert, sowohl ein *Rest* $r(h)$ existiert, der von $\mathbb{R}^n$ nach $\mathbb{R}^m$ abbildet.
> > (Also im Raum der [linearen Abbildung](../Lineare%20Abbildungen.md) bleibt $\to$ sonst ist der Rest unstetig im Raum)
> $$
\forall h \in \mathbb{R}^n, x_0+h \in A: f\left(x_0+h\right)=f\left(x_0\right)+L h+r(h) \wedge \lim _{h \rightarrow 0} \frac{\mid r(h)\mid}{\mid h \mid}=0
> $$
> $L$ heißt *Fréchet*-Ableitung oder *totale* Ableitung von $f$ in $x_0$,
> - Symbol: $L=f^{\prime}(x_{0})$.
> 
> Für $n=m=1$ ist die $1 \times 1$-Matrix $L$ gleich $f^{\prime}\left(x_0\right)$ aus Definition 11.1. Für $n=1$ kann auch $f: I \rightarrow \mathbb{R}^m$ mit $I$ Intervall behandelt werden.



> [!important] **Satz 11.10.** Sei $A \subset \mathbb{R}^n$ offen, $x_0 \in A$ und $f: A \rightarrow \mathbb{R}^m$ in $x_0$ stetig differenzierbar. Dann ist $f$ in $x_0$ Fréchet-differenzierbar.
> 
> Es gilt also: $f \in C^1\left(A, \mathbb{R}^m\right) \Longrightarrow f$ Fréchet-differenzierbar $\Longrightarrow$ alle partiellen Ableitungen von $f$ existieren; es gilt keine der möglichen Umkehrungen. Die Fréchetableitung ist, falls sie existiert, durch die [Jacobi-Matrix](../Gradient.md) gegeben.

Der Zusammenhang zwischen der Fréchet Ableitung und der partiellen Ableitung ist durch [Satz 11.18](../Satz%2011.18.md) gegeben 