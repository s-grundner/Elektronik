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

> [!def] Eine explizite lineare DGL $n$-ter Ordnung hat die Form
> 
> $$x^{(n)}(t) + \sum_{j=0}^{n-1} a_{j}(t)\cdot x^{(j)}(t) = s(t)$$
> 
> - Der Störterm $s(t)$ muss auf dem Interval $I$ stetig sein. 
> - $s, x: I \to \mathbb{R}, a\in \mathbb{R}$
> 
> in höheren dimensionen $\mathbb{R}^m$ liegt ein DGL-System vor, von welchem wederum die einzelnen DGLs betrachtet werden können.

Umwandeln in ein lineares [DGL-System 1. Ordnung](Lineare%20DGL-Systeme.md) ergibt die Koeffizientenmatrix $A(t)$ und den Störvektor $b(t)$

$$
A(t)=\left(\begin{array}{ccccc}
0 & 1 & 0 & \ldots & 0 \\
0 & 0 & 1 & \ddots & 0 \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & 0 & \ldots & 1 \\
a_0(t) & a_1(t) & a_2(t) & \ldots & a_{n-1}(t)
\end{array}\right) \quad \text { und } \quad b(t)=\left(\begin{array}{c}
0 \\ \vdots \\ 0 \\ s(t)
\end{array}\right)
$$

Das LGS hat dann die Form eines [inhomogenen DGL-Systems](Lineare%20DGL-Systeme.md#^AWP1-1) und es Lassen sich dementsprechende Lösungsverfahren anwenden.

$$x'(t)=A(t)x(t)+b(t)$$

## Konstanter Koeffizient

### Homogene Gleichung

$$
\begin{aligned}
x(t) & =e^{\lambda t} \\
x^{(3)}(t) & =\lambda^\lambda e^{\lambda t}
\end{aligned}
$$

Falls $a_{0}, \dots a_{n-1}$ nicht von $t$ abhängen, dann geben wir diese Lösungen der homogenen Gleichung ($s(t)=0$) explizit an:


$$
\underbrace{ \left(\lambda^n+\sum_{j=0}^n a_j \lambda^j\right) }_{ p(\lambda)} e^{\lambda t}=0
$$


charakteristisches Polynom

$$
p(\lambda)=\left(\lambda-\lambda_1\right)^{k_1} \cdots\left(\lambda-\lambda_l\right)^{k_l} \quad \text{ mit } k_{1}+\dots + k_{l}
$$

Das polynom kann mehrere nullstellen haben, daher gilt dass:

$\forall\nu : {\{ 0,\dots,k_{j} - 1\}},\, t^{\nu}\cdot e^{\lambda_{i} t}$ ist eine Lösung von $x^{(n)}+\sum_{j=0}^{n-1}a_{j}\cdot x^{(j)}=0$

> [!success]- Beweis
> 

### Inhomogene Gleichung

Ist allgemein mit Variation der Konstanten lösbar, jedoch ist diese Rechnung relativ Aufwändig, daher führt für spezielle Störterme $s$ ein unbestimmter Ansatz für $x$ zur partikulären Lösung.

Falls

$$
s(t) = (b_{0}+b_{1}\cdot t+\dots+b_{m}t^{m})\cdot e^{ \alpha t }\cdot \begin{cases}
\cos(\beta t) \\
\sin(\beta t)
\end{cases} \quad \text{ für } \alpha,\beta \in\mathbb{R}
$$

Dann führt der unbestimmte Ansatz 

$$
x_0(t)=t^k\left[\left(A_0+A_1 t+\cdots+A_m t^m\right) \cos (\beta t)+\left(B_0+B_1^{-1}+\cdots+B_m t^m\right) \sin (\beta t)\right]
$$

Auf eine partikuläre Lösung, wenn $\alpha+i\beta$ eine $k$-Fache Nullstelle von $p(\lambda)$ ist