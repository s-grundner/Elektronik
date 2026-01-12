---
tags:
  - DGL
  - Baugruppe/Oszillator
aliases:
  - Schwingkreis
  - Schwingungen
subject:
  - mathe
  - hwe
  - physik
---

# Schwingungen

> [!info] Zusammenhang mit [Differentialgleichungen](../Mathematik/Analysis/GDGL.md)  
> Jede Schwingung besteht aus einem *Einschwingvorgang* und einem *eingeschwungenen Zustand*.  
> Auf beide dieser Zustände kann mithilfe von Differentialgleichungen zurück gerechnet werden.

Die Komponenten einer Schwingung in der [lineare DGL zweiter Ordnung](../Mathematik/Algebra/lineare%20DGL%202.%20Ordnung.md) sind wie folgt:
1. Die Funktion $y_{h}(t)$ des Einschwingvorganges ist die [homogenen Lösung der DGL 2. Ordnung](../Mathematik/Algebra/lineare%20DGL%202.%20Ordnung.md)  
	$\rightarrow y_{h}$ aus $\ddot y + 2\delta\cdot\dot y + \omega_{0}^{2}\cdot y = 0$
2. die Funktion $y_{p}(t)$ des Eingeschwungenen Zustandes ist eine partikuläre Lösung:  
	$\rightarrow y_{p}$ aus $\ddot y + 2\delta\cdot\dot y + \omega_{0}^{2}\cdot y = s(x)$

> [!summary] Die Funktion der Gesamten Schwingung ist somit:  
> $y(t) = y_{p}(t) + y_{h}(t)$

## Arten von Schwingkreisen

- Allgemeine Betrachtung der [harmonischen Schwingungen](harmonische%20Schwingungen.md)
- [Mechanischer Schwingkreis](Mechanischer%20Schwingkreis.md)
- [elektrischer Schwingkreis](../Elektrotechnik/elektrischer%20Schwingkreis.md)

# Hardware Implementationen

- [LC Oszillatoren](../Hardwareentwicklung/Oszillatoren/LC%20Oszillatoren.md)
- [Colpitts Oszillator](../Hardwareentwicklung/Oszillatoren/Colpitts%20Oszillator.md)

# Tags