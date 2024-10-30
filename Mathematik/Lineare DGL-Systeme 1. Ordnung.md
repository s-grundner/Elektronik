## Lineare DGL-Systeme 1. Ordnung

vorher: $x' f(t,\bar{x})$

jetzt: $\underbrace{ x' \overset{(*)}{=} A(t)x+b(t) }_{ \text{lin. DGL-System} }, \quad t \in I\quad I\dots\text{(Intervall)}$

> [!quote] Lineare DGL-Systeme 1. Ordnung
>Eine Reihe von naturwissenschaftlichen Problemstellungen, wie z.B. Feder-DämpferSysteme der Mechanik oder Kirchhoffsche Netzwerke der Elektrotechnik, lassen sich durch explizite lineare DGL-Systeme erster Ordnung beschreiben

Also durch Systeme der Form

$$
x^{\prime}=A(t) x+b(t) \tag{AWP}
$$

wobei es sich bei $A(t)$ um eine Matrix in $\mathbb{R}^{m \times m}$ und bei $b(t)$ um einen Vektor in $\mathbb{R}^m$ handelt, also:


$$
\begin{align}
A(t)&=\begin{pmatrix}
a_{11}  & \cdots & a_{1m} (t) \\
\vdots & \ddots & \vdots \\
a_{m_{1}}(t) & \cdots & a_{mm}(t)
\end{pmatrix}=(a_{ij}(t))^m_{i,j=1} \\ \\
b(t) &= \begin{pmatrix}
b_{1}(t) \\
\vdots \\
b_{m}(t)
\end{pmatrix} = (b_{i}(t))_{i=1}^{m}
\end{align}
$$

> [!important] Falls $b=0$, dann heißt $(*)$ ein **homogenes DGL-System**, ansonsten **inhomogen**

Man kann den Satz von Picad von Picard Lindelöf auf das DGL-System erster ordnung anwenden

- $f(t,x)$ ist definiert auf $I\times \mathbb{R}^m$
- $K \subseteq I$ ... $K$ ist ein abgeschlossenes Teilintervall


$$
\lVert f(t,x)-\bar{f}(t,y) \rVert = \lVert  \rVert 
$$

$$
\begin{align}
A(t)\cdot z &= \left( \sum_{j=1}^{m} a_{ij}(t)\cdot z_{j} \right)^m _{i=1} \\
\lVert A(t)\cdot z \rVert &=\max
\end{align}
$$

> [!quote] Nach der globalen Version des Satz von [Picard-Lindelöf](Picard-Lindelöf.md) hat also ein Lineares DGL-System für $\forall t\in I$ eine Eindeutige Lösung

### Homogene Gleichung

Seien $x_{1},x_{2}\quad I\to \mathbb{R}^{m}$ zwei Lösungen von $x'A(t)\cdot x$, mit Zahlen $\lambda_{1}, \lambda_{2}$, dann gilt:
$$
\begin{align}
(\lambda_{1}x_{1}+\lambda_{2} x_{2})'= \lambda_{1}\cdot x_{1}'+\lambda_{2}\cdot x_{2}' \\
\end{align}
$$

### Inhomogene Gleichung

Seien $x_{1},x_{2}$ Lösungen der inhomogenen Gleichung $(*)$

$$
\begin{align}
(x_{1}-x_{2})' = x_{1}'-x_{2}'= A(t)x_{1} +b(t)-(A(t)x_{2}+b(t))
\end{align}
$$

Die differenz zweier Lösungen der inhomogenen Gleichugn  $x'= A(t)x+b(t)$ ist die Lösung der homogenen Gleichung $x'=A(t)x$.

Das heißt, jede Lösung der inhomogenen Gleichung kann man schreiben als Summe **einer** fixen partikulären Lösung $x_{p}$ von $x'=A(t)x+b(t)$ und einer Lösung $x_{h}$ der homogenen Gleichung.

$$
x_{2}= \underbrace{ x_{1} }_{ x_{p} }+(\underbrace{ x_{2}-x_{1} }_{ x_{h} })
$$

Daraus folgt,  wenn die Anfangswerte $x_{0,1},\dots x_{0,k}\in\mathbb{R}^{m}$ liner unabhängig sind, dann sind auch die dazugehörigen eindeutigen Lösungen $x_{1},\dots x_{k}$ [linear unabhängig](Algebra/Lineare%20Abhängigkeit.md)


> [!important] Satz 6.1 Die Lösung von $x'= A(t)x$ bilden einen $m$-dimensionalen [Vektorraum](Algebra/Vektorraum.md)
> 


> [!question] Wie kommt man von der [[Fundamentalmatrix]] $X(t)$ auf eine partikuläre Lösung $x_{p}$ vom $\dot{x}=A(t)x+b(t)$
> mit [Variation der Konstanten](Algebra/Variation%20der%20Konstanten.md)
> - Die konstante $c$ wird zu $c(t)$
