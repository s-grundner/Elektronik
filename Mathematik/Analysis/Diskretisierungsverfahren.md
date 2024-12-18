---
tags:
  - DGL/Numerisch
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 18. Dezember 2024
professor:
---
 

# Diskretisierungsverfahren

> [!info] Siehe: [Numerische Lösungsverfahren von DGL](Numerische%20Lösungsverfahren%20von%20DGL.md)

Das Zeitintervall $[a, b]$ auf dem man sich die Lösung ausrechnen möchte wird in $N$ Teilintervalle unterteilt. 

> [!info] **Äquidistande Diskretisierung**: Man nimmt sich also endlich viele Punkte und berechnet sich an diesen Punkten eine Näherungslösung berechnet:
> 
> **Intervall**: $I=[a,b], t \in I$
> **Diskretisierung** (äquidistand):
> 
> ![invert_dark|800](assets/Pasted%20image%2020241216194118.png)
> Das intervall wird also in gleiche Teile mit der länge $h$ unterteilt. Der letzte Teil ist jedoch möglicherweise kleiner, da $N$ nicht unbedingt durch $h$ teilbar ist.
> Der Abbildung kann man entnehmen, dass:
> $$t_{k}=t_{k-1}+h_{k} \quad \text{ mit } k=1, \ldots, N,\quad t_{0}=a, \quad t_{N}=b$$
> Da in dem äquidistanten Gitter alle Schrittweiten gleich sind:
> $$h_{k}=h:= \frac{b-a}{N},\quad t_{k}=t_{0}+kh$$


> [!hint] **Vorraussetzung:** Eindeutige Lösbarkeit
>  Wir nehmen an: das [AWP](../{MOC}%20DGL.md)
>  $$x^{\prime}=f(t, x), \quad x\left(t_0\right)=x_0\tag{AWP}$$
> ist eindeutig lösbar in $I$ für alle $t_0 \in I$ und $x_0 \in \mathbb{R}^m$ mit $f \in C\left(I \times \mathbb{R}^m, \mathbb{R}^m\right), \quad I:=[a, b], \quad a<b$.

Wir möchten näherungen $x_{k}$ für $x(t_{k})$ berechnen

## Verfahren

- [Explizite Einschrittverfahren](Explizite%20Einschrittverfahren.md) (einstufig und mehrstufig)
    - [Euler-Verfahren](Euler-Verfahren.md)