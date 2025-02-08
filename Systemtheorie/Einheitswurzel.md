---
tags: 
aliases:
  - Drehfaktor
  - Roots of Unity
  - Twiddle-Factor
keywords: 
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 8. Februar 2025
professor:
---
 
# Einheitswurzel

> [!question] [Zeitdiskrete Fourierreihe](Zeitdiskrete%20Fourierreihe.md) | [DFT](DFT.md) | [FFT](../Softwareentwicklung/DS-Algo/FFT.md)

Die Einheitswurzel ist eine Abkürzung für eine, häufig in der [DFT](DFT.md) benötigten, komplexen Exponentialfunktion mit einem Speziell auf eine **Abtastperiode** $N$ normierte **Phase**. 

> [!def] **D1 - EWRZ)** Einheitswurzel ^EWRZ
> $$W_{N} := \exp \left( -j \frac{2\pi}{N} \right) $$  

## Eigenschaften

- Die Einheitswurzel unterteilt die Abtastperiode, also alle Werte zwischen $0$ und $N$, gleichmäßig auf den [Einheitskreis](../Mathematik/Kreis.md) im komplexen Zahlenraum $\mathbb{C}$.

![](../assets/Excalidraw/Einheitswurzel%202025-02-08%2013.06.12.excalidraw)