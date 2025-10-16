---
tags: 
aliases: 
keywords: 
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 27th February 2025
professor:
release: false
title: Ereignisraum
---

# Ereignisraum $\Omega$

- [Menge](../Algebra/Mengenlehre.md) aller möglichen [Ereignisse](Ereignis.md) (Ausgänge) $\Omega$
- Anzahl aller möglichen [Ereignisse](Ereignis.md) $|\Omega|$ (Mächtigkeit)

>[!EXAMPLE] 1 Würfel  
> $\Omega = \{\text{"1"; "2"; "3"; "4"; "5"; "6"}\}$  
> $|\Omega|= 6$

>[!EXAMPLE] 2 Würfel  
> $\Omega=\{2;\dots;12\}\qquad$ Augensumme  
> $\Omega=\{(1,1);(1,2);\dots;(6,6)\}\qquad$ Würfelkombination ohne Reihenfolge  
> $\Omega=\{(1,1);(1,2);(2,1);\dots(6,6)\}\qquad$ Würfelkombination mit Reihenfolge
> 

## Häufigkeit

sei $\omega\in\Omega$ (ein Ausgang)  
$n$ Versuche

### Absolute Häufigkeit

- $H(\omega)$ … Anzahl des Auftretens von $\omega$
- $\sum\limits_{\omega\in\Omega}H(\omega)=n$

### Relative Häufigkeit

- $h(\omega)=\dfrac{H(\omega)}{n}$
- $\sum\limits_{\omega\in\Omega}h(\omega)=1$

#### Das empirische Gesetz der großen Zahlen

Die Folge der relativen Häufigkeit zeigt ein konvergentes Verhalten

# Tags

- [Wahrscheinlichkeit](Wahrscheinlichkeit.md)