---
tags:
  - LineareAlgebra
aliases:
  - Sarrus
  - Laplace-Entwicklungssatz
  - Determinanten
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - WS23
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

>[!important] Bedeutung der Determinante
> Mit der Basistransformation eines Vektors (Lineares Gleichungssystem) der Form $A\vec{x}=\vec{v}$, gibt die Determinante an, um welchen Faktor sich die Fläche (bzw. Volumen, oder höher dimensionale Einheiten) verändert.


> [!info] $\det = 0$: Transformation bewirkt, dass der Raum des Ergebnisses eine niedrigere Dimension hat
> Eine Inverse der Transformation ist daher nicht bildbar, da man aus einer niedrigeren Dimension nicht auf eine eindeutige Lösung in einer höheren Dimension kommt.

> [!info] $\det \neq 0$: Transformation bewirkt, dass der Raum die Gleiche Dimension wie der Eingangsvektor hat.
> ![|425](assets/Pasted%20image%2020240224211204.png)

> [!important] Definition der Determinante: $\det A$ oder $|A|$  
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

## $n=1$: $A \in \mathbb{R}^{1\times 1}$

$$\det A = | a_{11} |=a_{11}$$

## $n=2$: $A \in \mathbb{R}^{2\times 2}$

$$
\det A=\left|\begin{matrix}
a_{11} & a_{12} \\
a_{21} & a_{22}
\end{matrix}\right| =a_{11}\cdot a_{22} - a_{21}\cdot a_{12}
$$

## $n = 3$: $A \in \mathbb{R}^{3\times 3}$

![InlR|348](assets/Pasted%20image%2020240127170055.png) Man rechnet ”*Hauptdiagonalen minus Gegendiagonalen*“ und erhält, dass die Determinante von $A = (\vec{s_{1}},\vec{s_{2}}, \vec{s_{3}})$ gleich dem [Spatprodukt](Spatprodukt.md) $[\vec{s_{1}},\vec{s_{2}}, \vec{s_{3}}]$ ist.  

<br><br><br>

$$\det A=a_{11} a_{22} a_{33}+a_{12} a_{23} a_{31}+a_{13} a_{21} a_{32}-a_{13} a_{22} a_{31}-a_{11} a_{23} a_{32}-a_{12} a_{21} a_{33}$$

<br>

![InlR|400](assets/Pasted%20image%2020240127172108.png) Die geometrische Interpretation der Determinante im $\mathbb{R}^{3\times 3}$ ist demnach das Volumen des von den Spaltenvektoren (bzw. Zeilenvektoren) aufgespannten Parallelepipeds.

### Regel von Sarrus

> [!warning] Achtung: Gilt nur für $3\times 3$ [Matrizen](Matrix.md)!

$$
\begin{aligned}
\operatorname{det} A & =\left|\begin{array}{lll}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{array}\right|=a_{11} \cdot\left|\begin{array}{ll}
a_{22} & a_{23} \\
a_{32} & a_{33}
\end{array}\right|-a_{21} \cdot\left|\begin{array}{ll}
a_{12} & a_{13} \\
a_{32} & a_{33}
\end{array}\right|+a_{31} \cdot\left|\begin{array}{ll}
a_{12} & a_{13} \\
a_{22} & a_{23}
\end{array}\right| \\
& =a_{11} a_{22} a_{33}+a_{12} a_{23} a_{31}+a_{13} a_{21} a_{32}-a_{13} a_{22} a_{31}-a_{11} a_{23} a_{32}-a_{12} a_{21} a_{33} .
\end{aligned}
$$

## $n\geq 4$: Laplace Entwicklungssatz

# Sonderfälle

## Determinante einer oberen [Dreiecksmatrix](Dreiecksmatrix.md):

$$
\left|\begin{array}{ccccc}
a_{11} & * & * & \ldots & * \\
0 & a_{22} & * & \ldots & * \\
0 & 0 & a_{33} & \ldots & * \\
\vdots & \vdots & & \ddots & \vdots \\
0 & 0 & 0 & \ldots & a_{n n}
\end{array}\right|=a_{11} \cdot a_{22} \cdot \ldots \cdot a_{n n} .
$$

## Determinante einer [Diagonalmatrix](Diagonalmatrix.md):

$$
\operatorname{det}\left(\operatorname{diag}\left(d_1, \ldots, d_n\right)\right)=\prod_{i=1}^n d_i
$$

## Determinante der [Einheitsmatrix](Einheitsmatrix.md) $I_n$ :

$$
\operatorname{det}\left(E_n\right)=1 \text {. }
$$

# Tags

[Mathematrick Determinante](https://www.youtube.com/watch?v=dJ7d9wwC2sw)  
[Mathematrick Laplace Entwicklungssatz](https://www.youtube.com/watch?v=3cG0HWdmHLI)  
[Spatprodukt](Spatprodukt.md)