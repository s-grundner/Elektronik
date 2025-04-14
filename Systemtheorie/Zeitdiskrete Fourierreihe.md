---
tags:
  - Analysis
aliases: 
keywords: 
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 8. Februar 2025
professor:
---
 

# Zeitdiskrete Fourierreihen

[Fourierreihe](Fourierreihe.md) ***:LiArrowBigRightDash:***

---

> [!quote] Die Zeitdiskrete betrachtung der Fourierreihe bietet einen Einblick in die Funktionsweise der [DFT](DFT.md)

Es wird eine $N$-Periodische Folge betrachtet:
$$f[n]=f[n+rN]$$
Dabei ist $r=0,\pm 1, \pm 2, \dots$ und $N$ die Periode

> [!info] Anwendung der [Einheitswurzel](Einheitswurzel.md).
> In diese Periode passt genau eine Periode der **komplexen Exponentialfolge**:
> 
> $$e_{1}[n]=\exp \left( j \frac{2\pi}{N}\cdot n\right) = W^{-n}_{N}\impliedby W_{N}:=\exp \left( -j \frac{2\pi}{N} \right)$$


Gesucht ist nun die Darstellung der periodischen Folge $f[n]$ mit Hilfe der $k$-ten Harmonischen der Exponentialfolge 

$$
e_{k}[n] = W^{-kn}_{N}, \quad k=1,2,\dots,N
$$

Es gibt nur **$N$** verschieden Harmonische. Daraus folgt:

> [!def] **D - ZDFR)** Zeitdiskrete Fourier-Reihenentwicklung ^ZDFR
> $$f[n] = \sum_{k = 0}^{N-1} F[k] W^{-kn}_{N}\tag{ZDFR}$$

Diese Darstellung ist äquivalent zur [komplexen Fourierreihe](Fourierreihe.md#Komplexe%20Fourierreihe) in diskreter Form. Mit $F[k]$ als **Entwicklungskoeffizienten** der **Periodischen Folge** $f[n]$, anstelle der Spektralkoeffizienten $X_{k}$.

> [!warning] Hier ist genau wie in der komplexen Fourierreihe der exponent eigentlich positiv.
> wegen der Definition der Einheitswurzel als negativer exponent, muss hier das vorzeichen nochmal invertiert werden

Für die Enwichlungskoeffizienten ergibt sich:

$$
F[k] = \frac{1}{N} \sum_{n=0}^{N-1} f[n] W^{kn}_{N}
$$

## Periodizität der Einheitswurzel

Wegen der [Periodizität der Einheitswurzel](Einheitswurzel.md#Periodizität) $W^{kn}_{N}$ in $k$ mit der Periode $N$

## Berechnung der Entwicklungskoeffizienten