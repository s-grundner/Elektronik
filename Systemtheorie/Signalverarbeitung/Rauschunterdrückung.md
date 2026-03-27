---
tags:
aliases:
  - Rauschverminderung
subject:
  - VL
  - Optimum and Adaptive Signal Processing Systems
semester: SS26
created: 25th March 2026
professor:
release: false
title: Rauschunterdrückung
---

# Rauschunterdrückung

> [!question] [Optimale Filter](Optimale%20Filter.md)

## Rauschverminderung (Noise Reduction)

![invert_dark|700](../../_assets/Pasted%20image%2020260325184922.png)

> [!success] **Ziel:** $\mathbf{w}$ finden, sodass der Filter den Rauschanteil $n[k]$ im Eingangssignal $x[k]$ so gut wie Möglich reduziert.

Für $k_{0}>0$ versucht der Filter den Ausgang $\hat{y}[k]$ so gut wie möglich dem verzögerten Signal $s[k]$ nachzubilden.

## Rauschunterdrückung (Noise Cancellation)

![invert_dark|700](../../_assets/Pasted%20image%2020260325185512.png)

> [!success] **Ziel:** Entfernung von $n[k]$ aus $y[k]$ sodass $e[k]\approx s[k]$

- $y[k]$ besteht aus dem Nutzsignal $s[k]$ plus (mit $s[k]$ unkorreliertem) Rauschen $n[k]$. 
	- z.B.: Sprache + Rauschen in einem Helikopter, gemessen am Headsetmikrofon
- $n'[k]$ ist das Rauschsignal von der Gleichen Rauschquelle wie $n[k]$ aber ohne Sprachsignal.
	- z.B.: Helikopter-Rotor Geräusche, aufgenommen mit einem Zweiten Mikrofon in der Helikopterkabine.

Der Filter ist in der Lage, $n[k]$ von $n'[k]$ (ungefähr) zu rekonstruieren. Das Fehlersignal $e[k]$ wird dann dem Nutzsignal $s[k]$ Angenähert.