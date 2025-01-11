---
tags:
  - Schaltungsanalyse
  - Algorithmus/Elektrotechnik
aliases:
  - Knotenpotential
  - Knotenspannung
  - Knotenspannungs
keywords: 
subject:
  - VL
  - Elektrotechnik
semester:
  - SS24
  - B2
created: 8. Januar 2024
professor:
  - Andreas Springer
---
 

# Knotenpotential Verfahren

Grundidee
Wir eliminieren die Maschengleichungen, indem wir Knotenspannungen einführen.
Knotenpotentiale sind die Spannungen aller knoten zu einem Gewählten Bezugsknoten.

Wenn wir ein [elektrisches Netzwerk](../Elektrotechnik/Schaltungsanalyse.md) vor uns haben, eliminieren wir alle Spannungsquellen, indem wir das [Norton](../Elektrotechnik/lineare%20Quellen.md)-Ersatzbild auf alle Spannungsquellen anwenden.

Die Verwendung des Leitwertes erleichtert die Berechnung.

> [!success] Allgemeines Ergebnis:
> - mit der *Knotenadmittanzmatrix* $\mathbf{G}$,
> - dem *[Vektor](../Mathematik/Algebra/Vektor.md)* $\mathbf{U}$ der unbekannten *Knotenspannungen*
> - und dem [Vektor](../Mathematik/Algebra/Vektor.md) der Quellströme $\mathbf{I}_{q}$
> ![1200](../assets/Excalidraw/Knotenpotentialverfahren%202024-03-13%2021.34.50.excalidraw)

## Spannugsquellen-Umwandlung

Wenn eine Lineare Spannungsquelle vorliegt kann diese einfach in das [Norton](../Elektrotechnik/lineare%20Quellen.md) ESB umgewandelt werden

> [!warning] Ist die Spannungsquelle aber ideal, kann man sie nicht in eine (ideale) Stromquelle umwandeln.
> Wir wählen die Spannung als Bezugsknoten. $U_{q} = U_{10}$ aber nicht immer möglich.
>  - wenn mehrere ideale Spannungsquellen existieren, die nicht am Selben Knoten anliegen.



![](assets/Knotenpotential.png)

# Quellen

![Knotenpotentialverfahren - Schaltungen berechnen, ohne nachzudenken](https://www.youtube.com/watch?v=SxBQ7VUgzEM)