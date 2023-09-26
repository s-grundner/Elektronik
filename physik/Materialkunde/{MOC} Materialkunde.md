---
tags:
  - "#Material"
aliases:
  - "#Material"
created: 26. September 2023
---

# Leiter

```dataview
TABLE join(list(spec-resistance[0], spec-resistance[1])), spec-conductance[0]
FROM #Material/Metal
SORT file.name
```

# Substrate

```dataview
TABLE dielectric, tan-loss, at, material
FROM #Material/Substrate
SORT file.name
```