---
tags:
  - "#Material"
aliases:
  - "#Material"
created: 26. September 2023
---

# Leiter

```dataview
TABLE
join(list(spec-resistance[0], spec-resistance[1]), "$\cdot$") AS "Spez. Widerstand $\rho$",
join(list(spec-conductance[0], spec-conductance[1]), "$\cdot$") AS "Spez. Leitwert $\gamma$",
join(list(temperature-coeff[0], temperature-coeff[1]), "$\cdot$") AS "Temp. Koeffizient $\alpha$",
material AS "Komposition"

FROM #Material/Metal 
WHERE !contains(file.name, "Material")
SORT file.name
```

# Substrate

> [!question] [Verlustwinkel](../../Elektrotechnik/Verlustwinkel.md)

```dataview
TABLE dielectric AS "Dielektrizitätskonstante $\varepsilon_r$", tan-loss AS "Verlustwinkel $\tan\delta$", at AS "@", material AS "Komposition"
FROM #Material/Substrate
SORT file.name
```