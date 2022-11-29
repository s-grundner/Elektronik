---
tags: []
aliases: ["Q-Faktor"]
subject: ["hwe"]
source: ["Siegbert Schrempf", "Michael Offenhuber"]
reference: []
created: 29th November 2022
---

# Güte
Beschreibt, wie stark das resonanzverhalten ausgrprägt ist.

Verhältnis der Teilspannungen zur Gesamtspannung $\underline{U}$ bei Resonanz

$$
\begin{align*}
	Q=\frac{U_{L,res}}{U}=\frac{U_{C,res}}{U}=\frac{I\cdot X_{L,res}}{I\cdot R}=\frac{I\cdot X_{C,res}}{I\cdot R}=\frac{\omega_{0}\cdot L}{R}=\frac{1}{\omega_{0}\cdot C\cdot R}
\end{align*}
$$

## Phase
```functionplot
---
title: Phase
xLabel: f/Hz
yLabel: 
bounds: [0,2000,-90,90]
disableZoom: false
grid: true
---
phi(x)=180*(1/(1+2.71^(-(x/180)+5.555))-0.5)
```


```functionplot
---
title: 
xLabel: 
yLabel: 
bounds: [-10,10,-10,10]
disableZoom: false
grid: true
---
y(x)=x
f(x)= 1/x
g(x) = x+1/x
```


# Tags