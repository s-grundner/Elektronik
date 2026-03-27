---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 5th June 2025
professor:
release: false
title: FIR-Filter
---

# FIR-Filter

[IIR-Filter](IIR-Filter.md) :LiRefreshCcw:

---

FIR: Finite Imulse Response
- Nur Digital Möglich
- Immer BIBO Stabil
Bei FIR: Die Berechnung der Faltung ist äquivalent zur auswertung der [DZGL](../../Mathematik/Analysis/Numerische%20Verfahren/Differenzengleichung.md)

Nachteil eines FIR-Filters im vergleich zu IIR-Filter ist, dass diese eine große anzahl an Koeffizienten Benötigen, um die selbe Impulsantwort zu anzunähern

## Eigenschaften

### Differenzengleichung

Differenzengleichung eines FIR-Systems

$$
y[n] = \sum_{i=0}^{N} b_{i} x[n-i]
$$

Keine Rückkopplung des Ausgangssignals (alle $a_{i}=0$). $\to$ nicht rekursiv


### Impulsantwort

$$
h[n] = \{ h_{0}, h_{1}, \dots, h_{N}\}  = \{ b_{0}, b_{1}, \dots, b_{N}\}
$$

- Die Impulsantwort ist gleich den Koeffizienten der Differenzengleichung / Übertragungsfunktion
- Länge der Impulsantwort $N$-ter Ordnung: $N+1$

### Übertragungsfunktion

$$
H(z) = b_{0} +b_{1} z^{-1} + \dots + b_{N} z^{-N}
$$

Mit positiven Exponenten (erweiterung mit $\cdot \frac{z^N}{z^N}$)

$$
H(z) = \frac{b_{0}z^{N} + b_{1}z^{N -1} + \dots + b_{N}}{z^N}
$$

### Blockdiagramm

![invert_dark|700](../../_assets/Pasted%20image%2020260325210504.png)

## Entwurf

- Fenstermethode
- [Optimalmethode](Optimale%20Filter.md)

# Referenzen

- [LTI-Systeme](../Zeitdiskret/LTI-Systeme.md)