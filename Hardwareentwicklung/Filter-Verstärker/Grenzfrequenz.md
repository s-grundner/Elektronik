---
tags:
  - incomplete
  - Baugruppe/Filter
aliases: 
created: 30th November 2022
---

# Grenzfrequenz

> [!info] Die Grenzfrequenz ist ein Kennwert von Filtern und Schwingkreisen.

## 3dB-Grenzfrequenz

Jene Frequenz bei der das [maximum](../../Mathematik/Analysis/Extremwert.md) einer Übertragungsfunktion $T(\omega)$ um $3dB$ (Faktor $\frac{1}{\sqrt{ 2 }}$) gedämpft ist. 

$$\mid \underline{ T }(\omega_{g}) \mid = \frac{\lvert T_{\text{max}} \rvert }{\sqrt{ 2 }}$$

$T_{\text{max}}$ kann je nach Filter/SK entweder:
$$
\underbrace{ \lvert T(\omega \to 0) \rvert }_{ \text{Tiefpass} }\qquad \underbrace{ \lvert T(\omega \to \infty) \rvert }_{ \text{Hochpass} }\qquad \text{oder} \qquad \underbrace{ \lvert T(\omega_{r}) \rvert  }_{ \text{Schwingkreis} }  
$$
sein.

> [!example] Für RC Filter (Hoch oder Tiefpass) ist die Grenzfrequenz
> $$\omega_{c} = \frac{1}{RC}$$

## Resonanzfrequenz

> [!hint] Gibt es eine Obere und Untere Grenzfrequenz, liefert eine Quadratische Gleichung zwei (oder mehr) Optionen liefern, wobei negative und imaginäre Werte ungültig sind. 

Die Resonanzfrequenz ist das geometrische Mittel der Grenzfrequenzen:

$$
\omega_{r} = \sqrt{ \omega_{gu}\cdot \omega_{go} }
$$