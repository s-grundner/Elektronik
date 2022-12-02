---
tags: []
aliases: []
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 2nd December 2022
---

# Overfit
Bsp.: Lineare Reession (Häuserpreis)
```functionplot
---
title: Underfit
xLabel: Size
yLabel: Price
bounds: [0,10,0,10]
disableZoom: false
grid: true
---
y=x+1
```

```functionplot
---
title: Fit
xLabel: Size
yLabel: Preis
bounds: [0,10,0,10]
disableZoom: false
grid: true
---
y = 5-10x+5x^2
```


```functionplot
---
title: Overfit
xLabel: Größe
yLabel: Preis
bounds: [0,10,0,10]
disableZoom: false
grid: true
---
y=x^4 + x^3 + 3*x^2 + 10*x1
```
## Regularisieren
um das Overfitting zu verhindern



# Tags