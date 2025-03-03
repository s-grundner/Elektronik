---
tags: 
aliases:
  - Magnetfeld
  - magnetische Feld
keywords: 
subject:
  - VL
  - Einführung Elektrotechnik
  - Elektrische Maschinen und Antriebselektronik
semester: SS25
created: 31. August 2023
professor:
  - Bernhard Jakoby
  - Wolfgang Gruber
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

> [!question]- Vergleich zur Stromstärke und Stromdichte: **Magnetische Flüsse** $\iff$ **Elektrische Ströme**
>  Die Beziehung zwischen diesem Fluss $\Phi$ und dem Feld B entspricht genau jener zwischen elektrischem Strom $I$ und elektrischer Stromdichte $J$
>  (obwohl im Magnetfeld nichts fließt)

$$\Phi = \int_{A}\vec{B} \cdot d\vec{A} \qquad [\Phi] = Vs = Wb\dots \text{Weber}$$



![invert_dark](assets/FeldSpule.png)

Durch die Geometrie der Wicklung der Spule wird ein Magnetfeld erzeugt, das äquivalent wäre zu $N$ Mal der Drahtfläche mit $N$ mal dem Stromfluss. Daher kann der Fluss vervielfacht werden. Es ergibt sich der Verkettete Fluss $\Psi$:

$$\Psi = N\cdot\Phi$$

## Materialgesetz

Magnetische Leitfähigkeit permeabilität:

eine Gut magnetisch Leitfähiges material möchte in einem Magnetfeld den Luftspalt minimieren.

z.B: Aluminium ist zwar gut elektrisch Leitfähig aber nicht magnetisch


ferromagnetisch: $\mu_{r} \gg$ 
diamagnetisch: $\mu_{r}<$  (material stoßt sich vom Magnetfeld leicht ab)

### Magnetische Sättigung

Ab einem Gewissen Strom wird der Kern des Magnetkreises nicht weiter Magnetisiert

- Querschnitt des Magnetkreises größer machen um Sättigungsinduktion zu minimieren

### Magnetische Quellen

> [!hint] Es gibt keine Magnetischen Monopole $\iff$ [4. Maxwell Gleichung](Maxwell.md#^MW4)

**Permanentmagneten**



**Elektromagneten**




# Flashcards

Was beschreibt der magnetische Fluss
?
Genau wie beim elektrischen Strom kann der Strom nur durch eine Fläche definiert werden.
Um die Größe des Magnetfelds darzustellen kann der Fluss durch eine Fläche bestimmt werden (z.B. Der Querschnitt einer [Spule](Induktivitäten.md))
$I = \int  \vec{J}\cdot d\vec{A} \iff \Phi = \int \vec{B}\cdot d\vec{A}$
<!--SR:!2024-03-16,1,230-->

# Übung