---
tags: []
aliases: ["Clock", "Oszillatoren"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 17th October 2022
---

# Clock Generierung
Ein Oszillator ist eine elektrische Schaltung, welche eine ungedämpfte, elektrische Schwingung mit konstanter Frequenz und Amplitude erzeugt.

## Klassifizierung von Oszillatoren
- Nach Art der Schwingungserzeugung
- Der Form des Ausgangssignals
- Nach der Art der frequenzbestimmenden Bauteile
- Nach den aktiven Bauelementen

## Typen
### Analog
- [[NE555]]
- RC Oszillatoren:
	- [[Wien-Brücke Oszillator]]
	- [[Phasenschieber Oszillator]]
- [[LC Oszillatoren]]
	- [[LC Oszillatoren#Serien Schwingkreise Schwingkreis mit Operations-Verstärker OPV|Serien Schwingkreis]]
	- [[LC Oszillatoren#Parallel Schwingkreise Schwingkreis mit Operations-Verstärker OPV|Parallel Schwingkreis]]
	- [[Colpitts Oszillator]]
- [[Relaxationsoszillator]]
- [[Kippschaltungen]]
- [[Quarzoszillator]]
- [[Pierce-Gate Oszillator]]
- [[Phase Locked Loop]]

### Digital
- [[Discrete Time Oscillator]]

> [!note] Blockschaltbild eines komplexen Taktsystems
> ![[komplex-dto.png]]
> - [[Pierce Gate Oszillator|PGO]]
> - [[Phase Locked Loop|PLL]]
> - [[Discrete Time Oscillator|DTO]]
> - [[Clock Divider]]
> - [[Clock Tree Balancing]]

# Tags
[[Barkhausen Kriterium]]
[[Reset Generierung]]
[[Klirrfaktor]]

![[Clock_und_Reset_Generierung.pdf]]