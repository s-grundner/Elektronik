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

Die Shockley-Gleichung, benannt nach William B. Shockley, beschreibt die Strom-Spannungs-Kennlinie einer Halbleiterdiode.

Sie lautet nach Wagner:

## Bei der [Diode](../Hardwareentwicklung/Halbleiter/Diode.md):

$I_{D} = I_{S}\cdot(e^{\frac{U_{F}}{\eta\cdot U_{T}}}-1)$

| Bezeichnung | Beschreibung bei [Transistor](../Hardwareentwicklung/Halbleiter/{MOC}%20Transistor.md) |
|:-----------:|:---------------------------:|
|   $I_{D}$   |        [Dioden](Dioden.md)-Strom         |
|   $I_{S}$   |         Sperrstrom          |
|   $U_{F}$   |        Flussspannung        |
|   $U_{T}$   |     Temperaturspannung      |
|     $\eta$     |    Emissionskoeffizient     | 

## Beim [Transistor](../Hardwareentwicklung/Halbleiter/{MOC}%20Transistor.md):

$I_{C} = I_{S}\cdot(e^{\frac{U_{BE}}{\eta\cdot U_{T}}}-1)$

| Bezeichnung | Beschreibung bei [Transistor](../Hardwareentwicklung/Halbleiter/{MOC}%20Transistor.md) |
|:-----------:|:---------------------------:|
|   $I_{C}$   |       Kollektor-Strom       |
|   $I_{S}$   |       Sättigungsstrom       |
|  $U_{BE}$   |   Basis-Emitter-Spannung    |
|   $U_{T}$   |     Temperaturspannung      | 
|     $\eta$     |    Emissionskoeffizient     |

# Tags