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

> [!quote] Die Zeitdiskrete betrachtung der Fourierreihe bietet einen Einblick in die Funktionsweise der [DFT](DFT.md)

Es wird eine $N$-Periodische Folge betrachtet:
$$f[n]=f[n+rN]$$
Dabei ist $r=0,\pm 1, \pm 2, \dots$ und $N$ die Periode

In diese Periode passt genau eine Periode der **komplexen Exponentialfolge**:

$$e_{1}[n]=\exp \left( j \frac{2\pi}{N}\cdot n\right) = W^{-n}_{N}$$

Es gilt die Abkürzung (siehe [Einheitswurzel](Einheitswurzel.md))

$$W_{N}=\exp \left( -j \frac{2\pi}{N} \right) $$
