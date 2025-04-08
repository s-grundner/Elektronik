---
tags: 
aliases:
  - FIR
  - IIR
keywords: 
subject:
  - Signalverarbeitung
  - VL
semester: SS25
created: 12th March 2025
professor: 
draft: true
title: Diskrete Systeme
---

# Zeitdiskrete LTI-Systeme

> [!question] :LiArrowBigLeftDash: [Zeitdiskrete Lineare Systeme](Zeitdiskrete%20Lineare%20Systeme.md) |📍| [Zeitdiskreter LTI-Zustandsraum](Zeitdiskreter%20LTI-Zustandsraum.md) :LiArrowBigRightDash:

[Kontinuierliche LTI-Systeme](LTI-Systeme.md) ***:LiArrowBigRightDash:***

---

## Systemantwort (FIR / IIR)

IIR: Infinite Impulse Response
- Es gibt zwar endlich viele koeffizienten
- Aber unendlich elemente in $h[n]$ (impulsantwort)

FIR: Finite Imulse Response
- Nur Digital Möglich
- Immer BIBO Stabil

### Rekursive Systeme

Rekursive Systeme: Für die [Differenzengleichung](../Mathematik/Analysis/Differenzengleichung.md#^DZGL) des System gilt $a_{i}\neq 0 \quad\forall i$
- IIR - Systeme
- Akkumulator
- Moving Average

Bei FIR: Die Berechnung der Faltung ist äquivalent zur auswertung der DZGL
Bei IIR: Unendliche Faltung aber endliche Summen in der DZGL, daher DZGL Einfacher auszuwerten. 
- In Matlab: `filter()` Wertet DZGL aus. `conv()`wertet die Faltung aus.

M, N Auch bei Filter ist die Ordnung (bereich 2 ... 8)



---

# Beispiele für ZD-LTI-Systeme


> [!example] Ideale Verzögerung
> *Ausgangssignal:* $y[n] = x[n-n_{d}]$ mit $-\infty< n <\infty, n_{d} \in \mathbb{N}$
> *Impulsantwort:* $h[n] = \delta[n-n_{d}]$
> 
> Durch Betrachtung von $h[n]$ folgt unmittelbar, dass es sich um ein kausales, BIBO stabiles LTI-System handelt.

> [!example] Summierer, Akkumulator oder diskreter Integrator
> *Ausgangssignal:*
> *Impulsantwort:*
> 
> Durch Betrachtung von $h[n]$ folgt unmittelbar

> [!example] Gleitende Mittelwertbildung (Moving Average)
> *Ausgangssignal:* $y[n] = \sum_{k=0}^{M}x[n-k] = \begin{cases} \frac{1}{M+1} & \text{für } 0 \leq n < M \\ 0 & \text{sonst} \end{cases}$
> *Impulsantwort:*
> 
> Dieses System berechnet den $n$-ten Abtastwert der Ausgangsfolge aus dem Mittelwert von $x[n],x[n-1], \dots ,x[n-M]$
> 

> [!example] Vorwärts-Differenz-System
> *Ausgangssignal:* $y[n] = x[n+1]-x[n]$
> *Impulsantwort:* $h[n] = \delta[n+1]-\delta[n]$
> 
> Dieses BIBO stabile LTI System ist nicht kausal, da der aktuelle Wert der Ausgangsfolge von einem zukünftigen Wert der Eingangsfolge abhängt. Startet das Eingangssignal beispielsweise bei $n=1$, so startet das Ausgangssignal bereits bei $n=0$
> 

> [!example] Rückwärts-Differenz-System
> *Ausgangssignal:* $y[n] = x[n]-x[n-1]$
> *Impulsantwort:* $h[n] = \delta[n]-\delta[n-1]$
> 
> Diese System ist wiederum kausal

---