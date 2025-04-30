---
tags: 
aliases:
  - DC-Motor
  - DC-Maschine
  - DC-Generator
  - Gleichstrommotor
  - Gleichstromgenerator
  - Kommutator
keywords: 
subject:
  - Elektrische Maschinen und Antriebselektronik
  - VL
semester: SS25
created: 3. März 2025
professor: 
draft: false
title: Gleichstrommaschine
banner: /Elektrotechnik/Maschinen/assets/DCM.png
banner_y: 0.756
---
 

# Gleichstrommaschine

> [!info] **Merkmale:**
> - Spulenwicklung im Rotor
> - Bürste


## Funktionsweise

Der **Stator** wird mit einem Konstanten *Erregerfluss* durchströmt, welcher durch EM bzw PM erzeugt wird.

Im **Rotor** befinden sich beliebg Viele wicklungen die im Kreis Angeordnet sind. Die **Kontakte** der wicklungen sind am Schaft der Maschine freigestellt und kontaktieren die Bürsten.

Durch den **Kommutator / Stromwender** wird die Stromrichtung immer so *umgekehrt*, dass sich die momentan bestromten Rotorwicklungen geschickt zum Nächstgelegenen Pol *anzieht* bzw *abstößt*. 

- Der Fluss durch die Rotorwicklung (normal zur Wicklungsebene) möchte immer in die *selbe Richtung* wie der Erregerfluss zeigen.
- Dies wird allein durch geschickte verdrahtung der Rotorwicklungskontakte erzielt

## Stationäres Betriebsverhalten

Die Gleichstrommaschine ist ein reziprokes Elektromechanisches System und kann daher als Gleichstrommotor bzw. -generator behandelt werden. Wegen dieser Eigenschaft ist die **mechanischen Leistung** (mit allen Verlusten einbezogen) gleich der inneren **elektrische Leistung**.

$$ P_{m} = \omega M=U_{q}I_{A} $$

|       $\omega$        | $M$        | $U_{q}$       | $I_{A}$    |
| :-------------------: | :--------: | :-----------: | :--------: |
| Winkelgeschwindigkeit | Drehmoment | Quellspannung | Ankerstrom |

Zur Beschreibung des Stationäres Betriebsverhalten der DC-Maschine gibt es Gleichungen:

> [!def] **D1 - ASPG)** Ankerspannungsgleichung:
> 
> $$
> \begin{align}
> U_{A} &= R_{A}I_{A}+U_{q}(\omega) \\
> U_{q} &= cn\Phi =\bar{c}\Phi \omega & \impliedby \omega=2\pi n \\
> M &= \frac{c\Phi}{2\pi} I_{A} = \bar{c}\Phi I_{A}
> \end{align} 
> $$


- $[n]=\frac{U}{s}$ ... Umdrehungen pro Sekunde
- $[\omega] = \frac{\operatorname{rad}}{s}$
- $c, \bar{c}$ ... Maschinenkonstante mit $c = 2\pi \bar{c}$

## Nutrastmomente

> [!hint] **Nutrastmomente:** Sind die Einrastungen die man spürt, wenn man einen unbestromten DC-Motor Dreht.
> In DC-Motoren sind im Rotor Nuten wo die Spuleneingelassen sind. An dieser Nut gibt es einen größeren Lufspalt, wobei der Fluss auch an der Seitenfläche der Nut eintritt, welches ein Positives / Negatives Moment verursacht. Dadurch entstehen Ripple im Drehmoment. 

In Summe sind diese Momente $0$: $\int M_{c}(\varphi) \mathrm{~d}\varphi_{r}=0$

![invert_dark](assets/Nutrasten.png)