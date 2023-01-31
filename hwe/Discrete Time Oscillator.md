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
> ![dto-counter](assets/dto-counter.png)


> [!important] Topologie:
> Accumulating register (Accureg) mit Feedbackleitung, betaktet mit dem Ausgang eines [[Phase Locked Loop|PLL]]
> ![DTO](assets/DTO.png)



Das MSB des Accureg wird als Ausgang des DTO verwendet.


> [!info] Die Frequenz ist abhängig von
> - der Clockfrequenz des [[Phase Locked Loop|PLL]]
> - Bit-Breite des Addierers
> - Inkrement Wert

## Blockschaltbild eines komplexen Taktsystems
![komplex-dto](assets/komplex-dto.png)
# Tags
[Clock Tree Balancing](../Clock%20Tree%20Balancing.md)