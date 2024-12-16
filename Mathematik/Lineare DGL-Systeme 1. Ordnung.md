---
tags: 
aliases:
  - AWP 1.1
  - AWP 1.2
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 30. Oktober 2024
professor:
---
 

# Lineare DGL-Systeme 1. Ordnung

vorher: $x' = f(t,\bar{x})$

jetzt: $\underbrace{ x' \overset{(*)}{=} A(t)x+b(t) }_{ \text{lin. DGL-System} }, \quad t \in I\quad I\dots\text{(Intervall)}$

> [!quote] Lineare DGL-Systeme 1. Ordnung
>Eine Reihe von naturwissenschaftlichen Problemstellungen, wie z.B. [Feder](../Physik/Federkraft.md)-Dämpfer Systeme der Mechanik oder Kirchhoffsche Netzwerke der Elektrotechnik, lassen sich durch explizite lineare DGL-Systeme erster Ordnung beschreiben.

> [!important] … Also durch Systeme der Form
> 
> $$x^{\prime}=A(t) x+b(t) \tag{AWP (1.1)}$$

> [!info] wobei es sich bei $A(t)$ um eine [Matrix](Algebra/Matrix.md) in $\mathbb{R}^{m \times m}$ und bei $b(t)$ um einen [Vektor](Analysis/Vektor.md) in $\mathbb{R}^m$ handelt, also:
> Die Matrix $A$ heißt **Koeffizientenmatrix** und der Vektor $b$ **Störvektor**.
> > [!success] Ist die Koeffizientenmatrix konstant ($A(t) \mapsto A$)…
> > …Sind vereinfachungen bezüglich der Ermittlung der [Fundamentalmatrix](Fundamentalmatrix.md) möglich.
> > - siehe [Lineare DGL-Systeme 1. Ordung mit konstanten Koeffizienten](Lineare%20DGL-Systeme%201.%20Ordung%20mit%20konstanten%20Koeffizienten.md)

$$
\begin{align}
A(t)&=\begin{pmatrix}
a_{11}  & \cdots & a_{1m} (t) \\
\vdots & \ddots & \vdots \\
a_{m_{1}}(t) & \cdots & a_{mm}(t)
\end{pmatrix}=(a_{ij}(t))^m_{i,j=1} \quad\in\mathbb{R}^{m\times m}\\ \\
b(t) &= \begin{pmatrix}
b_{1}(t) \\
\vdots \\
b_{m}(t)
\end{pmatrix} = (b_{i}(t))_{i=1}^{m}\quad \in\mathbb{R}^{m}
\end{align}
$$


> [!important] Falls $b=\mathbf{0}$, dann heißt $(*)$ ein **homogenes DGL-System**, ansonsten **inhomogen**
> zu jedem inhomogenen System gibt es ein homogenes System $$x'=A(t)x\tag{AWP(1.2)}$$

> [!question]- Implizite Form eines inhomogenen DGL-Systems
> $C(t)x'=A(t)x+b(t)$ mit $C(t) \in \mathbb{R}^{m \times m}$.
> So ein System lässt sich nur dann in ein explizites umschreiben, wenn die Matrix $C(t)$ für alle $t$ regulär ist.

Man kann den Satz von [Picard-Lindelöf](Picard-Lindelöf.md) auf das DGL-System erster Ordnung anwenden

- $f(t,x)$ ist definiert auf $I\times \mathbb{R}^m$ (also $f: I \to \mathbb{R}$ )
- $K \subseteq I$ … $K$ ist ein abgeschlossenes Teilintervall

> [!quote] Nach der globalen Version des Satz von Picard Lindelöf hat also ein Lineares DGL-System für $\forall t\in I$ eine Eindeutige Lösung

## Homogene Gleichung

Sind $x_1$ und $x_2$ Lösungen des linearen homogenen Systems $x'=A(t)x$, so auch jede [Linearkombination](Algebra/Linearkombination.md) davon, da mit $\lambda_1, \lambda_2 \in \mathbb{R}$ gilt:

$$
\begin{aligned}
\left(\lambda_1 \cdot x_1+\lambda_2 \cdot x_2\right)^{\prime}(t) & =\lambda_1\cdot x_1^{\prime}(t)+\lambda_2\cdot x_2^{\prime}(t)\\
&=\lambda_1 A(t)\cdot x_1(t)+\lambda_2 A(t)\cdot x_2(t)\\
& =A(t)\cdot\left(\lambda_1 \cdot x_1(t)+\lambda_2 \cdot x_2(t)\right)
\end{aligned}
$$

## Inhomogene Gleichung

Ist $x_1$ Lösung des inhomogenen Systems und $x_2$ Lösung des homogenen Systems, so löst $x_1+x_2$ ebenfalls das inhomogene System, da gilt:

$$
\begin{align}
\left(x_1+x_2\right)'(t)&=\left(x_{1}'(t)+x_{2}'(t)\right) \\
&=A(t) x_1(t)+b(t)+A(t) x_2(t) \\
&=A(t)\left(x_1(t)+x_2(t)\right)+b(t)
\end{align}
$$


Seien $x_{1},x_{2}$ Lösungen der inhomogenen Gleichung $x'=A(t)x+b(t)$

$$
\begin{align}
(x_{1}-x_{2})' &= x_{1}'-x_{2}' \\
&= A(t)x_{1} + b(t)-(A(t)x_{2}+b(t)) \\
&=A(t)(x_{1}-x_{2})
\end{align}
$$

Die differenz zweier Lösungen der inhomogenen Gleichugn $x'= A(t)x+b(t)$ ist die Lösung der homogenen Gleichung $x'=A(t)x$.

Das heißt, jede Lösung der inhomogenen Gleichung kann man schreiben als Summe **einer** fixen partikulären Lösung $x_{p}$ von $x'=A(t)x+b(t)$ und einer Lösung $x_{h}$ der homogenen Gleichung.

$$
x_{2}= \underbrace{ x_{1} }_{ x_{p} }+(\underbrace{ x_{2}-x_{1} }_{ x_{h} })
$$

Daraus folgt, wenn die Anfangswerte $x_{0,1},\dots x_{0,k}\in\mathbb{R}^{m}$ liner unabhängig sind, dann sind auch die dazugehörigen eindeutigen Lösungen $x_{1},\dots x_{k}$ [linear unabhängig](Algebra/Lineare%20Abhängigkeit.md)


> [!important] Seien $A: I \rightarrow \mathbb{R}^m \times \mathbb{R}^m$ und $b: I \rightarrow \mathbb{R}^m$ stetig.
> Dann bilden die Lösungen des homogenen linearen Systems AWP 1.2 einen $m$-dimensionalen [Vektorraum](Algebra/Vektorraum.md)
> 
> **[Superposition](../Elektrotechnik/Superpositionsprinzip.md)**: Die Lösungen des inhomogenen linearen Systems AWP 1.1 bilden eine $m$ dimensionale lineare Mannigfaltigkeit.
> Man erhält alle Lösungen von AWP 1.1, indem man zu irgendeiner festen **partikulären** Lösung von AWP 1.1 alle Lösungen des zugehörigen **homogenen** Systems addiert.


> [!question] Wie kommt man von der [[Fundamentalmatrix]] $X(t)$ auf eine partikuläre Lösung $x_{p}$ vom $\dot{x}=A(t)x+b(t)$
> mit [Variation der Konstanten](Analysis/Variation%20der%20Konstanten.md)
> - Die konstante $c$ wird zu $c(t)$

