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

> [!quote] Wozu Numerische Verfahren?
>  Bei nichtlinearen Gleichungen stößt man sehr bald an Grenzen. Schon für einfach aussehende Gleichungen, wie z.B.
> 
> $$x^{\prime}=t-x^2 \quad \text { oder } \quad x^{\prime \prime}=6 x^2+t$$
> 
> lässt sich die Lösung nicht mehr mit Hilfe elementarer Funktionen darstellen.
> 
> Man braucht daher Näherungsmethoden. Dabei unterscheidet man zwischen **analytischen** und **numerischen** Näherungsverfahren.
> Ein analytisches Verfahren:
> - Aus dem Satz von Lindelöf: [Sukzessive Approximation](../sukzessive%20Approximation.md).
> - Falls die Funktion $f$ in der der [AWP](../{MOC}%20DGL.md) höher differenzierbar ist, kann man auch mit Hilfe der Taylorentwicklung weitere Näherungsverfahren herleiten.
> 
> Was die Rechengeschwindigkeit für große Systeme betrifft, haben sich im computerbasierten numerischen Rechnen sogenannte **Diskretisierungsverfahren** durchgesetzt.
> - Das Grundprinzip dieser Verfahren besteht darin, dass das *unendlich* dimensionale Problem der Bestimmung von Funktionen in eine *endlich* dimensionale Aufgabe transformiert wird: die Berechnung von Vektoren mit reellwertigen Komponenten.
> - Das einfachste Verfahren dieser Art ist das Euler-Verfahren. 
> 
> Im Folgenden werden Verfahren für Anfangswert-, Randwert- und Eigenwertprobleme definiert.
> 

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
\begin{gathered}
x_{1} \approx x_{0}+h\cdot x'= x_{0}+h\cdot f(t_{0}, x_{0}) \\
\boxed{ x_{k} \approx x_{k-1} + h\cdot f(t_{k-1}, x_{k-1}) }
\end{gathered}
$$
