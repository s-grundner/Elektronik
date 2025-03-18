---
tags: 
aliases:
  - Transitionsmatrix
  - Fundamentalsystem
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 30. Oktober 2024
professor:
---
 

# Fundamentalmatrix

> [!def] **D1 - FUMA)** Definition der Fundamentalmatrix ^FUMA
> Jedes System $\left\{\mathbf{x}_1, \ldots, \mathbf{x}_m\right\}$ von $m$ [linear unabhängigen](Algebra/Lineare%20Abhängigkeit.md) Lösungen eines [homogenen DGL-Systems](Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-2) heißt **Fundamentalsystem**, die zugehörige [Matrix](Algebra/Matrix.md)
> 
> $$
> \mathbf{X}(t):=\left(\mathbf{x}_1(t), \ldots, \mathbf{x}_m(t)\right)
> $$
> 
> heißt **Fundamentalmatrix**.

Die Fundamentalmatrix ist also die Sammlung aller homogenen Lösungen. Ist das DGL-System aus einer [DGL höherer Ordnung](Lineare%20DGL%20n-ter%20Ordnung.md) entsprungen, ist jede Zeile die Ableitung der Vorherigen.


> [!satz] **S1 - Eindeutige Lösung)** Sei $x(t;t_{0};x_{0})$ die eindeutige Lösung von $x'=A(t)x,\quad x(t_{0}) = x_{0}$ ^FM-S1
> 
> Dann lässt sich die Lösung eines homogenen AWP mit Hilfe einer Fundamentalmatrix $X(t)$ wie folgt angeben:
> 
> $$
> \begin{gathered}
> x(t;t_{0},x_{0})=X(t)\cdot X(t_{0})^{-1}\cdot x_{0} =\mathbf{\Phi}(t)\cdot x_{0} = \mathbf{\Phi}_{t}(x_{0})\\
> \implies X(t)\cdot X(t_{0})^{-1} =\mathbf{\Phi}(t) \\
> \end{gathered}
> $$


Mittels dem [Gauß-Jordan](Algebra/Gauß-Jordan-Verfahren.md) Verfahren kann de inverse der Fundamentalmatrix gebildet werden. $\mathbf{\Phi}_{t}(x_{0})$ ist also die Lösung welche man auch als den **Fluss** bezeichnet. Wenn man diesen Plottet erhält man einen Vektorplot der den Fluss der Lösung visualisiert

![250](assets/Pasted%20image%2020250318224707.png)


> [!def] **D2 - TRSM)** Transitionsmatrix ^TRSM
> Gilt außerdem $X\left(t_0\right)=\mathbb{1}_m$ (die [Einheitsmatrix](Algebra/Einheitsmatrix.md)) für ein $t_0 \in I$, so heißt diese Fundamentalmatrix auch **Transitionsmatrix** oder **Hauptfundamntalmatrix**, bezeichnet mit $\mathbf{\Phi}$. Ältere bezeichnung *Matrizant* ist nicht mehr üblich
> 
>  $$X(t)\cdot X(t_{0})^{-1}=\mathbf{\Phi}(t, t_{0})$$


> [!satz] **S2)** Eigenschaften der **Transitionsmatrix** ^TRSM-Eigenschaften
> 
> 1. $\dot{\mathbf{\Phi}}(t)=\mathbf{A}\mathbf{\Phi}(t)$ ... Das Fundamentalsystem löst das homogene AWP
> 2. $\mathbf{\Phi}(t_{0}) = \mathbb{1}$ ... Die Transitionsmatrix am Anfangswert des Intervalls ist die Einheitsmatrix
> 3. $\mathbf{\Phi}(t)^{-1}=\mathbf{\Phi}(-t)$ ... Für die Inverse gilt, dass man dem Fluss der Lösung in die umgekehrte Richtung Folgt
> 4. $\mathbf{\Phi}(t+\tau) = \mathbf{\Phi}(t)\mathbf{\Phi}(\tau)$ ... Eine Zeitliche Verschiebung eintspricht einer Entsprechenden Transformation.

Der Matrizant ist equivalent zur Übertragungsmatrix der Fehlerfortpflanzung
Da hier

$$
\left(\frac{\partial x}{\partial x_0}\left(t ; t_0, x_0\right)\right)=\mathbf{\Phi}(t)
$$

gilt, stimmt die **Übertragungsmatrix** für die Fehlerfortpflanzung bei einem AWP mit dem Matrizanten überein.

## Lösung von Inhomogenen AWP

> [!question] Durch die [Variation der Konstanten](Analysis/Variation%20der%20Konstanten.md) ist die allgemeine Lösung des [inhomogenen AWP](Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-1) $x'(t)=\mathbf{A}(t)x(t)+b(t)$ mit Anfangswerten $x(t_{0})=x_{0}$ gegeben durch: 
> $$x\left(t ; t_0, x_0\right)=\mathbf{\Phi}(t)\left[x_0+\int_{t_0}^t \mathbf{\Phi}(\tau)^{-1} b(\tau) d \tau\right]$$


