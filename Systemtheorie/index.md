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

> [!def] **D1 - SYST)** Eingrößen-System ^SYST
> $$y(t)=\mathcal{T}\{x\}(t)$$

## 🗺️ Dynamische Systeme im Zeitbereich

Anstelle einer statischen Transformation der Eingangs, wird hier das dynamische Verhalten des Zustands eines Systems berücksichtigt.

> [!important] Zentraler Begriff: **Zustandsraum** [(t)](Zeitkontinuierlich/Zustandsgrößen.md), [\[n\]](Zeitdiskret/Zustandsgrößen.md)

Die Darstellung des Zustandsraumes erfolgt je nach System unterschiedlich:

| **:LiAudioWaveform: Kontinuierliche Systeme**                                    | :LiBolt: |                                                        **Zeitdiskrete Systeme :LiBarChart2:** |
| -------------------------------------------------------------------------------- | :------: | --------------------------------------------------------------------------------------------: |
|                                                                                  |          |                                                                                               |
| [:LiArrowBigRightDash:](../Mathematik/Analysis/Differentialgleichungen/index.md) Differentialgleichungen  | :LiBolt: | Differenzengleichungen [:LiArrowBigLeftDash:](../Mathematik/Analysis/Numerische%20Verfahren/Differenzengleichung.md) |
|                                                                                  |          |                                                                                               |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/Dynamische%20Systeme.md) Dynamische Systeme              | :LiBolt: |                        Zeitdiskrete Systeme [:LiArrowBigLeftDash:](Zeitdiskret/Dynamische%20Systeme.md) |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/Lineare%20Systeme.md) Lineare Systeme                    | :LiBolt: |          Diskrete Lineare Systeme [:LiArrowBigLeftDash:](Zeitdiskret/Lineare%20Systeme.md) |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/LTI-Systeme.md) LTI-Systeme                              | :LiBolt: |                    Diskrete LTI-Systeme [:LiArrowBigLeftDash:](Zeitdiskret/LTI-Systeme.md) |
| [:LiArrowBigRightDash:](Zeitkontinuierlich/LTI-Zustandsraum.md) LTI-Zustandsraum | :LiBolt: |        Diskreter LTI-Zustandsraum [:LiArrowBigLeftDash:](Zeitdiskret/LTI-Zustandsraum.md) |

## Regelung vom Dynamischen Systemen

![](Regelungstechnik/index.md#^INFO)

Zur Regelung von Systemen sind folgenden Eigenschaften des Zustandsraumes von Bedeutung

- Erreichbar / Steuerbar
- Beobachtbar
- Rekonstruierbar / Detektierbar
- Beinflusst von der Abtastung

## Frequenzbereichsmethoden

Oft ist es wichtig, die [Übertragungsfunktion](Zeitkontinuierlich/Übertragungsfunktion.md) eines Systems zu kennen. Grundlegend zur Transformation in den Frequenzbereich ist im Allgeimenen die [Integraltransformation](Integraltransformation.md)

Zusammenhänge zwischen verschieden Signal-Transformationen 

### Übersicht und Zusammenhänge

![invert_dark](../_assets/Excalidraw/Drawing%202025-06-23%2015.38.42.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/Drawing%202025-06-23%2015.38.42.excalidraw.md) %%

### Übersicht: Eigenschaften von $G(s)$, $G(z)$ und $G^\#(q)$

|                  |                          $G(s)$                          |                          $G(z)$                          |                            $G^\#(q)$                            |
| ---------------- | :------------------------------------------------------: | :------------------------------------------------------: | :-------------------------------------------------------------: |
| Realisierbarkeit | $\lim\limits_{ s \to \infty }\lvert G(s) \rvert <\infty$ | $\lim\limits_{ z \to \infty }\lvert G(z) \rvert <\infty$ | $\lim\limits_{ q \to \Omega_{0} }\lvert G^\#(q) \rvert <\infty$ |
| Sprungfähigkeit  |        $\lim\limits_{ s \to \infty } G(s) \neq 0$        |        $\lim\limits_{ z \to \infty } G(z) \neq 0$        |       $\lim\limits_{ q \to  \Omega_{0} } G^\#(q) \neq 0$        |
| BIBO-Stabilität  |           alle Pole $s_{i}$ mit $\Re s_{i}<0$            |      alle Pole $z_{i}$ mit $\lvert z_{i} \rvert<1$       |               alle Pole $q_{i}$ mit $\Re q_{i}<0$               |
