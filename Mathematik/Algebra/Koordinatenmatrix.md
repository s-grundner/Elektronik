---
tags:
  - Algebra/LineareAlgebra
aliases:
  - erzeugendensystem
  - Spann
  - Span
  - Definition 6.5
  - Definition 10.5
  - Satz 10.6
  - Bemerkung 10.7
  - Basis
  - Basiswechsel
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 28. September 2024
professor:
  - Andreas Neubauer
---
 

# Basis, Dimension und Teilräume

Eine Basis des $\mathbb{R}^3$, wie z.B. kartesische Koordinaten oder Kugelkoordinaten, spannt den $\mathbb{R}^3$ vollständig auf. Die Koordinaten sind dabei definitionsgemäß $\mathbb{R}$ entnommen, und $N=3$ als Dimension des Raumes entspricht der Zahl der Basisvektoren.

> [!question]- Warum?
> Die Einheitsvektoren $\vec{\mathbf{e}}_{x},\vec{\mathbf{e}}_{y},\vec{\mathbf{e}}_{z}$, die das kartesische Koordinatensystem aufspannen sind linear Unabhängig (keine kombination der $\vec{\mathbf{e}}_{x}$ / $\vec{\mathbf{e}}_{y}$-Vektoren kann den $\vec{\mathbf{e}}_{z}$-Vektor darstellen)

> [!important] Definition 6.5. Sei $X$ ein $\mathbb{K}$-Vektorraum.
>
> - **(a)** [[Linearkombination]]
> - **(b)** [[Lineare Hülle]]
> - **(c)**, **(d)** [[Lineare Abhängigkeit]]

Ein Vektor im $\mathbb{R}^N$ wird bekanntermaßen als Linearkombination der Basisvektoren $\mathbf{x}_1, \ldots, \mathbf{x}_N$ dargestellt.

$$
\mathbf{y}=a_1 \mathbf{x}_1+a_2 \mathbf{x}_2+\ldots+a_N \mathbf{x}_N
$$


> [!info] Somit wird jeder Vektor in einem festgelegten Koordinatensystem durch seine Koordinaten $a_1, a_2, \ldots, a_N$ beschrieben.
> Durch die Wahl des Abstandes zweier Vektoren $d(\mathbf{x}, \mathbf{y})$, der [Metrik](Metrischer%20Raum.md), das [innere Produkt](Skalarprodukt.md) $\langle\mathbf{x}, \mathbf{y}\rangle$ und durch die Länge der Vektoren $\|\mathbf{x}\|$, der [Norm](Norm.md), strukturiert man das **Koordinatensystem**, d.h. die **Basis**.
> 

Umgekehrt stellt sich die Frage, wie die Koordinaten $a_i$ bestimmt werden können.

# Koordinatenmatrix und Basis

> [!important] Definition 10.5. Seien $X$ und $Y$ endlich-dimensionale $\mathbb{K}$-[Vektorräume](Vektorraum.md) mit zugehörigen Basen $B:=\left(b_1, \ldots, b_n\right)$ und $C:=\left(c_1, \ldots, c_m\right)$. Weiters sei $L \in L(X, Y)$.
> Nach Satz 6.6 (a) gibt es eindeutige Koordinaten $a_{i j}^L \in \mathbb{K}$ mit
> 
> $$
> L b_j=\sum_{i=1}^m a_{i j}^L c_i, \quad j=1, \ldots, n
> $$
> 
> Die [Matrix](Matrix.md) $A^L:=\left(a_{i j}^L\right) \in \mathbb{K}^{m \times n}$ heißt Koordinatenmatrix von $L$ bezüglich der Basen $B$ und $C$.

Es gilt dann offensichtlich:

> [!important] Satz 10.6. Seien $X, Y, B, C, L$ und $A^L$ wie in Definition 10.5. Dann gilt:
> 
> $$
> L x=y \quad \Longleftrightarrow \quad A^L x=y
> $$
> 
> Dabei gilt links $x \in X$ und $y \in Y$. Rechts gilt: $x$ ist der zugehörige Koordinatenvektor in $\mathbb{K}^n$ bzgl. der Basis $B$ und $y$ der zugehörige Koordinatenvektor in $\mathbb{K}^m$ bzgl. der Basis C. Zur Verwendung derselben Notation siehe Bemerkung 6.7.

## Bemerkung 10.7

Die Koordinatenmatrix hängt natürlich von der jeweils gewählten Basis ab. Würde man einen Basiswechsel von $B$ zu $\bar{B}$ bzw. $C$ zu $\bar{C}$ vornehmen, dann folgt mit Satz 7.21, dass dann für die Koordinatenmatrix $\bar{A}^L$ bzgl. der neuen Basis gilt:

$$
\bar{A}^L=T_{C, \bar{C}} A^L T_{B, \bar{B}}^{-1}=T_{C, \bar{C}} A^L T_{\bar{B}, B}
$$