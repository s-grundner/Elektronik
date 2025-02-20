---
tags: 
aliases:
  - Magnetfeld
  - magnetische Feld
keywords: 
subject:
  - VL
  - Einführung Elektrotechnik
semester: WS23
created: 31. August 2023
professor:
  - Bernhard Jakoby
---
 

# Magnetisches Feld

> siehe: [elektrisches Feld](elektrisches%20Feld.md) 

> [!hint] Auf bewegte Ladungsträger innerhalb eines Magnetfelds wirkt die [magnetische Kraft](Laplace-Kraft.md):
> Die Ursache für ein magnetisches Feld sind selbst *bewegte* Ladungsträger

## Magnetfeld im Leiter

> [!info] Rechte Hand Regel
> ![InlineR](assets/rechteHandLeiterMagnFeld.png)Feld um einen (*unendlich ausgedehnten*) langen Draht der den [Strom](elektrischer%20Strom.md) 𝐼 führt:
> Die Feldlinien sind konzentrische Kreise, die den stromführenden Leiter rechtswendig (s. Rechte-Hand-Regel) „umwirbeln“. 

Der Betrag des magnetischen Flusses $\vec{B}$ im Abstand 𝑟 der Leiterachse ist gegeben durch.

$$
B(r) = \frac{\mu_{0}\cdot I}{2\pi r} \qquad[B] = \frac{Vs}{m^{2}} = T \dots \text{Tesla}
$$

$\mu_{0} \approx 4 \pi 10^{-7} \frac{\mathrm{Vs}}{\mathrm{Am}} \ldots$ [Permeabilität](../Physik/Konstanten/Permeablitätskonstante%20des%20Vakuum.md) des freien Raumes, Naturkonstante

## Der magnetische Fluss

Anstelle der lokalen Feldstärke B beschreibt man das Feld auch gerne durch einen so genannten magnetischen Fluss $\Phi$, der eine bestimmte Fläche (z.B. die Querschnittsfläche eines Stabmagneten) durchsetzt.

> [!question]- Vergleich zur Stromstärke und Stromdichte:
>  Die Beziehung zwischen diesem Fluss $\Phi$ und dem Feld B entspricht genau jener zwischen elektrischem Strom $I$ und elektrischer Stromdichte $J$
>  (obwohl im Magnetfeld nichts fließt)

$$\Phi = \int_{A}\vec{B} \cdot d\vec{A} \qquad [\Phi] = Vs = Wb\dots \text{Weber}$$

![invert_dark](assets/FeldSpule.png)

Durch die Geometrie der Wicklung der Spule wird ein Magnetfeld erzeugt, das äquivalent wäre zu $N$ Mal der Drahtfläche mit $N$ mal dem Stromfluss. Daher kann der Fluss vervielfacht werden. Es ergibt sich der Verkettete Fluss $\Psi$:

$$\Psi = N\cdot\Phi$$

## Induktionsphänomene

Induktionsphänomene kamen bisher nicht vor, weil wir und nicht um Zeit Abhängigkeiten des Feldes gekümmert haben. Diese Phänomene treten nämlich nur in *Wechselfeldern* auf.

### Ruheinduktion

Ein magnetisches Wechselfeld erzeugt elektrische Wirbelfelder - dies bedeutet, dass geschlossene elektrische Feldlinien auftauchen!

> [!info] Ein sich zeitliches wechselndes Magnetfeld wird von einem elektrischen Feld *linkswendig* umwirbelt.
> Es wird also nicht durch Ladungen erzeugt, sondern durch die Änderung des magnetischen Feldes. (Warum wissen wir nicht -> Naturgesetz) Am naheliegendsten ist die Lenz'sche Regel

Wenn man einen Leiter entlang des Wirbelfeldes $\vec{E}_{W}$ legt, verschieben sich die Ladungen entlang des Leiters und an den Klemmen entsteht ein [Potenzialdifferenz](elektrische%20Spannung.md).


![invert_dark](assets/Wechselfelder.png)

es ergibt sich die *induzierte* Spannung:

$$u_{ind}=\frac{d\Phi}{dt}$$

> [!hint] [Maxwell](Maxwell.md)-Gleichung 
> Diese Wirbelfelder werden durch das Faraday'sche Gesetz beschrieben:
> $$\oint_{\partial A} \vec{E} \cdot d \vec{s}=-\int_{A} \frac{\partial \vec{B}}{\partial t} \cdot d \vec{a}$$
> In dem minus steckt die *linkswendigkeit* des umwirbelnden E-Felds. Die Fläche ä$A$ ist jene die der Leiter Aufspannt und die Kontur $\partial A$ der leiter selbst.
> 
> Im statischen Fall entspricht das der bereits bekannten Beziehung $\oint_{\partial A} \vec{E}\cdot d\vec{s} = 0$
> Also dass die Spannung an den Klemmen 0 ist.

### Bewegungsinduktion

![invert_dark](assets/BewegterLeiter.png)

# Flashcards

Was beschreibt der magnetische Fluss
?
Genau wie beim elektrischen Strom kann der Strom nur durch eine Fläche definiert werden.
Um die Größe des Magnetfelds darzustellen kann der Fluss durch eine Fläche bestimmt werden (z.B. Der Querschnitt einer [Spule](Induktivitäten.md))
$I = \int  \vec{J}\cdot d\vec{A} \iff \Phi = \int \vec{B}\cdot d\vec{A}$
<!--SR:!2024-03-16,1,230-->

# Übung