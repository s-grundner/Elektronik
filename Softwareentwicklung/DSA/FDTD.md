---
tags:
  - Algorithmus/Elektrotechnik
aliases:
  - Finite-Difference Time-Domain
keywords: 
subject:
  - KV
  - HF-Systemtechnik 1
semester: WS24
created: 16. Januar 2025
professor:
---
 

# FDTD - Finite-Difference Time-Domain

Mathematisches Verfahren zur direkten Integration zeitabhängiger Differentialgleichungen.
Wird zur Berechnung der Lösung von den [Maxwell](../../Elektrotechnik/Maxwell.md)-Gleichungen in der Elektrodynamik eingesetzt.

> [!question] Maxwell-Gleichungen beschreiben die Zeitentwicklung von elektrischen und magnetischen Feldern.
> [**Induktionsgestz**](../../Elektrotechnik/Maxwell.md#^MW2)
> $$
> \nabla \times \mathbf{E} = -\dfrac{\partial \mathbf{B}}{\partial t}
> \quad\overset{M1}{\iff}\quad
> \nabla \times \mathbf{E} = -\mu\dfrac{\partial \mathbf{H}}{\partial t}
> $$
> [**Durchflutungssatz**](../../Elektrotechnik/Maxwell.md#^MW1)
> $$
> \nabla \times \mathbf{H} = \mathbf{J}_{l} + \dfrac{\partial \mathbf{D}}{\partial t}
> \quad\overset{M2, M3}{\implies}\quad
> \nabla \times \mathbf{H} = \varepsilon \dfrac{\partial \mathbf{E}}{\partial t}
> $$
> (Leitungsstromdichte kann im Vakuum weggelassen werden)


FDTD: Der Raum indem sich die EM-Welle Ausbreitet wird mit einem Gitter Diskretisiert (Yee-Gitter):

![invert_dark](../../_assets/Pasted%20image%2020250116195649.png)

Durch die dualität, dass der Rotor eines Feldes die Zeitliche Änderung des Anderen Feldes Beschreibt, lässt sich das Gitter Iterativ ergänzen:

- An den Gitterpunkten wird zu einem Zeitpunkt $t$ die Felder $\mathbf{E}$ bzw $\mathbf{H}$ **gespeichert**.  
- An jedem Gitterpunkt werden **abwechselnd** das neue $\mathbf{E}$ bzw $\mathbf{H}$ Feld für den **nächsten** Zeitpunkt $t_{n}+\Delta t$ berechnet.
    - Die **änderung** des $\mathbf{E}$-Feldes wird mit **numerischer Roatation** des $\mathbf{H}$-Feldes berechnet
    - Die **änderung** des $\mathbf{H}$-Feldes wird mit **numerischer Roatation** des $\mathbf{E}$-Feldes berechnet

---

[OpenEMS](Software-Tools/OpenEMS.md)
