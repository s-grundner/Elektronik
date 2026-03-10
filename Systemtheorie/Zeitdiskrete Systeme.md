---
tags:
  - Systeme/Zeitdiskret
aliases:
  - Systeme von DZGL
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Signalverarbeitung
semester: SS25
created: 24th March 2025
professor: 
release: false
title: DZGL-Systeme
---
 

# Zeitdiskrete Systeme

> [!question] :LiArrowBigLeftDash: [Systemtheorie](index.md) |📍| [Zeitdiskrete Lineare Systeme](Zeitdiskrete%20Lineare%20Systeme.md) :LiArrowBigRightDash:

[Dynamische Systeme](Dynamische%20Systeme.md) ***:LiRefreshCcw:***

---

Ähnlich wie für zeitkontinuierliche Übertragungssysteme, werden zeitdiskrete Systeme mit finitem Zustand, druch ein explizites Modell von Zustands- und Ausgangsgleichung beschrieben.

$$
\begin{align}
\mathbf{x}_{k+1} &= \mathbf{f}(k, \mathbf{x}_{k}, \mathbf{u}_{k}), \quad\mathbf{x}[k_{0}] = \mathbf{x}_{0} \\
\mathbf{y}_{k} &= \mathbf{g}(k,\mathbf{x}_{k}, \mathbf{u}_{k})
\end{align}
$$
![](Zeitdiskrete%20Zustandsbeschreibung.md#^ZSGR)

Haben $\mathbf{f}$ und $\mathbf{g}$ eine bestimmte Form, bezeichnet man die Systeme als...

| **zeitinvariantes**, zeitdiskretes System                                                                                                                  | **freies** zeitdiskretes System                                                                                                 | **autonomes** zeitdiskretes System                                                                                         |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| $$\begin{align}\mathbf{x}_{k+1} &= \mathbf{f}(\mathbf{x}_{k}, \mathbf{u}_{k}) \\ \mathbf{y}_{k} &= \mathbf{g}(\mathbf{x}_{k}, \mathbf{u}_{k})\end{align}$$ | $$\begin{align}\mathbf{x}_{k+1} &= \mathbf{f}(k, \mathbf{x}_{k}) \\ \mathbf{y}_{k} &= \mathbf{g}(k,\mathbf{x}_{k})\end{align}$$ | $$\begin{align}\mathbf{x}_{k+1} &= \mathbf{f}(\mathbf{x}_{k}) \\ \mathbf{y}_{k} &= \mathbf{g}(\mathbf{x}_{k})\end{align}$$ |
| Die Zustandsfolgen sind nur indirekt über die Zustandsgrößen von $k$ abhängig                                                                              | Das System besitzt keine externen Stellgrößen                                                                                   | das System ist frei und zeitinvariant                                                                                      |



Die Zustandsfolge $\mathbf{f}$ ist die Rekursionsvorschrift zur Ermittlungs des nächsten Zustands. Daher ist es einfacher als bei kontinuierlichen DGL eine Lösung zu finden, da man durch einsetzen des Anfangswertes alle folgegleider rekursiv berechnen kann (Vorausgesetzt sei, dass $\mathbf{u}_{k}, \forall k\in\mathbb{N}$ bekannt sind)

$$
\mathbf{x}_{1} = \mathbf{f}(0,\mathbf{x}_{0},\mathbf{u}_{0}) \to \mathbf{x}_{2}=\mathbf{f}(1, \mathbf{x}_{1}, \mathbf{u}_{1}) \dots
$$

## Autonome Systeme

Da das autonome zeitdiskrete System nur $\mathbf{x}_{k}$ als argument hat, können die Funktinonen direkt ineinander eingesetzt werden: 

> [!satz] Die Lösungsfolge - auch als **Fluss** $\mathbf{\Phi}_{k}(\mathbf{x}_{0})$ bezeichnet - für ein autonomes System ist die $k$-malige [Komposition](../Mathematik/Algebra/Komposition.md) der **Zustandsfolge**:
>  $$\mathbf{x}[k] = \mathbf{\Phi}_{k}(\mathbf{x}_{0}) = \underbrace{ \mathbf{f} \circ \mathbf{f} \circ \dots \circ \mathbf{f} }_{ k\text{-mal} }(\mathbf{x}_{0})$$

z.B $\mathbf{x}_{2} = \mathbf{f}(\mathbf{f}(\mathbf{x}_{0}))$

## Ruhelagen und Stabilität

> [!hint] Auch für Zeitdiskrete Systeme lassen sich Ruhelagen sowie die [Stabilität](../Mathematik/Differentialgleichungen/Ljapunov.md#Differenzengleichungen) der Lösungsfolge Untersuchen


> [!warning] Achtung
> - im **kontinuierlichen** gilt $\dot{\mathbf{x}}(t) = 0$,
> - im **diskreten** aber $\mathbf{x}_{k+1} = \mathbf{x}_{k}$
