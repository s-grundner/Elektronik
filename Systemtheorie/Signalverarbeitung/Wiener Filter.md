---
tags:
  - Systeme/Zeitdiskret
aliases:
subject:
  - VL
  - Optimum and Adaptive Signal Processing Systems
semester: WS26
created: 27th March 2026
professor:
release: false
title: Wiener Filter
---

# Wiener Filter

> [!question] [Optimale Filter](Optimale%20Filter.md)

Die Systemantwort sowie die Eingangssignale sind realisierungen [stochastischer Prozesse](../../Mathematik/Statistik/Stochastische%20Prozesse.md). Das Optimierungskriterium für den Wiener Filter (WF) ist der (*Bayesian Mean Square Error*)

- Für die Modellbildung sei Vorrausgesetzt, dass die Stochastischen Prozesse *mittelwertfrei* und *schwach stationär* sind.
- Für das Modell ist außerdem eine [FIR-Filter](FIR-Filter.md) Struktur vorrasugesetzt.

![](FIR-Filter.md#^FIR)

## Kostenfunktion und Optimierungsbedingung

$$
\mathbf{w}_{0} = \underset{\mathbf{w}}{\operatorname{argmin}}\Big\{ E\left((  y[k]-\hat{y}[k])^{2} \right) \Big\} 
$$

Problem: Die Optimierung fordert die Kenntnis von [Momente 2. Ordnung](../../Mathematik/Statistik/Momenterzeugende%20Funktion.md), welche in der Realität schwer abzuschätzen sind.