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

# Diskrete LTI-Systeme

> [!question] [Systemtheorie]({MOC}%20Systemtheorie.md) > [Zustandsbeschreibung](Zustandsgleichungen.md) >📍> [Diskreter LTI-Zustandsraum](Diskreter%20LTI-Zustandsraum.md)

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
