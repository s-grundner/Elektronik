---
tags: 
aliases:
  - Satz 11.11
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 28. September 2024
professor:
---
 

# Faktorregel

> [!important] Satz 11.11: Sei $A \subset \mathbb{R}^n$ offen, $\alpha \in \mathbb{R}$ und $f, g: A \rightarrow \mathbb{R}^m$ seien in $x_0 \in A$ differenzierbar. Dann ist $\alpha f$ und $f+g$ in $x_0$ differenzierbar mit:
> 
> $$
> (\alpha f)^{\prime}\left(x_0\right)=\alpha f^{\prime}\left(x_0\right) \quad(f+g)^{\prime}\left(x_0\right)=f^{\prime}\left(x_0\right)+g^{\prime}\left(x_0\right)
> $$

## Beweis

Die differenzation 

Es gilt für alle $h \in \mathbb{R}^n$ mit $x_0+h \in A$ :

$$
\begin{aligned}
& f\left(x_0+h\right)=f\left(x_0\right)+f^{\prime}\left(x_0\right) h+r_f(h) \wedge \lim _{h \rightarrow 0} \frac{r_f(h)}{\|h\|}=0 \\
& g\left(x_0+h\right)=g\left(x_0\right)+g^{\prime}\left(x_0\right) h+r_g(h) \wedge \lim _{h \rightarrow 0} \frac{r_g(h)}{\|h\|}=0
\end{aligned}
$$


Also gilt für $h \in \mathbb{R}^n$ mit $x_0+h \in A$ :

$$
(\alpha f)\left(x_0+h\right)=(\alpha f)\left(x_0\right)+\left(\alpha f^{\prime}\left(x_0\right)\right) h+\left(\alpha r_f(h)\right) \wedge \lim _{h \rightarrow 0} \frac{\left(\alpha r_f\right)(h)}{\|h\|}=0
$$

sowie

$$
(f+g)\left(x_0+h\right)=(f+g)\left(x_0\right)+\left(f^{\prime}\left(x_0\right)+g^{\prime}\left(x_0\right)\right) h+\left(r_f(h)+r_g(h)\right)
$$

mit $\lim _{h \rightarrow 0} \frac{r_f(h)+r_g(h)}{\|h\|}=0$. Daraus folgt die Behauptung.

Da obiger Satz natürlich für den Spezialfall $n=m=1$ gilt, gelten diese Aussagen auch für partielle Ableitungen.