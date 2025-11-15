---
tags:
  - Baugruppe/Oszillator
aliases:
  - Phasenreglerschleife
  - PLL
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 27th February 2025
professor:
  - Reinhard Feger
draft: true
title: Phase Locked Loop
---

# Phase Locked Loop (PLL)

Ein PLL ist ein System, welches die Phasenlage und damit die Frequenz eines veränderbaren Oszillators so beeinflusst, dass die Phasenabweichung zu einem zu einem äußeren System möglichst konstant ist. 

![PLL](../assets/PLL.png)

> [!summary] Bestandteile
> - Phase Detector + Charge Pump
> - Loop Filter
> - [VCO](Voltage%20Controlled%20Oscillator.md)
> - Feedback-Divider ([Clock Divider](Clock%20Divider.md))

Beim VCO ist der Term $\frac{1}{s}$ vorhanden (integrator): Die Ausgangsfrequenz des VCO muss wieder in eine Phase umgewandelt werden. Integration des Ausgangs da gilt: $\dot{\varphi} = \omega\implies \int \omega \mathrm{~d}t =\varphi$

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

## Regelkreis eines Linearen PLL

Modell des PLLs, welcher um den "locked State" - dem Eingeschwungen Verhalten - linear ist:



# Phasedetector (PD)

Der Phasedetector vergleicht die … sind beide Frequenzen gleich, ist die PLL im *Locked*-Zustand, ansonsten (wenn ungleich) wird ein, der Abweichung proportionales Signal, ausgegeben.

## XOR Phase Detector

Ein einfaches Modell für einen Phasendetektor ist ein XOR-Gatter.  
Je größer die Phasenabweichung, desto höher das "PWM" am Ausgang des XOR Gatters.

![625](../assets/XOR-PD.png)
 
## Phase Frequency Detector (PFD)

Eine sehr populäre Implementierung für den Phasen Detektor ist der Phase-Frequency-Detector.

![invert_light|900](Hardwareentwicklung/assets/PFD.png)

siehe: [MT-086](../assets/pdf/MT-086.pdf)

## Loop Filter

Das PWM-Artige Ausgangssignal des PD wird mit einem Tiefpass gemittelt und liefert eine konstante Spannung proportional zum Arbeitszyklus, welche den VCO steuert.

> [!warning] Der Filter hat daher eine Tiefpass-Charakteristik.  
> Tiefpass 1. oder 2. Ordnung

## VCO

- Der [VCO](Voltage%20Controlled%20Oscillator.md) setzt das Signal in eine Rechteckschwingung um.
- Interessant ist die sogenannte *center-frequency*, also jede Frequenz, mit der der [Oszillator](Clock%20Generierung.md) im Locked-Zustand schwingt.
- Um sie herum findet der Regelvorgang statt.
- In PLL-Schaltungen kommen für die [Oszillatoren](Clock%20Generierung.md) hauptsächlich [LC-Oszillatoren](LC%20Oszillatoren.md) (weniger häufig RC-[Oszillatoren](Clock%20Generierung.md)) sowie Ringoszillatoren zum Einsatz.

--- 

# Tags

[Clock_und_Reset_Generierung](../assets/pdf/Clock_und_Reset_Generierung.pdf)
[MT-086](../assets/pdf/MT-086.pdf)
