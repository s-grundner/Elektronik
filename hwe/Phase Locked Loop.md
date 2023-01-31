---
tags: []
aliases: ["Phasenregelschleife", "PLL"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 19th January 2023
---

# Phase Locked Loop (PLL)

## Phasedetector
### Phase Frequency Detector (PFD)
Eine sehr populäre Implementierung für den Phasen Detektor ist der Phase-Frequency-Detector
## Loop Filter
Das rechteckförmige Ausgangssignal des PFD besteht aus einer vielzahl von Frequenzen.
Für den Regelkreis interessant ist jedoch nur sein DC-Anteil. Die übrigen Frequenzanteile werden durch den Loop-Filter eliminiert. Der Filter hat daher iene Tiefpass-Charakteristik.
## Voltage Controlled Oscillator (VCO)
Der VCO setzt das Signal in eine Rechteckschwingung um. Interessant ist die sogenannte center-frequency, also jede Frequenz mitder der Oszillator im Locked-Zustand schwingt.
Um sie herum findet der Regelvorgang statt.
In PLL-Schaltungen kommen für die Oszillatoren hauptsächlich [[LC Oszillatoren|LC-Oszillatoren]] (weniger häufig RC-Oszillatoren) sowie Ringoszillatoren zum Einsatz.
Beim [[LC Oszillatoren|LC-Oszillator]] wird ein [[Schwingkreise|Schwingkreis]], bestehend aus einer [[Induktivitäten|Induktivität]] und einer Kapazität verwendet. Mittels Kapazitätsdioden, ist die Resonanzfrequenz einstellbar.

>[!note] [[Colpitts Oszillator|Colpitts]]-Ostillator in [[Emitterfolger]]
> ![[VCO_KapD.png|675]]

# Tags

![[Clock_und_Reset_Generierung.pdf]]

![[MT-086.pdf]]