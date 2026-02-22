---
tags:
aliases:
  - Korrelationskoeffizient
  - Kovarianzmatrix
keywords:
subject:
  - KV
  - Übertragungstechnik
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 23rd October 2025
professor:
  - Andreas Springer
  - Dmitry Efrosinin
release: false
title: Kovarianz
---

# Kovarianz

Sind die Zufallsvariablen $X$ und $Z$ quadratisch integrierbar, nennt man

> [!def] **D)** **Kovarianz** von $X$ und $Z$
> 
> $$
> \begin{align}
> \operatorname{Cov}(X,Y) &:= \mathbb{E}{\color{green}\big(}{\color{orange}(}X-\mathbb{E}(X){\color{orange})}\cdot{\color{orange}(}Y-\mathbb{E}(Y){\color{orange})}{\color{green}\big)} \\
> \text{bzw.}\quad &= \mathbb{E}((X-\mu_{X})(Y-\mu_{Y}))
> \end{align}
> $$
> 

Man sieht, dass $\operatorname{Cov}(X,X)=\operatorname{Var}(X)$

> [!def] **D)** **Korrelationskoeffizient** von $X$ und $Z$
> 
> $$
> \operatorname{Corr}(X,Y) := \frac{\operatorname{Cov}(X,Y)}{\sqrt{ \operatorname{Var}(X) }\sqrt{ \operatorname{Var}(Y) }} = \mathbb{E} \left[ \left( \frac{X-\mu_{X}}{\sigma_{X}} \right)\left( \frac{Y-\mu_{Y}}{\sigma_{Y}} \right)  \right] 
> $$

## Bedeutung

Die **Kovarianz** $\operatorname{Cov}(X,Y)$ bzw. der **Korrelationskoeffizient** $\operatorname{Corr}(X,Y)$ sind genau dann *positiv*, wenn

- die Ereignisse  $\{X > \mathbb{E}(X)\}$ und $\{Y > \mathbb{E}(Y)\}$ 
- und damit auch die Ereignisse  $\{X < \mathbb{E}(X)\}$ und $\{Y < \mathbb{E}(Y)\}$) weitgehend *übereinstimmen*. 

Die **Kovarianz** $\operatorname{Cov}(X,Y)$ bzw. der **Korrelationskoeffizient** $\operatorname{Corr}(X,Y)$ sind dabei um so *größer*, je besser

- *große positive Abweichungen* der Zufallsvariablen $X$ von $\mathbb{E}(X)$ mit
- *großen positiven Abweichungen* der Zufallsvariablen $Y$ von $\mathbb{E}(Y)$ *übereinstimmen*.

Der Korrelationskoeffizient $\operatorname{Corr}(X,Y)$ ist genau dann gleich $+1$ (bzw. $-1$), wenn zwischen den beiden Zufallsvariablen $X$ und $Y$ die Beziehung  $Y = aX + b$ mit $a > 0$ (bzw. $a < 0$) gilt.

> [!satz] **S)** Sind die Zufallsvariablen **unabhängig**, dann gilt: ^UNCORRELATED
> 
> - $\operatorname{Cov}(X,Y)=0$  und $\operatorname{Corr}(X,Y) = 0$
> - Achtung $\operatorname{Cor}(X,Y)=0$ alleine zeigt nicht unbedingt, dass die Zufallsvariablen unabhängig sind.

## Allgemeiner Fall

Für den Allgemeinen Fall, dass eine beliebige endliche Anzahl an Zufallsvariablen $Z_{1}, Z_{2}, \ldots Z_{r}$, zusammengefasst zum Vektor $(Z_{1}, Z_{2}, \ldots Z_{r})^{T}\mathbf{Z} \in \mathbb{R}^{r}$, bezüglich Kovarianz und Korrelation ausgewertet werden, erhält man Matrizen.

$$
\mathbf{Z} = \begin{bmatrix}
Z_{1} \\ Z_{2} \\ \vdots \\ Z_{r}
\end{bmatrix}, \quad
\mathbb{E}(\mathbf{Z}) = \begin{bmatrix}
\mathbb{E}(Z_{1}) \\
\mathbb{E}(Z_{2}) \\
\vdots \\
\mathbb{E}(Z_{r})
\end{bmatrix} = \begin{bmatrix}
\mu_{1} \\ \mu_{2} \\ \vdots \\ \mu_{r}
\end{bmatrix} = \vec{\mu}
$$

Die Kovarianz einer Vektorwertigen Zufallsvariable ist

$$
\underbrace{ \operatorname{Cov(\mathbf{Z})} }_{ r \times r } = \mathbb{E} [ \underbrace{ (\mathbf{Z}- \mathbb{E}(\mathbf{Z})) }_{ r \times 1 }\cdot\underbrace{ (\mathbf{Z}-\mathbb{E}(\mathbf{Z}))^{T} }_{ 1 \times r }] =: \mathbf{C}
$$

Sind die Zufallsvariablen $Z_{1},Z_{2},\ldots,Z_{r}$ quadratisch integrierbar, nennt man die quadratischen [Matrizen](../Algebra/Matrix.md)

> [!def] **D - Kovarianzmatrix $\mathbf{C}$)**  der Zufallsvariablen $Z_{1}, Z_{2}, \ldots Z_{r}$
> 
> $$
> \mathbf{C} := \big(\operatorname{Cov(Z_{i},Z_{k})}\big)_{i=1,k=1}^{r,r} \in \mathbb{R}^{r \times r}
> $$

Auf der Diagonalen sind jeweils die Varianzen.

> [!def] **D - Korrelationsmatrix $\mathbf{R}$)** der Zufallsvariablen $Z_{1}, Z_{2}, \ldots Z_{r}$
> 
> $$
> \mathbf{R} := \big(\operatorname{Corr(Z_{i},Z_{k})}\big)_{i=1,k=1}^{r,r} \in \mathbb{R}^{r \times r}
> $$

## Eigenschaften und Rechenregeln

> [!satz] **S1)** Sind die Zufallsvariablen $X,Y$ quadratisch integrierbar, so gilt
> 
> 1. $\operatorname{Cov}(X,Y)=\mathbb{E}(X Y)-\mathbb{E}(X) \mathbb{E}(Y)$
> 2. $\operatorname{Var}(X+Y)=2 \operatorname{Cov}(X,Y)+\operatorname{Var}(X)+\operatorname{Var}(Y)$
> 3. $-1\leq \operatorname{Corr}(X,Y)\leq 1$
> 4. Die Kovarianzmatrix $\mathbf{C}$ ist symmetrisch und [positiv semidefinit](../Algebra/Definitheit.md)

Für S1-1 ist außerdem folgender Satz bei gegebenen **gemeinsamen Verteilungsdichte** besonders hilfreich


Im Standard Fall von S1-1 ist $g(X,Y) = XY$.

## Transformation 

Wird ein Basiswechsel (affine Transformation) bzgl der Zufalls variablen $\mathbf{X}$ druchgeführt

$$
\mathbf{C_{Y}} = \mathbf{AC_{X}A}^{T}
$$