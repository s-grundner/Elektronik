---
tags: 
aliases: 
keywords: 
subject:
  - KV
  - Elektronische Systeme 1
  - VL
  - Einführung Elektronik
semester: WS24
created: 11. Oktober 2025
professor:
release: false
title: Bandpass
---

# Bandpass

> [!question] [Filter](Filter.md)

> [!warning] Ein Bandpass hat immer 2 Grenzfrequenzen und ist damit immer mindestens von 2. Ordnung

Allgemeiner Bandpass 2. Ordnung:

$$
A_{BP}(s) = \frac{V_{0}\cdot \frac{s}{\omega_{0}}}{1+\frac{s}{\omega_{0}}\frac{1}{Q}+\left( \frac{s}{\omega_{0}} \right)^{2}} 
$$


## Güte $Q$

Die Güte bestimmt die Verstärkung / Bandbreite in der Übertragungsfunktion:

- Hohe Güte: Kleine Bandbreite, große Verstärkung
- Kleine Güte: große Bandbreite, kleine Verstärkung

Notation in der Regelungstechnik oft: $Q =\frac{1}{2\xi}$

## LCR Bandpass 2. Ordnung

