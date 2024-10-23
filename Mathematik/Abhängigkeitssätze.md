---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 23. Oktober 2024
professor:
---
 

# Abhängigkeitssätze

> [!important] Es gelten die Voraussetzungen des Satzes von [Picard-Lindelöf](Picard-Lindelöf.md). Dann gilt:
> 
> $$
> \lim _{\bar{x}_0 \rightarrow x_0} x\left(t ; t_0, \bar{x}_0\right)=x\left(t ; t_0, x_0\right) \quad \text { für alle } \quad t \in\left[t_0, t_0+\alpha\right)
> $$
> 
> mit $\alpha$ nach dem Satz von [Peano](Peano.md)
> Ist $f$ in $Q_{u, v}$ sogar stetig differenzierbar nach $x$, dann ist die Lösungsfunktion $x\left(t ; t_0, \cdot\right)$ stetig differenzierbar bei $x_{0}$.
> 

- $Q$ muss teilmenge des Definitionsbereich $\mathbb{D}$ sein:  $\mathbb{D} \supseteq Q_{u,v} = \{ (t,x)\in \mathbb{R}^{m+1} : t \in [t_{0}, t_{0}+x] \}$
- $f$ muss auf $D$ definiert werden: $f:\mathbb{D}\to \mathbb{R}^m$
- Lösung existiert auf $[t_{0},t_{0}+x]$

> [!question] Der Ausdruck $x(t;t_{0}, x_{0})$ bedeutet:
> $x(t)$ mit den anfangswerten $x(t_{0})=x_{0}$ ($x_{0}$ und $t_{0}$ können auch Vektoren sein)

> [!info] Die **Übertragungsmatrix** (allg. Jacobimatrix) ist ein Maß zur Güte der Fehlerfortpflanzung.
> Im falle eines [DGL-Systems](DGL-System.md), sonst ist sie eine $1\times1$-[Matrix](Algebra/Matrix.md).
> 
> $$
> \begin{align}
> \frac{\partial x}{\partial x_{0}}(t_{1};t_{0},x_{0})=\begin{pmatrix}
> \dfrac{\partial x_{1}}{\partial x_{0,1}}(t;t_{0},x_{0}) & \cdots & \dfrac{\partial x_{1}}{\partial x_{0,m} }(t;t_{0},x_{0}) \\
> \vdots  & \ddots{} & \vdots\\
> \dfrac{\partial x_{m} }{\partial x_{0,1}}(t;t_{0},x_{0}) & \cdots & \dfrac{\partial x_{m} }{\partial x_{0,m}}(t;t_{0},x_{0})
> \end{pmatrix}
> \end{align}
> $$
> 
> $$
> \begin{align}
> x(t;t_{0},x_{0}\delta x_{0})-x(t;t_{0},x_{0})
> \approx \underbrace{ \frac{\partial x}{\partial x_{0}}(t;t_{0},x_{0}) }_{ \in\mathbb{R}^{m\times m} }\cdot \underbrace{ \delta x_{0} }_{ \in \mathbb{R}^m }
> \end{align}
> $$
> 


>[!example]- Beispiel 5.2
> 
> $$
> \begin{align}
> x'&=x^{2}=f(t,x), \quad x(1)=1 \\
> x(t,1,x_{0})&= \frac{x_{0}}{1+x_{0}(1-t)} \quad t \in(-\infty, (1+x_{0})^{-1}) \\
> \frac{\partial x}{\partial x_{0}}&= \frac{1(1+x_{0}(1-t)-x_{0}(1-t))}{(1+x_{0}(1-t))^{2}} \quad\text{(Quotientenregel)}\\
> &=\frac{1}{(1+x_{0}(1-t))^{2}}\\
> \frac{\partial x}{\partial x_{0}}(t;1;1) &= \frac{1}{(2-t)^{2}}
> \end{align}
> $$

> [!important] Satz 5.3
> $$
> \begin{align}
> x'=f(t,x) && x(t_{0}) &=x_{0} \\
> \bar{x}'=\bar{f}(t;\bar{x}) && \bar{x}(t_{0}) &= \bar{x}_{0}
> \end{align}
> $$
> 
> $$
> \begin{align}
> \lVert x(t)-\bar{x}(t) \rVert &\leq \lVert x_{0}-\bar{x}_{0} \rVert \cdot e^{ L(t-t_{0}) } + \frac{\omega}{L}\cdot(e^{ L(t-t_{0}) }-1) \\
> \omega &= \underbrace{ \max }_{ (t,x)\in Q_{u,v} } \lVert f(t,x)-\bar{f(t,x)} \rVert
> \end{align}
> $$

>[!example]- Beispiel 5.4
> 
> $$
> \begin{align}
> x'&=x^{2}-t=f(t,x) \\
> \bar{f}(t, x)&=f(t,x) + \frac{1}{100}\sin() \\
> x'&=\bar{f}(t,x)\quad x(0) = \frac{1}{8} \\
> \bar{Q}_{\frac{1}{2}, \frac{3}{8}}& = \left\{  (t,x) \in \mathbb{R}^{2}:\lvert t \rvert \leq \frac{1}{2}, \left\lvert  x-\frac{1}{8}  \right\rvert \leq \frac{3}{8}   \right\} \subseteq Q_{\frac{1}{2}, \frac{1}{2}} \\
> \max \lvert f(t,x)-\bar{f}(t,x) \rvert &=\frac{1}{100}= \omega \\
> \lvert \bar{f(t,x)} \rvert &\leq \frac{1}{4}+\frac{1}{2}+\frac{1}{100} =\frac{19}{25}\quad (t,x)\in \bar{Q}_{\frac{1}{2} , \frac{1}{8}} \\
> \bar{\alpha}&=\min \left\{  \frac{1}{2} , \frac{\frac{3}{8} }{\frac{19}{25}} \right\} = \frac{75}{152}
> \end{align}
> $$