---
tags:
  - E-Feld
aliases:
  - elektrischen Spannung
  - Potenzialdifferenz
  - Spannungsquelle
  - Spannungsquellen
keywords:
  - Potenzial
subject:
  - Einführung Elektrotechnik
  - VL
semester: WS23
created: 18. Oktober 2023
professor:
  - Bernhard Jakoby
---
 

# Elektrische Spannung

> [!info] Die elektrische Spannung ist die Differenz des Potentials zweier [Ladungen](elektrisches%20Feld.md) in einem [Elektrischen Feld](elektrisches%20Feld.md).
> Potential: Wir erinnern uns an die [potentielle Energie](../Physik/Energieerhaltung.md).
> [Arbeit](../Physik/Mechanische%20Arbeit.md): $dW = \vec{F}\cdot d\vec{s}$
> 
> Im Schwerefeld der Erde: (*höhe* $h$ ist immer entgegengesetzt des Gravitationsfeld)
> $$W_{A\to B} = \int_{A}^{B} m\cdot \lvert \vec{g} \rvert  \cdot dh = m\cdot g\cdot h\qquad h = B-A$$
> Im [Elektrischen Feld](elektrisches%20Feld.md):
>   $$
> \begin{align}
> W_{A\to B} &= \int_{A}^{B} q\cdot\vec{E} \cdot d\vec{s} =q\cdot\underbrace{ \int_{A}^{B} \vec{E} \cdot d\vec{s} }_{ \text{Spannung }U_{A\to B} } \\
> &= q\cdot(\underbrace{ \lvert \vec{E} \rvert \cdot B }_{ \varphi(B) } - \underbrace{ \lvert \vec{E} \rvert \cdot A }_{ \varphi(A) }) = q\cdot U_{A\to B}
> \end{align}
> $$
> Aus dem bestimmten [Integral](../Mathematik/Analysis/Integralrechnung.md) ergibt sich mit den Grenzen $A$ $B$ die Potenzialdifferenz von $\varphi(B)$ und $\varphi(A)$ und somit die Spannung.
> Mit dem zusätzlichen Faktor der [Ladung](elektrisches%20Feld.md) muss für die Spannung auch *[Arbeit](../Physik/Mechanische%20Arbeit.md) pro [Ladung](elektrisches%20Feld.md)* gelten ($U = \frac{W}{q}$)

## Spannungsquellen

> [!info] Spannungsquellen beruhen darauf, dass eine [Kraft](../Physik/{MOC}%20Kräfte.md), welche *nicht elektrisch* ist, das treibende [elektrische Feld](elektrisches%20Feld.md) (externe Kräfte) innerhalb der Quelle aufrecht erhält und somit mittels dem [Stromfluss](elektrischer%20Strom.md) eine Potenzialdifferenz bewirkt.

### Externe Kräfte

> [!question] Chemisch lassen sich Spannungsquellen durch [Akkus](../Chemie/Sekundärelement.md) und [Batterien](../Chemie/Primärelement.md) auf Basis der [Elektrochemie](../Chemie/Elektrochemie.md) realisieren.
> Man spricht von einer *elektrochemischen Spannungsquelle*

> [!question] Lorentz Kraft

Der Spannungseinbruch der Entsteht wenn eine Last an die Quelle angehängt wird, kann durch den Innenwiderstand modelliert werden. Aufgrund von Material eigenschaften werden Kräfte benötigt um die Elektronen aus der Quelle abzuführen. Diese Kraft verringert das E-Feld und somit die Spannung. Wir betrachten es immer als Spannungsabfall im Innenwiderstand