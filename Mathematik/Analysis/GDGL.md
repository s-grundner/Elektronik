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
  - Regelungstechnik
semester: WS24
professor:
  - Markus Passenbrunner
created: 14th March 2022
def:
  - AWP
  - DGL
---

# Gewöhnliche Differentialgleichungen (DGL)

- [Differenzengleichungen](Differenzengleichung.md) ***:LiArrowBigRightDash:***
- [:LiWaves: Partielle DGL](Partielle%20Differenzialgleichung.md) ***:LiArrowBigRightDash:***

---

**Ordnung:** Die Ordnung der DGL ist durch die höchste Vorkommende [Ableitung](Analysis/Differenzialrechnung.md) bestimmt.

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

> [!def] **D2 - AWP)** Gegeben seien eine offene Menge $D \subset \mathbb{R}^{m+1}$, eine Funktion $f: D \rightarrow \mathbb{R}^m$ und ein fester Punkt $\left(t_0, x_0\right) \in D$. ^AWP
> 
> $x$ heißt Lösung des Anfangswertproblems, wenn es ein Intervall $I$ mit $t_0 \in I$ gibt,
> sodass $x: I \rightarrow \mathbb{R}^m$ differenzierbar ist, $g r(x) \subset D$ gilt und
> 
> $$x^{\prime}(t)=f(t, x(t))\tag{AWP}$$
> 
> für alle $t \in I$ und $x\left(t_0\right)=x_0$
> 
> > [!important] [inhomogene Systeme](Lineare%20DGL-Systeme.md#^AWP1-1), [homogenes Systeme](Lineare%20DGL-Systeme.md#^AWP1-2)

Um die Abhängigkeit der Lösung des AWP von $t_0$ und $x_0$ anzudeuten, schreibt man auch

$$
x\left(t ; t_0, x_0\right)
$$

## Randwert Problem (RWP)

Ein [Randwertproblem](Randwertprobleme.md) (RWP) ist ein Problem, bei dem eine Differenzialgleichung zusammen mit Randbedingungen gegeben ist.

## Lösungen von DGL-Systemen

### Existenz von Lösungen

> Eindeutige Lösung nach [Picard-Lindelöf](Picard-Lindelöf.md)

### Lösungsmethoden von DGL

- Finden der der homogenen und partikulären Lösung
    - Trennen der Variablen
    - Fundamentalmatrix
    - Variation der Konstanten
- [Laplacetransformation](../../Systemtheorie/Laplacetransformation.md)
- [Analytische Verfahren](Analysis/Numerische%20Lösungsverfahren%20von%20DGL.md#Analytische%20Verfahren)
- [Numerische Verfahren](Analysis/Numerische%20Lösungsverfahren%20von%20DGL.md#Numerische%20Verfahren)

### Stabilität von Lösungen

> Stabilität nach [Ljapunov](Ljapunov.md)

# Tags

![](https://www.youtube.com/embed/p_di4Zn4wz4)

[DGL-NOTES HTL](assets/pdf/DGL-NOTES.pdf)
