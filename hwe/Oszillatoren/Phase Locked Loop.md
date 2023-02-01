---
tags: []
aliases: ["Phasenregelschleife", "PLL"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 19th January 2023
---

# Phase Locked Loop (PLL)

Ein PLL ist ein System, welches die Phasenlage und damit die Frequenz eines veränderbaren Oszillators so beeinflusst, dass die Phasenabweichung zu einem zu einem äußeren System möglichst konstant ist. 

![[PLL.png]]

> [!summary] Bestandteile
> - Phase Detector + Charge Pump
> - Loop Filter
> - [[Voltage Controlled Oscillator|VCO]]
> - Feedback Divider ([[Clock Divider]])

## Kennwerte
1. **Lock range:** PLL folgt der Frequenzänderung innerhalb eines Taktes
2. **Pull out range:** spezifizierte Zeit für größere Frequenzänderungen um wieder den „locked“ Zustand zu erreichen.
3. **Lock time**
4. **Operationsbereich:** der von der PLL überdeckte Frequenzbereich
5. **Frequenzmultiplikator:** ganzzahlig / fraktional
6. **Ordnung der PLL:** Ordnung des Loop Filters
7. **Frequenzstabilität / Jitter**

# Phasedetector (PD)
Der Phasedetector vergleicht die ... sind beide Frequenzen gleich, ist die PLL im *Locked*-Zustand, ansonsten (wenn ungleich) wird ein, der Abweichung proportionales Signal, ausgegeben.

## XOR Phase Detector
Ein einfaches Modell für einen Phasendetektor ist ein XOR-Gatter.
Je größer die Phasenabweichung, desto höher das "PWM" am Ausgang des XOR Gatters.
![[XOR-PD.png|625]]
## Phase Frequency Detector (PFD)
Eine sehr populäre Implementierung für den Phasen Detektor ist der Phase-Frequency-Detector.
![[PFD.png]]
# Loop Filter
Das rechteck-förmige Ausgangssignal des PD besteht aus einer Vielzahl von Frequenzen.
Für den Regelkreis interessant ist jedoch nur sein DC-Anteil. Die übrigen Frequenzanteile werden durch den Loop-Filter eliminiert.

> [!warning] Der Filter hat daher eine Tiefpass-Charakteristik.
> Tiefpass 1. Ordnung

# [[Voltage Controlled Oscillator|VCO]]
Der VCO setzt das Signal in eine Rechteckschwingung um. Interessant ist die sogenannte *center-frequency*, also jede, Frequenz mit der der [[Clock Generierung|Oszillator]] im Locked-Zustand schwingt.
Um sie herum findet der Regelvorgang statt.
In PLL-Schaltungen kommen für die [[Clock Generierung|Oszillatoren]] hauptsächlich [[LC Oszillatoren|LC-Oszillatoren]] (weniger häufig RC-[[Clock Generierung|Oszillatoren]]) sowie Ringoszillatoren zum Einsatz.

--- 

# Tags
![[Clock_und_Reset_Generierung.pdf]]

![[MT-086.pdf]]