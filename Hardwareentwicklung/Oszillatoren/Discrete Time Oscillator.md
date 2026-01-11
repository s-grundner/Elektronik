---
tags: ["MCU", "Baugruppe/Oszillator"]
aliases: ["DTO"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 30th January 2023
---

# Discrete Time Oscillator

> [!INFO] Wird zum Zeitmessen am IC verwendet

> [!IMPORTANT] Ausgangspunkt:  
> 4 Bit Dualzähler betrieben mit $f_{0}$ betrachtet man das MSB

> [!IMPORTANT] Topologie:  
> Accumulating register (Accureg) mit Feedbackleitung, betaktet mit dem Ausgang eines [PLL](Phase%20Locked%20Loop.md) *(clk_i)*  
> ![DTO](../../_assets/DTO.png)
> - Das MSB des Accureg wird als Ausgang des DTO verwendet.

![dto-counter](../../_assets/dto-counter.png)

> [!INFO] Die Frequenz ist abhängig von
> - der Clockfrequenz des [PLL](Phase%20Locked%20Loop.md)
> - Bit-Breite des Addierers
> - Inkrement Wert

# Tags

[Clock-Generierung](Clock-Generierung.md)  
[Clock Tree Balancing](Clock%20Tree%20Balancing.md)  
[PLL](Phase%20Locked%20Loop.md)