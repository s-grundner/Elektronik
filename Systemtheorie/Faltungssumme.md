---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 24th March 2025
professor:
draft: true
title: Faltungssumme
---

# Faltungssumme

[Faltungsintegral](Faltung.md) ***:LiArrowBigRightDash:***

---

> [!def] **D1 - FALT)** Faltungssumme
> $$(y*x)[n] = \sum_{\nu=-\infty}^{\infty} x[\nu-n]y[n]$$

## Faltungsmatrix

Bekannt aus der Systemtheorie ist, dass das Ausgangssignal das Ergebnis der Faltung des Eingagns mit der Impulsantwort ist. Der Eingang, Ausgang und die Impulsantowrt 

$$
y[n] = (h*n)[n] = \sum_{\nu=-\infty}^{\infty} h[\nu-n]x[n]
$$
