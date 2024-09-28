---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 28. September 2024
professor:
---
 

# Kettenregel

> [!important] Satz 11.12 (Kettenregel). Sei $A \subset \mathbb{R}^n$ offen, $g: A \rightarrow \mathbb{R}^m$ differenzierbar in $x \in A$, $B \supset g(A)$ offen und $f: B \rightarrow \mathbb{R}^k$ differenzierbar in $g(x)$. Dann ist $f \circ g$ differenzierbar in $x$, und es gilt:
> 
> $$
> (f \circ g)^{\prime}(x)=f^{\prime}(g(x)) g^{\prime}(x) \quad \text { (als Produkt von Matrizen) }
> $$
> 

## Beweis

Sei $h \in \mathbb{R}^n$ so, dass $x+h \in A$. Da $f$ in $g(x)$ differenzierbar ist, gilt:

$$
f(g(x+h))-f(g(x))=f^{\prime}(g(x))[g(x+h)-g(x)]+r_f(g(x+h)-g(x))
$$

mit $\lim _{s \rightarrow 0} \frac{r_f(s)}{\|s\|}=0$. Damit existiert eine Funktion $\rho$ (definiert für hinreichend kleine $\left.s \in \mathbb{R}^m\right)$ mit $r_f(s)=\|s\| \rho(s)$ und $\lim _{s \rightarrow 0} \rho(s)=0$.

Da $g$ bei $x$ differenzierbar ist, gilt:

$$
g(x+h)-g(x)=g^{\prime}(x) h+r_g(h) \quad \text { mit } \quad \lim _{h \rightarrow 0} \frac{r_g(h)}{\|h\|}=0
$$


Damit gilt insgesamt:

$$
\begin{align}
&(f \circ g)(x+h)-(f \circ g)(x) &= f^{\prime}(g(x))\left[g^{\prime}(x) h+r_g(h)\right]
+\left\|g^{\prime}(x) h+r_g(h)\right\| \rho\left(g^{\prime}(x) h+r_g(h)\right) \\
&= {\left[f^{\prime}(g(x)) g^{\prime}(x)\right] h+r(h) \quad \mathrm{mit} } \\
& r(h):=f^{\prime}(g(x)) r_g(h)+\left\|g^{\prime}(x) h+r_g(h)\right\| \rho\left(g^{\prime}(x) h+r_g(h)\right)
\end{align}
$$