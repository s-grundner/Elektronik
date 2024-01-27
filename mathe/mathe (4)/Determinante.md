---
tags: 
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
> - ob ein lineares Gleichungssystem eindeutig lösbar ist.

> [!important] Definition der Determinante: $\det(A)$ oder $|A|$  
Sei $A$ eine quadratische [Matrix](Matrix.md). Die *Determinante* von $A$

## $n=1$:

## $n=2$:

## $n = 3$:

![InlR](assets/Pasted%20image%2020240127170055.png) Man rechnet ”*Hauptdiagonalen minus Gegendiagonalen*“ und erhält, dass die Determinante von $A = (\vec{s_{1}},\vec{s_{2}}, \vec{s_{3}})$ gleich dem [Spatprodukt](Spatprodukt.md) $[\vec{s_{1}},\vec{s_{2}}, \vec{s_{3}}]$ ist.  

Die geometrische Interpretation der Determinante im $\mathbb{R}^{3\times 3}$ ist demnach das Volumen des von den Spaltenvektoren (bzw. Zeilenvektoren) aufgespannten Parallelepipeds:

![Left|400](assets/Pasted%20image%2020240127172108.png) 

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

# Tags

[Mathematrick Determinante](https://www.youtube.com/watch?v=dJ7d9wwC2sw)  
[Mathematrick Laplace Entwicklungssatz](https://www.youtube.com/watch?v=3cG0HWdmHLI)  
[Spatprodukt](Spatprodukt.md)