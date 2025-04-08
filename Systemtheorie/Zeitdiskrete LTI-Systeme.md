---
tags: 
aliases: 
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

- Ideale Verzögerung
- Summierer, akkumulator, diskreter Intgrator
- Moving Average, Gleitender Mittelwert
- Vorwärts oder Rückwärts-Differenzierer

## Kettenschaltung

## FIR / IIR Systeme

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
> Durch Betrachtung von $h[n]$ folgt unmittelbar, dass es sich um ein kausales, BIBO stabiles LTI-System handelt.

> [!example] Summierer, Akkumulator oder diskreter Integrator
> *Ausgangssignal:*
> *Impulsantwort:*
> Durch Betrachtung von $h[n]$ folgt unmittelbar
