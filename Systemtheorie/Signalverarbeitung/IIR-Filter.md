---
tags: 
aliases: 
keywords:
  - IIR-Filterentwurf
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 5th June 2025
professor: 
release: false
title: IIR-Filter
---

# IIR-Filter

[FIR-Filter](FIR-Filter.md) :LiRefreshCcw:

---

IIR: Infinite Impulse Response
- Es gibt zwar endlich viele koeffizienten
- Aber unendlich elemente in $h[n]$ (impulsantwort)

Rekursive Systeme: Für die [Differenzengleichung](../../Mathematik/Analysis/Numerische%20Verfahren/Differenzengleichung.md#^DZGL) des System gilt $a_{i}\neq 0 \quad\forall i$
- IIR - Systeme
- Akkumulator
- Moving Average

Bei IIR: Unendliche Faltung aber endliche Summen in der DZGL, daher DZGL Einfacher auszuwerten. 
- In Matlab: `filter()` Wertet DZGL aus. `conv()`wertet die Faltung aus.

M, N Auch bei Filter ist die Ordnung (bereich 2 ... 8)

## Eigenschaften

### Differenzengleichung

### Impulsantwort

### Übertragungsfunktion

## Entwurf

- [Bilineartransformation](../Frequenzbereichsmethoden/q-Transformation.md)

# Referenzen

- [LTI-Systeme](../Zeitdiskret/LTI-Systeme.md)