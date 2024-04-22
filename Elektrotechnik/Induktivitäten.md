---
tags: 
aliases:
  - Spule
  - Spulen
subject:
  - hwe
source:
  - Siegbert Schrempf
  - Michael Offenhuber
created: 8th April 2022
---

# Induktivitäten

## Schaltzeichen

| Symbol        | ESB |
| ------------- | --- |
| ![indu](assets/indu.png) | ![indu-esb](assets/indu-esb.png)    |

## Induktivitäten Als Bauelemente Leistungselektronischen Schaltungen

Unter **Vernachlässigung** von **$R_{L}$** und der **parasitären Parallelkapazität $C_{L}$**, gilt für lineare Materialien der folgende Zusammenhang der die Spannung an der Induktivität beschreibt:

$$
\begin{align*}
	u_{L} = L\cdot \frac{di}{dt}
\end{align*}
$$
$$i(t)=i\left(t_0\right)+\frac{1}{L} \int_{t_0}^t u(\tau) \mathrm{d} \tau$$


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

---

# Tags

## Wikipedia

[Induktivitäten](<https://de.wikipedia.org/wiki/Induktivit%C3%A4t_(Bauelement)>)

[Spulen](<https://de.wikipedia.org/wiki/Spule_(Elektrotechnik)>)