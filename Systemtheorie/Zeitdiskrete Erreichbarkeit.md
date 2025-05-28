---
tags:
  - Systeme/LTI
  - Systeme/Zeitdiskret
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 26th May 2025
professor: 
release: false
title: Einheitskreismatrix
---

# Erreichbarkeit Zeitdiskreter LTI-Systeme

:LiArrowBigRightDash: [Beobachtbarkeit](Zeitdiskrete%20Beobachtbarkeit.md) 
:LiRefreshCcw: [Erreichbarkeit Zeitkontinuierlicher LTI-Systeme](Erreichbarkeit.md)

---

> [!def] **D1 - ERRE)** Erreichbarkeit eines zeitdiskreten Systems ^ERRE
> Man nennt ein [zeitdiskretes LTI-System](Zeitdiskreter%20LTI-Zustandsraum.md#^LTI-MIMO) vollständig erreichbar, wenn ausgehend vom Anfangszustand $\mathbf{x}_{0} = 0$ jeder beliebige Zustand $\mathbf{x}_{N}$ mit einer endlichen Steuerfolge $\mathbf{u}_{k} = (\mathbf{u}_{1}, \mathbf{u}_{2},\dots,\mathbf{u}_{N-1})$ erreicht werden kann.

## Testen Auf Erreichbarkeit

Der Test auf Erreichbarkeit erfolgt gleich wie für zeitkontinuierliche Systeme.

![Testen Auf Erreichbarkeit](Erreichbarkeit.md#Testen%20Auf%20Erreichbarkeit)

## Erreichbarer Unterraum

![Erreichbarer Unterraum](Erreichbarkeit.md#^ERRE-SUBSPACE)

Der Erreichbare Unterraum beinhaltet die Systemzustände, die ausgehend von $\mathbf{x}_{0} = \mathbf{0}$ die in endlicher Zeit erreicht werden können. Das System ist also vollständig erreichbar wie in [D1](#^ERRE) wenn $\dim\mathbf{M}_{\mathcal{R}} = \dim\mathcal{R} =n$ 

## Kalmanzerlegung bezüglich der Erreichbarkeit

> [!hint] Ist das System nicht vollständig erreichbar kann man das es in ein erreichbares Teilsystem und ein nicht-erreichbares Teilsystem zerlegen.

![Kalman-Zerlegung](Kalman-Zerlegung.md#^ERRE)

Das neue System hat die Form (mit den Koeffizienten wie in [ZTRF](Zustandstransformation.md#^ZTRF))

![](Kalman-Zerlegung.md#^ERRE-DISK)

## Steuerbarkeit

> [!question] :LiRefreshCcw: [Steuerbarkeit Zeitkontinuierlicher Systeme](Erreichbarkeit.md#Steuerbarkeit)

---

> [!def] **D)** Steuerbarkeit
> Das [zeitdiskrete LTI-System](Zeitdiskreter%20LTI-Zustandsraum.md#^LTI-MIMO) vollständig steuerbar, wenn ausgehend von einem beliebigen Anfangszustand $\mathbf{x}_{0}$, mit einer endlichen Steuerfolge $\mathbf{u}_{k} = (u_{0},u_{1},\dots, u_{N-1})$ das System in den Zustand $\mathbf{x}_{N} = \mathbf{0}$ übergeführt werden kann. 

Im zeitdiskreten kann ein System steuerbar sein obwohl es nicht vollständig erreichbar ist. Warum? Die Transitionsmatrix muss für diskrete Systeme *nicht* regulär sein.

> [!hint] Im zeitdiskreten gilt: **vollst. erreichbar** $\implies$ **vollst. steuerbar**
> Ansonsten ist das nicht vollst. erreichbare System trotzdem **vollst. steuerbar** wenn der nicht-erreichbare Unterraum $\mathbf{\bar{A}}_{22}$ [nilpotent](../Mathematik/Algebra/Nilpotente%20Matrix.md#^NILP) ist

Das heißt das der nicht-erreichbare Unterraum dann keinen Einfluss auf Folgeglieder der Lösung hat. Der Teilzustand $\mathbf{z}_{2}$ wird für einen beliebigen Anfangszustand $\mathbf{z}_{2}(0)$ in einer endlichen Zeit zu $0$ konvergieren.

## Stabilisierbarkeit

> [!question] [Stabilisierbarkeit Zeitkontinuierlicher LTI-Systeme](Erreichbarkeit.md#Stabilisierbarkeit)

---

Das nicht vollständig beobachtbare System ist **stabilisierbar**, wenn $\mathbf{\bar{A}}_{22}$ eine [Einheitskreismatrix](Einheitskreismatrix.md) ist.