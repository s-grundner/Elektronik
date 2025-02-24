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

> [!def] **D1 - DGL)** Allgemeine Form
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


> [!def] **D2 - AWP)** Gegeben seien eine offene Menge $D \subset \mathbb{R}^{m+1}$, eine Funktion $f: D \rightarrow \mathbb{R}^m$ und ein fester Punkt $\left(t_0, x_0\right) \in D$.
> 
> $x$ heißt Lösung des Anfangswertproblems, wenn es ein Intervall $I$ mit $t_0 \in I$ gibt,
> sodass $x: I \rightarrow \mathbb{R}^m$ differenzierbar ist, $g r(x) \subset D$ gilt und
> 
> $$x^{\prime}(t)=f(t, x(t))\tag{AWP}$$
> 
> für alle $t \in I$ und $x\left(t_0\right)=x_0$
> 
> > [!important] [AWP 1.1](Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-1), [AWP 1.2](Lineare%20DGL-Systeme%201.%20Ordnung.md#^AWP1-2)

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

## Stabilität von Lösungen

Hier sind Wir daran Interessiert, wie sich zwei Lösungen einer DGL, welche sich durch leicht unterschiedliche Anfangswerte $(t_{0},x_{0})$ unterscheiden, im Grenzwert $x\to \infty$ verhalten.

### Stabil

Die Differenz bleibt für alle $t$ innerhalb einer Grenze $\varepsilon$, wenn man nur um einen kleinen Abstand $\delta$ vom Startwert abweicht.

![](../assets/Excalidraw/%7BMOC%7D%20DGL%202025-02-21%2019.10.16.excalidraw)

### Attrahierend

Die Differenz geth für $t \to \infty$ gegen $0$, wenn man nur um einen kleinen Abstand $\delta$ vom Startwert abweicht.#

![](../assets/Excalidraw/%7BMOC%7D%20DGL%202025-02-21%2019.14.56.excalidraw)

### Asymptotisch Stabil (Stabil & Attrahierend)

Die Differenz überschreitet den kleinen $\delta$ des Startwertes nicht und geht für $t \to 0$ gegen $0$

![](../assets/Excalidraw/%7BMOC%7D%20DGL%202025-02-21%2019.18.06.excalidraw)

## Numerische Lösungen

- [Numerische Lösungsverfahren von DGL](Analysis/Numerische%20Lösungsverfahren%20von%20DGL.md)

# Tags

![](https://www.youtube.com/embed/p_di4Zn4wz4)

![DGL-NOTES](assets/pdf/DGL-NOTES.pdf)
