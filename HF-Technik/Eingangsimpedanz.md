---
tags:
  - RF
  - Nachrichtentechnik
aliases:
created: 26th January 2026
semester: WS25
professor:
  - Reinhard Feger
subject:
  - KV
  - HF-Systemtechnik 1
  - VL
  - Grundlagen der Hochfrequenztechnik
keywords:
release: false
title: Eingangsimpedanz
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

Wobei $\Gamma_{L}$ der Reflexionsfaktor von der Leitung mit $Z_{0}$ zur Last $Z_{L}$ ist

$$
\Gamma_{L} = \frac{Z_{L}-Z_{0}}{Z_L + Z_0}
$$

# Tags

[Veritasium](https://www.youtube.com/watch?v=oI_X2cMHNe0)