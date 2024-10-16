---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 16. Oktober 2024
professor:
---
 
# Sukzessive Approximation

$$
\dot{x} = f(t,x)\quad x(t_{0})=x_{0}
$$
Differenzialgleichung wird zur Integralgleichung

$$
\int _{t_{0}}^{t}\dot{x}(s) \, ds =\int_{t_{0}^{t}} f(s,x(s)) \, ds 
$$
Mit dem Hauptsatz der Differenzalrechnung folgt:

$$
\begin{align}

x(t)-x(t_{0}) &= \int _{t_{0}}^{t} f(s,x(s)) \, ds \\
x(t) &= x_{0}+ \underbrace{ \int _{t_{0}}^{t} f(s,x(s)) }_{ (Ax) } \, ds
\end{align}
$$