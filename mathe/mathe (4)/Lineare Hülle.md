---
tags: 
aliases:
  - linearen Hüllen
  - linear kombination
  - linear abhängig
  - linear unabhängig
  - erzeugendensystem
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - WS23
created: 27. Dezember 2023
professor:
---
 

# Lineare Hülle

> [!important]+ Definition: Linearkombination, lineare Hülle
Sei $(V,+, \cdot)$ ein Vektorraum über einem Körper $K$.
(i) Jede aus endlich vielen [Vektoren](../mathe%20(3)/Vektor.md) $v_1, v_2, \ldots, v_n \in V$ gebildete Summe
> $$
\lambda_1 \cdot v_1+\lambda_2 \cdot v_2+\ldots+\lambda_n \cdot v_n=\sum_{i=1}^n \lambda_i \cdot v_i
> $$
> mit Koeffizienten $\lambda_i \in K$ heißt eine Linearkombination von $v_1, v_2, \ldots, v_n$. Ist $\lambda_i=0$ für alle $i=1, \ldots, n$, so heißt die Linearkombination trivial.
> (ii) Die Menge aller Linearkombinationen von [Vektoren](../mathe%20(3)/Vektor.md) $v_1, v_2, \ldots, v_n \in V$
> $$
\operatorname{Lin}\left(v_1, v_2, \ldots, v_n\right):=\left\{\sum_{i=1}^n \lambda_i \cdot v_i \mid \lambda_1, \lambda_2, \ldots, \lambda_n \in K\right\}
> $$
> heißt lineare Hülle von $v_1, v_2, \ldots, v_n$. Ergänzend wird noch $\operatorname{Lin}(\emptyset):=\{o\}$ festgelegt.

> [!important]+ Definition: Lineare (Un)abhängigkeit
> Sei $(V,+, \cdot)$ ein Vektorraum über einem Körper $K$ und seien $v_1, v_2, \ldots, v_n \in V$ endlich viele [Vektoren](../mathe%20(3)/Vektor.md).
> (i) Die [Vektoren](../mathe%20(3)/Vektor.md) $v_1, \ldots, v_n$ heißen linear abhängig, wenn es $\lambda_1, \lambda_2, \ldots, \lambda_n \in K$ gibt, die nicht alle gleich Null sind, sodass gilt
> $$
\lambda_1 \cdot v_1+\lambda_2 \cdot v_2+\ldots+\lambda_n \cdot v_n=o
> $$
> (ii) Die [Vektoren](../mathe%20(3)/Vektor.md) $v_1, \ldots, v_n$ heißen linear unabhängig, wenn sie nicht linear abhängig sind, wenn also gilt
> $$
\lambda_1 \cdot v_1+\lambda_2 \cdot v_2+\ldots+\lambda_n \cdot v_n=o \quad \Rightarrow \quad \lambda_1=\lambda_2=\ldots=\lambda_n=0
> $$

Um die [Vektoren](../mathe%20(3)/Vektor.md) $v_{1},v_{2},\dots,v_{n}\in V$

 auf lineare Abhängigkeit bzw. lineare Unabhängigkeit zu Prüfen, ist die Gleichung (bzw. das daraus resultierende [LGS](../mathe%20(3)/Lineare%20Gleichungssysteme.md))

$$
\lambda_{1}\cdot v_{1}+\lambda_{2}\cdot v_{2}\dots+\lambda_{n}\cdot v_{n}= \vec{o}
$$

Mit noch unbekannten Koeffizienten $\lambda_{1},\lambda_{2},\dots\lambda_{n}\in K$ zu lösen.
Das [LGS](../mathe%20(3)/Lineare%20Gleichungssysteme.md) kann auch als [Matrix](Matrix.md) angeschrieben werden:

$$
\begin{pmatrix}
\vec{v}_{1} & \vec{v}_{2} & \cdots  & \vec{v}_{n}
\end{pmatrix}\cdot \begin{pmatrix}
\lambda_{1} \\ \lambda_{2} \\ \vdots \\ \lambda_{n}
\end{pmatrix} = \begin{pmatrix}
0 \\ 0 \\ \vdots \\ 0 \\
\end{pmatrix}
$$

> [!example] Beispiel:
>
> Überprüfen Sie, ob die drei Zeilenvektoren $(1,2,1),(3,1,5),(3,-4,7)$, welche Elemente des $\mathbb{R}$ -Vektorraumes $\left(\mathbb{R}_n,+, \cdot\right)$ sind, linear unabhängig sind.
> 
> > [!success]- *Lösung: Wir setzen an*
> > $$
\begin{aligned}
\vec{0} & =\lambda_1 \cdot \vec{z_1}+\lambda_2 \cdot \vec{z_2}+\lambda_3 \cdot \vec{z_3} \\
\Rightarrow \quad(0,0,0) & =\lambda_1 \cdot(1,2,1)+\lambda_2 \cdot(3,1,5)+\lambda_3 \cdot(3,-4,7) \\
\Rightarrow \quad(0,0,0) & =\left(\lambda_1+3 \lambda_2+3 \lambda_3, 2 \lambda_1+\lambda_2-4 \lambda_3, \lambda_1+5 \lambda_2+7 \lambda_3\right)
\end{aligned}
> > $$
> >
> > $$
\begin{aligned}
& \lambda_1+3 \lambda_2+3 \lambda_3=0 \\
& 2 \lambda_1+\lambda_2-4 \lambda_3=0 \\
& \lambda_1+5 \lambda_2+7 \lambda_3=0
\end{aligned}
> >$$
> >
> > $$
\begin{align}
\left(\begin{array}{ccc|c}
1 & 3 & 3 & 0 \\
2 & 1 & -4 & 0 \\
1 & 5 & 7 & 0
\end{array}\right)
\begin{aligned}
\cdot 2 \\ \\ \cdot 2 \\
\end{aligned}&\to
\left(\begin{array}{ccc|c}
2 & 6 & 6 & 0 \\
2 & 1 & -4 & 0 \\
2 & 10 & 14 & 0
\end{array}\right)
\\
\left(\begin{array}{ccc|c}
2 & 6 & 6 & 0 \\
0 & 5 & 10 & 0 \\
0 & 4 & 8 & 0
\end{array}\right)
\begin{aligned}
\\ \cdot 4 \\ \cdot 5
\end{aligned}&\to
\left(\begin{array}{ccc|c}
2 & 6 & 6 & 0 \\
0 & 20 & 40 & 0 \\
0 & 20 & 40 & 0
\end{array}\right)
\end{align}
> > $$