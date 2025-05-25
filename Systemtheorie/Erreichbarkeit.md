---
tags:
  - Systeme/LTI
  - Systeme/Kontinuierlich
aliases:
  - Steuerbarkeit
  - Erreichbarer Unterraum
  - Gramsche Erreichbarkeitsmatrix
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 25. Mai 2025
professor: 
release: false
title: Erreichbarkeit
---

# Erreichbarkeit

:LiRefreshCcw: Zeitdiskrete Erreichbarkeit
:LiArrowBigRightDash: [Beobachtbarkeit](Beobachtbarkeit.md)

---

Betrachtet wird ein [zeitkontinuierliches LTI-System.](Kontinuierlicher%20LTI-Zustandsraum.md)


> [!def] **D - ERRE)** Erreichbarkeit einers zeitkontinuierlichen LTI-Systems ^ERRE
> Man nennt das System vollständig erreichbar, wenn Ausgehend vom Anfangszustand $\mathbf{x}_{0}=\mathbf{0}$ jeder beliebige Zustand $\mathbf{x}(T_{e})$ innerhalb einer endlichen Zeit $T_{e}$ mit einer im intervall $0 \leq t \leq T_{e}$ stückweise stetigen Eingangsgröße $\mathbf{u}(t)$ erreicht werden kann.

Gibt es also einen Eingangsvektor $\mathbf{u}$, sodass alle Werte zu einem gegebenen Zeitpunkt $T_{e}$ alle Zustände erreicht werden können? Diese Definition kann mit der Systemmatrizen $\mathbf{A}$ und $\mathbf{B}$ geprüft werden.

> [!satz] **S - MIMO)** Erreichbarkeitskriterium für [MIMO](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO)-Systeme.
> Das LTI-System ist genau dann vollständig erreichbar, wenn die Matrix $\mathbf{M}_{R}$ [regulär](../Mathematik/Algebra/Reguläre%20Matrizen.md#^REGM) ist. ^MIMO
> $$\mathbf{M}_{R} = \begin{bmatrix}
> \mathbf{B} & \mathbf{AB} & \mathbf{A}^{2}\mathbf{B} & \dots &  \mathbf{A}^{n-1}\mathbf{B}\\
> \end{bmatrix}$$
> 


> [!satz]- **S - SISO)** Erreichbarkeitskriterium für [SISO](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-SISO)-Systeme. ^SISO
> $$\mathbf{M}_{R} = \begin{bmatrix}
> \mathbf{b} & \mathbf{Ab} & \mathbf{A}^{2}\mathbf{b} & \dots &  \mathbf{A}^{n-1}\mathbf{b}\\
> \end{bmatrix}$$

## Erreichbarer Unterraum

> [!def] **D)** Der *Erreichbare Unterraum* $R$ ist gegeben durch
> $$R = \operatorname{im}(M_{R})$$
>  Das [Bild](../Mathematik/Algebra/Lineare%20Abbildungen.md#^BILD) von $\mathbf{M}_{R}$ sind alle linear unabhängigen **Spalten**

Der Erreichbare Unterraum beinhaltet die Systemzustände, die ausgehend von $\mathbf{x}_{0} = \mathbf{0}$ die in endlicher Zeit erreicht werden können.

> [!hint] Ist das System nicht vollständig erreichbar kann eine [Dreieckszerlegung](Dreieckszerlegung.md) durchgeführt werden.

---

- Dreieckszerlegung / Kalman-Zerlegung
