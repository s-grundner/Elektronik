---
tags:
  - Systeme/Zeitdiskret
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Signalverarbeitung
semester: SS25
created: 24th March 2025
professor: 
draft: true
title: DZGL-Systeme
---
 
# Systeme von Differenzengleichungen

[Systemtheorie]({MOC}%20Systemtheorie.md) > [Differenzengleichungen](Differenzengleichung.md) 

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

Die Zustandsfolge $\mathbf{f}$ ist die Rekursionsvorschrift zur Ermittlungs des nächsten Zustands. Daher ist es einfacher als bei kontinuierlichen DGL eine Lösung zu finden, da man durch einsetzen des Anfangswertes alle folgegleider rekursiv berechnen kann (Vorausgesetzt sei, dass $\mathbf{u}_{k}, \forall k\in\mathbb{N}$ bekannt sind)

$$
\mathbf{x}_{1} = \mathbf{f}(0,\mathbf{x}_{0},\mathbf{u}_{0}) \to \mathbf{x}_{2}=\mathbf{f}(1, \mathbf{x}_{1}, \mathbf{u}_{1}) \dots
$$

## Autonome Systeme

> [!def] Die Lösungsfolge - auch als **Fluss** $\mathbf{\Phi}_{k}(\mathbf{x}_{0})$ bezeichnet - für ein autonomes System ist die $k$-malige [Komposition](../Mathematik/Algebra/Komposition.md) der **Zustandsfolge**:
>  $$\mathbf{x}[k] = \mathbf{\Phi}_{k}(\mathbf{x}_{0}) = \underbrace{ \mathbf{f} \circ \mathbf{f} \circ \dots \circ \mathbf{f} }_{ k\text{-mal} }(\mathbf{x}_{0})$$


# Lineare DZGL-Systeme

Das System ist Linear, wenn $\mathbf{f}$ in eine linearkombination von Ein und Ausgang übergeht. Das System ist dann in seiner [Zustandsraumdarstellung](Zustandsgleichungen.md) wenn es sich in folgenden Form überführen lässt:

> [!def] **D - )** 