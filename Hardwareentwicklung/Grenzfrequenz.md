---
tags:
  - incomplete
  - Baugruppen/Filter
aliases: 
created: 30th November 2022
---

# Grenzfrequenz

> [!info] Die Grenzfrequenz ist ein Kennwert von Filtern und Schwingkreisen.

Jene Frequenz bei der das [maximum](Extremwert.md) der Übertragungsfunktion um $3dB$ (Faktor $\frac{1}{\sqrt{ 2 }}$) gedämpft ist. Gibt es eine Obere und Untere Grenzfrequenz, wird eine quadratische 

$$\mid \underline{ T }(\omega_{g}) \mid = \frac{\lvert T_{\text{max}} \rvert }{\sqrt{ 2 }}$$

$T_{\text{max}}$ Kann je nach Filter/SK:
$$
\underbrace{ \lvert T(\omega \to 0) \rvert }_{ \text{Tiefpass} }\qquad \underbrace{ \lvert T(\omega \to \infty) \rvert }_{ \text{Hochpass} }\qquad \text{oder} \qquad \underbrace{ \lvert T(\omega_{r}) \rvert  }_{ \text{Schwingkreis} }  
$$
sein.

Die Resonanzfrequenz ist das geometrische Mittel der Grenzfrequenzen:

$$
\omega_{r} = \sqrt{ \omega_{gu}\cdot \omega_{go} }
$$