---
tags:
  - Algebra
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

> [!quote] Es geht um [Mengen](Mengenlehre.md) mit einer besonderen **Struktur**, d.h. um Eigenschaften, was mit den Elementen dieser Menge gemacht werden kann.
> > [!important] Allgemein werden Mengen mit einer Struktur als **[Räume](Raum%20(Mathematik).md)** bezeichnet.
> 
> Häufig trifft man in der Mathematik eine Struktur bei der sich die Elemente einer Menge in natürlicher Weise addieren und mit einem skalar multiplizieren ('strecken') lassen.
> 
> Das Resultat dieser Operationen (Addition und Multiplikation) ist dabei wieder ein Element dieser Menge, d.h. die Operationen führen nicht aus der Menge heraus.
> 
> Nachfolgend behandelte Räume sind die abstrakte Erweiterung des wohlbekannten dreidimensionalen Euklidschen Raumes $\mathbb{R}^3$.

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


- [Normierter Vektorraum](Norm.md)

## Unterraum

> [!important] Sei $(V,+, \cdot)$ ein Vektorraum über einem [Körper](Algebraische%20Strukturen.md) $K$.
> Eine nichtleere Teilmenge $U \subseteq V$ heißt Unterraum des Vektorraumes, wenn $U$ bzgl. „+“ und ,.“ abgeschlossen ist.
> Wenn also für alle $u, v \in U$ und alle $\lambda, \mu \in K$ gilt:
> $$\lambda \cdot u+\mu \cdot v \in U $$

> [!example] Beispiele von Unterräumen
> - Die Menge der oberen (bzw. unteren) $(n\times n)$-[Dreiecksmatrizen](Dreiecksmatrix.md) ist Unterraum von $\mathbb{R}^{n\times n}$
>  - Von diesem wiederum bilden die $(n\times n)$- [Diagonalmatrizen](Diagonalmatrix.md) einen Unterraum
>  - Wenn $m\leq n$ ist, dann ist $P_{m}$ ein unterraum von $P_{n}$ (Polynome vom Grad $\leq n$)
