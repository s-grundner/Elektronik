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

> [!def] **D1 - FUMA)** Definition der Fundamentalmatrix
> Jedes System $\left\{x_1, \ldots, x_m\right\}$ von $m$ [linear unabhängigen](Algebra/Lineare%20Abhängigkeit.md) Lösungen eines [homogenen DGL-Systems](../Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-2) heißt **Fundamentalsystem**, die zugehörige [Matrix](Algebra/Matrix.md)
> 
> $$
> X(t):=\left(x_1(t), \ldots, x_m(t)\right)
> $$
> 
> heißt **Fundamentalmatrix**.


Da jede Lösung das homgene DGL-System erfüllt, gilt
$$
X^{\prime}(t)=A(t) X(t)
$$

> [!def] **D2 - MATZ)** Definition des Martizant
> Gilt außerdem $X\left(t_0\right)=\mathbb{1}_m$ (die [Einheitsmatrix](Algebra/Einheitsmatrix.md)) für ein $t_0 \in I$, so heißt diese Fundamentalmatrix auch **Matrizant**, bezeichnet mit $X_{t_0}$.
> 


Diese Matrix ist die eindeutige Lösung des linearen AWP (auch Matrix-DGL genannt)

$$
X^{\prime}=A(t) X, \quad X\left(t_0\right)=\mathbb{1}_m
$$

> [!satz] **S1 - Eindeutige Lösung)** Sei $x(t;t_{0};x_{0})$ die eindeutige Lösung von $x'=A(t)x,\quad x(t_{0}) = x_{0}$ ^FM-S1
> 
> Dann lässt sich die Lösung eines homogenen AWP mit Hilfe einer Fundamentalmatrix $X(t)$ wie folgt angeben:
> 
> $$
> \begin{gathered}
> x(t;t_{0},x_{0})=X(t)\cdot X(t_{0})^{-1}\cdot x_{0} =X_{t_{0}}(t)\cdot x_{0} \\ \implies X(t)\cdot X(t_{0})^{-1} =X_{t_{0}}(t) \\
> \end{gathered}
> $$
> 
> > [!success] für $t=t_{0}$ ist $X(t)\cdot X(t_{0})^{-1}=X_{t_{0}}(t_{0})=\mathbb{1}_{m}$
> 
> Mittels dem [Gauß-Jordan](Algebra/Gauß-Jordan-Verfahren.md) Verfahren kann de inverse der Fundamentalmatrix gebildet werden
> 


> [!hint] Der Matrizant ist equivalent zur Übertragungsmatrix der Fehlerfortpflanzung
> Da hier
> 
> $$
> \left(\frac{\partial x}{\partial x_0}\left(t ; t_0, x_0\right)\right)=X_{t_0}(t)
> $$
> 
> gilt, stimmt die **Übertragungsmatrix** für die Fehlerfortpflanzung bei einem AWP mit dem Matrizanten überein.

## Lösung von Inhomogenen AWP

> [!question] Durch die [Variation der Konstanten](Analysis/Variation%20der%20Konstanten.md) ist die Lösung des [inhomogenen AWP](../Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-1) $x'(t)=\mathbf{A}(t)x(t)+b(t)$ mit Anfangswerten $x(t_{0})=x_{0}$ gegeben durch: 
> $$x\left(t ; t_0, x_0\right)=X_{t_0}(t)\left[x_0+\int_{t_0}^t X_{t_0}(\tau)^{-1} b(\tau) d \tau\right]:=R(t)$$
> $R(t)$ Steht für die Rechte seite der DGL (also der term rechts des Gleichheitszeichens)

> [!success] Hier ist gezeigt, dass $R(t)$ tatsächlich die eindeutige Lösung des [AWP 1.2](Lineare%20DGL-Systeme%201.%20Ordnung.md) ist:
> ![](assets/Pasted%20image%2020241106135932.png)

## DGL-Systeme mit konstanten Koeffizienten

Bei DGL Systemen mit konstanten Koeffizienten lässt sich die Fundamentalmatrix $X(t)$ durch die Matrix-Exponentialfunktion und den Hauptvektoren des Systems bestimmen: 

- Siehe [Fundamentalmatrix](Lineare%20DGL-Systeme%201.%20Ordung%20mit%20konstanten%20Koeffizienten.md#Fundamentalmatrix) in DGL Systeme mit konstanten Koeffizienten
