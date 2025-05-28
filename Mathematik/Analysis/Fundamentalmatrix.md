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
> Jedes System $\left\{\mathbf{x}_1, \ldots, \mathbf{x}_m\right\}$ von $m$ [linear unabhängigen](Algebra/Lineare%20Abhängigkeit.md) Lösungen eines [homogenen DGL-Systems](Lineare%20DGL-Systeme.md#^AWP1-2) heißt **Fundamentalsystem**, die zugehörige [Matrix](Algebra/Matrix.md)
> 
> $$
> \mathbf{X}(t):=\left(\mathbf{x}_1(t), \ldots, \mathbf{x}_m(t)\right)
> $$
> 
> heißt **Fundamentalmatrix**.

Die Fundamentalmatrix ist also die Sammlung aller homogenen Lösungen. Ist das DGL-System aus einer [DGL höherer Ordnung](Lineare%20DGL%20n-ter%20Ordnung.md) entsprungen, ist jede Zeile die Ableitung der Vorherigen.


> [!satz] **S1 - Eindeutige Lösung)** Sei $x(t;t_{0};x_{0})$ die eindeutige Lösung von $x'=A(t)x,\quad x(t_{0}) = x_{0}$ ^FM-S1
> 
> Dann lässt sich die Lösung eines homogenen AWP mit Hilfe einer Fundamentalmatrix $\mathbf{X}(t)$ wie folgt angeben:
> 
> $$
> \begin{gathered}
> x(t;t_{0},x_{0})=\mathbf{X}(t)\cdot \mathbf{X}(t_{0})^{-1}\cdot x_{0} =\mathbf{\Phi}(t,t_{0})\cdot x_{0} = \mathbf{\Phi}_{t}(x_{0})\\
> \implies \mathbf{X}(t)\cdot \mathbf{X}(t_{0})^{-1} =\mathbf{\Phi}(t,t_{0}) \\
> \end{gathered}
> $$


Mittels dem [Gauß-Jordan](Algebra/Gauß-Jordan-Verfahren.md) Verfahren kann de inverse der Fundamentalmatrix gebildet werden. Die Lösung $\mathbf{\Phi}_{t}(x_{0})$ beschreibt den Fluss des Systems, also die zeitliche Änderung des Anfangswertes $x_{0}$ unter der Dynamik des Systems. Wenn man diesen Plottet erhält man einen Vektorplot der den Fluss der Lösung visualisiert

## Transitionsmatrix

(Ältere bezeichnung *Matrizant* ist nicht mehr üblich)

> [!def] **D2 - TRSM)** Transitionsmatrix ^TRSM
> Gilt außerdem $\mathbf{X}\left(t_0\right)=\mathbb{1}_m$ (die [Einheitsmatrix](Algebra/Einheitsmatrix.md)) für ein $t_0 \in I$, so heißt diese Fundamentalmatrix auch **Transitionsmatrix** oder **Hauptfundamentalmatrix**, bezeichnet mit $\mathbf{\Phi}$. 
> 
>  $$\mathbf{X}(t)\cdot \mathbf{X}(t_{0})^{-1}=\mathbf{\Phi}(t, t_{0})$$

Wenn man schreibt $\mathbf{\Phi}(t)$, dann hat man implizit angenommen den Anfangswert bereits eingesetzt zu haben. Bei LTI-Systemen wo $t_{0}=0$ ist ist dies of üblich


> [!satz] **S2)** Eigenschaften der **Transitionsmatrix** ^TRSM-Eigenschaften
> 
> 1. $\mathbf{\dot{\Phi}}(t,t_{0})=\mathbf{A}\mathbf{\Phi}(t,t_{0})$:
> 	$\iff$ Das Fundamentalsystem löst das homogene AWP
> 2. $\mathbf{\Phi}(t_{0},t_{0}) = \mathbb{1}$:
> 	$\iff$ Die Transitionsmatrix am Anfangswert des Intervalls ist die Einheitsmatrix
> 
> **LTI-Systeme:** Ist das System auch zeitinvariant (*konstanter Koeffizient*), gilt zusätzlich
> 
> 3. $\mathbf{\Phi}(t+\tau) = \mathbf{\Phi}(t)\mathbf{\Phi}(\tau)$
>   $\iff$ Eine Zeitliche Verschiebung entspricht einer Entsprechenden Transformation.
> 4. $\mathbf{\Phi}(t,t_{0})^{-1} = \mathbf{\Phi}(-t,-t_{0}) = \mathbf{\Phi}(t_{0},t)$ und falls $t_{0}=0$, dann $\mathbf{\Phi}(t)^{-1}=\mathbf{\Phi}(-t)$)
>   $\iff$ Für die Inverse gilt, dass man dem Fluss der Lösung in die umgekehrte Richtung Folgt
> 5. Die Transitionsmatrix ist immer [regulär](../Algebra/Reguläre%20Matrizen.md)

Der Matrizant ist equivalent zur Übertragungsmatrix der Fehlerfortpflanzung
Da hier

$$
\left(\frac{\partial x}{\partial x_0}\left(t ; t_0, x_0\right)\right)=\mathbf{\Phi}(t)
$$

gilt, stimmt die **Übertragungsmatrix** für die Fehlerfortpflanzung bei einem AWP mit dem Matrizanten überein.

## Lösung von Inhomogenen AWP

Die Lösung des [inhomogenen AWP](Lineare%20DGL-Systeme.md#^AWP1-1) lässt sich mit der variation der Konstanten lösen

 ![Variation der Konstanten](Analysis/Variation%20der%20Konstanten.md#^VARK)  

## Ermittlung der Transitionsmatrix

Zur Ermittlung der Transitionsmatrix kann für **entkoppelte Systeme** bzw. 1-dimensionale Systeme [Trennen der Variablen](../Algebra/Trennen%20der%20Variablen.md) angewendet werden. Ansonsten bringt man das System in seine [Jordannormalform](../Algebra/Jordannormalform.md) 
