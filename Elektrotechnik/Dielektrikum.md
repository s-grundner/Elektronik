---
tags:
  - Konstante
  - Physik
aliases:
  - Permittivität
  - Dielektrikums
  - relative Dielektrizitätszahl
  - Dielektrizitätskonstante
  - elektrische Polarisation
keywords:
subject:
  - VL
  - Einführung Elektrotechnik
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 15th January 2026
professor:
symbol: $\epsilon_{0}$
value: $8.8541878128(13)\cdot 10^{-12}$
unit: $\mathrm{\dfrac{As}{Vm}}$
release: true
title: Dielektrikum
---
 

# Permittivität des Vakuums

> [!def] $\epsilon_{0}=8.8541878128(13)\cdot 10^{-12} \mathrm{\frac{As}{Vm}}$ ^DEF
> 
> auch mit der Einheit $\dfrac{F}{m}$

> [!question] [Materialgesetze](Materialgesetze.md)

---

# Materialgesetz

> [!def] Materialgesetz
> $$
> \mathbf{D}=\epsilon \mathbf{E}  \qquad
> [\epsilon] = [\epsilon_{0}] = \mathrm{\frac{As}{Vm}} = \mathrm{\frac{F}{m}}
> $$

## Dielektrika und Polarisation

> [!info] Medien die elektrisch [Polarisierbar](../Chemie/Polarisation.md) sind, heißen Dielektrika
> Auch nicht leitfähige Materialien können auf elektrische Felder durch interne Ladungsverschiebungen reagieren – dabei wird keine Nettoladung generiert aber lokal können positive und anderswo gegengleiche negative Ladungsüberschüsse entstehen.
> Man modelliert diesen Effekt durch so genannte [Dipole](elektrischer%20Dipol.md) – das ist im Modell eine positive Ladung die in einem bestimmten Abstand einer gegengleichen negativen Ladung gegenüber steht.
> Den Effekt nennt man elektrische *[Polarisation](../Chemie/Polarisation.md)*. 

> [!important] [Polarisation](../Chemie/Polarisation.md): Ladungsschwerpunkte des Moleküls, richten sich nach dem [elektrischen Feld](elektrisches%20Feld.md) aus
> Dielektrika, die man in ein [elektrisches Feld](elektrisches%20Feld.md) einbringt [Polarisieren](../Chemie/Polarisation.md) sich, wodurch das [E-Feld](elektrisches%20Feld.md) abgeschwächt wird, obwohl sie nicht Leitfähigkeit sind.

![invert_dark](../_assets/Pasted%20image%2020240310011251.png)

Die Materialeigenschaft, wie ein Dielektrikum mit einem [Elektrischen Feld](elektrisches%20Feld.md) wechselwirkt, wird als Permittivität $\epsilon$ (Dielektrizitätszahl) bezeichnet. 

Je nach dem ob das elektrische Feld [dynamisch](Dynamisches%20Elektrisches%20Feld.md) (schnell veränderlich) oder [statisch](Statisches%20Elektrisches%20Feld.md) (hinreichend langsam) ist, können Vereinfachungen getroffen werden.

## Elektrostatik

Die Permittivität ist in der Regel indirekt Proportional zur elektrischen Feldstärke. Je nachdem wie stark ein Dielektrikum Polarisierbar ist, wird das Feld dementsprechend abgeschwächt.  


> [!satz] **S)** Permittivität im statischen Fall ^STAT-PERM
>
> $$
> \epsilon = \epsilon_{0}\epsilon_{r} \quad\text{mit}\quad \epsilon_{r}\in \mathbb{R}
> $$

## Elektrodynamik

In Wechselfeldern müssen die dynamischen Eigenschaften des Materials berücksichtigt werden.

> [!question] Unterstrichene Symbole deuten darauf hin, dass diese als [Phasor](Wechselstromtechnik.md) notiert sind.

Polarisation von Atomen oder Molekülen erzeugen elektrische [Dipolmomente](../Chemie/Dipol%20(Chemie).md), welche die elektrische Flussdichte $\mathbf{\underline{D}}$ verstärken.

