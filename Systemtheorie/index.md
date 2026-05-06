---
tags:
  - index
  - Systeme
title: Systemtheorie
release: true
aliases:
  - "#Systeme"
  - Systemeigenschaften
  - Systemtheorie
keywords:
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 11th March 2025
professor:
  - Andreas Stelzer 🕊️
---


# Signale und Systeme

- Signale ($x$, $y$) sind Träger von Information.
- Systeme $\mathcal{T}$ bilden Signale am Eingang auf veränderte Signale am Ausgang ab.

> [!def] **D1 - SYST)** Eingrößen-System ^SYST
> 
> $$
> y(t)=\mathcal{T}\{x\}(t)
> $$

## Dynamische Systeme im Zeitbereich

Die dynamik von Systemen (also wie sich Signale mit beliebiger zeilicher änderung verhalten) lassen sich im Allgemeinen durch Differenzialgleichungen beschreiben.

> [!important] Zentraler Begriff: **Zustandsraum** [(t)](Zeitkontinuierlich/Zustandsgrößen.md), [\[n\]](Zeitdiskret/Zustandsgrößen.md)

Die Darstellung des Zustandsraumes erfolgt je nach Art des Systems unterschiedlich.

| **:LiAudioWaveform: Kontinuierliche Systeme**                                                            |                                                                               **Zeitdiskrete Systeme :LiBarChart2:** |
| :------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------: |
|                                                                                                          |                                                                                                                      |
| [:LiArrowBigRightDash:](../Mathematik/Analysis/Differentialgleichungen/index.md) Differentialgleichungen | Differenzengleichungen [:LiArrowBigLeftDash:](../Mathematik/Analysis/Numerische%20Verfahren/Differenzengleichung.md) |
|                                                                                                          |                                                                                                                      |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/Dynamische%20Systeme.md) Dynamische Systeme                   |                                     Zeitdiskrete Systeme [:LiArrowBigLeftDash:](Zeitdiskret/Dynamische%20Systeme.md) |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/Lineare%20Systeme.md) Lineare Systeme                         |                                    Diskrete Lineare Systeme [:LiArrowBigLeftDash:](Zeitdiskret/Lineare%20Systeme.md) |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/LTI-Systeme.md) LTI-Systeme                                   |                                              Diskrete LTI-Systeme [:LiArrowBigLeftDash:](Zeitdiskret/LTI-Systeme.md) |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/LTI-Zustandsraum.md) LTI-Zustandsraum                         |                                   Diskreter LTI-Zustandsraum [:LiArrowBigLeftDash:](Zeitdiskret/LTI-Zustandsraum.md) |

## Referenzen

- [Regelungstechnik](Regelungstechnik/index.md)
- [Zustandsraummethoden](Zustandsraummethoden.md)
- [Frequenzbereichsmethoden](Frequenzbereichsmethoden/index.md)