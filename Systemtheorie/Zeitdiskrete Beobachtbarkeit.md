---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 26th May 2025
professor:
release: false
title: Zeitdiskrete Beobachtbarkeit
---

# Beobachtbarkeit Zeitdiskreter LTI-Systeme

:LiArrowBigRightDash: [Erreichbarkeit](Zeitdiskrete%20Erreichbarkeit.md) 
:LiRefreshCcw: [Beobachtbarkeit Zeitkontinuierlicher Systeme](Beobachtbarkeit.md)

---

> [!def] **D1 - BEOB)** Beobachtbarkeit eines zeitkontinuierlichen LTI-Systems ^BEOB
> Man nennt das [zeitdiskrete LTI-System](Zeitdiskreter%20LTI-Zustandsraum.md#^LTI-MIMO) vollständig beobachtbar, wenn 

## Testen auf Beobachtbarkeit

![Testen auf Beobachtbarkeit](Beobachtbarkeit.md#Testen%20auf%20Beobachtbarkeit)

## Nicht-Beobachtbarer Unterraum



## Kalman-Zerlegung bezüglich der Beobachtbarkeit

![BEOB](Kalman-Zerlegung.md#^BEOB)

Das Resultierende System hat **immer** die Form (mit $\mathbf{\bar{A}}$ und $\mathbf{\bar{B}}$ wie in [ZTRF](Zustandstransformation.md#^ZTRF))

![BEOB-KONT](Kalman-Zerlegung.md#^BEOB-KONT)

- $\mathbf{z}_{1}$ ... Zustand des nicht-beobachtbaren Teilsystems
- $\mathbf{z}_{2}$ ... Zustand des beobachtbaren Teilsystems

## Rekonstruierbarkeit

> [!question] [Rekonstruierbarkeit Zeitkontinuierlicher LTI-Systeme](Beobachtbarkeit.md#Rekonstruierbarkeit)

---

> [!def] **D - REKO)** Rekonstruierbarkeit eines zeitdiskreten LTI-Systems ^REKO
>Man nennt das [LTI-System](Zeitdiskreter%20LTI-Zustandsraum.md#^LTI-MIMO) vollständig rekonstruierbar, wenn aus der Kenntnis der Eingangs- und Ausgangsgrößen $\mathbf{u}_{k}$ und $\mathbf{y}_{k}$ auf einem finiten Intervall $N$ sowie der Systemmatrizen $\mathbf{A}$, $\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ der Zustand $\mathbf{x}_{N}$ errechnet werden kann. 


> [!hint] Im zeitdiskreten gilt: vollst. Beobachtbar $\implies$ vollst. Rekonstruierbar 
> Ansonsten ist das nicht vollst. beobachtbare System trotzdem **vollst. rekonstruierbar**, wenn $\mathbf{A}_{11}$ der Dreieckszerlegung [nilpotent](../Mathematik/Algebra/Nilpotente%20Matrix.md) ist. 

## Detektierbarkeit

Das System ist detektierbar, wenn $\mathbf{A}_{11}$ eine [Einheitsmatrix](../Mathematik/Algebra/Einheitsmatrix.md) ist.