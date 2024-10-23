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
 
# Satz von Picard-Lindelöf

Es seien die vorrausseztungen des Satzes von Peano erfüllt

> [!important] Satz von Picard-Lindelöf
> ist $f:[c,d] \times \mathbb{R}^m \to \mathbb{R}^m$ (definiert über dem ganzen streifen)  stetig und Lipschitzstetig $\lvert \lvert f(t) \rvert \rvert$ für alle $(t,x),(t,\overline{x})\in Q_{u,v}$

Abhängigkeitssätze

Unter vorraussetzung des Satzes von Picard-Lindelöf gilt, dass

die Eindeutige Lösung

$$
\begin{align}
x(t;t_{0})= \lim_{ \bar{x}_{0} \to x_{0} } x(t;t_{0};\bar{x}_{0}), \quad t\in[t_{0},t_{0}+x]
\end{align}
$$
Stetigkeit der Lösung in abhängigkeit der Anfangsbedingung
$$
\begin{align}
\alpha&=\min\left\{ u,\frac{v}{m} \right\} \\
\mathbb{D} \geq Q_{u,v} &= \{ (t,x)\in \mathbb{R}^{m+1} : t \in [t_{0}, t_{0}+x] \}  \\
f&:\mathbb{D}\to \mathbb{R}^m
\end{align}
$$

Q muss teilmenge des Definitionsbereich D sein
f muss auf D definiert werden

$$
M=\underbrace{ \max }_{ (t,x) \in Q_{u,v} } \lVert f(t,x) \rVert 
$$

Lösung existiert auf $[t_{0},t_{0}+x]$

Übertragungsmatrix (Jacobimatrix):

$$
\begin{align}
\frac{\partial x}{\partial x_{0}}(t_{1};t_{0};x_{0})=\begin{pmatrix}
\frac{\partial x_{1}}{\partial x_{0,1}} & \dots & \frac{\partial }{\partial } \\
\vdots \\
\frac{\partial }{\partial } & \dots & \frac{\partial }{\partial }
\end{pmatrix}
\end{align}
$$

$$
\begin{align}
x(t;t_{0};x_{0}\delta x_{0})-x(t;t_{0};x_{0}) \\
\approx \underbrace{ \frac{\partial x}{\partial x_{0}}(t;t_{0};x_{0}) }_{ \in\mathbb{R}^{m\times m} }\cdot \underbrace{ \delta x_{0} }_{ \in \mathbb{R}^m }
\end{align}
$$

Beispiel 5.2

$$
\begin{gather}
x'=x^{2}, \quad x(1)=1 \\
f(t,x) = x^{2} \\
x(t,1,x_{0})= \frac{x_{0}}{1+x_{0}(1-t)} \quad t \in(-\infty, (1+x_{0})^{-1}) \\
\frac{\partial x}{\partial x_{0}}= \frac{1(1+x_{0}(1-t))}{(1)+x_{0}(1-t))^{2}}
\end{gather}
$$