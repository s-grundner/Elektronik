---
tags: []
aliases: ["Piezogeber", "Piezo", "Piezoelektrisch", "Piezoeffekt"]
subject: ["mtrs"]
source: ["Norbert Irnleitner"]
created: 7th June 2022
---

# Piezoelektrik

> [!example]- Rechenbeispiel
> Ein [Quarz](../Hardwareentwicklung/Oszillatoren/Quarzoszillator.md) mit einer Empfindlichkeit von $k= 2,3\cdot 10^{-12} \frac{As}{N}$, der Fläche $10cm^{2}$, der Dicke $1mm$, dem spezifischen [Widerstand](../Elektrotechnik/Widerstand.md) $\rho = 10^{14}\Omega cm$ und der relativen Dielektrizitätszahl $\varepsilon_{r}=5$ wird mit einer [Kraft](../Physik/Kraft.md) von $F=1kN$ belastet.
> Wie groß ist die Spannung infolge des Piezoeffektes? Wann ist die [Ladung](../Elektrotechnik/elektrisches%20Feld.md) abgeklungen?
> $$
> \begin{align*}
> R_{q} &= \frac{\rho\cdot l}{A} &&= \frac{10^{12}\cdot 10^{-3}}{10\cdot 10^{-4}} = 10^{12}\Omega
> \\
> C_{q} &= \frac{\varepsilon_{0}\cdot \varepsilon_{r}\cdot A}{d} &&= \frac{8.8542\cdot 10^{-12}\cdot 5\cdot 10\cdot 10^{-4}}{10^{-3}} = 44.27pF
> \\\\
> Q &= k\cdot F &&= 2.3\cdot 10^{-12}\cdot 10^{3} = 2.3 \cdot 10^{-9}As
> \\
> U_{q} &= \frac{Q}{C_{q}} &&= 51.95 V
> \\\\
> \uptau &= R_{q}\cdot C_{q} &&= 44.27s
> \\
> \uptau_{\infty} &= 5\uptau &&=221.35s\dots\text{Abklingdauer}
> \end{align*}
> $$

## Piezogeber

![650](assets/piezo_ions.png)

In diesem Modell zur Veranschaulichung des Piezoelektrischen Effekts werden zwei sorten von Ionen *(+q und -q)* asymmetrisch angeordnet.
Wird das System nun einer mechanischen Spannung ausgesetzt, führt diese zu einer **elastischen Verzerrung** und damit zu einer **induzierten [Polarisation](../Chemie/Polarisation.md)**.  

| Input       | Output |
| ----------- | ------ |
| [Kraft](../Physik/Kraft.md)/Druck | [elektrische Spannung](../Elektrotechnik/elektrische%20Spannung.md)       |

![piezo_esb](assets/piezo_esb.png)

![Piezo_effects.png](assets/Piezo_effects.png)

## Piezoresistiver Geber

Zur **Druckmessung in Flüssigkeiten und Gasen werden** *piezoresistive Geber* aus [Silizium](../Physik/Materialkunde/Silizium.md) herangezogen. Sie sind bereits als Brücken im Sensor ausgeführt.  
Es handelt sich dabei um ein **[DMS-System](Dehnungsmessstreifen)** aus **mehreren Streifen**, die entweder auf einer *Metallmembran* aufgeklebt oder gänzlich durch *Ätztechnik* hergestellt sind.

![375](piezoresistivergeber.png)

 - Die Membrane muss gasdicht sein.
 - Es muss Referenzdruck herrschen

## Piezoelektrischer Effekt

>[!INFO] Wird auf eine Ausgeschnittene Fläche des Quarzkristall Druck ausgeübt, so bilden sich an gegenüberliegenden Flächen elektrische [Ladungen](../Elektrotechnik/elektrisches%20Feld.md) aus.

Der piezoelektrische Effekt kann genutzt werden um aus der gemessenen  
[Ladung](../Elektrotechnik/elektrisches%20Feld.md) die zugrunde liegende Deformation zu bestimmen.  
Der Effekt ist nur von der Längenänderung nicht von [Geschwindigkeit](../Physik/Kinematik.md)  
bzw. [Beschleunigung](../Physik/Kinematik.md) der Deformation abhängig.

## Lippmann Effekt (inverser P.e.-Effekt)

Wird ein **[elektrisches Feld](../Elektrotechnik/elektrisches%20Feld.md)** angelegt, sorgt dieses für eine **Verschiebung der Ionen** im Festkörper. Da die Bindungen unterschiedlich stark sind, tritt *Deformation*, also **elastische Verzerrung** auf.  
Man spricht vom **inversen piezoelektrischen (Lippmann) Effekt**.

# Tags

[Quarz](../Hardwareentwicklung/Oszillatoren/Quarzoszillator.md)
