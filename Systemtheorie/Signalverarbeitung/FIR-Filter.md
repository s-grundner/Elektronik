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


> [!def] **D - FIR)** Finite Impulse Response Filter ^FIR
> 
> ![invert_dark|700](../../_assets/Pasted%20image%2020260325210504.png)
> 
> - $x[k]$ ... Eingangssignal
> - $\hat{y}[k]$ ... Ausgangssignal
> - $\{w_{i} \}_{i=0}^{p-1}$ ... Filterkoeffizienten
> - $p$ ... Länge des FIR Filters
> 
> Fasst man die letzten $p-1$ Werte des Eingangssignals in einen Vektor $\mathbf{x}[k]$ und die Filterkoeffizienten in einen Vektor $\mathbf{w}$ zusammen:
> 
> $$
> \mathbf{x}[k] = \begin{pmatrix}
> x[k] \\ x[k-1] \\ \vdots \\ x[k-p+1]
> \end{pmatrix} \qquad
> \mathbf{w} = \begin{pmatrix}
> w_{0} \\ w_{1} \\ \vdots \\ w_{p-1}
> \end{pmatrix}
> $$
> 
> lässt sich das Ausgangssignal, dass sich aus der [Faltungssumme](../Zeitdiskret/Faltungssumme.md) ergibt, lässt sich diese auch mit Vektoren anschreiben
> 
> $$
> \hat{y}[k] = \sum_{i=0}^{p-1}w_{i}x[k-i] = \mathbf{w}^{T}\mathbf{x}[k]
> $$



- Nur Digital Möglich
- Immer BIBO Stabil
- Bei FIR: Die Berechnung der Faltung ist äquivalent zur auswertung der [DZGL](../../Mathematik/Analysis/Numerische%20Verfahren/Differenzengleichung.md)

Nachteil eines FIR-Filters im vergleich zu IIR-Filter ist, dass diese eine große anzahl an Koeffizienten Benötigen, um die selbe Impulsantwort zu anzunähern

## Differenzengleichung

Die [Differenzengleichung](../../Mathematik/Analysis/Numerische%20Verfahren/Differenzengleichung.md) eines FIR-Systems hat die Form

$$
y[n] = \sum_{i=0}^{N} b_{i} x[n-i]
$$

- Die $\Delta$-GL hat die Form einer [Faltungssumme](../Zeitdiskret/Faltungssumme.md).
- Betrachtet man die Allgemeine Form eines Zeitdiskreten Systems, erkennt man, dass keine Rückkopplung des Ausgangssignals auftritt (alle $a_{i}=0$ $\implies$ nicht rekursiv).


## Impulsantwort

$$
h[n] = \{ h_{0}, h_{1}, \dots, h_{N}\}  = \{ b_{0}, b_{1}, \dots, b_{N}\}
$$

- Die Impulsantwort ist gleich den Koeffizienten der Differenzengleichung / Übertragungsfunktion
- Länge der Impulsantwort $N$-ter Ordnung: $N+1$

## Übertragungsfunktion

$$
H(z) = b_{0} +b_{1} z^{-1} + \dots + b_{N} z^{-N}
$$

Mit positiven Exponenten (erweiterung mit $\cdot \frac{z^N}{z^N}$)

$$
H(z) = \frac{b_{0}z^{N} + b_{1}z^{N -1} + \dots + b_{N}}{z^N}
$$

## Entwurf

- Fenstermethode
- [Optimalmethode](Optimale%20Filter.md)

# Referenzen

- [LTI-Systeme](../Zeitdiskret/LTI-Systeme.md)