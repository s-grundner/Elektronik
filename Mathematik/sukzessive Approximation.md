---
tags: 
aliases:
  - Fixpunkt-Iteration
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
\boxed{ \lvert \lvert \varphi_{n}^{(t)}-x^{(t)}  \rvert  \rvert \leq \underbrace{ M \cdot L^{n} \cdot \frac{\alpha^{n+1}}{(n+1)!} }_{ \to 0 \text{ mit } n\to \infty \quad(1)} \quad \text{für alle}\quad t\in[t_{0}-\alpha,t_{0}+\alpha] }
$$

siehe Satz von [Peano](../Peano.md) zur Maximumsnorm


> [!success]- Beweis (1):
> 
> $$
> e^{ L\alpha } = \sum_{n=0}^{\infty} \frac{(L\alpha)^n}{n!} \implies \frac{(L\alpha)^n}{n!}\to 0\implies n \to \infty
> $$

$X:=$ Raum stetiger Funktion von $[t_{0}-\alpha, t_{0}+\alpha]$ nach $\mathbb{R}^m$

$$
g \in X\quad \lvert\lvert g \rvert\rvert _{\infty}:= \underset{t \in[t_0 - \alpha, t_0 + \alpha]}{\operatorname{max} \lvert\lvert g(t) \rvert\rvert_{\infty} } = \underset{t \in[t_0 - \alpha, t_0 + \alpha]}{\operatorname{max}}\underset{1\leq i\leq m}{\operatorname{max}} | g_{i}(t)|
$$

$$
\boxed{ \lvert\lvert g \rvert\rvert _{w}:= \underset{ t \in[t_0 - \alpha, t_0 + \alpha] }{ \operatorname{max} } e^{ -2Lt } \cdot \lvert\lvert g \rvert\rvert _{\infty} }
$$

$X$ hat keine Löcher bzw. $x$ ist vollständig $\to$   ist ein [Barnachraum](Barnachscher%20Fixpunktsatz.md)

>[!example] Nichtlineares AWP: (Riccati DGL)
Beispiel 4.11. Wir betrachten das nichtlineare AWP (Riccati-DGL)

$$
x^{\prime}=x^2-t, \quad x(0)=0
$$


Die Funktion $f(t, x):=x^2-t$ ist auf ganz $\mathbb{R}^2$ definiert. Im Hinblick auf die Fehlerabschätzung betrachten wir die Einschränkung der rechten Seite der DGL auf das Quadrat

$$
Q_{\frac{1}{2}, \frac{1}{2}}=\left\{(t, x) \in \mathbb{R}^2:|t| \leq \frac{1}{2},|x| \leq \frac{1}{2}\right\}=\left[-\frac{1}{2}, \frac{1}{2}\right] \times\left[-\frac{1}{2}, \frac{1}{2}\right] .
$$


```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[xmin=-0.7, xmax=0.7, ymin=-0.7, ymax=0.7]

\end{tikzpicture}

\end{document}
```

Dort gilt die Abschätzung

$$
|f(t, x)-f(t, y)|=\left|\left(x^2-t\right)-\left(y^2-t\right)\right|=|x+y||x-y| \leq|x-y| .
$$


Also ist eine Lipschitzbedingung erfüllt mit $L=1$.
Um die Größe des Existenzintervalls zu bekommen, schätzen wir $f$ auf der Menge $Q_{\frac{1}{2}, \frac{1}{2}}$ ab:

$$
\left|x^2-t\right| \leq x^2+|t| \leq \frac{3}{4}
$$
