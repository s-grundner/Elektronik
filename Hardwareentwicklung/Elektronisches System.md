---
tags:
aliases:
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 11th November 2025
professor:
release: true
title: Elektronisches System
---

# Darstellung Elektronischer Systeme

Um die Funktionsweise von elektronischen Systemen z.B. komplexen integrierten Schaltungen oder Signalketten zu realisieren wird das System zunächst aus **mathematisch beschriebenen Blöcken** zusammengeschalten. Auf dieser Ebene widmet man sich noch nicht dem tatsächlichen Schaltungsentwurf und realen Einflüssen, sondern beschreibt das auf einer Abstrakten art.

Beispiele für diese Blöcke sind

| Block-Bezeichnung                                                                      | Symbol                                     | mathematische Beschreibung                             |
| -------------------------------------------------------------------------------------- | ------------------------------------------ | ------------------------------------------------------ |
| [Mischer](HF-Technik/Mischer.md)                                                       | ![invert_dark\|100](../_assets/Mixer.png)      | $u_{\text{out}}(t) = u_{1}(t)\cdot u_{2}(t)$           |
| [Oszillator](Hardwareentwicklung/Oszillatoren/Oszillatoren.md)                         | ![invert_dark\|100](../_assets/Oscillator.png) | $u(t) = \cos(2\pi f_{0} t + \phi)$                     |
| [Phase Frequnecy Detectors](Hardwareentwicklung/Oszillatoren/Phase%20Locked%20Loop.md) | ![invert_dark\|100](assets/PFD%201.png)        | $i_{\text{out}} = K_{\phi}(\phi_{1}(t) + \phi_{2}(t))$ |

Die Verbindung zwischen den Blöcken repräsentieren die Klasse des [Signals](Systemtheorie/Signale.md), also in welcher Form die Information zum anderen Block gelangt.

- Analoge Spannung oder
- Digitale Schnittstelle (SPI, UART)

## Beispiel CC1101

Als Beispiel der [CC1101](Digitaltechnik/CC1101.md), ein Radar Chip mit digitaler Schnittstelle.

![invert_dark](../Digitaltechnik/assets/cc1101-BSB.png)

