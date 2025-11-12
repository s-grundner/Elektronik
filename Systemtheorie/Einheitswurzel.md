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

> [!question] [Zeitdiskrete Fourierreihe](Zeitdiskrete%20Fourierreihe.md) | [DFT](Systemtheorie/DFT.md) | [FFT](../Softwareentwicklung/DS-Algo/FFT.md)

Die Einheitswurzel ist eine Abkürzung für eine, häufig in der [DFT](Systemtheorie/DFT.md) benötigten, komplexen Exponentialfunktion mit einem Speziell auf eine **Abtastperiode** $N$ normierte **Phase**. 

> [!def] **D1 - EWRZ)** Einheitswurzel ^EWRZ
> $$W_{N} := \exp \left( -j \frac{2\pi}{N} \right) $$  

## Eigenschaften

### Periodizität

Die Eigenschaft, dass $W_{N}^N = W_{N}^0 = 1$, führt zu periodischen Eigenschaften in der DFT, was in der Signalverarbeitung oft genutzt wird (z. B. beim periodischen Fortsetzen von Signalen).

### Drehung

Die Einheitswurzel unterteilt die Abtastperiode, also alle Werte zwischen $0$ und $N-1$, gleichmäßig auf dem [Einheitskreis](../Mathematik/Kreis.md) im komplexen Zahlenraum $\mathbb{C}$, indem die Einheitswurzel über die gesamte Periode **Potenziert** wird. Da die Potenzen der Einheitswurzel eine **Drehung** verursachen, bezeichnet man sie daher of als **Dreh-Faktor** (engl. Twiddle-Factor):



> [!def] Funktionenfolge der Drehfaktoren *(Twiddle-Factors)*
> $$W_{N}^{n} = \exp \left( -j \frac{2\pi}{N}n \right) \quad \text{mit } n=0,1,\dots, N-1 $$

Die Funktionenfolge der Drehfaktoren ergibt folgendes Bild:
![700](../assets/Excalidraw/Einheitswurzel%202025-02-08%2013.06.12.excalidraw)

### Symmetrie

Bei der schnellen Berechnung der DFT mittels der Fast-Fourier-Transformation (FFT) kommen diese Drehfaktoren in vielfacher Weise vor. Ihre regelmäßige Struktur (gleichmäßig verteilte Einheitswurzeln) erlaubt es, Algorithmen zu entwickeln, die redundante Berechnungen vermeiden und so die Rechenkomplexität erheblich reduzieren.