---
tags: 
aliases:
  - THD
  - Total Harmonic Distortion
subject:
  - hwe
source:
  - Siegbert Schrempf
created: 3rd January 2023
---

# Klirrfaktor

Der Klirrfaktor beschreibt das Verhältnis der Oberwellen zur Grundwelle plus Oberwellen als Effektivwert.

> [!summary] $$k_{ges}=\frac{\sqrt{A_{2}^{2}+A_{3}^{2}+A_{4}^{2}+\cdots}}{\sqrt{A_{1}^{2}+A_{2}^{2}+A_{3}^{2}+A_{4}^{2}+\cdots}}$$
>
> - $Z\dots$ einzelnen Oberschwingungen
> - $N\dots$ Gesamtes Signals (Grundschwingung mit Oberwellen)
> - $A_{n}\dots$ Amplituden der $n$-ten Komponente

## Klirrfaktor bei [Oszillatoren](Oszillatoren/Clock%20Generierung.md)

- Für Sinusoszillatoren ist die spektrale Reinheit des Ausgangssignals von entscheidender Bedeutung.
- Der hierbei verwendete Kennwert ist der Klirrfaktor.



Der Wert von $k_{ges}$ ist immer eine dimensionslose Größe $<1$. Sie wird in Prozent oder Promille angegeben.  
Im Englischsprachigen wird der Begriff der „*total harmonic distortion*" (THD) verwendet und verkörpert die nachfolgende Näherung, welche für Klirrfaktoren $<3\%$ anwendbar ist.  

$$k_{ges}=THD=\frac{\sqrt{u_{2}^{2}+u_{3}^{2}+u_{4}^{2}+\cdots}}{\sqrt{u_{1}^{2}}} = \sqrt{\frac{u_{2}^{2}+u_{3}^{2}+u_{4}^{2}+\cdots}{u_{1}^{2}}}$$

- Die Ermittlung des Klirrfaktors erfolgt in der Praxis durch eine *Spektralanalyse*, bzw. ein *Klirrfaktormessgerät*.
- Bei einer Simulation mit SPICE (dh. LTSpice) kann der Klirrfaktor direkt über eine *.FOUR*-Anweisung bestimmt werden.
- Bei LTSpice ist dazu eine transienten Analyse mit eingeschalteter Fourier-Analyse durchzuführen.
- Hinweise zur Ermittlung des Klirrfaktors mit LTSpice können den nachfolgenden Links entnommen werden.

# Tags

[Fourierreihe](../../Systemtheorie/Fourierreihe.md)

LT-Spice Tutorial: <http://eecs.oregonstate.edu/education/docs/ece323/Appendix.pdf>

<http://www.audio-perfection.com/spice-ltspice/distortion-measurements-with-ltspice.html>

![00_Clock_und_Reset_Generierung_intro](assets/pdf/00_Clock_und_Reset_Generierung_intro.pdf)