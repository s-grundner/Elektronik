---
tags: 
aliases: 
keywords: 
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 8. Februar 2025
professor:
---
 
# z-Transformation

> [!quote] Die z-Transformation ist eine Erweiterung der [Zeitdiskrete Fouriertransformation](Poissonsche%20Summenformel.md#**Zeitdiskrete**%20Fouriertransformation)
> **Zur Erinnerung:** Die Zeitdiskrete Fouriertransformation stellt ein zeitdiskretes signal in Form einer gewichteten Summe von komplexen Exponentialfunktionen der form $\exp (j\Omega)$ dar

Die z-Transformation verwendet die Exponential funktionen der Form:

$$
z=r\cdot\exp(j\Omega)
$$

Die $z$-Transformierte einer Folge ist die **analytische Fortsetzung** der zeitdiskreten Fouriertransformierten vom [Einheitskreis](../Mathematik/Kreis.md) in die komlexe Zahlenebene

> [!hint] *Diskrekt* $\to$ $z$-Transformation $\iff$ Laplacetransformation $\gets$ *Kontinuierlich*
> Die z-Transformation spielt bei zeitdiskreten Signalen die gleiche Rolle wie die [Laplacetransformation](Laplacetransformation.md) bei kontinuierlichen Signalen.

## Zweiseitige z-Transformation

> [!def] **D1 - 2ZTR)** Zweiseitige z-Transformation 
$$\mathcal{Z}_{II} \{f[n]\}=F(z) = \sum_{n=-\infty}^{\infty} f[n]z^{-n} = \sum_{n=-\infty}^{\infty} f[n] \cdot r\cdot e^{ -j\Omega n } \impliedby z = r\cdot e^{ j\Omega } \tag{2ZTR}$$

Lässt sich auch im zusammenhanf der zeitdiskreten Fouriertransformation 