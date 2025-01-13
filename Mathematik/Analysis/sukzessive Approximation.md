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

> [!important] Es wird ein [AWP]({MOC}%20DGL.md)  $\dot{x} = f(t,x)\quad x(t_{0})=x_{0}$ betrachtet.
> 
> 1. Die Differentialgleichung wird in ein Integral umgewandelt:
> $$\int _{t_{0}}^{t}\dot{x}(s) \, ds =\int_{t_{0}}^{t} f(s,x(s)) \, ds$$
> 2. Mit dem [[Fundamentalsatz der Analysis]] folgt:
> 
> $$
> \begin{align}
> x(t)-x(t_{0}) &= \int _{t_{0}}^{t} f(s,x(s)) \, ds \\
> x(t) &= x_{0}+ \underbrace{ \int _{t_{0}}^{t} f(s,x(s)) }_{ (Ax)(t) } \, ds
> \end{align}
> $$
> 
> 3. Die Lösung $x$ des [AWP]({MOC}%20DGL.md) wird [analytisch](Analysis/Numerische%20Lösungsverfahren%20von%20DGL.md) mit der Funktionenfolge $\varphi_{n}$ approximiert:
> 
> $$\boxed{ \varphi_{0}(t) := x_{0}, \quad\varphi_{n}(t):= (A\cdot\varphi_{n-1})(t) }$$

> [!info] Operator $A$ ist eine Abbildung von dem [Raum](Algebra/Raum%20(Mathematik).md) der Stetigen funktionen in sich selbst.
> $A$ nimmt eine stetige Funktion und produziert wieder eine solche



Für eine Lösung $x$ von dem [AWP]({MOC}%20DGL.md) bzw einen Fixpunkt $x$ von $A$ gilt nach [Lindelöf](Picard-Lindelöf.md):

$$
\boxed{ \lVert \varphi_{n}(t)-x(t) \rVert \leq \underbrace{ M \cdot L^{n} \cdot \frac{\alpha^{n+1}}{(n+1)!} }_{ \to 0 \text{ mit } n\to \infty \quad(1)} \quad \text{für alle}\quad t\in[t_{0}-\alpha,t_{0}+\alpha] }
$$


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

$X$ hat keine Löcher bzw. $x$ ist vollständig $\to$   ist ein [Barnachraum](Analysis/Barnachscher%20Fixpunktsatz.md)

## Spezialisierung auf homog. lineare DGL-Systeme

$$
\begin{align}
\Phi_{n}(t) = \mathbb{1}_{m}+ \int_{t_{0}}^{t}A(s)\cdot\Phi_{n-1}(s)\,\mathrm{d}s, \quad\Phi_{0}:= \mathbb{1}_{m} \\
\Phi_{n}(t) \to X_{t_{0}}(t) \quad\text{ für } n\to \infty \quad\forall t\in I
\end{align}
$$
 


---

>[!example]- Nichtlineares AWP: (Riccati DGL)
Beispiel 4.11. Wir betrachten das nichtlineare AWP (Riccati-DGL)
> 
> $$
> x^{\prime}=x^2-t, \quad x(0)=0
> $$
> 
> 
> Die Funktion $f(t, x):=x^2-t$ ist auf ganz $\mathbb{R}^2$ definiert. Im Hinblick auf die Fehlerabschätzung betrachten wir die Einschränkung der rechten Seite der DGL auf das Quadrat
> 
> $$
> Q_{\frac{1}{2}, \frac{1}{2}}=\left\{(t, x) \in \mathbb{R}^2:|t| \leq \frac{1}{2},|x| \leq \frac{1}{2}\right\}=\left[-\frac{1}{2}, \frac{1}{2}\right] \times\left[-\frac{1}{2}, \frac{1}{2}\right] .
> $$
> 
> 
> ```tikz
> \usepackage{pgfplots}
> \pgfplotsset{compat=1.16}
> 
> \begin{document}
> 
> \begin{tikzpicture}
> \begin{axis}[dashed, axis lines=middle, xmin=-0.7, xmax=0.7, ymin=-0.7, ymax=0.7]
> \draw[solid] (-0.5, -0.5) -- (-0.5, 0.5) -- (0.5, 0.5) -- (0.5, -0.5) -- (-0.5, -0.5);
> \end{axis}
> \end{tikzpicture}
> 
> \end{document}
> ```
> 
> Dort gilt die Abschätzung
> 
> $$
> |f(t, x)-f(t, y)|=\left|\left(x^2-t\right)-\left(y^2-t\right)\right|=|x+y||x-y| \leq|x-y| .
> $$
> 
> 
> Also ist eine Lipschitzbedingung erfüllt mit $L=1$.
> Um die Größe des Existenzintervalls zu bekommen, schätzen wir $f$ auf der Menge $Q_{\frac{1}{2}, \frac{1}{2}}$ ab:
> 
> $$
> \left|x^2-t\right| \leq x^2+|t| \leq \frac{3}{4}
> $$
> 
> Wegen $\alpha=\min \left\{\frac{1}{2}, \frac{1}{2} \frac{4}{3}\right\}=\frac{1}{2}$, liefert der Satz 4.9 die eindeutige Existenz der Lösung auf dem Intervall $I=\left[-\frac{1}{2}, \frac{1}{2}\right]$.
> 
> Die ersten drei Iterationen der sukzessiven Approximation (4.6) liefern dann:
> 
> $$
> \begin{aligned}
> & \varphi_1(t)=-\frac{t^2}{2} \\
> & \varphi_2(t)=-\frac{t^2}{2}+\frac{t^5}{20} \\
> & \varphi_3(t)=-\frac{t^2}{2}+\frac{t^5}{20}-\frac{t^8}{160}+\frac{t^{11}}{4400}
> \end{aligned}
> $$
> 
> 
> Für einen Mathematica- bzw. Python-Code zur Berechnung der Polynome siehe A. 2 bzw. B.2.
> 
> Die Fehlerabschätzung (4.7) liefert für $\varphi_3$ die Abschätzung
> 
> $$
> \frac{3}{4}\left(\frac{1}{2}\right)^4 \frac{1}{4!}=\frac{3}{1536} \approx 2 \cdot 10^{-3}
> $$
> 
> 
> In der Praxis ist allerdings der Fehler meist viel kleiner als die Schranke.