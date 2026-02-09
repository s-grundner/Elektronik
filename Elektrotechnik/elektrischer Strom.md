---
tags:
  - SI-Einheit
aliases:
  - Strom
  - Stromstärke
  - Stroms
  - elektrischen Stroms
  - elektrischen Strom
keywords: 
subject:
  - VL
  - Einführung Elektrotechnik
semester: WS23
created: 1. März 2024
professor:
  - Bernhard Jakoby
---
 

# Elektrischer Strom



Die Stromstärke $I$ gibt an, wie viel [Ladung](elektrisches%20Feld.md) $\Delta Q$ pro Zeiteinheit $\Delta t$ durch einen [bestimmten Querschnitt](Stromdichte.md) (Bei Drähten üblicherweise der Drahtquerschnitt, außer beim [Skineffekt](../HF-Technik/Skineffekt.md)) fließt.

![invert_light](../_assets/elekStrom.png)

Da die Stromstärke natürlich auch *zeitlich variieren* kann, definiert man (wie üblich) diese Änderungsrate [differenziell](../Mathematik/Analysis/Differenzialrechnung.md):

$$
I = \lim_{ \Delta t\to 0 } \frac{\Delta Q}{\Delta t} = \frac{dQ}{dt} 
$$

> [!success] Die Einheit des Stromflusses ist das *Ampere* ($A$);
> es entspricht einer [Ladung](elektrisches%20Feld.md) von einem [Coulomb](Coulomb-Kraft.md) ($C$) pro Sekunde ($s$).
> (Daher ist auch $1C=1As$)

## Amperesches Gesetz

Die Erste Maxwell Gleichung Lautet

![](Maxwell.md#^MW1)

Für Elektrische Leiter ist ist die Integral-Form des Ampereschen Gesetz

$$
I = \oint_{\partial A} \mathbf{H}\cdot\mathrm{d}\mathbf{s}
$$

Wobei $\partial A$ die Kontur der geschlossenen Leiterfläche $A$ ist.

---

Während bei der [Influenz](../Elektrotechnik/elektrische%20Influenz.md) die Ladungsträgerbewegung relativ rasch wieder zum Erliegen kommt (typischerweise Pikosekunden!), wird im Falle eines kontinuierlichen elektrischen Stromflusses das treibende Feld aufrecht erhalten indem man die Elektronen am einen Ende aufnimmt und am anderen einspeist.

Dies kann durch eine elektrische [Spannungsquelle](../Elektrotechnik/elektrische%20Spannung.md) bewerkstelligt werden – dadurch bleibt das treibende elektrische Feld trotz der Elektronenbewegung aufrecht.

> [!info] Mit dem [Drude-Modell](Drude-Modell.md) lässt sich die Elektronenbewegung statistisch Auswerten 

---

> [!info] Technische Stromrichtung
> 
> *==Positive==* [Ladung](elektrisches%20Feld.md) *in* die definierte **Stromrichtung** sowie ***==negative==*** [Ladung](elektrisches%20Feld.md) in die *Gegenrichtung* werden *positiv* gezählt (und vice versa).
> Dies entspricht der sogenannten ***technischen Stromrichtung***

> [!hint] In [Metallen](../Chemie/Metallbindung.md) tragen **nur** negativ geladene Elektronen zum Storm bei!
> 
> In einem metallischen Leiter sind nur die negativ geladenen Elektronen beweglich, die positiv geladenen Atomrümpfe sind im Gitter verankert und sind nicht beweglich.

---

- [Stromquelle](../Hardwareentwicklung/Stromquelle.md)
- [[../Hardwareentwicklung/Strommessung]]