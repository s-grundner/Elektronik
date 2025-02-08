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
$$F(z) = \mathcal{Z}_{II} \{f[n]\} = \sum_{n=-\infty}^{\infty} f[n]z^{-n} = \sum_{n=-\infty}^{\infty} f[n] \cdot r\cdot e^{ -j\Omega n } \impliedby z = r\cdot e^{ j\Omega } \tag{2ZTR}$$

Lässt sich auch im Zusammenhang der zeitdiskreten Fouriertransformation schreiben:

$$F(z) = \sum_{n=-\infty}^{\infty}\left( f[n]r^{-n} \right)e^{ -jn\Omega } =\mathcal{F}\{f[n]\cdot r^{-n}\}$$

$\implies$ die z-Transformation der Folge $f[n]$ ist gleich der zeitdiskreten Fouriertransformation der Folge $f[n]r^{-n}$. Wenn $r=1$ ist, dann stimmen beide Transformationen überein (sofern sie existieren)

### Existenzbedingung

> [!important] Existenzbedingung für die Existenz der z-Transformierten einer Folge $f[n]$:
> $$\sum_{n=-\infty}^{\infty}\left| f[n]r^{-n} \right|< M <\infty $$
> Mit dem Betrag $r$ kann also die Konvergenzeigenschaft der z-Transformierten beeinflusst werden. 

Äquivalent zum Realteil $\Re (s) = \sigma$ der Laplace-Transformation


## Einseitige z-Transformation

> [!def] **D2 - 1ZTR)** Einseitige z-Transformation
> $$F(z) = $$