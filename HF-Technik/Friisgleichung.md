---
tags:
aliases:
  - Übertragungsgleichung
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 10th November 2023
professor:
release: true
title: Friisgleichung
---


# Friis Übertragungsgleichung

Die Friisgleichung beschreibt, welche Leisung man sich über die Übertragungsstrecke im [Fernfeld](HF-Technik/Fernfeld%20und%20Nahfeld.md) von Sende-Antenne zu Empfangs-Antenne erwarten kann. 

> [!def] **Friis Übertragungsgleichung** ^FRIIS
> 
> $$
> \frac{P_{\mathrm{r}}(r,\theta,\phi)}{P_{\mathrm{t}}} = G_{\mathrm{t}}(\theta,\phi)G_{\mathrm{r}}(\theta,\phi)\left( \frac{\lambda}{4\pi r} \right) ^{2} = G_{\mathrm{t}}(\theta,\phi)G_{\mathrm{r}}(\theta,\phi)\left( \frac{c_{0}}{4\pi rf} \right) ^{2}
> $$

Interpretation

- Jenach dem wie weit entfernt, wie die Antennen ausgerichtet sind und mit welcher Frequenz gesendet wird, kann man abschätzen, welche Leistung man am Empfänger erwarten kann.
- Die Leisungsübertragung ist proportional zu $\frac{1}{f^{2}}$ und $\frac{1}{r^{2}}$

Fragwürdig ist, wieso die Leistungsübertragung mit dem quadrat der Frequenz kleiner wird. Hier ist zu beachten, dass typischerweise der Antennengewinn für kleinere Antennen (also höheren Frequenzen) auch mit $f^{2}$ größer wird. 

## Herleitung

- Der Sender Strahlt die Sendeleistung $P_{\mathrm{t}}$ entsprechend der Antennencharakteristik bezogen auf den [Isotroper Kugelstrahler](HF-Technik/Isotroper%20Kugelstrahler.md) ab.
- Der Empfänger nimmt die Leistung über die [Antennenwirkfläche](HF-Technik/Antennenwirkfläche.md), gewichtet mit dem [Antennengewinn](HF-Technik/Antenne.md#^GAIN) auf.

![invert_dark|1000](../assets/friis.jpg)

Damit die Rechnung näherungsweise korrekt ist, muss die Eintreffende Wellenfront eine **Ebene** sein, d.h keine radiale Krümmung mehr aufweisen. Diese forderung gilt in der [Fraunhofer Zone](HF-Technik/Fernfeld%20und%20Nahfeld.md) mit $r > \frac{2D^{2}}{\lambda}$ in guter Näherung.

### Am Sender

Isotrope Quelle mit der Speiseleistung (Transmitpower) $P_{t}$ hat in einem großen Radius (im Fernfeld) die [Leistungsdichte](HF-Technik/Isotroper%20Kugelstrahler.md#^S) $S_{\mathrm{iso}}(r)$:

$$ S_{\mathrm{iso}}(r) = \frac{P_{\mathrm{t}}}{4\pi r^{3}} $$

Eine Antenne, die mit dem Antennengewinn $G_{\mathrm{t}}(\theta,\phi)$ (in $\mathrm{dBi}$) bezogen auf den Isotropen Strahler charakterisiert ist, hat dann die Leisungsdichte

$$
S(r,\theta,\phi) = G_{\mathrm{t}}(\theta,\phi) S_{\mathrm{iso}}(r) = \frac{P_{\mathrm{t}}}{4\pi r^{2}}G_{\mathrm{t}}(\theta,\phi)
$$

### Am Empfänger

Der Empfänger weist eine Antennenwirkfläche $A_{\mathrm{eff}}$ mit der er die Leistungsdichte Aufnehmen kann auf

$$
A_{\mathrm{eff,r}}(\theta,\phi) = G_{\mathrm{r}}(\theta,\phi) \frac{\lambda^{2}}{4\pi}
$$

### Kombiniert

Kombiniert man Sende und Empfangsfall, ist die Leistung die im Endeffekt vom Empfänger aufgenommen werden kann

$$
P_{\mathrm{r}}(r, \theta,\phi) = S(r,\theta,\phi)A_{\mathrm{eff,r}}(\theta,\phi) = \frac{P_{\mathrm{t}}}{4\pi r^{2}}G_{\mathrm{t}}(\theta,\phi)G_{\mathrm{r}}(\theta,\phi) \frac{\lambda^{2}}{4\pi}
$$

Betrachtet man das Verhältnis der Empfangsleisung zur Sendeleistung, erhält man die Friis-Übertragungs Gleichung

![](#^FRIIS)