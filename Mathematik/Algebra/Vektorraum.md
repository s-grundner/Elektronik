---
tags: 
aliases:
  - Vektorräume
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
