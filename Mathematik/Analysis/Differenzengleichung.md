---
tags:
  - Systeme/Zeitdiskret
aliases: 
keywords: 
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 11th March 2025
professor: 
draft: true
title: Differenzengleichung
---
 
# Differenzengleichung

> [!quote] Differenzengleichungen im zeitdiskreten sind äquivalent zu kontinuierlichen [DGL](GDGL.md)
> Man sucht hier anstatt einer Lösungsfunktion $\mathbf{x}(t;\mathbf{x}_{0}, t_{0})$ eine **Lösungsfolge**


> [!def] **D1 - DZGL)** Explizites Differenzengleichungen ^DZGL
> $$y[n] = -\sum_{i=1}^{M} a_{i}y[n-i] + \sum_{i=0}^{N}b_{i}x[n-i]$$

- Wenn alle $a_{i}=0$ dann heißt das System **nichtrekursiv**. der Ausgang ist nur von Differenzen des Ausgangsabhängig.
- Sonst ist das System **rekursiv**. Man verwendet auch vergangenen Ausgänge.
- Die **Ordnung** des Systems ist $\max\{M,N\}$

## Systeme von DZGL

> [!question] [Systemtheorie](../../Systemtheorie/{MOC}%20Systemtheorie.md) | [Zustandsraum](../../Systemtheorie/Zustandsgleichungen.md)

Ähnlich wie für zeitkontinuierliche Übertragungssysteme, werden zeitdiskrete Systeme mit finitem Zustand, druch ein explizites Modell beschrieben.

$$
\begin{align}
\mathbf{x}_{k+1} &= \mathbf{f}(k, \mathbf{x}_{k}, \mathbf{u}_{k}), \quad\mathbf{x}(k_{0}) = \mathbf{x}_{0} \\
\mathbf{y}_{k} &= \mathbf{g}(k,\mathbf{x}_{k}, \mathbf{u}_{k})
\end{align}
$$
Dabei sind die Größen:
- $\mathbf{x}$ : $x$-dimensionaler Zustand
- $\mathbf{u}$ : $m$-dimensionaler Eingang
- $\mathbf{y}$ : $l$-dimensionaler Ausgang


Haben $\mathbf{f}$ und $\mathbf{g}$ eine bestimmte Form bezeichnet man die Systeme als...

| **zeitinvariantes**, zeitdiskretes System                                                                                                                  | **freies** zeitdiskretes System                                                                                                 | **autonomes** zeitdiskretes System<br>*(das System ist frei und zeitinvariant)*                                            |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| $$\begin{align}\mathbf{x}_{k+1} &= \mathbf{f}(\mathbf{x}_{k}, \mathbf{u}_{k}) \\ \mathbf{y}_{k} &= \mathbf{g}(\mathbf{x}_{k}, \mathbf{u}_{k})\end{align}$$ | $$\begin{align}\mathbf{x}_{k+1} &= \mathbf{f}(k, \mathbf{x}_{k}) \\ \mathbf{y}_{k} &= \mathbf{g}(k,\mathbf{x}_{k})\end{align}$$ | $$\begin{align}\mathbf{x}_{k+1} &= \mathbf{f}(\mathbf{x}_{k}) \\ \mathbf{y}_{k} &= \mathbf{g}(\mathbf{x}_{k})\end{align}$$ |



### Ruhelagen

> [!question]  Stabilität nach Ljapunov und [Ruhelagen](Ljapunov.md#Differenzengleichungen) für Differenzengleichungen

### Lineare zeitvariante Systeme



