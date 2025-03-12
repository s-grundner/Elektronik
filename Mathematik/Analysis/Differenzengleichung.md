---
tags: 
aliases: 
keywords: 
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 11th March 2025
professor:
draft: true
title: Differenzengleichung
---
 
# Differenzengleichung

> [!def] **D1 - DZGL)** Differenzengleichungen ^DZGL
> $$y[n] = -\sum_{i=1}^{M} a_{i}y[n-i] + \sum_{i=0}^{N}b_{i}x[n-i]$$

Wenn alle $a_{i}=0$ dann heißt das System **nichtrekursiv**. der Ausgang ist nur von Differenzen des Ausgangsabhängig.

Sonst ist das System **rekursiv**. Man verwendet auch vergangenen Ausgänge.

Die **Ordnung** des Systems ist $\max\{M,N\}$

---
