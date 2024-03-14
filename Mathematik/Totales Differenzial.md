---
tags: 
aliases:
  - Fréchet
keywords: 
subject:
  - VL
  - Mathematik 2
semester:
  - SS24
  - B2
created: 28. Februar 2024
professor:
---
 

# Totales Differenzial

Das totale Differential einer Funktion $f$ in $n$ Variablen erhält man folgendermaßen:
$$
\mathrm{d} f=\frac{\partial f}{\partial x_1} \mathrm{~d} x_1+\ldots+\frac{\partial f}{\partial x_n} \mathrm{~d} x_n=\sum_{i=1}^n \frac{\partial f}{\partial x_i} \mathrm{~d} x_i .
$$

Die totale [Ableitung](Differenzialrechnung.md) einer Funktion nach einer Variable $x_i$ erhält man somit als
$$
\frac{\mathrm{d} f}{\mathrm{~d} x_i}=\frac{\partial f}{\partial x_1} \frac{\mathrm{d} x_1}{\mathrm{~d} x_i}+\ldots+\frac{\partial f}{\partial x_i}+\ldots+\frac{\partial f}{\partial x_n} \frac{\mathrm{d} x_n}{\mathrm{~d} x_i}
$$


> [!important] Sei $A \subset \mathbb{R}^n$ offen, $f: A \rightarrow \mathbb{R}^m$ und $x_0 \in A$.
> $f$ heißt Fréchet-differenzierbar, total differenzierbar (oder kurz: differenzierbar) in $x_{0}$ wenn: 
> > [!tldr]- $\exists L \in L\left(\mathbb{R}^n, \mathbb{R}^m\right) \exists r: \mathbb{R}^n \rightarrow \mathbb{R}^m$
> > eine Lineare Abbildung $L$ aus der Menge aller Linearen Abbildungen von $\mathbb{R}^n$ nach $\mathbb{R}^m$ existiert, sowohl ein *Rest* $r(h)$ existiert, der von $\mathbb{R}^n$ nach $\mathbb{R}^m$ abbildet.
> > (Also im Raum der linearen Abbildung bleibt $\to$ sonst ist der Rest unstetig im Raum)
> $$
\left(\forall h \in \mathbb{R}^n, x_0+h \in A: f\left(x_0+h\right)=f\left(x_0\right)+L h+r(h) \wedge \lim _{h \rightarrow 0} \frac{\|r(h)\|}{\|h\|}=0\right)
> $$
> $L$ heißt *Fréchet*-Ableitung oder *totale* Ableitung von $f$ in $x_0$,
> - Symbol: $L=f^{\prime}(x_{0})$.
> 
> Für $n=m=1$ ist die $1 \times 1$-Matrix $L$ gleich $f^{\prime}\left(x_0\right)$ aus Definition 11.1. Für $n=1$ kann auch $f: I \rightarrow \mathbb{R}^m$ mit $I$ Intervall behandelt werden.
