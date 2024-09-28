---
tags:
  - LineareAlgebra
aliases:
  - erzeugendensystem
  - Spann
  - Span
  - Definition 6.5
  - Definition 10.5
  - Satz 10.6
  - Bemerkung 10.7
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

> [!important] Definition 6.5. Sei $X$ ein $\mathbb{K}$-Vektorraum.
>
> - **(a)** [[Linearkombination]]
> - **(b)** [[Lineare Hülle]]
> - **(c)**, **(d)** [[Lineare Abhängigkeit]]


![[linHuelle.jpg|250]]

> [!important]+ Definition: Lineare (Un)abhängigkeit
> Sei $(V,+, \cdot)$ ein [[Vektorraum]] über einem Körper $K$ und seien $v_1, v_2, \ldots, v_n \in V$ endlich viele [Vektoren](Vektor.md).
> (i) Die [Vektoren](Vektor.md) $v_1, \ldots, v_n$ heißen linear abhängig, wenn es $\lambda_1, \lambda_2, \ldots, \lambda_n \in K$ gibt, die nicht alle gleich Null sind, sodass gilt
> $$
\lambda_1 \cdot v_1+\lambda_2 \cdot v_2+\ldots+\lambda_n \cdot v_n=o
> $$
> (ii) Die [Vektoren](Vektor.md) $v_1, \ldots, v_n$ heißen linear unabhängig, wenn sie nicht linear abhängig sind, wenn also gilt
> $$
\lambda_1 \cdot v_1+\lambda_2 \cdot v_2+\ldots+\lambda_n \cdot v_n=o \quad \Rightarrow \quad \lambda_1=\lambda_2=\ldots=\lambda_n=0
> $$

Um die [Vektoren](Vektor.md) $v_{1},v_{2},\dots,v_{n}\in V$

 auf lineare Abhängigkeit bzw. lineare Unabhängigkeit zu Prüfen, ist die Gleichung (bzw. das daraus resultierende [LGS](Lineare%20Gleichungssysteme.md))

$$
\lambda_{1}\cdot v_{1}+\lambda_{2}\cdot v_{2}\dots+\lambda_{n}\cdot v_{n}= \vec{o}
$$

Mit noch unbekannten Koeffizienten $\lambda_{1},\lambda_{2},\dots\lambda_{n}\in K$ zu lösen.
Das [LGS](Lineare%20Gleichungssysteme.md) kann auch als [Matrix](Matrix.md) angeschrieben werden:

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

## Bemerkung 10.7.

Die Koordinatenmatrix hängt natürlich von der jeweils gewählten Basis ab. Würde man einen Basiswechsel von $B$ zu $\bar{B}$ bzw. $C$ zu $\bar{C}$ vornehmen, dann folgt mit Satz 7.21, dass dann für die Koordinatenmatrix $\bar{A}^L$ bzgl. der neuen Basis gilt:

$$
\bar{A}^L=T_{C, \bar{C}} A^L T_{B, \bar{B}}^{-1}=T_{C, \bar{C}} A^L T_{\bar{B}, B}
$$