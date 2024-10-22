---
tags: 
aliases:
  - linear abhängig
  - linear unabhängig
  - lineare Unabhängigkeit
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 28. September 2024
professor:
---
 

# Lineare Abhängigkeit

> [!important] [Definition 6.5](Koordinatenmatrix.md) **(c, d)** Sei $X$ ein $\mathbb{K}$-[Vektorraum](Vektorraum.md):
> **(c)** Die Elemente $v_i \in X, i=1, \ldots, n$ ($v$ sind endlich viele [Vektoren](../Analysis/Vektor.md)), heißen **linear unabhängig**, falls gilt:
> 
> $$
> \left.\sum_{i=1}^k \lambda_i v_i=0 \quad \Longleftrightarrow \quad \forall i \in\{1, \ldots, k\}\right\}: \lambda_i=0
> $$
> 
> 
> Ansonsten heißen sie **linear abhängig**.
> 
> **(d)** Eine (auch möglicherweise unendliche) Menge $M \subset X$ heißt linear unabhängig, wenn jede endliche Auswahl von Elementen aus $M$ linear unabhängig ist.

```tikz
\usepackage{pgfplots}
\begin{document}

% Linear Abhängigkeit
\begin{tikzpicture}
\begin{axis}[
    
    axis lines=middle, 
    grid=both,
    xmin=-1, xmax=3, ymin=-1, ymax=3,
    xlabel={$x$}, ylabel={$y$},
    xtick={-1,0,1,2,3},
    ytick={-1,0,1,2,3},
    title={\textbf{Linear Abhängig}},
    scale=2.0
]

% Vektor 1
\addplot[->, thick, color=blue] coordinates {(0,0) (1,1)};
\node at (axis cs: 1.2, 1.0) {$\mathbf{v_1}$};

% Vektor 2 (lineare Kombination von v1)
\addplot[->, thick, color=red] coordinates {(0,0) (2,2)};
\node at (axis cs: 2.4, 2.0) {$\mathbf{v_2} = 2\mathbf{v_1}$};

\end{axis}
\end{tikzpicture}

% Linear Unabhängigkeit
\begin{tikzpicture}
\begin{axis}[
    axis lines=middle, 
    grid=both,
    xmin=-1, xmax=3, ymin=-1, ymax=3,
    xlabel={$x$}, ylabel={$y$},
    xtick={-1,0,1,2,3},
    ytick={-1,0,1,2,3},
    title={\textbf{Linear Unabhängig}},
    scale=2.0
]

% Vektor 1
\addplot[->, thick, color=blue] coordinates {(0,0) (2,1)};
\node at (axis cs: 2.2, 1.2) {$\mathbf{v_1}$};

% Vektor 2 (nicht lineare Kombination von v1)
\addplot[->, thick, color=red] coordinates {(0,0) (1,2)};
\node at (axis cs: 1.2, 2.2) {$\mathbf{v_2}$};

\end{axis}
\end{tikzpicture}

\end{document}
```

> [!important] Lineare (Un)abhängigkeit
> (i) Die [Vektoren](Vektor.md) $v_{1}, \ldots, v_{n}$ heißen **linear abhängig**, wenn es $\lambda_1, \lambda_{2}, \ldots, \lambda_{n} \in K$ gibt, die nicht alle gleich Null sind, sodass gilt
> $$
\lambda_{1} \cdot v_{1}+\lambda_{2} \cdot v_{2}+\ldots+\lambda_{n} \cdot v_{n}=\vec{o}
> $$
> (ii) Die [Vektoren](Vektor.md) $v_1, \ldots, v_n$ heißen **linear unabhängig**, wenn sie nicht linear abhängig sind, wenn also gilt
> $$
\lambda_{1} \cdot v_{1}+\lambda_{2} \cdot v_{2}+\ldots+\lambda_{n} \cdot v_{n}=\vec{o} \quad \Rightarrow \quad \lambda_{1}=\lambda_{2}=\ldots=\lambda_{n}=0
> $$

Um die [Vektoren](Vektor.md) $v_{1},v_{2},\dots,v_{n}\in X$ auf lineare Abhängigkeit bzw. lineare Unabhängigkeit zu Prüfen, ist die Gleichung (bzw. das daraus resultierende [LGS](Lineare%20Gleichungssysteme.md))

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