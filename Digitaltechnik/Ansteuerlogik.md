---
tags: 
aliases:
  - Schaltfunktion
keywords:
  - DNF
  - KNF
  - Min-/Maxterme
  - KV-Diagramm
subject:
  - KV
  - Technische Informatik
semester: WS23
created: 27th February 2025
professor:
  - Timm Ostermann
title: Ansteuerlogik
release: false
---

# Ansteuerlogik

## Literale

> [!def] **D - Literale)** 
> - positive Literale: $X_{1}, X_{2}, X_{3}$
> - negative Literale: $\bar{X}_{1}, \bar{X}_{2}, \bar{X}_{3}$

- [Konjunktion](../Mathematik/Logik/Junktor.md#Konjunktion) von Literalen: Produktterm, UND Verknüpfungen (Bsp.: $X_{1}X_{2}X_{3}$)
- [Disjunktion](../Mathematik/Logik/Junktor.md#Disjunktion) von Literalen: Summenform, ODER Verknüpfungen (Bsp.: $X_{1}+X_{2}+X_{3}$)

## Min- und Maxterme

> [!def] **D - Minterm** $m$
>  Ein Minterm ist eine konjunktive Verknüpfung **aller** Eingangsvariablen, wobei **jede** Eingangsvariable in negierter oder nicht-negierter Form vorkommen muss.


 > [!example] Für die drei Variablen $X_{1},X_{2},X_{3}$ gibt es $2^{3}=8$ mögliche Minterme
 > $$
> \begin{align}
> X_{1}\cdot X_{2}\cdot X_{3}, \quad X_{1}\cdot X_{2}\cdot \bar{X}_{3}, \quad X_{1}\cdot \bar{X}_{2}\cdot X_{3}, \quad X_{1}\cdot \bar{X}_{2}\cdot \bar{X}_{3} \\
> \bar{X}_{1}\cdot X_{2}\cdot X_{3}, \quad \bar{X}_{1}\cdot X_{2}\cdot \bar{X}_{3}, \quad \bar{X}_{1}\cdot \bar{X}_{2}\cdot X_{3}, \quad \bar{X}_{1}\cdot \bar{X}_{2}\cdot \bar{X}_{3} \\
\end{align}
> $$

> [!def] **D - Maxterm** $M$
>  Ein Maxterm ist eine disjunktive Verknüpfung **aller** Eingangsvariablen, wobei **jede** Eingangsvariable in negierter oder nicht-negierter Form vorkommen muss.

 > [!example] Für die drei Variablen $X_{1},X_{2},X_{3}$ gibt es $2^{3}=8$ mögliche Maxterme
 > $$
> \begin{align}
> X_{1}+ X_{2}+ X_{3}, \quad X_{1}+ X_{2}+ \bar{X}_{3}, \quad X_{1}+ \bar{X}_{2}+ X_{3}, \quad X_{1}+ \bar{X}_{2}+ \bar{X}_{3} \\
> \bar{X}_{1}+ X_{2}+ X_{3}, \quad \bar{X}_{1}+ X_{2}+ \bar{X}_{3}, \quad \bar{X}_{1}+ \bar{X}_{2}+ X_{3}, \quad \bar{X}_{1}+ \bar{X}_{2}+ \bar{X}_{3} \\
\end{align}
> $$

## Normalformen

> [!def] **D - DNF)** disjunktive Normalform
> Disjunktion aus konjungierten Literalen. Verknüpft die DNF ausschließlich *Minterme*, heißt sie **kanonisch (KDNF)** oder **vollständig**

Bsp. DNF: $X_{1}\cdot \bar{X}_{2} + X_{2}\cdot X_{3}$
Bsp. KDNF: $X_{1}\cdot \bar{X}_{2} \cdot X_{3} + X_{1}\cdot X_{2}\cdot X_{3}$

> [!def] **D - KNF)** konjunktive Normalform 
> Konjunktion aus disjungierten Literalen. Verknüpft die KNF ausschließlich *Maxterme*, heißt sie **kanonisch (KKNF)** oder **vollständig**

Bsp. KNF: $(X_{1} + \bar{X}_{2}) \cdot (X_{2} + X_{3})$
Bsp. KDNF: $(X_{1} + \bar{X}_{2} + X_{3}) \cdot (X_{1}+ X_{2}+ X_{3})$

### Überführung in kanonische Normalformen

#### DNF $\to$ KDNF

Mithilfe der Eigenschaft des
- [komplementären Elements](../Mathematik/Algebra/Boolesche%20Algebra.md#^BOOL) $1= X_{1} + \bar{X}_{1}$ und dem
- [neutralen Element](../Mathematik/Algebra/Boolesche%20Algebra.md#^BOOL) der konjunktion $X_{2} \cdot 1 = X_{2}$ folgt
- $X_{2} = X_{2}\cdot(X_{1}+\bar{X}_{1}) = X_{2}\cdot X_{1} + X_{2} \cdot \bar{X}_{1}$

Es kann daher jeder konjungierte Term mit $1$ erweitert werden, sodass die DNF durch das Distributivgesetz immer auf eine kanonische Form gebracht werden kann.

#### KNF $\to$ KKNF

Mithilfe der Eigenschaft des

- [komplementären Elements](../Mathematik/Algebra/Boolesche%20Algebra.md#^BOOL) $0= X_{1} \cdot \bar{X}_{1}$ und dem
- [neutralen Element](../Mathematik/Algebra/Boolesche%20Algebra.md#^BOOL) der disjunktion $X_{2} + 0 = X_{2}$ folgt
- $X_{2} = X_{2} + (X_{1}\cdot\bar{X}_{1}) = (X_{2} + X_{1}) \cdot (X_{2} + \bar{X}_{1})$

Es kann daher jeder disjungierte Term mit $0$ erweitert werden, sodass die KNF durch das Distributivgesetz immer auf eine kanonische Form gebracht werden kann.

#### KDNF $\iff$ KKNF

Aus der [De Morganschen Regel](../Mathematik/Algebra/Boolesche%20Algebra.md#Rechenregeln) folgt.

$$ \text{KKNF}(f) \iff \overline{\text{KDNF}(\overline{f})} $$

## Beschriebung von Schaltfunktionen

### KNF

### DNF

## Minimierung

> [!info] Minimierungsverfahren
> 1. Minimierung durch [Boolesche Algebra](../Mathematik/Algebra/Boolesche%20Algebra.md) 
>   - i.d.R. nur für wenige Variablen ($< 4$) geeignet
> 2.

