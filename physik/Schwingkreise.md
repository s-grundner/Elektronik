---
tags:
  - DGL
  - Baugruppen/Oszillator
aliases:
  - Schwingkreis
  - Harmonische Schwingungen
subject:
  - mathe
  - hwe
  - physik
---

# Schwingungen

## Zusammenhang mit [Differentialgleichungen](../{MOC}%20DGL.md)

Jede Schwingung besteht aus einem Einschwingvorgang und einem eingeschwungenen Zustand.  
Auf beide dieser Zustände kann mithilfe von Differentialgleichungen zurück gerechnet werden.

Die Komponenten einer Schwingung in der [lineare DGL zweiter Ordnung](lineare%20DGL%202.%20Ordnung.md) sind wie folgt:
1. Die Funktion $y_{h}(t)$ des Einschwingvorganges ist die [homogenen Lösung der DGL 2. Ordnung](lineare%20DGL%202.%20Ordnung.md)  
	$\rightarrow y_{h}$ aus $\ddot y + 2\delta\cdot\dot y + \omega_{0}^{2}\cdot y = 0$
2. die Funktion $y_{p}(t)$ des Eingeschwungenen Zustandes ist eine partikuläre Lösung [](lineare%20DGL%202.%20Ordnung.md#Lösung%20der%20inhomogenen%20DGL%202%20Ordnung|der%20inhomogenen%20DGL%202.%20Ordnung)  
	$\rightarrow y_{p}$ aus $\ddot y + 2\delta\cdot\dot y + \omega_{0}^{2}\cdot y = s(x)$

> [!summary] Die Funktion der Gesamten Schwingung ist somit:  
> $y(t) = y_{p}(t) + y_{h}(t)$

## Arten von Schwingkreisen

[Mechanischer Schwingkreis](../../Physik/Mechanischer%20Schwingkreis.md)

[Elektrischer Schwingkreis](Elektrischer%20Schwingkreis.md)

# Hardware Implementationen

- [LC Oszillatoren](../../Hardwareentwicklung/Oszillatoren/LC%20Oszillatoren.md)
- [Colpitts Oszillator](../../Hardwareentwicklung/Oszillatoren/Colpitts%20Oszillator.md)

# Tags