---
tags: []
aliases: []
subject: ["physik"]
source: ["Norbert Irnleitner"]
created: 28th November 2022
---

# Schwarzkörperstrahlung

absorbiert auftreffende elektromagnetische [Strahlung](../Chemie/Radioaktivität.md) vollständig, somit auch [Licht](../Chemie/Spektralanalyse.md).  
Er lässt keine [Strahlung](../Chemie/Radioaktivität.md) hindurch und spiegelt oder streut nichts.  
Besitz ein **Absorptionsvermögen** von **$\alpha=1$**

## Stefan-Boltzmann Verteilung

$$
\begin{align*}
f(\omega, T)&\dots\text{Spektrum}\\
\omega&\dots\text{Wellenlänge der abgestrahlten EM-Welle}\\
T&\dots\text{Temperatur des Körpers}
\end{align*}
$$
![planckStrahlungsspektrum](assets/planckStrahlungsspektrum.png)

Durch das plancksche Strahlungsgesetz wird beschrieben, wie das Strahlungsspektrum eines schwarzen Körpers in Abhängigkeit von seiner [Temperatur](Temperatur%20und%20Teilchenmodell.md) aussieht.

## Stefan-Boltzmann-Gesetz

Die Strahlungsleistung eines schwarzen Körpers ist proportional zur 4. Potenz der [Temperatur](Temperatur%20und%20Teilchenmodell.md).  
$P=\sigma\cdot A\cdot T^{4}$ 

$P\dots$ Strahlungsleistung  
$A\dots$ Fläche  
$T\dots$ [Temperatur](Temperatur%20und%20Teilchenmodell.md)  
$\sigma\dots$ Stefan Boltzmann [Naturkonstante](Konstanten%20Verzeichnis.md) ($\sigma = \dfrac{2\pi^5 k_\mathrm{B}^4}{15h^3c^2} = 5{,}670\,374\,419… \,\cdot 10^{-8} \, \mathrm{\dfrac{W}{m^2 K^4}}$)

**Wienisches Verschiebungsgesetz:**  
$\lambda_{m} = \dfrac{2.898\cdot 10^{-3}mK}{T}$  
Mit Änderung der [Temperatur](Temperatur%20und%20Teilchenmodell.md) verändert sich auch das abgestrahlte Spektrum, insbesondere auch die Wellenlänge des Strahlungsmaximums.  
Mit steigender [Temperatur](Temperatur%20und%20Teilchenmodell.md) T wird die Wellenlänge des Strahlungsmaximums somit kleiner.

## Oberflächentemperatur der Sonne

[Solarkonstante](https://de.wikipedia.org/wiki/Solarkonstante): $E_{0} = 1367 \frac{W}{m^{2}}$  
Abstand Erde-Sonne: $d_{E-S}=149.6\cdot 10^{9}km= 1.496\cdot 10^{11}m$  
Radius Sonne: $r_{S} = 696340km = 6.9634\cdot10^{8}m$

$A_{E} = 4\pi d_{E-S}^{2}$  
$A_{S}= 4\pi r_{S}^{2}$
$$
\begin{align*}
E_{0} &= \frac{P}{A_{E}}\\
P &= \sigma \cdot A_{S}\cdot T^{4}\\
E_{0} &= \frac{\sigma \cdot A_{S}\cdot T^{4}}{A_{E}}\\
T &= \sqrt[4]{\frac{A_{E}}{\sigma\cdot A_{S}}} = 5\,775.563K
\end{align*}
$$

# Quellen