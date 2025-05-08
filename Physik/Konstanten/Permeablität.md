---
tags:
  - Konstante
  - Physik
aliases:
  - Permeabilitätskonstante
  - Permeabilität
  - Hysterese
keywords:
  - Materialgesetz
subject:
  - Elektrische Maschinen und Antriebselektronik
  - VL
semester: SS25
created: 10. März 2025
professor: 
draft: true
title: Permeabilität
symbol: $\mu_{0}$
value: $1.25663706127(20) \cdot 10^{-6}$
unit: $\mathrm{\dfrac{Vs}{Am}}$
rel-uncertainty: 1.6e-10
---

# Permeabilität des Vakuums

> [!def] $\mu_{0} = 1.25663706127(20) \cdot 10^{-6} \mathrm{\frac{Vs}{Am}}$ ^DEF

# Materialgesetz - Permeabilität

> [!question] Themenkreis: [Magnetisches Feld](Magnetisches%20Feld.md)

---

Die **Permeabilität** $\mu$ bezeichnet die magnetische Leitfähigkeit von Werkstoffen. 

> [!important] [Materialgesetze nach Maxwell](Maxwell.md#^MATG) für das Magnetfeld
> $$\mathbf{B}= \mu \mathbf{H}, \qquad[\mu] = \mathrm{\frac{Vs}{Am} = \frac{H}{m}}$$
> Wichtige Beziehung für [Magnetkreise](Maschinen/Magnetkreis.md)

Magnetische Leitfähigkeit - **Permeabilität** $\mu = \mu_{0}\cdot\mu_{r}$:
- $\mu_{0}$ ... [Permeabilität des Vakuums](#^DEF)
- Ein gut magnetisch leitfähiges Material möchte in einem Magnetfeld den Luftspalt minimieren.
- z.B: Aluminium ist zwar gut elektrisch Leitfähig aber nicht magnetisch

ferromagnetisch: $\mu_{r} \gg$ 
diamagnetisch: $\mu_{r}<$ (material stoßt sich vom Magnetfeld leicht ab)

## Magnetisierung und Sättigung

> [!question] **Manetische Sättigung:** Ab einem Gewissen Strom wird der Kern des Magnetkreises nicht weiter Magnetisiert
> - Querschnitt des Magnetkreises größer machen um Sättigungsinduktion zu minimieren

| ![invert_dark\|200](assets/Mkreis.png)                                                                 | ![invert_dark\|200](assets/Mkurve.png)                                                                    |
| ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| Durch das Einbringen eines Magnetfeldes durch eine Spule in den Eisenkreis, wird der kern Magnetisiert | Damit ergibt sich für die Magnetische Flussdichte über dem Strom die Hysterese- oder Magnetisierungskurve |
