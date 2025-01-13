---
tags:
  - Algebra/LineareAlgebra
  - Axiome/Skalarprodukt
aliases:
  - inneres Produkt
  - innere Produkt
  - Satz 10.10
  - Definition 6.13
  - Prähilbertraum
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 28. September 2024
professor:
  - Andreas Neubauer
axiome:
  - S1
  - S2
  - S3
def:
  - SKAX
satz:
  - SKAP
---
 

# Skalarprodukt / Inneres Produkt

Das Skalarprodukt ist eine Art zwei Vektoren miteinander zu multiplikativ zu verknüpfen. Eine Andere Art ist das [Kreuzprodukt](Kreuzprodukt.md). 

## Skalarprodukt im Vektorraum

> [!def] **D1 - SKAX)** Sei $X$ ein $\mathbb{K}$-[Vektorraum](Vektorraum.md). Eine Abbildung $\langle\cdot, \cdot\rangle: X \times X \rightarrow \mathbb{K}$ heißt Skalarprodukt (inneres Produkt) auf $X$, falls folgende Bedingungen gelten:
> 
> **(S1)** $\forall x \in X:\langle x, x\rangle \geq 0 \wedge(\langle x, x\rangle=0 \Longleftrightarrow x=0)\quad$ ([positive Definitheit](Definitheit.md))
> **(S2)** $\forall x, y \in X:\langle x, y\rangle=\overline{\langle y, x\rangle} \quad$ 
> **(S3)** $\forall x, y, z \in X \forall \lambda, \mu \in \mathbb{K}:\langle\lambda x+\mu y, z\rangle=\lambda\langle x, z\rangle+\mu\langle y, z\rangle$ (Linearität bzgl. 1. Argument)
> 
> $(X,\langle\cdot, \cdot\rangle)$ heißt **Prähilbertraum**. (Der Raum auf den das Skalarprodukt Abbildet)

> [!info]- Erläuterung zu **(S2)**
> **S2** setzt die Symmetrie in $\mathbb{R}$ bzw. Hermitizität in $\mathbb{C}$ voraus
> 1. wenn $\mathbb{K}=\mathbb{R}$ reduziert sich die Bedingung auf $\langle x, y\rangle=\langle y, x\rangle$
> 2. wenn $\mathbb{K}=\mathbb{C}$ dann gilt $\langle x, y\rangle=\overline{\langle y, x\rangle}$. Der Überstrich bedeutet dann die [konjugation](../Analysis/Komplexe%20Zahlen.md) des Skalarprodukts bei Vertauschung der Argumente

Wir zeigen nun, dass man mit Hilfe der Koordinatendarstellung in jedem endlichdimensionalen Raum ein Skalarprodukt definieren kann:

> [!satz] **S1 - SKAP)** Sei $X$ ein endlich-dimensionaler $\mathbb{K}$-[Vektorraum](Algebra/Vektorraum.md) mit [Koordinatenmatrix](Koordinatenmatrix.md) $B:=\left(b_1, \ldots, b_n\right)$. Dann ist
> 
> $$
> \boxed{ \langle x, y\rangle:=\sum_{i=1}^n x_i \overline{y_i}\,} \quad \text { mit } \quad x=\sum_{i=1}^n x_i b_i \quad \text { und } \quad y=\sum_{i=1}^n y_i b_i 
> $$
> 
> ein Skalarprodukt auf $X$.
> Weiters gilt: Alle [Normen](Norm.md) auf $X$ sind äquivalent.
> Sind also $\|\cdot\|_1$ und $\|\cdot\|_2$ [Normen](Norm.md) auf $X$, dann gilt:
> 
> $$
> \exists m, M>0 \forall x \in X: m\|x\|_1 \leq\|x\|_2 \leq M\|x\|_1
> $$

## Interpretation im $\mathbb{R}^2$

```tikz
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{amsmath}

\begin{document}

\newcommand{\ihat}{\hat{\textbf{\i}}}
\newcommand{\jhat}{\hat{\textbf{\j}}}

\begin{tikzpicture}[x=5pt, y=5pt, font=\LARGE]
\begin{axis}[
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xtick={-1, 0, 1, 2, 3, 4},
    ytick={-1, 0, 1, 2, 3, 4},
    xmin=-1, xmax=4,
    ymin=-1, ymax=4,
    scale=2, axis equal
]
    
% Define two vectors u and v
\addplot[->, very thick, cyan] coordinates {(0, 0) (3, 1)} node[pos=1, above] {\Large$\vec{u}$};
\addplot[->, very thick, red] coordinates {(0, 0) (2, 3)} node[pos=1, right] {\Large$\vec{v}$};

% Normalize vector of u
\addplot[->, ultra thick, cyan!50!black] coordinates {(0, 0) (0.6, 0.2)} node[pos=1, above] {$\ihat_{\vec{u}}$};

% Perpentucular normalized vector of u
\addplot[->, ultra thick, cyan!50!black] coordinates {(0, 0) (-0.2, 0.6)} node[pos=1, left] {$\jhat_{\vec{u}}$};

\end{axis}
\end{tikzpicture}
\end{document}
```

Das innere Produkt zweier [Vektoren](Vektor.md) liefert den Anteil der in die Selbe Richtung zeigt immer als Skalar,
bzw. den Anteil der auf den anderen Vektor projiziert wird

> [!info] Interpretation im $\mathbb{R}^2$:
> Es hängt deshalb mit dem $\cos$ zusammen.
> - $\cos(0°) = 1$: Zeigen in die selbe Richtung ($100\%$ werden auf den anderen [Vektor](Vektor.md) projiziert)
> - $\cos(90°) = 0$: Der projizierte Anteil ist $0$
> 
> $\vec{u}\cdot \vec{v}= \lvert \vec{u} \rvert \lvert \vec{v} \rvert \cdot \cos(\angle \vec{u}\vec{v})$