---
tags:
  - "#Material"
aliases:
  - "#Material"
created: 26. September 2023
---

# Leiter

```dataview
TABLE join(list(spec-resistance[0], spec-resistance[1]), "$\cdot$") AS "Spez. Widerstand $\rho$", join(list(spec-conductance[0], spec-conductance[1]), "$\cdot$") AS "Spez. Leitwert $\gamma$",material AS "Komposition"
FROM #Material/Metal
SORT file.name
```

# Substrate

```dataview
TABLE dielectric AS "Dielektrizitätskonstante $\varepsilon_r$", tan-loss AS "$\tan\delta$ Verluste", at AS "@", material AS "Komposition"
FROM #Material/Substrate
SORT file.name
```