---
tags:
  - Analysis
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 16. Oktober 2024
professor:
  - Markus Passenbrunner
satz:
  - PEAN
---
 

# Satz von Peano

> [!info] Globale version von Peano
> 
> ist $f:[c,d] \times \mathbb{R}^m \to \mathbb{R}$ stetig, dann hat das AWP for $t_{0} \in [c,d]$ eine Lösung $x$, die auf $[c,d]$ definiert ist.

Der satz von Peano sagt uns die existenz mindestens einer Lösung.

$\dot{x}=f(t,x)$ leifert eine Lösung sofern $f$ stetig ist




> [!satz] **S1 - PEAN)** Satz von Peano ^PEAN
> Gegeben seien eine offene [Menge](../Algebra/Mengenlehre.md) $D \subset \mathbb{R}^{m+1}$, eine Funktion $f: D \rightarrow \mathbb{R}^m$ und ein fester Punkt $\left(t_0, x_0\right) \in D$.
> Weiters sei die Funktion $f$ stetig auf dem **Quader**
> 
> $$ Q_{u, v}:=\{(t, x) \in \mathbb{R}^{m+1}: t \in[\underbrace{ t_0, t_0+u }_{ (1) }],\left\|x-x_0\right\| \leq v\} \subset D $$
> 
> Dann besitzt das [AWP](GDGL.md) eine Lösung im Intervall $\left[t_0, t_0+\alpha\right]$, wobei
> 
> $$ \alpha:=\min \left\{u, \frac{v}{M}\right\}, \quad M:=\max _{(t, x) \in Q_{u, v}}\|f(t, x)\| $$
> 
> > [!info]- Diese Aussage gilt auch…
> > … wenn man in $(1)$ das Intervall $\left[t_0, t_0+u\right]$ durch $\left[t_0-u, t_0\right.$ ] oder $\left[t_0-u, t_0+u\right]$ ersetzt, wobei sich dann das Existenzintervall zu $\left[t_0-\alpha, t_0\right]$ bzw. $\left[t_0-\alpha, t_0+\alpha\right]$ ändert.

![](../../assets/Excalidraw/Peano%202025-02-21%2017.57.50.excalidraw.md)

> [!question] Ist die Funktion $f$ zusätzlich [Lipschitz-Stetig](Lipschitz-Stetigkeit.md), dann ist die Lösung sogar Eindeutig: [Picard-Lindelöf](Picard-Lindelöf.md) 