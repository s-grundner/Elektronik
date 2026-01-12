---
tags: 
aliases:
  - Stabilität von DGL
  - Ruhelage
  - Ruhelagen
keywords: 
subject:
  - Regelungstechnik
  - VL
  - Mathematik 3
semester: SS25
created: 7. März 2025
professor: 
release: false
title: Stabilität nach Ljapunov
---
 

# Stabilität nach Ljapunov

> [!question] [A Visual Explanation of Lyapunov Stability - YouTube](https://www.youtube.com/watch?v=W8YpgG0KuOo)

## Differentialgleichungen

### Ruhelagen

Ruhelage Bedeutet $\mathbf{\dot{x}}=0$. Für das [LTI-System](../../Systemtheorie/LTI-Systeme.md) also $0 = \mathbf{Ax}_{S}+\mathbf{Bu}_{S}$

|                        | $\mathbf{u}_{s}=0$                                | $\mathbf{u}_{S}\neq 0$                                                                                                                                           |
| ---------------------- | ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $\det\mathbf{A}\neq 0$ | 1 Ruhelage: $\mathbf{x}_{s}=0$                    | 1 Ruhelage: $\mathbf{x}_{s} = \mathbf{A}^{-1}\mathbf{Bu}_{s}$                                                                                                    |
| $\det\mathbf{A}=0$     | $\infty$ viele Ruhelagen im Kern von $\mathbf{A}$ | $\infty$ viele Ruhelagen falls $\mathbf{Bu}_{s} \in \operatorname{im}\mathbf{A}$ <br>keine Ruhelagen falls $\mathbf{Bu}_{s} \notin \operatorname{im} \mathbf{A}$ |


> [!example] Pendel: Das Pendel hat zwei ruhelagen:
> - Ruhelage unten ist **stabil**
> - Ruhelage oben ist **instabil**. Eine kleine Abweichung eskaliertdas System
> - Das Pendel kehrt nicht mehr in die Ursprüngliche Ruhelage zurück, verlässt also das $\varepsilon$ Gebiet der Phase des Pendels
> 
> ![invert_dark|200](../../_assets/LjapPendel.png)

### Stabilität

Hier sind Wir daran Interessiert, wie sich zwei Lösungen einer DGL, welche sich durch leicht unterschiedliche Anfangswerte $(t_{0},x_{0})$ unterscheiden, im Grenzwert $x\to \infty$ verhalten.


Wir bringen ein $\varepsilon$ und ein $\delta$ ins spiel, sodass zwei bedinungen erfüllt sind:

- $\varepsilon$ ist eine Zahl die uns ein Gebiet abschränkt. 
- das $\delta$ ist der Anfangswert.

Wir starten bei einer abweichung $\delta$ von der Ruhelage und bleiben im Gebiet $\varepsilon$, für jedes $\delta$ muss es ein solches gebiet geben, dass die Lösung stabil ist, das hießt im Grenzwert nahe der Ruhelage ist.

| **BIBO Stabil**                                                                                                                                | **Attrahierend**                                                                                                        | **Asymptotisch Stabil**<br>BIBO-Stabil & Attrahierend                                                   |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Die Differenz bleibt für alle $t$ innerhalb einer Grenze $\varepsilon$, wenn man nur um einen kleinen Abstand $\delta$ vom Startwert abweicht. | Die Differenz geht für $t \to \infty$ gegen $0$, wenn man nur um einen kleinen Abstand $\delta$ vom Startwert abweicht. | Die Differenz überschreitet den kleinen $\delta$ des Startwertes nicht und geht für $t \to 0$ gegen $0$ |
| ![](../../_assets/Excalidraw/DGL-Stabil.md)                                                                                                     | ![](../../_assets/Excalidraw/DGL-Attr.md)                                                                                | ![](../../_assets/Excalidraw/DGL-AsympStabil.md)                                                         |

## Differenzengleichungen

Auch die Lösungsfolge zeitdiskreter [Differenzengleichungen](Differenzengleichung.md) kann auf Stabilität untersucht werden.

Stabilität für ein Zeitdiskretes System ist erreicht, wenn gilt:

$$\mathbf{x}_{k+1} = \mathbf{x}_{k}, \quad \forall k\in\mathbb{N}$$

> [!hint] Diese Aussage ist äquivlent zum Zeitkontinuierlichen Fall $\mathbf{x}'(t)=0, \forall t \in I$
