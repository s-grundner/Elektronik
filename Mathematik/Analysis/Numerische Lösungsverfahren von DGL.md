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

Zeitintervall $[a, b]$ auf dem man sich die Lösung ausrechnen möchte wird in $N$ Teilintervalle unterteilt. 

> [!info] Man nimmt sich also endlich viele Punkte und berechnet sich an diesen Punkten eine näherungslösung berechnet:
> 
> **Intervall**: $I=[a,b], t \in I$
> **Diskretisierung** (äquidistand):
> 
> ![invert_dark|800](assets/Pasted%20image%2020241216194118.png)
> Das intervall wird also in gleiche Teile mit der länge $h$ unterteilt. Der letzte Teil ist jedoch möglicherweise kleiner, da $N$ nicht unbedingt durch $h$ teilbar ist.


Wir nehmen an, dass das [AWP](../{MOC}%20DGL.md) eine eindeutige Lösung auf $I$ hat. Wir möchten näherungen $x_{k}$ für $x(t_{k})$ berechnen

### Euler-Verfahren (EV)

Wir betrachten das AWP  $x' = f(t,x), x(t_{0})=x_{0}$:


![invert_dark|600](assets/DGL_NUM_EV.png)
$$
\begin{align}
x_{1} &\approx x_{0}+h\cdot x'= x_{0}+h\cdot f(t_{0}, x_{0}) \quad \text{ Erster Term in der Taylor Entwicklung. } \\
x_{k} &\approx x_{k-1} + h\cdot f(t_{k-1}, x_{k-1})
\end{align}
$$
