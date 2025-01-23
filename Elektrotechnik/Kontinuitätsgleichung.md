---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Elektrotechnik
semester: WS24
created: 14. Januar 2025
professor:
---
 

# Kontinuitätsgleichung

Die Kontinuitätsgleichung besagt, dass wenn sich die Ladungsdichte $\rho$ an einem Ort Ändert, sich an diesem Ort ein Quelle oder Senke von Ladungen, durch einen Querschnitt betrachtet die Stromdichte $\mathbf{J}$, befindet.

$$
\operatorname{div}\mathbf{J}=-\frac{\mathrm{d}\rho}{\mathrm{d}t}
$$


> [!question] Herleitung der Kontinuitätsgleichung
> 
> Eine von Ladung pro Zeiteinheit durchsetzte Fläche ist der [elektrische Strom](elektrischer%20Strom.md) $i(t)$:
> 
> $$i(t)= -\frac{\mathrm{d}Q}{\mathrm{d}t}$$
> 
> wobei wir festlegen, dass positiver Strom bedeutet, dass positive Ladungen durch die Hüllfläche nach außen fließen, also die Ladung im Volumen weniger wird $(\mathrm{d} Q / \mathrm{d} t<0)$
> 
> Diese Fläche $A$ besitzt dann eine Stromdichte $\mathbf{J}$, die die Ladung pro Zeiteinheit und Fläche angibt, wenn diese Fläche die Hüllfläche $\partial V$ eines Volumens $V$ ist in der sich Ladungen mit der Ladungsdichte $\rho$ befinden, so lässt sich schreiben:
> 
> $$
> \oint_{\partial V}\mathbf{J}\cdot\mathrm{d}\mathbf{a} = - \frac{\mathrm{d}}{\mathrm{d}t}\int_{V}\rho \mathrm{~d}V = -\int_{V} \frac{\mathrm{d}\rho}{\mathrm{d}t} \mathrm{~d}V 
> $$
> Mit dem [Gaußschen Integralsatz](../Mathematik/Analysis/Gaußscher%20Integralsatz.md) ergibt sich die **Kontinuitätsgleichung**:
> 
> $$\boxed{\operatorname{div}\mathbf{J}=-\frac{\mathrm{d}\rho}{\mathrm{d}t}}$$