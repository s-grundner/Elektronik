---
tags: 
aliases:
  - Masse an einer Feder
  - Federschwinger
  - Federpendel
keywords: 
subject:
  - Physik 1 für TechnikerInnen
  - VL
semester: WS23
created: 25. Januar 2024
professor:
  - Gunther Springholz
---
 

# [Feder](Federkraft.md)-Schwinger

![InlineR](assets/Pasted%20image%2020240125155851.png)  
Als einfachstes Modellsystem eines harmonischen Oszillators, betrachten wir eine Masse an einer [Feder](Federkraft.md), die sich reibungsfrei auf einer Unterlage bewegt.

In der Gleichgewichtslage bei $x = 0$ übt die [Feder](Federkraft.md) keine [Kraft]({MOC}%20Kräfte.md) auf den Körper aus, bei einer Auslenkung $x$ wirkt eine [Rückstellkraft](Federkraft.md) die linear mit $x$ ansteigt.

## Bewegungsgleichung

Wird der Körper um den [Betrag](../Mathematik/Algebra/Betrag.md) x aus der Ruhelage ausgelenkt, erfährt er nach dem Hookeschen Gesetz eine rücktreibende [Federkraft](Federkraft.md), die gegeben ist durch:  

$$F_{r}(x)=-k\cdot x$$

> [!info] Mit dem 2. Newtonschen Gesetz ($\sum F=0$) ergibt sich die Bewegungsgleichung:  
>
> $$m\cdot a=m\cdot \frac{d^2x}{dt^2}=-k\cdot x$$
>
> oder
>
> $$\frac{d^2x}{dt^2}=- \frac{k}{m}\cdot x\quad \text{bzw.}\quad \ddot{x}(t)=- \frac{k}{m}\cdot x(t)$$

> [!success] Die [Beschleunigung](Kinematik.md) $a = \ddot{x}$ des Körpers ist also entgegengesetzt und linear proportional zur Auslenkung $x$.  
> $\implies$ Je weiter der Punkt $x$ vom Gleichgewichts-Punkt entfernt ist, desto kleiner ist die [Beschleunigung](Kinematik.md). Am Umkehrpunkt ist die [Beschleunigung](Kinematik.md) minimal.

> Diese Gleichung ist die Bewegungsgleichung des harmonischen Oszillators. Sie ist eine [Differentialgleichung 2. Ordnung](lineare%20DGL%202.%20Ordnung.md) da sie die 2. [Ableitung](../Mathematik/Analysis/Differenzialrechnung.md) von $x$ enthält.

> Gesucht ist die [Funktion](../Mathematik/Algebra/Abbild.md) $x(t)$, die diese [Differentialgleichung](../Mathematik/{MOC}%20DGL.md) erfüllt und damit die [Bewegung](Kinematik.md) beschreibt.