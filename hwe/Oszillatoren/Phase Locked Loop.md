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

![PLL](hwe/assets/PLL.png)

> [!summary] Bestandteile
> - Phase Detector + Charge Pump
> - Loop Filter
> - [VCO](hwe/Voltage%20Controlled%20Oscillator.md)
> - Feedback Divider ([Clock Divider](digitaltechnik/Clock%20Divider.md))

## Kennwerte
| Kennwert                        |                                                                                                |
| ------------------------------- | ---------------------------------------------------------------------------------------------- |
| **Lock Range**                  | PLL folgt der Frequenzänderung innerhalb eines Taktes                                          |
| **Pull out Range**              | spezifizierte Zeit für größere Frequenzänderungen um wieder den „locked“ Zustand zu erreichen. |
| **Lock time**                   |                                                                                                |
| **Operationsbereich**           | der von der PLL überdeckte Frequenzbereich                                                     |
| **Frequenzmultiplikator**       | ganzzahlig / fraktional                                                                        |
| **Ordnung der PLL**             | Ordnung des Loop Filters                                                                       |
| **Frequenzstabilität / Jitter** |                                                                                                |

# Phasedetector (PD)
Der Phasedetector vergleicht die ... sind beide Frequenzen gleich, ist die PLL im *Locked*-Zustand, ansonsten (wenn ungleich) wird ein, der Abweichung proportionales Signal, ausgegeben.

## XOR Phase Detector
Ein einfaches Modell für einen Phasendetektor ist ein XOR-Gatter.
Je größer die Phasenabweichung, desto höher das "PWM" am Ausgang des XOR Gatters.
![625](hwe/assets/XOR-PD.png)
## Phase Frequency Detector (PFD)
Eine sehr populäre Implementierung für den Phasen Detektor ist der Phase-Frequency-Detector.
![PFD](hwe/assets/PFD.png)
siehe: [MT-086](hwe/assets/pdf/MT-086.pdf)
# Loop Filter
Das rechteck-förmige Ausgangssignal des PD besteht aus einer Vielzahl von Frequenzen.
Für den Regelkreis interessant ist jedoch nur sein DC-Anteil. Die übrigen Frequenzanteile werden durch den Loop-Filter eliminiert.

> [!warning] Der Filter hat daher eine Tiefpass-Charakteristik.
> Tiefpass 1. Ordnung

# [VCO](hwe/Voltage%20Controlled%20Oscillator.md)
- Der [VCO](hwe/Voltage%20Controlled%20Oscillator.md) setzt das Signal in eine Rechteckschwingung um.
- Interessant ist die sogenannte *center-frequency*, also jede Frequenz, mit der der [Oszillator](hwe/Oszillatoren/Clock%20Generierung.md) im Locked-Zustand schwingt.
- Um sie herum findet der Regelvorgang statt.
- In PLL-Schaltungen kommen für die [Oszillatoren](hwe/Oszillatoren/Clock%20Generierung.md) hauptsächlich [LC-Oszillatoren](hwe/Oszillatoren/LC%20Oszillatoren.md) (weniger häufig RC-[Oszillatoren](hwe/Oszillatoren/Clock%20Generierung.md)) sowie Ringoszillatoren zum Einsatz.

--- 

# Tags
![Clock_und_Reset_Generierung](hwe/assets/pdf/Clock_und_Reset_Generierung.pdf)

![MT-086](hwe/assets/pdf/MT-086.pdf)