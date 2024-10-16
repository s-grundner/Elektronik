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
x(t) &= x_{0}+ \underbrace{ \int _{t_{0}}^{t} f(s,x(s)) }_{ (Ax)(t) } \, ds
\end{align}
$$

$$
\varphi_{0}(t) := x_{0}, \quad\varphi_{n}(t):= (A\cdot\varphi_{n-1})(t)
$$

> [!info] Operator $A$ ist eine Abbildung von dem Raum der Stetigen funktionen in sich selbst.
> $A$ nimmt eine stetige Funktion und produziert wieder eine solche



Für eine Lösung $x$ von dem AWP bzw einen Fixpunkt $x$ von $A$ gilt:

$$
\lvert \lvert \varphi_{n}^{(t)}-x^{(t)}  \rvert  \rvert \leq \underbrace{ M \cdot L^{n} \cdot \frac{\alpha^{n+1}}{(n+1)!} }_{ \to 0 \text{ mit } n\to \infty \quad(1)} \quad \text{für alle}\quad t\in[t_{0}-\alpha,t_{0}+\alpha]
$$

siehe Satz von [Peano](../Peano.md)


> [!success]- Beweis (1):
> 
> $$
> e^{ L\alpha } = \sum_{n=0}^{\infty} \frac{(L\alpha)^n}{n!} \implies \frac{(L\alpha)^n}{n!}\to 0\implies n \to \infty
> $$

$x:=$ stetige Funktion

$x$ hat keine Löcher bzw. $x$ ist vollständig $\to$ x ist ein [[]]