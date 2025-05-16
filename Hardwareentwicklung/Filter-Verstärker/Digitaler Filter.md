---
tags: 
aliases:
  - Cardic
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 2nd April 2025
professor: 
release: false
title: Digitaler Filter
---

# Digitale Filter

Bei digitalen Filtern handelt es sich um [zeitdiskrete Systeme](../../Systemtheorie/Zeitdiskrete%20Systeme.md) (oft [Zeitdiskrete LTI-Systeme](../../Systemtheorie/Zeitdiskrete%20LTI-Systeme.md)).

---

> [!important] Implementationen
> - [Moving Average](../../Systemtheorie/Moving%20Average.md)

---

## Adaptive Filter:

- Verändern ihre eigenschaften über Zeit. Werden an die Samples angepasst

![invert_dark|600](assets/Pasted%20image%2020250305101059.png)
    
- $s[k]$ = nutzsignal
- $x'[k]$ = rauschsignal
- $y[k]$ = überlagertes signal

Cardic: Algorithmus zur auswertung von Elementarsignale (iterativ: nur durch addition und multiplikation)