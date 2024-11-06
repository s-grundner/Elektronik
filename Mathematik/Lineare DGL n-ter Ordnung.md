---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 6th November 2024
professor:
---
 
# Lineare DGL $n$-ter Ordnung

$$
x^{(n)}(t) + \sum_{j=0}^{n-1} a_{j}(t)\cdot x^{(j)}(t) = s(t)
$$

Umwandeln in ein lineares [DGL-System](DGL-System.md) 1. Ordnung


## Konstanter Koeffizient

1. Versuch

$$
\begin{aligned}
x(t) & =e^{\lambda t} \\
x^{(3)}(t) & =\lambda^\lambda e^{\lambda t}
\end{aligned}
$$

Falls $a_{0}, \dots a_{n-1}$ nicht von $t$ abhängen, dann geben wir diese Lösungen der homogenen Gleichung ($s(t)=0$) explizit an:


$$
\left(\underbrace{ \lambda^n+\sum_{j=0}^n a_j \lambda^jU }_{ p(\lambda)}\right) e^{\lambda t}=0
$$


charakteristisches Polynom

$$
p(\lambda)=\left(\lambda-\lambda_1\right)^{k_1} \cdots\left(\lambda-\lambda_l\right)^{k_l} \quad \text{ mit } k_{1}+\dots + k_{l}
$$

Das polynom kann mehrere nullstelen haben, daher gilt dass:

$\forall\nu : {\{ 0,\dots,k_{j} - 1\}},\, t^{\nu}\cdot e^{\lambda_{i} t}$ ist eine Lösung von $x^{(n)}+\sum_{j=0}^{n-1}a_{j}\cdot x^{(j)}=0$

> [!success]- Beweis


$$
\frac{d^n}{d t^n}\left(\frac{d^\mu}{d \lambda_i^p} e^{\lambda_i t}\right)+\sum_{j=0}^{n_0-1} a_j \frac{d^j}{d t^s}\left(\frac{d^v}{d \lambda_i^\mu} e^{\lambda_i t}\right)
$$