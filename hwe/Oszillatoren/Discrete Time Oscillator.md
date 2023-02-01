---
tags: []
aliases: ["DTO"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 30th January 2023
---

# Discrete Time Oscillator

> [!important] Ausgangspunkt:
> 4 Bit Dualzähler betrieben mit $f_{0}$ betrachtet man das MSB

> [!important] Topologie:
> Accumulating register (Accureg) mit Feedbackleitung, betaktet mit dem Ausgang eines [[Phase Locked Loop|PLL]] *(clk_i)*
> ![[DTO.png]]
> - Das MSB des Accureg wird als Ausgang des DTO verwendet.


> [!info] Die Frequenz ist abhängig von
> - der Clockfrequenz des [[Phase Locked Loop|PLL]]
> - Bit-Breite des Addierers
> - Inkrement Wert

# Tags
[[Clock Tree Balancing]]
[[Clock Generierung]]
[[Phase Locked Loop|PLL]]