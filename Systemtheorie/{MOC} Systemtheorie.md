---
tags:
  - MOC
  - Systeme
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
draft: true
title: Systemtheorie
---
 
# System

> [!def] **D1 - SYST)** Eingrößen-System ^SYST
> $$y(t)=\mathcal{T}\{x\}(t)$$

## 🗺️ Dynamische Systeme

Anstelle einer statischen Transformation der Eingangs, wird hier das dynamische Verhalten des Zustands eines Systems berücksichtigt.

> [!important] Zentraler Begriff: **Zustandsraum** [(t)](Zustandsraum.md), [\[n\]](Zeitdiskreter%20Zustandsraum.md)
> Man stellt sich die Frage, ist dieser ...
> - Erreichbar
> - Steuerbar
> - Beobachtbar
> - Rekonstruierbar
> - Beinflusst von der Abtastung

Die Darstellung des Zustandsraumes erfolgt je nach System unterschiedlich:

| **:LiAudioWaveform: Kontinuierliche Systeme**                                    | :LiBolt: |                                                        **Zeitdiskrete Systeme :LiBarChart2:** |
| -------------------------------------------------------------------------------- | :------: | --------------------------------------------------------------------------------------------: |
| [:LiArrowBigRightDash:](Dynamische%20Systeme.md) Systeme von DGL                 | :LiBolt: |                            Systeme von DZGL [:LiArrowBigLeftDash:](Zeitdiskrete%20Systeme.md) |
| [:LiArrowBigRightDash:](Lineare%20Systeme.md) Lineare Systeme                    | :LiBolt: |          Diskrete Lineare Systeme [:LiArrowBigLeftDash:](Zeitdiskrete%20Lineare%20Systeme.md) |
| [:LiArrowBigRightDash:](LTI-Systeme.md)  LTI-Systeme                             | :LiBolt: |                    Diskrete LTI-Systeme [:LiArrowBigLeftDash:](Zeitdiskrete%20LTI-Systeme.md) |
| [:LiArrowBigRightDash:](Kontinuierlicher%20LTI-Zustandsraum.md) LTI-Zustandsraum | :LiBolt: |        Diskreter LTI-Zustandsraum [:LiArrowBigLeftDash:](Zeitdiskreter%20LTI-Zustandsraum.md) |
|                                                                                  |          |                                                                                               |
| [:LiArrowBigRightDash:](../Mathematik/Analysis/GDGL.md) Differentialgleichungen  | :LiBolt: | Differenzengleichungen [:LiArrowBigLeftDash:](../Mathematik/Analysis/Differenzengleichung.md) |
