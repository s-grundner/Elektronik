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

![Blockdiagramm](FIR-Filter.md#Blockdiagramm)

## Kostenfunktion und Optimierungsbedingung

$$
\mathbf{w}_{0} = \underset{\mathbf{w}}{\operatorname{argmin}}\left\{ E\left((  y[k]-\hat{y}[k])^{2} \right) \right\} 
$$
