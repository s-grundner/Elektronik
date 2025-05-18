---
tags: 
aliases:
  - Bool
  - Boolean
keywords:
  - Axiome
subject:
  - KV
  - Technische Informatik
semester: WS23
created: 27th February 2025
professor: 
title: Boolesche Algebra
release: true
---

# Boolesche Algebra

> [!question] [Algebraische Strukturen](Algebraische%20Strukturen.md)

Boolesche Algebra besteht aus der Menge $B$ und zwei Verküpfungsoberatoren $+$ und $\cdot$

Es gelten die Axiome

> [!def] **D1 - BOOL)** Axiome der Booleschen Algebra $(B, +, \cdot)$
> 
> 1. **Abgeschlossenheit** der Menge $B$ bezüglich $+$ und $\cdot$ bedeuted, dass kein mögliches Ergebnis außerhalb $B$ liegt, d.h.
> 
> $$ \forall x,y \in B: \quad (x+y) \in B, \quad (x\cdot y) \in B $$
> 
> 2. **Neutrale Elemente**
> $B$ hat ein neutrales Element bzgl. $+$ das mit $0$ (*Nullelement*) bezeichet wird.
> $B$ hat ein neutrales Element bzgl. $\cdot$ das mit $1$ (*Einselement*) bezeichet wird.
> 
> $$ \forall x \in B: \quad (x+0) = x, \quad (x\cdot 1) = x $$
> 
> 3. **Kommutativität**
> $$ \forall x,y \in B: \quad x+y = y+x, \quad x\cdot y = y\cdot x $$
> 
> 4. **Distributivität**
> 
> $$
> \forall x,y,z \in B:\quad
> \begin{cases}
> \quad x\cdot(y+z) = (x\cdot y) + (x\cdot z) \\
>  \quad x+(y \cdot z) = (x + y) \cdot (x + z)
> \end{cases}
> $$
>
> 5. **Komplementäres Element**
> 
> $$
> \forall x \in B ~\exists \bar{x} \in B : \quad x + \bar{x} =1, \quad x \cdot \bar{x} =0
> $$
> 
> 6. Die Menge $B$ muss mindestens zwei Elemente besitzen.

Zur Distributivität (4): dies gilt in der Booleschen Algebra im Gegensatz zur herkömmlichen Algebra, da z.B.

- herkömmlich: $2+(4\cdot 3) = 14$ jedoch $(2+3)\cdot (2+ 4)=30$ 
- boolesch: $1+1=1$ und $1+0=1$ sowie $1\cdot 1=1$

Es ergibt sich folgende Tabelle:

$$
\begin{array}{c||c|c||cc||c}
x~y~z & y+z & x\cdot (y+z) & x\cdot y & x\cdot z & (x\cdot y) + (x\cdot z) \\ \hline
0~0~0 & 0 & 0 & 0 & 0 & 0 \\
0~0~1 & 1 & 0 & 0 & 0 & 0 \\
0~1~0 & 1 & 0 & 0 & 0 & 0 \\
0~1~1 & 1 & 0 & 0 & 0 & 0 \\ \hline
1~0~0 & 0 & 0 & 0 & 0 & 0 \\
1~0~1 & 1 & 1 & 0 & 1 & 1 \\
1~1~0 & 1 & 1 & 1 & 0 & 1 \\
1~1~1 & 1 & 1 & 1 & 1 & 1 \\
\end{array}
$$

## Rechenregeln

Verwand mit den [Regeln des logischen Schließens](../Logik/Regeln%20des%20logischen%20Schließens.md)

> [!satz] **S1 - BOOL)** Rechenregeln der Booleschen Algebra.
> Seine $x,y,z \in B$, dann gelten folgende Rechenregelt bezüglich der Operatoren $+$ und $\cdot$
>
> $$
> \begin{align}
> &\begin{array}{l|c|c}
>  & + & \cdot \\ \hline
> \text{Idempotenz} & x+x=x & x\cdot x=x\\ 
> \text{Beschränktheit} & x+1=1 & x\cdot 0 = 0\\
> \text{Absorbtion} & x + (x\cdot y) = x & x \cdot (x + y) = x \\
> \text{Assoziativität} & (x+y)+z = x+(y+z) & (x\cdot y)\cdot z = x\cdot(y\cdot z) \\
> \text{Consensus} & \begin{array}{c}
> (x\cdot y) + (\bar{x}\cdot z) + (y+z)  \\
> =(x\cdot y) + (\bar{x}+z)
> \end{array} & \begin{array}{c}
> (x + y) \cdot (\bar{x}+ z) \cdot (y+z)  \\
> =(x + y) \cdot (\bar{x}+z)
> \end{array} \\ 
> \text{DeMorgan} & \overline{(x+y)}=\bar{x} \cdot \bar{y} & \overline{(x\cdot y)}=\bar{x} + \bar{y}\\
> \end{array}\\ \\
> &\text{Involution}\qquad \overline{(\bar{x})}=x
> \end{align}
> $$

## Schaltalgebra

Die Schaltalgebra ist eine spezielle version der Booleschen Algebra, bei der die Menge $B=\left\{ 0,1 \right\}$ ist.

Der Name des Operators $\cdot$ ist **UND** und $+$ ist **ODER**

$$
\begin{array}{c|c}
\text{Additionsmatrix} & \text{Multiplikationsmatrix} \\
\hline
\begin{array}{c|cc}
+ & 0 & 1 \\ \hline
0 & 0 & 1 \\ 1 & 1 & 10
\end{array} &
\begin{array}{c|cc}
\cdot & 0 & 1 \\ \hline
0 & 0 & 0 \\ 1 & 0 & 1
\end{array}
\end{array}
$$

> [!question] [Ansteuerlogik](Ansteuerlogik.md)

### Dualität

**Prinzip der Dualität:** Zu jedem Schaltausdruck $T$ existiert ein dualer Schaltausdruck $T^\mathrm{D}$

$T^\mathrm{D}$ wird gebildet indem man in $T$

- jedes $+$ durch $\cdot$
- jedes $\cdot$ durch $+$
- jede $0$ durch $1$
- jede $1$ durch $0$ ersetzt

