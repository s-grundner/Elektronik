---
tags:
  - Algebra/LineareAlgebra
aliases:
  - Sarrus
  - Laplace-Entwicklungssatz
  - Determinanten
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 27. Januar 2024
professor:
  - Andreas Neubauer
  - Susanne Saminger-Platz
---
 

# Determinante

> [!info] Die Determinante ist eine wichtige Kenngröße einer [Matrix](Matrix.md).  
> Sie gibt z.B. Auskunft darüber
> - ob eine [Matrix](Matrix.md) invertierbar ist bzw.
> - ob ein [lineares Gleichungssystem](Lineare%20Gleichungssysteme.md) eindeutig lösbar ist.

> [!def] **D1 - DET)** Determinante: $\det A$ oder $|A|$  
> Sei $A$ eine quadratische [Matrix](Matrix.md). Die *Determinante* von $A$ ist [rekursiv](../../Softwareentwicklung/DS-Algo/Rekursion.md) definiert:
> - ist $A=(a_{11}\in \mathbb{R}^{1\times 1})$, so ist $\det A$ definiert als:  
>
> $$\det A:=a_{11}$$
>
> - $A=(a_{ij})\in \mathbb{R}^{n\times n}$ mit $n\geq 2$, so ist $\det A$ definiert als:  
>
> $$\det A:=\sum_{i=1}^{n} (-1)^{i+1}a_{i 1}\cdot\det A_{i 1}$$
>
> wobei $A_{ij} \in \mathbb{R}^{(n-1)\times(n-1)}$ jene [Matrix](Matrix.md) bezeichnet, die aus $A$ durch Streichen der $i$-ten Zeile und der $j$-ten Spalte hervorgeht. siehe Laplace-Entwicklungssatz.
> 
> Die Determinante ist außerdem das Produkt der Eigenwerte seiner Matrix:
> $$\det A=\prod^{n}_{i=1}\lambda_{i}$$


---

## Bedeutung der Determinante

Mit der Basistransformation eines Vektors (Lineares Gleichungssystem) der Form $A\vec{x}=\vec{v}$, gibt die Determinante an, um welchen Faktor sich die Fläche (bzw. Volumen, oder höher dimensionale Einheiten) verändert.

- Haben zwei Matrizen die selbe Determinante heißen sie **ähnlich**.

> [!hint] $\det = 0$: Transformation bewirkt, dass der Raum des Ergebnisses eine niedrigere Dimension hat
> Eine Inverse der Transformation ist daher nicht bildbar, da man aus einer niedrigeren Dimension nicht auf eine eindeutige Lösung in einer höheren Dimension kommt.
> - Matrix ist nicht invertierbar
> - [lineares Gleichungssystem](Lineare%20Gleichungssysteme.md) ist nicht eindeutig lösbar
> - Mindestens ein [Eigenwert](Eigenvektor.md) ist 0.
> - [Matrix](Matrix.md) ist singulär

> [!hint] $\det \neq 0$: Transformation bewirkt, dass der Raum die Gleiche Dimension wie der Eingangsvektor hat.
>  ![InlineR|325](assets/spooder.png)
> - Die Matrix ist regulär
> - Das Vorzeichen der Determinante gibt Hinweise auf das Vorzeichen der Eigenwerte:
>     - $\det(A)>0$ : Alle Eigenwerte haben ein Produkt mit positivem Vorzeichen. Dies kann darauf hindeuten, dass entweder alle Eigenwerte positiv sind (positive Definitheit) oder ein geradzahliges Paar negativer Eigenwerte vorhanden ist.
>     - $\det(A)<0$ : Es gibt eine ungerade Anzahl negativer Eigenwerte, was oft auf Indefinitheit hinweist.
> 

---

## Ermittlung der Determinante

> [!info] $n=1$: $A \in \mathbb{R}^{1\times 1}$ 
>
> $$\det A = | a_{11} | =a_{11}$$ 


> [!info] $n=2$: $A \in \mathbb{R}^{2\times 2}$
>
> $$
> \det A=\left|\begin{matrix}
> a_{11} & a_{12} \\
> a_{21} & a_{22}
> \end{matrix}\right| =a_{11}\cdot a_{22} - a_{21}\cdot a_{12}
> $$


> [!info] $n = 3$: $A \in \mathbb{R}^{3\times 3}$
> ![InlR|300](Pasted%20image%2020240127170055.png) 
> 
> $$\det A=a_{11} a_{22} a_{33}+a_{12} a_{23} a_{31}+a_{13} a_{21} a_{32}-a_{13} a_{22} a_{31}-a_{11} a_{23} a_{32}-a_{12} a_{21} a_{33}$$ 
> Man rechnet ”*Hauptdiagonalen minus Gegendiagonalen*“ und erhält, dass die Determinante von $A = (\vec{s_{1}},\vec{s_{2}}, \vec{s_{3}})$ gleich dem [Spatprodukt](Spatprodukt.md) $[\vec{s_{1}},\vec{s_{2}}, \vec{s_{3}}]$ ist.
> Die geometrische Interpretation der Determinante im $\mathbb{R}^{3\times 3}$ ist demnach das Volumen des von den Spaltenvektoren (bzw. Zeilenvektoren) aufgespannten Parallelepipeds.
> 
> ![InlR|300](Pasted%20image%2020240127172108.png)
> 
> **Sätze:**
> - [Regel von Sarrus](Regel%20von%20Sarrus.md)
>
> 

> [!info] $n\geq 4$:
> **Sätze:** 
> - Laplace Entwicklungssatz

## Sonderfälle

### Determinante einer oberen [Dreiecksmatrix](Dreiecksmatrix.md)

$$
\left|\begin{array}{ccccc}
a_{11} & * & * & \ldots & * \\
0 & a_{22} & * & \ldots & * \\
0 & 0 & a_{33} & \ldots & * \\
\vdots & \vdots & & \ddots & \vdots \\
0 & 0 & 0 & \ldots & a_{n n}
\end{array}\right|=a_{11} \cdot a_{22} \cdot \ldots \cdot a_{n n}
$$

### Determinante einer [Diagonalmatrix](Diagonalmatrix.md)

$$
\operatorname{det}\left(\operatorname{diag}\left(d_1, \ldots, d_n\right)\right)=\prod_{i=1}^n d_i
$$

### Determinante der [Einheitsmatrix](Einheitsmatrix.md) $\mathbb{1}_n$

$$\operatorname{det}\left(\mathbb{1}_n\right)=1$$

# Tags

[Mathematrick Determinante](https://www.youtube.com/watch?v=dJ7d9wwC2sw)  
[Mathematrick Laplace Entwicklungssatz](https://www.youtube.com/watch?v=3cG0HWdmHLI)  
[Spatprodukt](Spatprodukt.md)