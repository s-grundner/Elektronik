---
tags:
  - Halbleiter
aliases: 
subject:
  - physik
  - hwe
source:
  - Siegbert Schrempf
created: 30th March 2022
---

# [Shockley Gleichung](https://de.wikipedia.org/wiki/Shockley-Gleichung)

Die Shockley-Gleichung, benannt nach William B. Shockley, beschreibt die [Strom](../Elektrotechnik/elektrischer%20Strom.md)-Spannungs-Kennlinie einer Halbleiterdiode.



## Bei der [Diode](../Hardwareentwicklung/Halbleiter/Diode.md):

$I_{D} = I_{S}\cdot(e^{\frac{U_{F}}{\eta\cdot U_{T}}}-1)$

| Bezeichnung | Beschreibung bei [Transistor](../Hardwareentwicklung/Halbleiter/{MOC}%20Transistor.md) |     |
| :---------: | :------------------------------------------------------------------------------------: | --- |
|   $I_{D}$   |                                      Diodenstrom                                       |     |
|   $I_{S}$   |                                       Sperrstrom                                       |     |
|   $U_{F}$   |                                     Flussspannung                                      |     |
|   $U_{T}$   |                                 [[Temperaturspannung]]                                 |     |
|   $\eta$    |                                  Emissionskoeffizient                                  |     |

## Beim [Bipolartransistor](../Hardwareentwicklung/Halbleiter/Bipolartransistor.md):

$I_{C} = I_{S}\cdot(e^{\frac{U_{BE}}{\eta\cdot U_{T}}}-1)$

| Bezeichnung | Beschreibung bei [Transistor](../Hardwareentwicklung/Halbleiter/{MOC}%20Transistor.md) |
|:-----------:|:---------------------------:|
|   $I_{C}$   |       Kollektor-[Strom](../Elektrotechnik/elektrischer%20Strom.md)       |
|   $I_{S}$   |       Sättigungsstrom       |
|  $U_{BE}$   |   Basis-Emitter-Spannung    |
|   $U_{T}$   |     Temperaturspannung      | 
|     $\eta$     |    Emissionskoeffizient     |

# Tags