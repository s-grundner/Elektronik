---
tags:
  - Systeme/LTI
  - Systeme/Kontinuierlich
aliases:
  - Zustandsregelung
  - Regelungsnormalform
  - Erreuichbarkeit
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 4th April 2025
professor: 
release: false
title: Regelungsnormalform
---

# Lineare Zustandsregelung

:LiRefreshCcw: [Zustandsbeobachter](Zustandsbeobachter.md)
:LiRefreshCcw: diskreter Zustandsregler

---

Für ein [LTI-System](Kontinuierlicher%20LTI-Zustandsraum.md) ist die Zustandsregelung eine Vorschrift der Form

$$
\mathbf{u} = \mathbf{Kx} + \mathbf{v}
$$

![invert_dark|600](assets/Pasted%20image%2020250525195124.png)

und man erhält für den *geschlossenen Kreis*

$$
\mathbf{\dot{x}} = (\mathbf{A}+\mathbf{BK})\mathbf{x} + \mathbf{Bv}
$$

> [!important] Wichtig ist nun, wie man die Matrix $\mathbf{K}$ geeignet wählt / bestimmen kann.

Man erkennt, dass zur implementierung des Zustandsregler die Messung aller Zustandsgrößen $\mathbf{x}$ erforderlich ist. Aufgrund dieses Nachteils wird in der Regel ein [Zustandsbeobachter](Zustandsbeobachter.md) substituiert, der stattdessen einen Schätzwert $\mathbf{\hat{x}}$ für $\mathbf{x}$ liefert.

![invert_dark|700](assets/Pasted%20image%2020250525201353.png)

## Erreichbarkeit

Betrachtet wird ein [zeitkontinuierliches LTI-System.](Kontinuierlicher%20LTI-Zustandsraum.md)


> [!def] **D - ERRE)** Erreichbarkeit einers zeitkontinuierlichen LTI-Systems
> Man nennt das System vollständig erreichbar, wenn Ausgehend vom Anfangszustand $\mathbf{x}_{0}=\mathbf{0}$ jeder beliebige Zustand $\mathbf{x}(T_{e})$ innerhalb einer endlichen Zeit $T_{e}$ mit einer im intervall $0 \leq t \leq T_{e}$ stückweise stetigen Eingangsgröße $\mathbf{u}(t)$ erreicht werden kann.

Gibt es also einen Eingangsvektor $\mathbf{u}$, sodass alle Werte zu einem gegebenen Zeitpunkt $T_{e}$ alle Zustände erreicht werden können? Diese Definition kann mit der Systemmatrizen $\mathbf{A}$ und $\mathbf{B}$ geprüft werden.

> [!satz] **S - MIMO)** Erreichbarkeitskriterium für [MIMO](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-MIMO)-Systeme.
> Das LTI-System ist genau dann vollständig erreichbar, wenn die Matrix
> $$\mathbf{M}_{k} = \begin{bmatrix}
> \mathbf{B} & \mathbf{AB} & \mathbf{A}^{2}\mathbf{B} & \dots &  \mathbf{A}^{n-1}\mathbf{B}\\
> \end{bmatrix}$$
> [regulär](../Mathematik/Algebra/Determinante.md#Reguläre%20Matrizen) ist, also den Rang $n$ hat. Wobei $\mathbf{x}\in \mathbb{R}^n$


> [!satz]- **S - SISO)** Erreichbarkeitskriterium für [SISO](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-SISO)-Systeme.
> $$\mathbf{M}_{k} = \begin{bmatrix}
> \mathbf{b} & \mathbf{Ab} & \mathbf{A}^{2}\mathbf{b} & \dots &  \mathbf{A}^{n-1}\mathbf{b}\\
> \end{bmatrix}$$

> [!def] **D - )** Gramsche Erreichbarkeitsmatrix

---

- Dreieckszerlegung / Kalman-Zerlegung
