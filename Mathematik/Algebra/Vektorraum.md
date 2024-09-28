---
tags: 
aliases: []
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 29. Januar 2024
professor:
  - Andreas Neubauer
---
 

# Vektorraum

> [!info] Bekannte Vektorräume:  
> Menge aller ***[Vektoren](Vektor.md)*** im $\mathbb{R}^{3}$
> - Mit der Vektoraddition: $\vec{u}+\vec{v}$
> - und der skalaren Multiplikation: $\lambda \cdot \vec{u}$
> 
> Menge $\mathbb{R}^{m\times n}$ aller ***[Matrizen](Matrix.md)*** mit
> - $A+B$
> - $\lambda \cdot A$
> 
> als komponentenweise Verknüpfung.

## Unterraum

> [!important] Sei $(V,+, \cdot)$ ein Vektoraum über einem Körper $K$.
> Eine nichtleere Teilmenge $U \subseteq V$ heißt Unterraum des Vektorraumes, wenn $U$ bzgl. „+“ und ,.“ abgeschlossen ist.
> Wenn also für alle $u, v \in U$ und alle $\lambda, \mu \in K$ gilt:
> $$\lambda \cdot u+\mu \cdot v \in U $$

> [!example] Beispiele von Unterräumen
> - Die Menge der oberen (bzw. unteren) $(n\times n)$-[Dreiecksmatrizen](Dreiecksmatrix.md) ist Unterraum von $\mathbb{R}^{n\times n}$
>  - Von diesem wiederum bilden die $(n\times n)$- [Diagonalmatrizen](Diagonalmatrix.md) einen Unterraum
>  - Wenn $m\leq n$ ist, dann ist $P_{m}$ ein unterraum von $P_{n}$ (Polynome vom Grad $\leq n$)

## Koordinatenmatrix

Definition 10.5. Seien $X$ und $Y$ endlich-dimensionale $\mathbb{K}$-Vektorräume mit zugehörigen Basen $B:=\left(b_1, \ldots, b_n\right)$ und $C:=\left(c_1, \ldots, c_m\right)$. Weiters sei $L \in L(X, Y)$.
Nach Satz 6.6 (a) gibt es eindeutige Koordinaten $a_{i j}^L \in \mathbb{K}$ mit

$$
L b_j=\sum_{i=1}^m a_{i j}^L c_i, \quad j=1, \ldots, n
$$


Die Matrix $A^L:=\left(a_{i j}^L\right) \in \mathbb{K}^{m \times n}$ heißt Koordinatenmatrix von $L$ bezüglich der Basen $B$ und $C$.

Es gilt dann offensichtlich:

Satz 10.6. Seien $X, Y, B, C, L$ und $A^L$ wie in Definition 10.5. Dann gilt:

$$
L x=y \quad \Longleftrightarrow \quad A^L x=y
$$


Dabei gilt links $x \in X$ und $y \in Y$. Rechts gilt: $x$ ist der zugehörige Koordinatenvektor in $\mathbb{K}^n$ bzgl. der Basis $B$ und $y$ der zugehörige Koordinatenvektor in $\mathbb{K}^m$ bzgl. der Basis C. Zur Verwendung derselben Notation siehe Bemerkung 6.7.

Bemerkung 10.7. Die Koordinatenmatrix hängt natürlich von der jeweils gewählten Basis ab. Würde man einen Basiswechsel von $B$ zu $\bar{B}$ bzw. $C$ zu $\bar{C}$ vornehmen, dann folgt mit Satz 7.21, dass dann für die Koordinatenmatrix $\bar{A}^L$ bzgl. der neuen Basis gilt:

$$
\bar{A}^L=T_{C, \bar{C}} A^L T_{B, \bar{B}}^{-1}=T_{C, \bar{C}} A^L T_{\bar{B}, B}
$$