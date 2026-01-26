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

## Allgemein

Eingangswiderstand $Z_{\text{in}}$ einer allgemeinen, verlustbehafteten Transmission-Line:
$$
Z_{\text{in}}= \frac{U(-l)}{I(-l)} = Z_{0} \dfrac{Z_{L}+ Z_{0}\tanh(\gamma  l)}{Z_{0} + Z_{L} \tanh(\gamma l)}
$$

## Verlustlos

Eingangswiderstand $Z_{\text{in}}$ einer Verlustlosen Transmission-Line

$$
Z_{\text{in}} = \frac{U(-l)}{I(-l)} = Z_{0} \dfrac{Z_{L}+ Z_{0}\tan(\beta l)}{Z_{0} + Z_{L} \tan(\beta l)} = Z_{0} \frac{1+\Gamma_{L}e^{ -2j\beta l }}{1-\Gamma_{L}e^{ -2j\beta l }}
$$

Wobei $\Gamma_{L}$ der Reflexionsfaktor von der Leitung mit $Z_{0}$ zur Last $Z_{L}$

# Tags

[Veritasium](https://www.youtube.com/watch?v=oI_X2cMHNe0)