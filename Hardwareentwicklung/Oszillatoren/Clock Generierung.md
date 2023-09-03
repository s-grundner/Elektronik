---
tags: ["Microcontroller", "Baugruppen/Oszillator"]
aliases: ["Clock", "Oszillatoren"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 17th October 2022
---

# Clock Generierung

Ein Oszillator ist eine elektrische Schaltung, welche eine ungedämpfte, elektrische Schwingung mit konstanter Frequenz und Amplitude erzeugt.

> [!NOTE] Blockschaltbild eines komplexen Taktsystems  
> ![komplex-dto](../assets/komplex-dto.png)
> - [PGO](Pierce-Gate%20Oszillator.md)
> - [PLL](Phase%20Locked%20Loop.md)
> - [DTO](Discrete%20Time%20Oscillator.md)
> - [Clock Divider](Clock%20Divider.md)
> - [Clock Tree Balancing](Clock%20Tree%20Balancing.md)

## Klassifizierung von Oszillatoren

- Nach Art der Schwingungserzeugung
- Der Form des Ausgangssignals
- Nach der Art der frequenzbestimmenden Bauteile
- Nach den aktiven Bauelementen

## Typen

### Analog

- [NE555](NE555.md)
- RC Oszillatoren:
	- [Wien-Brücke Oszillator](Wien-Brücke%20Oszillator.md)
	- [Phasenschieber Oszillator](Phasenschieber%20Oszillator.md)
- [LC Oszillatoren](LC%20Oszillatoren.md)
	- [Colpitts Oszillator](Colpitts%20Oszillator.md)
- [Relaxationsoszillator](Relaxationsoszillator.md)
- [Kippschaltungen](Kippschaltungen.md)
- [Quarzoszillator](Quarzoszillator.md)
- [Pierce-Gate Oszillator](Pierce-Gate%20Oszillator.md)
- [Phase Locked Loop](Phase%20Locked%20Loop.md)

### Digital

- [Discrete Time Oscillator](Discrete%20Time%20Oscillator.md)

# Tags

[Barkhausen Kriterium](Barkhausen%20Kriterium.md)

[Reset Generierung](../Reset%20Generierung.md)

[Klirrfaktor](../Klirrfaktor.md)

![Clock_und_Reset_Generierung](../assets/pdf/Clock_und_Reset_Generierung.pdf)