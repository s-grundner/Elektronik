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
  - Bernhard Jakoby
def:
  - SHOC
---
 

# Shockley Gleichung

Die Shockley-Gleichung, benannt nach William B. Shockley, beschreibt die Strom-Spannungs-Kennlinie einer Halbleiterdiode.

## Bei der [Diode](../Hardwareentwicklung/Halbleiter/Diode.md)

> [!def] **D1 - SHOC)** Shockley-Gleichung ^SHOC
> $$I_{D}(U_{D}) = I_{S}\cdot(e^{\frac{U_{D}}{\eta\cdot U_{T}}}-1)$$ 

| Bezeichnung |                            |
| :---------: | :------------------------: |
|   $I_{D}$   |        Diodenstrom         |
|   $I_{S}$   |         Sperrstrom         |
|   $U_{D}$   | Vorwärtsspannung der Diode |
|   $U_{T}$   |     Temperaturspannung     |
|   $\eta$    |    Emissionskoeffizient    |

## Beim [Bipolartransistor](../Hardwareentwicklung/Halbleiter/Bipolartransistor.md)

$I_{C} = I_{S}\cdot(e^{\frac{U_{BE}}{\eta\cdot U_{T}}}-1)$

| Bezeichnung |                        |
| :---------: | :--------------------: |
|   $I_{C}$   |     Kollektorstrom     |
|   $I_{S}$   |    Sättigungsstrom     |
|  $U_{BE}$   | Basis-Emitter-Spannung |
|   $U_{T}$   |   Temperaturspannung   |
|   $\eta$    |  Emissionskoeffizient  |

## Temparaturabhängigkeit von Halbleitern

Durch die Kenngrößen $I_{S}$ und $U_{T}$ ist die Temparaturempfindlichkeit von Halbleitern gegeben.

### Sperr und Sättigungsstrom $I_{S}$

$$
I_{\mathrm{S}}=I_{\mathrm{S} 0} \cdot e^{-\frac{W_{\mathrm{G}}}{k_{\mathrm{B}} T}}
$$

| $k_{\mathrm{B}}$ | [Boltzmannkonstante](Konstanten/Boltzmannkonstante.md) |
| ---------------- | ------------------------------------------------------ |
| $T$              | Absolute Temparatur                                    |
| $W_{G}$          | Vom Halbleitermaterial abhängiger [Bandabstand](../Chemie/elektrischer%20Leiter.md)          |

$W_{G}=1.1eV$ für [Silizium](Materialkunde/Silizium.md)

### Temparaturspannung $U_{T}$

$$
U_{\mathrm{T}}=\frac{k_{\mathrm{B}} \cdot T}{e}
$$
| $k_{\mathrm{B}}$ | [Boltzmannkonstante](Konstanten/Boltzmannkonstante.md) |
| ---------------- | ------------------------------------------------------ |
| $T$              | Absolute Temparatur                                    |
| $e$              | [Elementarladung](Konstanten/Elementarladung.md)       |

# Tags