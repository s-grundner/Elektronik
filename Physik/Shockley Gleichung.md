---
tags: 
aliases:
  - Temparaturspannnung
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 4. März 2024
professor:
---
 

# Shockley Gleichung

Die Shockley-Gleichung, benannt nach William B. Shockley, beschreibt die [Strom](../Elektrotechnik/elektrischer%20Strom.md)-Spannungs-Kennlinie einer Halbleiterdiode.


## Bei der [Diode](../Hardwareentwicklung/Halbleiter/Diode.md):

$I_{D} = I_{S}\cdot(e^{\frac{U_{F}}{\eta\cdot U_{T}}}-1)$

| Bezeichnung |                      |
| :---------: | :------------------: |
|   $I_{D}$   |     Diodenstrom      |
|   $I_{S}$   |      Sperrstrom      |
|   $U_{F}$   |    Flussspannung     |
|   $U_{T}$   |  Temperaturspannung  |
|   $\eta$    | Emissionskoeffizient |

## Beim [Bipolartransistor](../Hardwareentwicklung/Halbleiter/Bipolartransistor.md):

$I_{C} = I_{S}\cdot(e^{\frac{U_{BE}}{\eta\cdot U_{T}}}-1)$

| Bezeichnung |                                                              |
| :---------: | :----------------------------------------------------------: |
|   $I_{C}$   | Kollektor-[Strom](../Elektrotechnik/elektrischer%20Strom.md) |
|   $I_{S}$   |                       Sättigungsstrom                        |
|  $U_{BE}$   |                    Basis-Emitter-Spannung                    |
|   $U_{T}$   |                      Temperaturspannung                      |
|   $\eta$    |                     Emissionskoeffizient                     |

## Temparaturspannung

$$
U_{\mathrm{T}}=\frac{k_{\mathrm{B}} \cdot T}{e}
$$
| $k_{\mathrm{B}}$ | [Boltzmannkonstante](Konstanten/Boltzmannkonstante.md) |
| ---------------- | ------------------------------------------------------ |
| $T$              | Absolute Temparatur                                    |
| $e$              | [Elementarladung](Konstanten/Elementarladung.md)       |

# Tags