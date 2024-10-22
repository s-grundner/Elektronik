---
tags:
  - incomplete
aliases: 
subject:
  - dic
source:
  - Robert Vogl
created: 3rd February 2023
---

# Faltung

$$
\begin{align*}
y(t)&=x(t)\ast h(t)=\int_{-\infty}^{\infty}x(\uptau)\cdot h(t-\uptau)d\uptau=\int_{-\infty}^{\infty}x(t-\uptau)\cdot h(\uptau)d\uptau
\end{align*}
$$
![Convolution_of_box_signal_with_itself](../../../Digitaltechnik/assets/Convolution_of_box_signal_with_itself.gif)

## Eigenschaften der Faltung

Bei LTI-Systemen lässt sich das Ausgangssignal $y$ durch Faltung des EIngangssignals $x$ mit der Impulsantwort

> [!important] Für die Faltung gelten die Körperaxiome:
> 
> 1. neutrales element $e$: $\delta(t)$
>     - Die Faltung eines Signals mit dem Dirac-Impuls ergibt wieder das Signal
> inverses Element $a'$: $x(t)$
>     - Die Faltung des Signals mit sich selbst ist $1$
> kommutativität: $x*h=h*x$

Wenn zwei stetige Funktionen gefaltet werden ist das Ergebnis wieder stetig.