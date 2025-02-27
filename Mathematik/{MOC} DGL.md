---
tags:
  - MOC
  - Analysis
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
  - DGL
---

# Differentialgleichungen (DGL)

![](../assets/Excalidraw/%7BMOC%7D%20DGL%202025-02-21%2021.10.45.excalidraw)

> [!info] Arten von Differentialgleichungen
>
> | gewöhnlich | partiell |
> | - | - |
> | Linear | Nichtlinear |
> | homogen | inhomogen |
> | konstaner Koeffizient | nicht-konstanter Koeffizient |

> [!info] Ordnung
> Die höchste Vorkommende [Ableitung](Analysis/Differenzialrechnung.md) in einer DGL nennen wir deren Ordnung

> [!def] **D1 - DGL)** Allgemeine Form ^DGL
> 
> **Implizite Differenzialgleichung:** $F\left(t,x,x',\dots,x^{(n)}\right) = 0$
>  
> **Explizite Differenzialgleichung:** $x^{(n)}= f\left(t,x,x',\dots,x^{(n-1)}\right)$
> 
> $\implies F\left(t,x,x',\dots,x^{(n)}\right) := x^{(n)}-f\left(t,x,x',\dots, x^{(n-1)}\right)$
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


> [!def] **D2 - AWP)** Gegeben seien eine offene Menge $D \subset \mathbb{R}^{m+1}$, eine Funktion $f: D \rightarrow \mathbb{R}^m$ und ein fester Punkt $\left(t_0, x_0\right) \in D$. ^AWP
> 
> $x$ heißt Lösung des Anfangswertproblems, wenn es ein Intervall $I$ mit $t_0 \in I$ gibt,
> sodass $x: I \rightarrow \mathbb{R}^m$ differenzierbar ist, $g r(x) \subset D$ gilt und
> 
> $$x^{\prime}(t)=f(t, x(t))\tag{AWP}$$
> 
> für alle $t \in I$ und $x\left(t_0\right)=x_0$
> 
> > [!important] [inhomogene Systeme](Analysis/Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-1), [homogenes Systeme](Analysis/Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-2)

Um die Abhängigkeit der Lösung des AWP von $t_0$ und $x_0$ anzudeuten, schreibt man auch

$$
x\left(t ; t_0, x_0\right)
$$

## Randwert Problem (RWP)

Ein [Randwertproblem](Randwertprobleme.md) (RWP) ist ein Problem, bei dem eine Differenzialgleichung zusammen mit Randbedingungen gegeben ist.

## Stabilität von Lösungen

Hier sind Wir daran Interessiert, wie sich zwei Lösungen einer DGL, welche sich durch leicht unterschiedliche Anfangswerte $(t_{0},x_{0})$ unterscheiden, im Grenzwert $x\to \infty$ verhalten.

| **Stabil**                                                                                                                                     | **Attrahierend**                                                                                                        | **Asymptotisch Stabil**<br>Stabil & Attrahierend                                                        |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Die Differenz bleibt für alle $t$ innerhalb einer Grenze $\varepsilon$, wenn man nur um einen kleinen Abstand $\delta$ vom Startwert abweicht. | Die Differenz geht für $t \to \infty$ gegen $0$, wenn man nur um einen kleinen Abstand $\delta$ vom Startwert abweicht. | Die Differenz überschreitet den kleinen $\delta$ des Startwertes nicht und geht für $t \to 0$ gegen $0$ |
| ![](../assets/Excalidraw/DGL-Stabil.md)                                                                                                        | ![](../assets/Excalidraw/DGL-Attr.md)                                                                                   | ![](../assets/Excalidraw/DGL-AsympStabil.md)                                                            |

## Lösungsmethoden von DGL

- Finden der der homogenen und partikulären Lösung
    - Trennen der Variablen
    - Fundamentalmatrix
    - Variation der Konstanten
- [Laplacetransformation](../Systemtheorie/Laplacetransformation.md)
- [Analytische Verfahren](Analysis/Numerische%20Lösungsverfahren%20von%20DGL.md#Analytische%20Verfahren)
- [Numerische Verfahren](Analysis/Numerische%20Lösungsverfahren%20von%20DGL.md#Numerische%20Verfahren)

# Tags

![](https://www.youtube.com/embed/p_di4Zn4wz4)

[DGL-NOTES HTL](assets/pdf/DGL-NOTES.pdf)
