---
tags: 
aliases:
  - Bemerkung 11.9
keywords:
  - Fréchet Differenzierbarkeit
  - Partielle Ableitung
  - Zusammenhang
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 27. September 2024
professor:
  - Andreas Neubauer
---

# Satz 11.18 - Fréchet Differenzierbarkeit

Wir untersuchen den Zusammenhang zwischen partieller und Fréchet-Differenzierbarkeit:

> [!important] **Satz 11.8.** Sei $A \subset \mathbb{R}^n$ offen, $x \in A$ und $f: A \rightarrow \mathbb{R}^m$ sei in $x$ Fréchet-differenzierbar mit Fréchet-Ableitung $f^{\prime}(x)-\left(f^{\prime}(x)_{i j}\right) \in L\left(\mathbb{R}^n, \mathbb{R}^m\right)$. Dann gilt:
> 
> $$
> \forall 1 \leq i \leq m, 1 \leq j \leq n: \frac{\partial f_i}{\partial x_j}(x) \text { existiert und } \frac{\partial f_i}{\partial x_j}(x)=f^{\prime}(x)_{i j}
> $$

## Beweis

Für alle $h \in \mathbb{R}^n$ mit $x+h \in A$ gilt:

$$
f(x+h)-f(x)=f^{\prime}(x) h+r(h) \quad \text { mit } \quad \lim _{h \rightarrow 0} \frac{r(h)}{\|h\|}=0
$$


Also folgt mit $h=\left(h_1, \ldots, h_n\right), f=\left(f_1, \ldots, f_m\right)$ für alle $h \in \mathbb{R}^n$ mit $x+h \in A$ :

$$
f_i(x+h)-f_i(x)=\sum_{j=1}^n f^{\prime}(x)_{i j} h_j+r_i(h) \quad \text { mit } \quad \lim _{h \rightarrow 0} \frac{r_i(h)}{\|h\|}=0
$$

Sei nun $h(t)=(0, \ldots, 0, t, 0, \ldots, 0)$ mit $t$ an der $j$-ten Stelle. Dann gilt für alle $t \in \mathbb{R}$ mit $x+h(t) \in A$ :

$$
f_i\left(x_1, \ldots, x_{j-1}, x_j+t, x_{j+1}, \ldots, x_n\right)-f_i(x)=f^{\prime}(x)_{i j} t+r_i(0, \ldots, 0, t, 0, \ldots, 0)
$$

$$
\text{mit } \lim _{t \rightarrow 0} \frac{r_i(0, \ldots, 0, t, 0, \ldots, 0)}{|t|}=0 \text {, also: }
$$

$$
\frac{\partial f_i}{\partial x_j}(x)=\lim _{t \rightarrow 0} \frac{f_i\left(x_1, \ldots, x_{j-1}, x_j+t, x_{j+1}, \ldots, x_n\right)-f_i(x)}{t}=f^{\prime}(x)_{i j}
$$

## Bemerkung

> [!important] **Bemerkung 11.9** Die Umkehrung von obigem Satz ist allerdings i.A. falsch: Sei etwa
> 
> $$
> \begin{aligned}
> f: \mathbb{R}^2 & \rightarrow \mathbb{R} \\
> (x, y) & \mapsto \begin{cases}0, & x=0 \vee y=0 \\
> 1, & \text { sonst }\end{cases}
> \end{aligned}
> $$
> 
> 
> Dann gilt: $\frac{\partial f}{\partial x}(0,0)=\frac{\partial f}{\partial y}(0,0)=0$. Da $f$ aber in $(0,0)$ offensichtlich nicht stetig ist, ist $f$ nach [Satz 11.6](Satz%2011.6.md) in $(0,0)$ auch nicht Fréchet-differenzierbar.
> Man sieht an diesem Beispiel auch, dass die Existenz der partiellen Ableitungen nicht die Stetigkeit impliziert.