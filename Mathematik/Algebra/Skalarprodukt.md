---
tags:
  - LineareAlgebra
aliases:
  - inneres Produkt
  - innere Produkt
  - Satz 10.10
  - Definition 6.13
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 28. September 2024
professor:
  - Andreas Neubauer
---
 

# Skalarprodukt / Inneres Produkt

```tikz
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{amsmath}

\begin{document}

\begin{tikzpicture}
    \begin{axis}[
        axis lines=middle,
        grid=major,
        xlabel={$x$},
        ylabel={$y$},
        xmin=-1, xmax=4,
        ymin=-1, ymax=4,
        xlabel style={below right},
        ylabel style={above left},
        scale=2.0
    ]
    
    % Define two vectors u and v
    \addplot[->, very thick, cyan] coordinates {(0, 0) (3, 1)} node[pos=1, above] {$\vec{u}$};
    \addplot[->, very thick, red] coordinates {(0, 0) (2, 3)} node[pos=1, right] {$\vec{v}$};
    
    % Add a label to show the scalar product (u dot v)
    \node at (axis cs: 1, 3.3) {Skalarprodukt: $\vec{u} \cdot \vec{v}$};
    
    % Das Skalarprodukt kann als eine Projektion verstanden werden:
    % Projektion des Vektors v auf u (grün)
    \draw[dashed, green] (axis cs: 2, 3) -- (axis cs: 3, 1);
    
    \end{axis}
\end{tikzpicture}
\end{document}
```

Das innere Produkt zweier [Vektoren](Vektor.md) liefert den Anteil der in die Selbe Richtung zeigt immer als Skalar.
(bzw. den Anteil der auf den Anderen [Vektor](Vektor.md) projiziert wird)
> [!info] Es hängt deshalb mit dem $\cos$ zusammen.
> - $\cos(0°) = 1$: Zeigen in die selbe Richtung ($100\%$ werden auf den anderen [Vektor](Vektor.md) projiziert)
> - $\cos(90°) = 0$: Der projizierte Anteil ist $0$

## Skalarprodukt im Vektorraum

> [!important] **Definition 6.13**. Sei $X$ ein $\mathbb{K}$-[Vektorraum](Vektorraum.md). Eine Abbildung $\langle\cdot, \cdot\rangle: X \times X \rightarrow \mathbb{K}$ heißt Skalarprodukt (inneres Produkt) auf $X$, falls folgende Bedingungen gelten:
> 
> **(S1)** $\forall x \in X:\langle x, x\rangle \geq 0 \wedge(\langle x, x\rangle=0 \Longleftrightarrow x=0)\quad$ ([positive Definitheit](Definitheit.md))
> **(S2)** $\forall x, y \in X:\langle x, y\rangle=\overline{\langle y, x\rangle} \quad$ (Symmetrie in $\mathbb{R}$ bzw. Hermitizität in $\mathbb{C}$ )
> **(S3)** $\forall x, y, z \in X \forall \lambda, \mu \in \mathbb{K}:\langle\lambda x+\mu y, z\rangle=\lambda\langle x, z\rangle+\mu\langle y, z\rangle$ (Linearität bzgl. 1. Argument)
> 
> $(X,\langle\cdot, \cdot\rangle)$ heißt **Prähilbertraum**.

Wir zeigen nun, dass man mit Hilfe der Koordinatendarstellung in jedem endlichdimensionalen Raum ein Skalarprodukt definieren kann:

> [!important] **Satz 10.10**. Sei $X$ ein endlich-dimensionaler $\mathbb{K}$-[Vektorraum](Algebra/Vektorraum.md) mit [Basis](Algebra/Basis,%20Dimension%20und%20Teilräume.md) $B:=\left(b_1, \ldots, b_n\right)$. Dann ist
> 
> $$
> \boxed{ \langle x, y\rangle:=\sum_{i=1}^n x_i \overline{y_i} \quad \text { mit } \quad x=\sum_{i=1}^n x_i b_i \quad \text { und } \quad y=\sum_{i=1}^n y_i b_i }
> $$
> 
> ein Skalarprodukt auf $X$.
> Weiters gilt: Alle [Normen](Norm.md) auf $X$ sind äquivalent.
> Sind also $\|\cdot\|_1$ und $\|\cdot\|_2$ [Normen](Norm.md) auf $X$, dann gilt:
> 
> $$
> \exists m, M>0 \forall x \in X: m\|x\|_1 \leq\|x\|_2 \leq M\|x\|_1
> $$

### Beweis

Laut Satz 6.6 ist die Abbildung $L: \mathbb{K}^n \rightarrow X$ mit $L x:=\sum_{i=1}^n x_i b_i$ ein Isomorphismus (vgl. Bemerkung 6.7). Damit folgt mit Beispiel 6.16 (a), dass (10.1) ein Skalarprodukt auf $X$ darstellt.
Wir zeigen nun die Äquivalenz zweier Normen auf $X$. Auf $\mathbb{K}^n$ verwenden wir die [Norm](Norm.md):

$$
\|x\|:=\sqrt{\sum_{i=1}^n\left|x_i\right|^2}
$$


Sei $f: \mathbb{K}^n \rightarrow \mathbb{R}$ definiert durch $f(x):=\|L x\|_1$. Dann folgt mit der 2. [Dreiecksungleichung](Betrag.md) (siehe Beispiel 6.12 (b)), der Cauchy-Schwarzschen Ungleichung (siehe [Satz 6.15](Norm.md) (a)) und der Normeigenschaften:

$$
|f(x)-f(y)| \leq\|L(x-y)\|_1 \leq \sum_{i=1}^n\left|x_i-y_i\right|\left\|b_i\right\|_1 \leq c\|x-y\|
$$

mit
$$
c:=\sqrt{\sum_{i=1}^n\left\|b_i\right\|_1^2}
$$

Die Funktion $f$ ist also [Lipschitz-stetig](../Analysis/Stetigkeit.md).

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