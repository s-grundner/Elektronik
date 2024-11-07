---
tags: 
aliases:
  - Matrizant
  - FM D1
  - FM D2
  - FM S1
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 30. Oktober 2024
professor:
---
 

# Fundamentalmatrix

> [!important] **FM D1)** Definition der Fundamentalmatrix
> Jedes System $\left\{x_1, \ldots, x_m\right\}$ von $m$ [linear unabhängigen](Algebra/Lineare%20Abhängigkeit.md) Lösungen eines homogenen DGL-Systems ([AWP 1.2](Lineare%20DGL-Systeme%201.%20Ordnung.md)) heißt **Fundamentalsystem**, die zugehörige [Matrix](Algebra/Matrix.md)
> 
> $$
> X(t):=\left(x_1(t), \ldots, x_m(t)\right)
> $$
> 
> heißt **Fundamentalmatrix**.


Da jede Lösung das homgene DGL-System ([AWP 1.2](Lineare%20DGL-Systeme%201.%20Ordnung.md)) erfüllt, gilt
$$
X^{\prime}(t)=A(t) X(t)
$$

> [!important] **FM D2)** Definition des Martizant
> Gilt außerdem $X\left(t_0\right)=I_m$ (die [Einheitsmatrix](Algebra/Einheitsmatrix.md)) für ein $t_0 \in I$, so heißt diese Fundamentalmatrix auch **Matrizant**, bezeichnet mit $X_{t_0}$.
> 


Diese Matrix ist die eindeutige Lösung des linearen AWP (auch Matrix-DGL genannt)

$$
X^{\prime}=A(t) X, \quad X\left(t_0\right)=I_m
$$

> [!important] **FM S1)** Sei $x(t;t_{0};x_{0})$ die eindeutige Lösung von $x'=A(t)x,\quad x(t_{0}) = x_{0}$
> 
> Dann lässt sich die Lösung eines homogenen AWP mit Hilfe einer Fundamentalmatrix $X(t)$ wie folgt angeben:
> 
> $$
> \begin{gathered}
> x(t;t_{0},x_{0})=X(t)\cdot X(t_{0})^{-1}\cdot x_{0} =X_{t_{0}}(t)\cdot x_{0} \\ \implies \boxed{ X(t)\cdot X(t_{0})^{-1} =X_{t_{0}}(t) } \\
> \end{gathered}
> $$
> 
> > [!success] für  $t=t_{0}$ ist $X(t)\cdot X(t_{0})^{-1}=X_{t_{0}}(t)=\mathbb{1}_{m}$
> 
> Mittels dem [Gauß-Jordan](Algebra/Gauß-Jordan-Verfahren.md) Verfahren kann de inverse der Fundamentalmatrix gebildet werden
> 


> [!hint] Der Matrizant ist equivalent zur Übertragungsmatrix der Fehlerfortpflzung
> Da hier
> 
> $$
> \left(\frac{\partial x}{\partial x_0}\left(t ; t_0, x_0\right)\right)=X_{\iota_0}(t)
> $$
> 
> gilt, stimmt die **Übertragungsmatrix** für die Fehlerfortpflanzung bei einem AWP mit dem Matrizanten überein.

> [!question] Durch die [Variation der Konstanten](Analysis/Variation%20der%20Konstanten.md) ist die Lösung des [AWP 1.2](Lineare%20DGL-Systeme%201.%20Ordnung.md)  $x'(t)=A(t)x(t)+b(t)$ mit Anfangswerten $x(t_{0})=x_{0}$ gegeben durch: 
$$x\left(t ; t_0, x_0\right)=X_{t_0}(t)\left[x_0+\int_{t_0}^t X_{t_0}(\tau)^{-1} b(\tau) d \tau\right]:=R(t)$$

> [!success] Hier ist gezeigt, dass $R(t)$ tatsächlich die eindeutige Lösung des [AWP 1.2](Lineare%20DGL-Systeme%201.%20Ordnung.md) ist:
> ![](assets/Pasted%20image%2020241106135932.png)
> 