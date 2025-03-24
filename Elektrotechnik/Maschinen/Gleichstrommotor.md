---
tags: 
aliases:
  - DC-Motor
  - Gleichstrommaschine
  - DC-Maschine
keywords: 
subject:
  - Elektrische Maschinen und Antriebselektronik
  - VL
semester: SS25
created: 3. März 2025
professor: 
draft: false
title: Gleichstrommotor
---
 
# Gleichstrommaschine


![900](assets/DCM.jpg)

**Merkmale:**

- Spulenwicklung im Rotor
- Bürste

Zur Beschreibung des Stationäres Betriebsverhalten der DC-Maschine gibt es G gleichungen:

> [!def] **D1 - ASPG)** Ankerspannungsgleichung:
> 
> $$
> \begin{align}
> U_{A} &= R_{A}I_{A}+U_{q}(\omega) \\
> U_{q} &= cn\Phi &&(=c_{1}\Phi \omega) \impliedby \omega=2\pi n \\
> M &= \frac{c\Phi}{2\pi} i_{A} &&(= c_{1}\Phi i_{a})
> \end{align} 
> $$
> $[n]=\frac{U}{s}$ ... Umdrehungen pro Sekunde
> $[\omega] = \frac{\operatorname{rad}}{s}$
> $c, c_{1}$ ... Maschinenkonstante mit $c = 2\pi c_{1}$

> [!hint] **Nutrastmomente:** Sind die Einrastungen die man spürt, wenn man einen unbestromten DC-Motor Dreht.
> In DC-Motoren sind im Rotor Nuten wo die Spuleneingelassen sind. An dieser Nut gibt es einen größeren Lufspalt, wobei der Fluss auch an der Seitenfläche der Nut eintritt, welches ein Positives / Negatives Moment verursacht. Dadurch entstehen Ripple im Drehmoment. 

In Summe sind diese Momente $0$: $\int M_{c}(\varphi) \mathrm{~d}\varphi_{r}=0$

