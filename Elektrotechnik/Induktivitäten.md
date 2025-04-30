---
tags:
  - Baugruppe/Komponente
aliases:
  - Spule
  - Spulen
  - Induktivität
  - Henry
keywords: 
subject:
  - VL
  - Elektrotechnik
semester: WS23
created: 8th April 2022
professor:
  - Bernhard Jakoby
cited:
---
 

# Induktivitäten

## Schaltsymbol

| Symbol                   | ESB                              |
| ------------------------ | -------------------------------- |
| ![indu](assets/indu.png) | ![indu-esb](assets/indu-esb.png) |

## Kenngrößen der Induktivität

> [!def] **Induktivität**
> $$ [L] = \frac{Vs}{A} = \Omega s = H \dots \text{Henry}$$

### Strom-Spannungsbeziehung

### Energie in der Spule

Die **Energie** die in einer **Induktivität** gespeichert werden kann ergibt sich aus:

$$
\begin{align*}
E &= \frac{L\cdot I^{2}}{2} 
\end{align*}
$$

Grundsätzlich kann man sagen, dass die Induktivität Änderungen des **Stromes entgegenwirkt** ([Lenzsche Regel](../Physik/Lenzsche%20Regel.md)).


![indu-pulse](assets/indu-pulse.png)


nach 1-mal $\tau$ sind $63\%$ des Stromes erreicht.

### Einschaltvorgang einer Induktivität

![indu-einsch](assets/indu-einsch.png)

### Abschaltvorgang einer Induktivität

![indu-aussch](assets/indu-aussch.png)


## Induktionsphänomene

> [!question] [Magnetfeld](Magnetisches%20Feld.md)

Induktionsphänomene kamen bisher nicht vor, weil wir und nicht um Zeit Abhängigkeiten des Feldes gekümmert haben. Diese Phänomene treten nämlich nur in *Wechselfeldern* auf.




### Ruheinduktion

Ein magnetisches Wechselfeld erzeugt elektrische Wirbelfelder - dies bedeutet, dass geschlossene elektrische Feldlinien auftauchen!

> [!info] Ein sich zeitliches wechselndes Magnetfeld wird von einem elektrischen Feld *linkswendig* umwirbelt.
> Es wird also nicht durch Ladungen erzeugt, sondern durch die Änderung des magnetischen Feldes. (Warum wissen wir nicht -> Naturgesetz) Am naheliegendsten ist die Lenz'sche Regel

Wenn man einen Leiter entlang des Wirbelfeldes $\vec{E}_{W}$ legt, verschieben sich die Ladungen entlang des Leiters und an den Klemmen entsteht ein [Potenzialdifferenz](elektrische%20Spannung.md).


![invert_dark](assets/Wechselfelder.png)

es ergibt sich die *induzierte* Spannung:

$$u_{ind}=\frac{d\Phi}{dt}$$

> [!hint] [Maxwell](Maxwell.md)-Gleichung 
> Diese Wirbelfelder werden durch das Faraday'sche Gesetz beschrieben:
> $$\oint_{\partial A} \vec{E} \cdot d \vec{s}=-\int_{A} \frac{\partial \vec{B}}{\partial t} \cdot d \vec{a}$$
> In dem minus steckt die *linkswendigkeit* des umwirbelnden E-Felds. Die Fläche ä$A$ ist jene die der Leiter Aufspannt und die Kontur $\partial A$ der leiter selbst.
> 
> Im statischen Fall entspricht das der bereits bekannten Beziehung $\oint_{\partial A} \vec{E}\cdot d\vec{s} = 0$
> Also dass die Spannung an den Klemmen 0 ist.

### Bewegungsinduktion

![invert_dark](assets/BewegterLeiter.png)



---

### Induzierte Spannung

quellstrom $i$ ist konstant

Quellspannung

$$
u_{q}=\frac{\mathrm{d}\Psi}{\mathrm{d}t}(t,\varphi)
$$
Verketteter Fluss: $\Psi = N \cdot\Phi$

Bisher:

$$
u = Ri + L\frac{\mathrm{d}i}{\mathrm{d}t} \overset{ \Psi = Li }{ \to } Ri + \frac{\mathrm{d}\Psi}{\mathrm{d}t} 
$$

Aufgespalten in eine induktive und rotatorische komponente

$$
u_{q} = \underbrace{ \frac{\partial \Psi}{\partial i}\cdot \frac{\mathrm{d}i}{\mathrm{d}t} }_{\text{Ruhe ind.}} +\underbrace{ \frac{\partial \Psi}{\partial \vec{\varphi}}\vec{\omega} }_{ \text{Bewegt ind.} }
$$

$\vec{\varphi}$ und $\vec{\omega}$ sind vektoren wegen der Rotationsachse. $\vec{\omega} = \dfrac{\mathrm{d}\vec{\varphi}}{\mathrm{d}t}$

Synchrongenerator: Fluss ändert sich nicht (Luftspule rotiert im Luftspalt)

Reluktanzgenerator: Magnetkreis selbst ändert sich. Breite des Luftspalts ist anhängig von der phase

#### Induktionsgesetz

Beim Integral: $\mathrm{d}\mathbf{s}\times \mathbf{l} = \mathrm{d}\mathbf{a}$

$\mu,\nu$ sind indizes

---

# Tags

## Wikipedia

[Induktivitäten](<https://de.wikipedia.org/wiki/Induktivit%C3%A4t_(Bauelement)>)

[Spulen](<https://de.wikipedia.org/wiki/Spule_(Elektrotechnik)>)