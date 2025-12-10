---
tags: 
aliases:
  - Lipschitz-Stetig
keywords: 
subject:
  - VL
  - Mathematik 3
  - Mathematik 2
  - Mathematik 1
semester: WS24
created: 16. Oktober 2024
professor:
---
 

# Lipschitz-Stetigkeit

> [!def] **LPS D1)** $f: A \rightarrow B$ erfüllt eine Lipschitzbedingung, wenn eine Lipschitz-Konstante $L>0$ existiert, sodass für alle $x, y \in A$ gilt:
> 
> $$\|f(x)-f(y)\| \leq L\|x-y\|$$
> 
> Erfüllt $f$ eine Lipschitzbedingung, so ist $f$ stetig, denn:
> 
> $$x_n-x \rightarrow 0 \Longrightarrow\left\|f\left(x_n\right)-f(x)\right\| \leq L\left\|x_n-x\right\| \rightarrow 0$$
> 
> $f$ heißt dann **Lipschitz-Stetig**.


> [!info] Erläuterung
> - $x$ ist der Ausgangspunkt und $y$ ist ein beliebiger anderer Punkt.
> - $L$ ist die Lipschitz-**Konstante**.
> - Das heißt wenn durch das einsetzen von $f(x)$ bzw, $f(y)$ ein von $f$ Abhängiges $L$ überbleibt ist $f$ nicht Lipschitzstetig.

> [!hint] $L$ ist die gerade, zwischen welcher die Funktion stetig propagiert
> Für eine lipschitzstetige Funktion existiert ein Doppelkegel (weiß), dessen Ursprung entlang des Graphen bewegt werden kann, sodass der Graph stets außerhalb des Doppelkegels bleibt
>
> ![500](../../_assets/Lipschitz_Visualisierung.gif)

## Folgerungen

- Lösbarkeit einer DGL: [Picard-Lindelöf](Picard-Lindelöf.md)

---

- [Analysis Integrale: Eine stetige Funktion, die nicht Lipschitz-stetig ist](https://www.youtube.com/watch?v=p51A_GClQKE&t=298s)