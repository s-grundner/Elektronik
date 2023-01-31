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

> [!note] Schaltung
> ![[PLL.png]]

> [!summary] Bestandteile
> - Phase Detector
> - Charge Pump
> - Loop Filter
> - [[Voltage Controlled Oscillator|VCO]]
> - Feedback Divider ([[Clock Divider]])

## Phasedetector (PD)
Der Phasedetector vergleicht die .... sind beide Frequenzen gleich, ist die PLL im *Locked*-Zustand, ansonsten (wenn ungleich) wird ein, der Abweichung proportionales Signal, ausgegeben.

### XOR Phase Detector
Ein einfaches Modell für einen Phasendetektor ist ein XOR-Gatter.
Je größer die Phasenabweichung, desto höher das "PWM" am ausgang des XOR Gatters.

### Phase Frequency Detector (PFD)
Eine sehr populäre Implementierung für den Phasen Detektor ist der Phase-Frequency-Detector.



## Loop Filter
Das rechteck-förmige Ausgangssignal des PD besteht aus einer Vielzahl von Frequenzen.
Für den Regelkreis interessant ist jedoch nur sein DC-Anteil. Die übrigen Frequenzanteile werden durch den Loop-Filter eliminiert. Der Filter hat daher eiene Tiefpass-Charakteristik.

[[Voltage Controlled Oscillator]]


# Tags
[[Kapazitäts-Diode|Varicap]]


![[Clock_und_Reset_Generierung.pdf]]

![[MT-086.pdf]]