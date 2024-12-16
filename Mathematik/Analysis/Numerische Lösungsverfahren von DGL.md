---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 16. Dezember 2024
professor:
---
 

# Numerische DGL

> [!hint]- Einfachstes numerisches Verfahren: Sukzessive Approximation nach
> 
> $x' = f(t,x), x(t_{0})=x_{0}$
> 
> Wird zu integralgleichung:
> 
> $$x(t) = x_{0} + \int_{t_{0}}^{t} f(\tau, x(\tau)) d\tau$$
> 
> Wird dann durch eine Funktionenfolge $\phi_{k}$ approximiert (Folgt aus dem Beweis des Satzes von [Picard-Lindelöf](../Picard-Lindelöf.md))
> 
> $$
> \begin{align}
> \phi_{0} & = x_{0}  \\
> \phi_{n+1}(t) & = x_{0} + \int_{t_{0}}^{t} f(\tau, \phi_{n}(\tau)) d\tau
> \end{align}
> $$
> 
> $\phi_{t}$ konvergiert gegen die Lösung des AWP: Analytische Approximationsmethode zur Lösung der DGL

## Diskretisierungsverfahren

Zeitintervall $[t_{0}, t_{1}]$ auf dem man sich die Lösung ausrechnen möchte wird in $n$ Teilintervalle unterteilt. 

Man nimmt sich also endlich viele Punkte und berechnet sich an diesen Punkten eine näherungslösung berechnet:

Intervall: $I=[a,b]$
Diskretisierung (äquidistand):

![](assets/Pasted%20image%2020241216193934.png)
