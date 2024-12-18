---
tags:
  - MOC
  - Infinitesimalrechnung
  - DGL
aliases:
  - DGL
  - Differenzialgleichungen
  - "#DGL"
  - AWP
  - Anfangswerte
subject:
  - Mathematik 3
  - VL
semester: WS24
professor:
  - Markus Passenbrunner
created: 14th March 2022
def:
  - AWP
---

# Differentialgleichungen (DGL)

> [!info] Arten von Differentialgleichungen
>
> | | |
> | --------------------- | ---------------------------- |
> | gewöhnlich             | partiell                     |
> | Linear                | Nichtlinear                  |
> | homogen               | inhomogen                    |
> | konstaner Koeffizient | nicht-konstanter Koeffizient | 
> 
> > [!info] Ordnung
> > Die höchste Vorkommende [Ableitung](Analysis/Differenzialrechnung.md) in einer DGL nennen wir deren Ordnung

> [!info] Allgemeine Form
> 
> **Implizite Differenzialgleichung:** $F(t,x,x',\dots,x^{(n)}) = 0$
>  
> **Explizite Differenzialgleichung:** $x^{(n)}= f(t,x,x',\dots,x^{(n-1)})$
> 
> $\implies F(t,x,x',\dots,x^{(n)}) := x^{(n)}-f(t,x,x',\dots, x^{(n-1)})$
> 

> [!hint] Jede DGL und DGL-System $n$-ter Ordnung lässt sich in ein [DGL-System](Analysis/DGL-System.md) 1. Ordnung überführen
> 
> **DGL**: Eine Einzige Differentialgleichung
> **DGL-System**: Ein System aus mehreren Differentialgleichungen die voneinander abhängen
> 



## Anfangswert Problem (AWP)

Ein Anfangswertproblem (AWP) ist ein Problem, bei dem eine Differentialgleichung zusammen mit einer Anfangsbedingung gegeben ist. 

> [!hint] **Anfangswerte** sind die Werte, die die Lösung der Differentialgleichung an **einer** bestimmten Stelle $t_{0}$ annehmen soll.
> $$ x_{0} := x(t_{0}), \quad x_{0}' := x'(t_{0}), \quad \ldots, \quad x_{0}^{(n-1)} := x^{(n-1)}(t_{0}) $$


> [!def] **D1 - AWP)** Gegeben seien eine offene Menge $D \subset \mathbb{R}^{m+1}$, eine Funktion $f: D \rightarrow \mathbb{R}^m$ und ein fester Punkt $\left(t_0, x_0\right) \in D$.
> 
> $x$ heißt Lösung des Anfangswertproblems, wenn es ein Intervall $I$ mit $t_0 \in I$ gibt,
> sodass $x: I \rightarrow \mathbb{R}^m$ differenzierbar ist, $g r(x) \subset D$ gilt und
> 
> $$x^{\prime}(t)=f(t, x(t))\tag{AWP}$$
> 
> für alle $t \in I$ und $x\left(t_0\right)=x_0$

Um die Abhängigkeit der Lösung des AWP von $t_0$ und $x_0$ anzudeuten, schreibt man auch manchmal

$$
x\left(t ; t_0, x_0\right)
$$

## Randwert Problem (RWP)

Ein [Randwertproblem](Randwertprobleme.md) (RWP) ist ein Problem, bei dem eine Differenzialgleichung zusammen mit Randbedingungen gegeben ist.

> [!important] Bei RWP werden an mindestens zwei verschiedenen Punkten des Lösungsintervalls Bedingungen vorgeschrieben.
> $x' = f(t,x) \in \mathbb{R}^{m}$ wie bisher mit $t \in[a,b]$
> Aber statt an $x_{0}(t_{0})=x_{0}$ (Anfangswert) betrachten wir Randwerte
> 
> $$
> \begin{align}
> g(x(a), x(b)) = 0 \\
> g: \mathbb{R}^{m}\times R^{m} \rightarrow \mathbb{R}^{m}
> \end{align}
> $$

## Map of Content

- [lineare DGL 1. Ordnung](Analysis/lineare%20DGL%201.%20Ordnung.md)
- [lineare DGL 2. Ordnung](lineare%20DGL%202.%20Ordnung.md)
- [DGL-System](Analysis/DGL-System.md)

## Anwendungen und Beispiele

- [Schwingkreise](../Physik/Schwingkreise.md)
- Wärmeleitungsgleichung
- Schaltungsberechnung mit Induktoren und Kondensatoren
- exponentielles Wachstum

# Tags

![](https://www.youtube.com/embed/p_di4Zn4wz4)

![DGL-NOTES](assets/pdf/DGL-NOTES.pdf)
