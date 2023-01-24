---
tags: []
aliases: []
subject: ["dic"]
source: ["Siegbert Schremof"]
reference: []
created: 24th January 2023
---

# Ringoszillator

Ein Ringoszillator besteht aus einer in Reihe geschaleteten Kette von Invertern. es gelten die [[Barkhausen Kriterium|Barkhausen Kriterien]].
[[Barkhausen Kriterium|BHK]]:
- open loop gain > 1
- open loop phase shift: ungerades Vielfaches von $180\degree$

>[!summary] Oscillation frequency: $f_{osz} = \dfrac{1}{2\cdot M\cdot T_{d}}$
> - $M$ ... Anzahl der Inverter stufen.
> - $T_{d}$ ... Delay Time eines einzelnen Inverters

Die delay time einer einzalnen Inverterstufe, lässt sich auf kapazitive/resistive weise und durch beeinflusses des Querstromes beim Schaltvorgang des Gatters beeinflussen. 

## Schaltung
![[PNG-Bild 1.png]]

## Clock Divider 
Zweier potenzen lassen sich leicht über kaskadierte D-Flip-Flops erzeugen
# Tags