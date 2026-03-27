---
tags:
aliases:
  - Channel Estimation
  - System Identification
subject:
  - VL
  - Optimum and Adaptive Signal Processing Systems
  - Bachelorarbeit
semester: SS26
created: 25th March 2026
professor:
release: false
title: Systemidentfikation
---

# Systemidentifikation

> [!question] [Optimale Filter](Optimale%20Filter.md)

Parallel zu einem Unbekannten System wird ein Optimaler Filter mit dem gleichen Eingang betrieben. Für ein [FIR](FIR-Filter.md)-System sind die Koeffizienten des Filters, dann jene des unbekannten Systems.

![invert_dark|500](../../_assets/Pasted%20image%2020260325184026.png)

- $\mathbf{h}$ ... Unbekanntes System
- $n[k]$ ... Messrauschen

Der Eingang $x[k]$ beider Systeme ist üblicherweise breitbandiges Rauschen.

> [!success] Ziel ist es, $\mathbf{w}$ so gut wie möglich $\mathbf{h}$ anzunähern.

## Referenzen

- [Inverse Systemidentifikation](Inverse%20Systemidentifikation.md)