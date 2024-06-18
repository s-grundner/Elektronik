---
tags: 
aliases:
  - Punktweise Konvergenz
  - Gleichmäßige Konvergenz
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 11. Juni 2024
professor: 
cited:
---
 

# Funktionenfolge

> [!info] Definition 15.1. Für $n \in \mathbb{N}$ seien $f_n: A \rightarrow B$ und $f: A \rightarrow B$ Funktionen.
> Die Funktionenfolge $\left(f_n\right)$ konvergiert
> *(a)* punktweise gegen $f$ (Symbole: $\left.f_n \xrightarrow{\mathrm{pw}} f, f=\mathrm{pw}-\lim _{n \rightarrow \infty} f_n\right): \Longleftrightarrow$
> 
> > [!tldr]- $$\forall x \in A \forall \varepsilon>0 \exists n_0 \in \mathbb{N} \forall n \geq n_0:\left\|f_n(x)-f(x)\right\|<\varepsilon$$
> > Für alle $x$ in $A$ und für alle $\varepsilon > 0$ gibt es ein $n_{0}$ aus $\mathbb{N}$, sodass für alle $n \geq n_{0}$ gilt
> 
> (also: $f_n(x) \rightarrow f(x)$ für alle $x \in A$ )
> *(b)* gleichmäßig gegen $f$ (Symbole: $f_n \xrightarrow{\operatorname{glm}} f, f=\operatorname{glm}-\lim _{n \rightarrow \infty} f_n$ ):
> > [!tldr] $$\forall \varepsilon>0 \exists n_0 \in \mathbb{N} \forall n \geq n_0 \forall x \in A:\left\|f_n(x)-f(x)\right\|<\varepsilon$$
> 
> *(c)* kompakt gegen $f$ (Symbol: $f_n \xrightarrow{\mathrm{k}} f$ ) : $f_n|\xrightarrow{\text { glm }} f|_K$ für alle kompakten Teilmengen $K \subset A$