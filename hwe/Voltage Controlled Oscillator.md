---
tags: []
aliases: ["VCO"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 31st January 2023
---

# Voltage Controlled Oscillator (VCO)
Der VCO setzt das Signal in eine Rechteckschwingung um. Interessant ist die sogenannte center-frequency, also jede Frequenz mitder der [[Clock Generierung|Oszillator]] im Locked-Zustand schwingt.
Um sie herum findet der Regelvorgang statt.
In [[Phase Locked Loop|PLL]]-Schaltungen kommen für die [[Clock Generierung|Oszillatoren]] hauptsächlich [[LC Oszillatoren|LC-Oszillatoren]] (weniger häufig RC-[[Clock Generierung|Oszillatoren]]) sowie Ringoszillatoren zum Einsatz.
Beim [[LC Oszillatoren|LC-Oszillator]] wird ein [[Schwingkreise|Schwingkreis]], bestehend aus einer [[Induktivitäten|Induktivität]] und einer Kapazität verwendet. Mittels Kapazitätsdioden, ist die Resonanzfrequenz einstellbar.

>[!note] [[Colpitts Oszillator|Colpitts]]-Ostillator in [[Emitterfolger]]
> ![[VCO_KapD.png|675]]

# Tags
[[Kapazitäts-Diode|Varicap]]
[[Phase Locked Loop|PLL]]
[[Discrete Time Oscillator|DTO]]