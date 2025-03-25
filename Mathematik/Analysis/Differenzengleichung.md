---
tags:
  - Systeme/Zeitdiskret
aliases:
  - Differenzengleichungen
  - DZGL
keywords: 
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 11th March 2025
professor: 
draft: true
title: Differenzengleichung
def:
  - DZGL
---
 
# Differenzengleichung

[Differenzialgleichungen](GDGL.md) ***:LiArrowBigRightDash:***

---

> [!quote] Differenzengleichungen im zeitdiskreten sind äquivalent zu den kontinuierlichen DGL 
> Man sucht hier anstatt einer Lösungsfunktion $\mathbf{x}(t;\mathbf{x}_{0}, t_{0})$ eine **Lösungsfolge** $\mathbf{x}[k;\mathbf{x}_{0},k_{0}]$


> [!def] **D1 - DZGL)** Explizite Differenzengleichung ^DZGL
> $$y[n] = -\sum_{i=1}^{M} a_{i}y[n-i] + \sum_{i=0}^{N}b_{i}x[n-i]$$

- Wenn alle $a_{i}=0$ dann heißt das System **nichtrekursiv**. der Ausgang ist nur von Folgegliedern des Eingangs.
- Sonst ist das System **rekursiv**. Man verwendet auch vergangenen Ausgänge.
- Die **Ordnung** des Systems ist $\max\{M,N\}$

---

Weiterführend ist die Systemtheoretische Betrachtung von [Differenzengleichungssystemen](../../Systemtheorie/Zeitdiskrete%20Systeme.md) als Zustandsgleichungen von Übertragungssystemen.