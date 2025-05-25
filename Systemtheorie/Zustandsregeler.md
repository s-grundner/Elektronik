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
