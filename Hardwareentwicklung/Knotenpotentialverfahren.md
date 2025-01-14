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

> [!hint] Grundidee
> 1. In einem Netzwerk kann man einen Knoten (meistens Masse) als Bezugsknoten frei wählen. 
> 2. Die Spannungen aller anderen Knoten (den **Knotenspannungen**) werden relativ zu diesem Bezugsknoten angegeben.
> 3. Dadurch werden die Maschengleichunge eliminiert.

Treten in dem Netzwerk Spannungsquellen auf, werden diese mit Hilfe des [Norton](../Elektrotechnik/lineare%20Quellen.md)-Ersatzbildes in Stromquellen umgewandelt.

Man verwendet Leitwerte, um die Berechnung zu vereinfachen, da man nach dem Strom Lösen möchte und dann $G\cdot U=I$ schreiben kann anstatt eines Bruches.


> [!success] Allgemeines Ergebnis:
> - mit der *Knotenadmittanz*-[Matrix](../Mathematik/Algebra/Matrix.md) $\mathbf{G}$,
> - dem *[Vektor](../Mathematik/Algebra/Vektor.md)* $\mathbf{U}$ der unbekannten *Knotenspannungen*
> - und dem Vektor der Quellströme $\mathbf{I}_{q}$
> ![1200](../assets/Excalidraw/Knotenpotentialverfahren%202024-03-13%2021.34.50.excalidraw)

## Spannugsquellen-Umwandlung

Wenn eine Lineare Spannungsquelle vorliegt kann diese einfach in das [Norton](../Elektrotechnik/lineare%20Quellen.md) ESB umgewandelt werden

> [!warning] Ist die Spannungsquelle aber ideal, kann man sie nicht in eine (ideale) Stromquelle umwandeln.
> Wir wählen die Spannung als Bezugsknoten. $U_{q} = U_{10}$ aber nicht immer möglich.
>  - wenn mehrere ideale Spannungsquellen existieren, die nicht am Selben Knoten anliegen.



![](assets/Knotenpotential.png)

# Quellen

![Knotenpotentialverfahren - Schaltungen berechnen, ohne nachzudenken](https://www.youtube.com/watch?v=SxBQ7VUgzEM)