---
tags: 
aliases:
  - Group Delay
keywords: 
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 6. Februar 2025
professor:
  - Andreas Stelzer
  - Mario Huemer
---
 
# Gruppenlaufzeit

> [!question] [Gruppenlaufziet zeitdiskreter Systeme](zeitdiskrete%20Gruppenlaufzeit.md) :LiRefreshCcw:

---

$H(j\omega)$ ist der [Frequenzgang](Übertragungsfunktion.md) eines zeitkontinuierlichen LTI-System.

> [!def] **D1 - GRLZ)** Gruppenlaufzeit ^GRLZ
> $$\tau_{g} := - \frac{\mathrm{d}\operatorname{arg}H(j\omega)}{\mathrm{d}\omega}$$ 
> 

## Verzerrungsfreies LTI-System

Ein LTI-System ist verzerrungsfrei, wenn das Eingangssignal lediglich skalier und zeitverzögert ist.

Übertragungsfunktion ist konstant und Phase ist linear, das heißt hat die Form $-\omega t_{0}$

$\implies$ Konstante Gruppenlaufzeit $\uptau_{g} = t_{0}$ für alle Frequenzen.

## Eigenschaften

Im allgemeinen hat man eine nichtlineare Phasencharakteristik

Auswirkkung eines LTI-Systems auf ein schmalbandiges Signal, das heißt das Spektrum des Signals ist nur einem schmalen Band um die Frequenz $\omega_{0}$ nicht Null

Es gilt die lineare Approximation der Phase: $\operatorname{arg}(H(h\omega))\approx-\phi-\alpha\omega$

Spektrum des Ausgangssignals: 

$$
Y(j\omega) = X(j\omega) \lvert H(j\omega) \rvert  e^{ -j\phi } e^{ -j\omega\alpha }
$$

$X(j\omega)$ wird mit dem kompkexen Faktor $\lvert H(j\omega) \rvert e^{ -j\phi }$ multipliziert. Der **lineare Phasenterm** entspricht einer Verzögerung der Größe $\alpha$.

Diese Verzögerung erfährt eine **Gruppe** der Frequenzen aus denen sich das schmalbandige Eingangsignal zusammensetzt.[^1]

> [!example] Gegebene Übertragungsfunktion
> 
> $$H(s) = \frac{s-s_{0}}{s+s_{0}}$$
> 
> $s_{0}$ reell und positiv (Pol in der linken und Nullstelle in der rechten $s$-Ebene)
> 
> - Phase des Systems:
> 
> $$
> \operatorname{arg}(H(j\omega)) = \arctan \left( \frac{\omega}{-s_{0}} \right) -\arctan \left( \frac{\omega}{s_{0}} \right) = \pi - 2 \arctan\left( \frac{\omega}{s_{0}} \right) 
> $$
> 
> - Gruppenlaufzeit:
> 
> $$
> \uptau_{g}(\omega) = - \frac{\mathrm{d}\operatorname{arg}(H(j\omega))}{\mathrm{d}\omega} = \frac{2}{1+ \left( \frac{\omega}{s_{0}} \right)^{2} } \frac{1}{s_{0}} = \frac{2s_{0}}{s_{0}^{2}+\omega^{2}}
> $$


[^1]: Aus deiser betrachtugnsweise leitet sich der begriff Gruppenlaufzeit (engl. group Delay ab)

