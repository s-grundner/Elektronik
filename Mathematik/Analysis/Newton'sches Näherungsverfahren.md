---
tags: []
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
created: 30th May 2022
---

# Newton'sches Näherungsverfahren


Wenn die Funktion $f: \mathbb{R} \rightarrow \mathbb{R}$ differenzierbar ist, dann lässt sich $f(x)$ durch $f\left(x_0\right)+f^{\prime}\left(x_0\right)\left(x-x_0\right)$ approximieren. Löst man nun statt der Gleichung (16.1) die Gleichung
$$
f\left(x_0\right)+f^{\prime}\left(x_0\right)\left(x-x_0\right)=0,
$$
schneidet man also die Tangente in $\left(x_0, f\left(x_0\right)\right)$ mit der $x$-Achse, so erhält man als Lösung:
$$
x_1=x_0-\frac{f\left(x_0\right)}{f^{\prime}\left(x_0\right)}
$$

Diese Prozedur kann man ausgehend von einem Startwert $x_0$ immer wieder wiederholen. Man erhält somit das Newton-Verfahren:
$$
x_{n+1}=x_n-\frac{f\left(x_n\right)}{f^{\prime}\left(x_n\right)}
$$

Offensichtlich ist dieses Verfahren nur dann durchführbar, wenn $f^{\prime}\left(x_n\right) \neq 0$.