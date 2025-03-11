---
tags: 
aliases:
  - Matrizant
  - FM D1
  - FM D2
  - FM S1
  - Transitionsmatrix
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
> Jedes System $\left\{x_1, \ldots, x_m\right\}$ von $m$ [linear unabhängigen](Algebra/Lineare%20Abhängigkeit.md) Lösungen eines [homogenen DGL-Systems](Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-2) heißt **Fundamentalsystem**, die zugehörige [Matrix](Algebra/Matrix.md)
> 
> $$
> X(t):=\left(x_1(t), \ldots, x_m(t)\right)
> $$
> 
> heißt **Fundamentalmatrix**.

Die Fundamentalmatrix ist also die Sammlung aller homogenen Lösungen. Ist das DGL-System aus einer [DGL höherer Ordnung](Lineare%20DGL%20n-ter%20Ordnung.md) entsprungen, ist jede Zeile die Ableitung der Vorherigen.

Die Fundamentalmatrix heißt auch **Transitionsmatrix** oder **Fluss** der zugehörigen DGL. Auch mit dem Symbol $\mathbf{\Phi}$ bezeichnet.


> [!satz] **S1)** Eigenschaften der Fundamentalmatrix
> 
> 1. $\dot{X}(t)=\mathbf{A}X(t)$ ... Jede Lösung erfüllt das homegene DGL-System
> 2. $X(t_{0}) = \mathbb{1}$
> 
> Hat das zur Fundamentalmatrix gehörige lin. DGL-System eine [Konstante Koeffizientenmatrix](Lineare%20DGL-Systeme%201.%20Ordung%20mit%20konstanten%20Koeffizienten.md), weist sie zusätzlich folgende Eigenschaften auf:
> 
> 3. $X(t)^{-1}=X(-t)$
> 4. $X(t+\tau) = X(t)X(\tau)$


> [!def] **D2 - MATZ)** Definition des Martizant
> Gilt außerdem $X\left(t_0\right)=\mathbb{1}_m$ (die [Einheitsmatrix](Algebra/Einheitsmatrix.md)) für ein $t_0 \in I$, so heißt diese Fundamentalmatrix auch **Matrizant**, bezeichnet mit $X_{t_0}$.
> 
>  $$X(t)\cdot X(t_{0})^{-1}=X_{t_{0}}(t)$$

> [!satz] **S2 - Eindeutige Lösung)** Sei $x(t;t_{0};x_{0})$ die eindeutige Lösung von $x'=A(t)x,\quad x(t_{0}) = x_{0}$ ^FM-S1
> 
> Dann lässt sich die Lösung eines homogenen AWP mit Hilfe einer Fundamentalmatrix $X(t)$ wie folgt angeben:
> 
> $$
> \begin{gathered}
> x(t;t_{0},x_{0})=X(t)\cdot X(t_{0})^{-1}\cdot x_{0} =X_{t_{0}}(t)\cdot x_{0} \\ \implies X(t)\cdot X(t_{0})^{-1} =X_{t_{0}}(t) \\
> \end{gathered}
> $$
> 
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

> [!question] Durch die [Variation der Konstanten](Analysis/Variation%20der%20Konstanten.md) ist die Lösung des [inhomogenen AWP](Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-1) $x'(t)=\mathbf{A}(t)x(t)+b(t)$ mit Anfangswerten $x(t_{0})=x_{0}$ gegeben durch: 
> $$x\left(t ; t_0, x_0\right)=X_{t_0}(t)\left[x_0+\int_{t_0}^t X_{t_0}(\tau)^{-1} b(\tau) d \tau\right]:=R(t)$$
> $R(t)$ Steht für die Rechte seite der DGL (also der term rechts des Gleichheitszeichens)

Durch die Eigenschaften der Fundamentalmatrix lässt sich die Variation der Konstanten auch anschreiben wie;


