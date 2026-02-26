---
tags:
aliases:
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 15th October 2025
professor:
release: false
title: Leeson Gleichung
---

# Leeson Gleichung

Die Leeson Gleichung modelliert die Rauschleistungsverstärkung eines [Oszillators](../Analog-Design/Oszillatoren/index.md) in abhängigkeit der Entfernung von der Carrier/Resonanzfrequenz

> [!def] **D - LEES)** Rauschleistungsmodell eines Oszillators ^LEES
> $$
> L(f_\mathrm{off}) = 10 \lg \left[ \frac{1}{2} \left( \frac{1}{4Q^{2}} \left( \frac{f_{0}}{f_{\mathrm{off}}} \right)^{2} +1  \right) \left( \frac{f_{\mathrm{c,flicker}}}{f_{\mathrm{off}}}+1 \right) \left( \frac{FkT}{P_{\mathrm{s}}} \right) \right] 
> $$

- $f_{\mathrm{off}}$: Abstand von der Resonanzfrequenz
- $f_{\mathrm{c,flicker}}$: Fluktuation um die Carrier-Frequenz (kommt in diversen Halbleiterschaltungen)

## Herleitung

Die Herleitung erfolgt durch die Taylorreihen Approximation des Closed Loop Gains des [Verstärker-Bandpass Modell](../Analog-Design/Oszillatoren/Verstärker-Bandpass%20Oszillator.md) eines Oszillators um die Resonanzfrequenz.