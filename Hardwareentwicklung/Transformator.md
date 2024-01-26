---
tags: 
aliases: 
keywords: []
subject:
  - EET
  - "..."
semester: 1
created: 24th January 2024
professor:
---
 

# Transformator

- Transformatoren dienen dazu, Spannungen, Ströme und/oder Impedanzen zu transformieren und Leistungen zwischen galvanisch getrennten Netzwerken zu übertragen.
- Transformatoren bestehen aus magnetisch gekoppelten Induktivitäten
- Die Transformation von Spannungen, Ströme und/oder Impedanzen ist nur für *zeitlich veränderliche* Spannungen/Ströme möglich, da diese auf dem Prinzip der Ruheinduktion beruht -> gekoppelte Induktivitäten.


![600](assets/Pasted%20image%2020240124090631.png)

Sehr hohe *relative permeabilität* $\mu_{r}$ des Kerns.

> [!info] Betrachtung als Zweitor/Vierpol -> Vierpoltheorie  
> Torbedingung: Strom $i_{1}$ der oben hinein fließt, muss unten (als $i_{2}$) wieder herausfließen.

> [!warning] Vereinfachungen  
> kein magnetisches Feld außerhalb des Eisenkerns

## Gekoppelte Induktivitäten

![](assets/Pasted%20image%2020240124091021.png)

Wenn ein teil des Flusses der erzeugenden Spule eine Andere durchsetzt, wird ein Fluss in dieser Spule erzeugt.  
Strom muss seiner Ursache entgegenwirken

### Koppelfaktor

## Wicklungssinn

![450](assets/Pasted%20image%2020240124092616.png)

Wenn die Punkte am selben Ende der beiden Wicklungen sind, addieren sich die Flüsse. Sonst subtrahieren sie sich

$$
\begin{align}
u_{1} = \frac{d}{dt}(\phi_{11}+\phi_{12}) = L_{11} \frac{di_{1}}{dt} + M \frac{di_{2}}{dt}\\
u_{2} = \frac{d}{dt}(\phi_{21}+\phi_{22}) = M \frac{di_{1}}{dt} + L_{11} \frac{di_{2}}{dt}
\end{align}
$$

## Aufbau

### Transformator im Leerlauf

![600](assets/Pasted%20image%2020240124095233.png)

$$
\begin{align}
\frac{u_{1}}{u_{2}} &= \frac{N_{1}}{N_{2}} \\
u_{1} = -N_{1} \frac{d\phi_{LL}}{dt} \quad &\text{und}\quad u_{2} = -N_{2} \frac{d\phi_{LL}}{dt}
\end{align}
$$

da an beiden Wicklungen die selbe Änderung des Flusses auftritt, kürzt sich dieser.

### Belasteter Transformator

Annahmen:
- ideale Kopplung ($k=1$)
- verlustfrei

Der Laststrom $i_{2}$ erzeugt einen Gegenfluss $\phi_{2}$ (Lenz‘sche Regel)


![600](assets/Pasted%20image%2020240124095307.png)

siehe Folien Springer: $\dfrac{u_{1}}{u_{2}}=\dfrac{N_{1}}{N_{2}}$

Trotz der Last ist das Übersetzungsverhältis gleich wie im Unbelasteten Fall (Leerlauf)

> [!warning] verlustfreier Transformator -> Die Leistung am eingangs Tor ist gleich die Leistung am Ausgangstor
> - Es wird *nicht* die Leistung Transformiert
> - Wird die Spannung um einen Faktor nach oben Transformiert, wird der Strom um den selben Faktor verringert
> 	- $P=U\cdot I$

### Analogie zum Ohm‘schen Gesetz

Magnetische Spannung <-> elektrische Spannung

Magnetischer Strom <-> elektrischer Strom

Magnetischer widerstand <-> elektrischer Widerstand

$R_{m} = \frac{l}{\mu A}$ aber $R_{m}$ ist im gegensatz zum elektrischen Widerstand stark nichtlinear vom Magnetischen Fluss Abhängig.

[Elektrische Leistung](../physik/Elektrische%20Leistung.md)