Hinzu kommt der **polarisations Vektor** $\mathbf{P}_{e}$ wobei

$$
\mathbf{\underline{D}} = \epsilon_{0} \mathbf{\underline{E}} + \mathbf{\underline{P}}_{e}
$$

Mit der elektrischen **suszeptibilität** $\chi_{e} \in \mathbb{C}$ erhält man

$$
\mathbf{\underline{P}}_{e} = \epsilon_{0}\chi_{e}\mathbf{\underline{E}}
$$

Wenn das Material in ein gebiet verschoben wird in dem ein externes E-Feld wirk, richten sich die inhärenten Dipole des Materials nach dem Feld aus.

![invert_dark|500](../_assets/Pasted%20image%2020260116165414.png)

Diese Dipole können Ionen, Atome etc. sein. Je höher die Änderungsrate des Feldes, desto kleiner werden die betroffenen teilchen. Einsetzten liefert

$$
\mathbf{\underline{D}} = \epsilon_{0}(1+\chi_{e}) \mathbf{\underline{E}} = \epsilon \mathbf{\underline{E}}
$$

wobei

> [!satz] **S)** komplexe Permittivität ^CPLX-PERM
>
> $$
> \epsilon = \epsilon'-j\epsilon'' = \epsilon_{0}(1+\chi_{e}) \in \mathbb{C}
> $$

die komplexe permittivität des Mediums ist. Der Imaginärteil von $\epsilon$ beschreibt [Verluste](Verlustwinkel.md) im Medium (wärme), die durch die dämpfung der schwingenden Dipolmomente verursacht werden (vergleiche mit [Federschwinger](../Physik/Feder-Schwinger.md)).

> [!question] Begründung zur komplexwertigkeit der Permittivität
> 
> Bei höher werdenen Frequenzen kommt die Schwingung der Dipole nicht mehr dem Feld hinterher, wodurch eine Phasenverschiebung zwischen Schwingung der Dipole und dem Feld auftritt. 

## Isotropie

Für [isotrope](../Dictionary/Isotrop.md) dielektrika gilt, dass deren Permittivität ein Skalarer wert ist. Ist ein Material **anisotrop** - bedeutet, dass sich die Permittivität ortsabhängig im Material ändert - wird die Permittivität durch einen [Tensor](../Mathematik/Algebra/Tensor.md) vom Rang 2 (Dyade) beschrieben.

![invert_dark|400](../_assets/Excalidraw/Dielektrikum%202026-01-16%2020.43.02.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/Dielektrikum%202026-01-16%2020.43.02.excalidraw.md)%%

Hier im kartesischen Koordinatensystem:

$$
\begin{bmatrix}
D_{x} \\ D_{y} \\ D_{z} \\
\end{bmatrix} = 
\begin{bmatrix}
\epsilon_{xx} && \epsilon_{xy} && \epsilon_{xz} \\
\epsilon_{yx} && \epsilon_{yy} && \epsilon_{yz} \\
\epsilon_{zx} && \epsilon_{zy} && \epsilon_{zz} \\
\end{bmatrix} \begin{bmatrix}
E_{x} \\ E_{y} \\ E_{z} \\
\end{bmatrix} = [\epsilon] \begin{bmatrix}
E_{x} \\ E_{y} \\ E_{z} \\
\end{bmatrix}
$$

> [!important] Für Anisotrope Materialien ist die Permittivität ortsabhängig.
> 
> Möchte man die Maxwellgleichungen
> 
> ![](Maxwell.md#^MW3)
> 
> für anisotrope materialien unter verwendung von
> 
>  $$
> \mathbf{D} = [\epsilon]\mathbf{E}
> $$
>  
>  lösen, muss beachtet werden, dass die Ortsableitungen im [Nabla Operator](../Mathematik/Analysis/Vektoranalysis/Nabla%20Operator.md) auch auf die Permittivität unter der Verwendung der Produktregel für die Diveregenz
>  
>  $$
>  \nabla \cdot (\varphi \boldsymbol{A}) = \varphi \nabla \cdot \boldsymbol{A} + \boldsymbol{A} \cdot \nabla \varphi
>  $$
> 
> anzuwenden ist.