---
tags:
  - RF
  - Nachrichtentechnik
aliases: 
created: 20th August 2023
semester: WS24
professor:
  - Reinhard Feger
subject:
  - HF-Systemtechnik 1
keywords:
---

# Eingangsimpedanz

Die Leitungstheorie wird auf [HF-Übertragungsleitungen](Transmission%20Line.md) Angewandt, also wenn es sich auf der Leitung um ein [RF-Signal](RF-Signal.md) Handelt.

> [!NOTE] Kenngrößen  
> Zur vollständigen Beschreibung der Leitungseinflüsse muss die Leitung neben ihrer Länge $l$ durch zwei zusätzliche Kenngrößen charakterisiert werden:
> - Leitungswellenwiderstand $Z_{L}$
> - [Ausbreitungskonstante](Telegraphengleichung.md) $\gamma$.
> - Abschlussimpedanz $Z_{A}$
> 
> Im Schaltungsentwurf sind diese mit zu berücksichtigen!

## Allgemein

Eingangswiderstand $Z_{E}$ einer allgemeinen, verlustbehafteten Transmission-Line:
$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ \frac{Z_{L}}{Z_{A}}\cdot\tanh(\gamma\cdot l)}{1+ \frac{Z_{A}}{Z_{L}}\cdot\tanh(\gamma\cdot l)}
$$

## Verlustlos

Eingangswiderstand $Z_{E}$ einer Verlustlosen Transmission-Line

$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ j\frac{Z_{L}}{Z_{A}}\cdot\tan(\gamma\cdot l)}{1+ j\frac{Z_{A}}{Z_{L}}\cdot\tan(\gamma\cdot l)}
$$

# Tags

[Veritasium](https://www.youtube.com/watch?v=oI_X2cMHNe0)