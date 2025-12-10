---
tags:
  - Systeme/LTI
  - Systeme/Kontinuierlich
aliases:
  - Zustandsregelung
  - Regelungsnormalform
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

---

Für ein [LTI-System](Kontinuierlicher%20LTI-Zustandsraum.md) ist die Zustandsregelung eine Vorschrift der Form

> [!def] **Regelgesetz)** ^REGG
> - MIMO: $\mathbf{u} = \mathbf{Kx} + \mathbf{v}$
> - SISO:  $u = \mathbf{k}^\mathrm{T}\mathbf{x} + v$

![invert_dark|500](../_assets/Pasted%20image%2020250525195124.png)

und man erhält für den *geschlossenen Kreis*

$$ \mathbf{\dot{x}} = (\mathbf{A}+\mathbf{BK})\mathbf{x} + \mathbf{Bv} $$

> [!important] Wichtig ist nun, wie man die Matrix/Spaltenvektor $\mathbf{K}$ geeignet wählt / bestimmen kann.

Man erkennt, dass zur implementierung des Zustandsregler die Messung aller Zustandsgrößen $\mathbf{x}$ erforderlich ist. Aufgrund dieses Nachteils kann ein [Zustandsbeobachter](Zustandsbeobachter.md) substituiert werden, der stattdessen einen Schätzwert $\mathbf{\hat{x}}$   für $\mathbf{x}$ auf Basis von $\mathbf{u}$ und $\mathbf{y}$ liefert.

![invert_dark|500](../_assets/Pasted%20image%2020250525201353.png)


## Eingrößen-Zustandsregelung (zeitkontinuierlich)

Betrachtet wird zunächst das eingrößensystem ![eingrößen System](Kontinuierlicher%20LTI-Zustandsraum.md#^LTI-SISO)

Die Erreichbarkeit des Systems ist gegeben durch ![SISO](Erreichbarkeit.md#^SISO)

Der Reglerentwurf für das Eingrößensysteme wird in einem speziellen Koordinatensystem besonders einfach. Die Systemmatrix soll dafür nach dem Basiswechsel eine spezielle Form haben, welche die folgende Eigenschaft hat:

> [!satz] **S - AR)** Das charakteristische Polynom $p(s)_{\mathbf{A}_{R}} = \det(s\mathbb{1}-\mathbf{A}_{R})$ der Matrix $\mathbf{A}_{R} \in \mathbb{R}^{n\times n}$
> 
> $$
> \mathbf{A}_{R} = \begin{bmatrix}
> 0 & 1 & 0 & \cdots & \cdots & 0 \\
> 0 & 0 & 1 & \cdots & \cdots & 0 \\
> 0 & 0 & 0 & \ddots & \cdots & 0 \\
> \vdots & \vdots & \vdots & \vdots & \ddots & \vdots \\
> 0 & 0 & 0 & \cdots & 0 & 1 \\
> -a_{0} & -a_{1} & \cdots & \cdots & -a_{n-2} & -a_{n-1}
> \end{bmatrix}
> $$
> ist
> 
> $$ p_{\mathbf{A}_{R}}(s) = a_{0}+ a_{1}s+\dots+a_{n-1}s^{n-1} + s^n $$

Für die wahl der Koordinaten
