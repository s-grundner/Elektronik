---
tags: 
aliases:
  - totale Differenzierbarkeit
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 27. September 2024
professor:
  - Andreas Neubauer
---
 

# Fréchet-Ableitung

> [!info] Die **Fréchet-Ableitung** verallgemeinert den Begriff der [Ableitung](Differenzialrechnung.md)


> [!def] **D1 - FRCH)** Sei $A \subset \mathbb{R}^n$ offen, $f: A \rightarrow \mathbb{R}^m$ und $x_0 \in A$. ^FRCH
> $f$ heißt Fréchet-differenzierbar, [Total Differenzierbar](Total%20Differenzierbar.md) (oder kurz: differenzierbar) in $x_{0}$ wenn: 
> > [!tldr]- $\exists L \in L\left(\mathbb{R}^n, \mathbb{R}^m\right) \exists r: \mathbb{R}^n \rightarrow \mathbb{R}^m$
> > eine [[../Algebra/Lineare Abbildungen|Lineare Abbildung]] $L$ aus der Menge der Linearen Abbildungen von $\mathbb{R}^n$ nach $\mathbb{R}^m$ existiert, sowohl ein *Rest* $r(h)$ existiert, der von $\mathbb{R}^n$ nach $\mathbb{R}^m$ abbildet.
> > (Also im Raum der [linearen Abbildung](../Algebra/Lineare%20Abbildungen.md) bleibt $\to$ sonst ist der Rest unstetig im Raum)
> $$
\forall h \in \mathbb{R}^n, x_0+h \in A: f\left(x_0+h\right)=f\left(x_0\right)+L h+r(h) \wedge \lim _{h \rightarrow 0} \frac{\mid r(h)\mid}{\mid h \mid}=0
> $$
> $L$ heißt *Fréchet*-Ableitung oder *totale* Ableitung von $f$ in $x_0$,
> - Symbol: $L=f^{\prime}(x_{0})$.
> 
> Für $n=m=1$ ist die $1 \times 1$-[Matrix](../Algebra/Matrix.md) $L$ gleich $f^{\prime}\left(x_0\right)$ aus Definition 11.1. Für $n=1$ kann auch $f: I \rightarrow \mathbb{R}^m$ mit $I$ Intervall behandelt werden.


> [!satz] **S1)** Sei $A \subset \mathbb{R}^n$ offen, $x_0 \in A$ und $f: A \rightarrow \mathbb{R}^m$ in $x_0$ stetig differenzierbar. Dann ist $f$ in $x_0$ Fréchet-differenzierbar. ^S1
> 
> Es gilt also:
> $f \in C^1\left(A, \mathbb{R}^m\right) \Longrightarrow f$ Fréchet-differenzierbar $\Longrightarrow$ alle partiellen Ableitungen von $f$ existieren;
> es gilt keine der möglichen Umkehrungen.
> 
> > [!tldr] Die Fréchetableitung ist, falls sie existiert, durch die [Jacobi-Matrix](Vektoranalysis/Gradient.md) gegeben
>

## Fréchet Differenzierbarkeit

Wir untersuchen den Zusammenhang zwischen [partieller](Partielle%20Ableitung.md) und Fréchet-Differenzierbarkeit:

> [!satz] **S2)** Sei $A \subset \mathbb{R}^n$ offen, $x \in A$ und $f: A \rightarrow \mathbb{R}^m$ sei in $x$ Fréchet-differenzierbar mit Fréchet-Ableitung $f^{\prime}(x)-\left(f^{\prime}(x)_{i j}\right) \in L\left(\mathbb{R}^n, \mathbb{R}^m\right)$. Dann gilt: ^S2
> 
> $$
> \forall 1 \leq i \leq m, 1 \leq j \leq n: \frac{\partial f_i}{\partial x_j}(x) \text { existiert und } \frac{\partial f_i}{\partial x_j}(x)=f^{\prime}(x)_{i j}
> $$

Nach diesem Satz lässt sich die Fréchet-Ableitung durch die [Jacobi-Matrix](Vektoranalysis/Gradient.md) ausdrücken.

> [!success]- Beweis von S2
> 
> Für alle $h \in \mathbb{R}^n$ mit $x+h \in A$ gilt:
> 
> $$
> f(x+h)-f(x)=f^{\prime}(x) h+r(h) \quad \text { mit } \quad \lim _{h \rightarrow 0} \frac{r(h)}{\|h\|}=0
> $$
> 
> 
> Also folgt mit $h=\left(h_1, \ldots, h_n\right), f=\left(f_1, \ldots, f_m\right)$ für alle $h \in \mathbb{R}^n$ mit $x+h \in A$ :
> 
> $$
> f_i(x+h)-f_i(x)=\sum_{j=1}^n f^{\prime}(x)_{i j} h_j+r_i(h) \quad \text { mit } \quad \lim _{h \rightarrow 0} \frac{r_i(h)}{\|h\|}=0
> $$
> 
> Sei nun $h(t)=(0, \ldots, 0, t, 0, \ldots, 0)$ mit $t$ an der $j$-ten Stelle. Dann gilt für alle $t \in \mathbb{R}$ mit $x+h(t) \in A$ :
> 
> $$
> f_i\left(x_1, \ldots, x_{j-1}, x_j+t, x_{j+1}, \ldots, x_n\right)-f_i(x)=f^{\prime}(x)_{i j} t+r_i(0, \ldots, 0, t, 0, \ldots, 0)
> $$
> 
> $$
> \text{mit } \lim _{t \rightarrow 0} \frac{r_i(0, \ldots, 0, t, 0, \ldots, 0)}{|t|}=0 \text {, also: }
> $$
> 
> $$
> \frac{\partial f_i}{\partial x_j}(x)=\lim _{t \rightarrow 0} \frac{f_i\left(x_1, \ldots, x_{j-1}, x_j+t, x_{j+1}, \ldots, x_n\right)-f_i(x)}{t}=f^{\prime}(x)_{i j}
> $$
> 


> [!important] **Bemerkung** Die Umkehrung von obigem Satz ist allerdings i.A. falsch: Sei etwa
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
> Dann gilt: $\frac{\partial f}{\partial x}(0,0)=\frac{\partial f}{\partial y}(0,0)=0$. Da $f$ aber in $(0,0)$ offensichtlich nicht stetig ist, ist $f$ nach [Satz 11.6](Differenzialrechnung.md) in $(0,0)$ auch nicht Fréchet-differenzierbar.
> Man sieht an diesem Beispiel auch, dass die Existenz der partiellen Ableitungen nicht die [Stetigkeit](Stetigkeit.md) impliziert.