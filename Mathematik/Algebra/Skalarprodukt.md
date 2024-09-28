---
tags:
  - LineareAlgebra
aliases:
  - inneres Produkt
  - innere Produkt
  - Bemerkung 10.11
  - Satz 10.10
  - Definition 6.13
keywords: 
subject:
  - VL
  - Mathematik1
  - Mathematik 1
semester: WS23
created: 28. September 2024
professor:
  - Andreas Neubauer
---
 

# Skalarprodukt / Inneres Produkt

![invert_dark](Skalarprodukt.png)
Das innere Produkt zweier [Vektoren](Vektor.md) liefert den Anteil der in die Selbe Richtung zeigt immer als Skalar.
(bzw. den Anteil der auf den Anderen [Vektor](Vektor.md) projiziert wird)
> [!info] Es hängt deshalb mit dem $\cos$ zusammen.
> - $\cos(0°) = 1$: Zeigen in die selbe Richtung ($100\%$ werden auf den anderen [Vektor](Vektor.md) projiziert)
> - $\cos(90°) = 0$: Der projizierte Anteil ist $0$

## Skalarprodukt im Vektorraum

> [!important] Definition 6.13. Sei $X$ ein $\mathbb{K}$-Vektorraum. Eine Abbildung $\langle\cdot, \cdot\rangle: X \times X \rightarrow \mathbb{K}$ heißt Skalarprodukt (inneres Produkt) auf $X$, falls folgende Bedingungen gelten:
> 
(S1) $\forall x \in X:\langle x, x\rangle \geq 0 \wedge(\langle x, x\rangle=0 \Longleftrightarrow x=0)\quad$ ([positive Definitheit](Definitheit.md))
(S2) $\forall x, y \in X:\langle x, y\rangle=\overline{\langle y, x\rangle} \quad$ (Symmetrie in $\mathbb{R}$ bzw. Hermitizität in $\mathbb{C}$ )
(S3) $\forall x, y, z \in X \forall \lambda, \mu \in \mathbb{K}:\langle\lambda x+\mu y, z\rangle=\lambda\langle x, z\rangle+\mu\langle y, z\rangle$ (Linearität bzgl. 1. Argument)
> 
> $(X,\langle\cdot, \cdot\rangle)$ heißt Prähilbertraum.

Wir zeigen nun, dass man mit Hilfe der Koordinatendarstellung in jedem endlichdimensionalen Raum ein Skalarprodukt definieren kann:

> [!important] Satz 10.10. Sei $X$ ein endlich-dimensionaler $\mathbb{K}$-[Vektorraum](Algebra/Vektorraum.md) mit [Basis](Algebra/Basis,%20Dimension%20und%20Teilräume.md) $B:=\left(b_1, \ldots, b_n\right)$. Dann ist
> 
> $$
> \boxed{ \langle x, y\rangle:=\sum_{i=1}^n x_i \overline{y_i} \quad \text { mit } \quad x=\sum_{i=1}^n x_i b_i \quad \text { und } \quad y=\sum_{i=1}^n y_i b_i }
> $$
> 
> ein Skalarprodukt auf $X$.
> Weiters gilt: Alle Normen auf $X$ sind äquivalent.
> Sind also $\|\cdot\|_1$ und $\|\cdot\|_2$ Normen auf $X$, dann gilt:
> 
> $$
> \exists m, M>0 \forall x \in X: m\|x\|_1 \leq\|x\|_2 \leq M\|x\|_1
> $$

### Beweis

Laut Satz 6.6 ist die Abbildung $L: \mathbb{K}^n \rightarrow X$ mit $L x:=\sum_{i=1}^n x_i b_i$ ein Isomorphismus (vgl. Bemerkung 6.7). Damit folgt mit Beispiel 6.16 (a), dass (10.1) ein Skalarprodukt auf $X$ darstellt.
Wir zeigen nun die Äquivalenz zweier Normen auf $X$. Auf $\mathbb{K}^n$ verwenden wir die Norm:

$$
\|x\|:=\sqrt{\sum_{i=1}^n\left|x_i\right|^2}
$$


Sei $f: \mathbb{K}^n \rightarrow \mathbb{R}$ definiert durch $f(x):=\|L x\|_1$. Dann folgt mit der 2. Dreiecksungleichung (siehe Beispiel 6.12 (b)), der Cauchy-Schwarzschen Ungleichung (siehe Satz 6.15 (a)) und der Normeigenschaften:

$$
|f(x)-f(y)| \leq\|L(x-y)\|_1 \leq \sum_{i=1}^n\left|x_i-y_i\right|\left\|b_i\right\|_1 \leq c\|x-y\|
$$

mit
$$
c:=\sqrt{\sum_{i=1}^n\left\|b_i\right\|_1^2}
$$

Die Funktion $f$ ist also Lipschitz-stetig.

Da die Menge $S:=\left\{x \in \mathbb{K}^n:\|x\|=1\right\}$ offensichtlich kompakt ist, nimmt die Funktion $f$ auf $S$ ihr Minimum und Maximum an (siehe Satz 9.22).

Sei $m_1:=\min _{x \in S} f(x)$ und $M_1:=\max _{x \in S} f(x)$. Dann gilt offensichtlich für $z:=\frac{x}{\|x\|}, x \neq 0$ :

$$
0<m_1 \leq\|L z\|_1 \leq M_1 \quad \Longleftrightarrow \quad m_1\|x\| \leq\|L x\|_1 \leq M_1\|x\|
$$


Analog folgt die Existenz von $0<m_2 \leq M_2$ mit:

$$
m_2\|x\| \leq\|L x\|_2 \leq M_2\|x\|
$$


Mit $m:=\frac{m_2}{M_1}>0$ und $M:=\frac{M_2}{m_1}>0$ folgt nun die Behauptung.

### Bemerkung 10.11

Aus den Sätzen 10.6 und 10.10 folgt übrigens, dass jede lineare Abbildung $L: X \rightarrow Y$ Lipschitz-stetig ist, wenn $X, Y$ endlich-dimensional sind:
Seien $B, C$ irgendwelche Basen für $X$ bzw. $Y$ und seien $n$ bzw. $m$ die Dimensionen von $X$ bzw. $Y$.

Dann folgt mit dem jeweiligen Skalarprodukt und der davon induzierten Norm aus Satz 10.10 sowie der Koordinatenmatrix $A_L$ unter Verwendung der Cauchy-Schwarzschen Ungleichung (siehe Satz 6.15 (a)):

$$
\|L x\|^2=\sum_{i=1}^m\left(\sum_{j=1}^n a_{i j}^L x_j\right)^2 \leq \sum_{i=1}^m\left(\sum_{j=1}^n\left(a_{i j}^L\right)^2\right)\left(\sum_{j=1}^n x_j^2\right)=\left(\sum_{i=1}^m \sum_{j=1}^n\left(a_{i j}^L\right)^2\right)\|x\|^2
$$

Also:

$$
\|L x\| \leq c\|x\| \quad \text { mit } \quad c:=\left(\sum_{i=1}^m \sum_{j=1}^n\left(a_{i j}^L\right)^2\right)^{\frac{1}{2}}
$$

Diese Zahl hängt natürlich von den gewählten Basen ab, existiert aber für jede Wahl.