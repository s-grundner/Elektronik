---
tags:
  - E-Feld
aliases:
  - statischen E-Feld
  - E-Feld
  - E-Feldstärke
  - Elektrische Feldstärke
  - elektrisches Feld
  - elektrischen Feld
keywords: 
subject:
  - Einf. ET
  - "335.005"
semester:
  - WS23
  - B1
created: 21. Januar 2024
professor:
  - Bernhard Jakoby
---

# Elektrisches Feld

> [!info] Das elektrische Feld beschreibt Kraftwirkungen auf Objekte, die eine elektrische [Ladung](elektrisches%20Feld.md) tragen.
> - Die Ursache elektrischen Felder sind selbst Ladungen.
> - Die Ladungen können ruhen oder in Bewegung sein

> [!hint]- Folgende Behandlung des E-Feld gilt nur in der Elektrostatik und näherungsweise bei langsamen Änderungen.
> Statisch: 
> - es ändert sich nichts mehr (eingeschwungener Zustand)
> - Keine ruckartigen/schnelle Änderungen
> - in der HF Technik sind einige Vereinfachungen der Elektrostatik nicht mehr gültig

> [!info] [Coulomb-Kraft](Coulomb-Kraft.md)
>Ähnlich wie das Schwerefeld einer Masse, kann auch einer einzelnen Ladung ein [elektrisches Feld](elektrisches%20Feld.md) $E$ zugeordnet werden.  
> Die [Kraft](../Physik/Kraft.md) auf eine Ladung 𝑞, die in dieses Feld eingebracht wird ergibt sich dann aus:
> $$\vec{F}=q\cdot \vec{E}$$
> 
>> [!success] Die [Kraft](../Physik/Kraft.md) auf eine Ladung $q$ in einem von $Q$ hervorgerufenen externen [Elektrischen Feld](elektrisches%20Feld.md) ist proportional zu $q$ und $E$  
>

![inlineR\|395](EFeld.png)
Das Feld das eine Ladung $Q$ um sich herum erzeugt ist, ähnlich wie beim Schwerefeld mit sternförmig auseinander gehenden Feldlinien verknüpft und mit mit dem Quadrat des Abstandes ab; sein [Betrag](../Mathematik/Betrag.md) reduziert sich mit dem Quadrat des Abstands zu dieser Ladung:

$$|\vec{E}| = \frac{Q}{4\pi\varepsilon_{0}r^{2}}$$

Die Einheit der elektrischen Feldstärke ist $1 \frac{V}{m}$.

> [!important] Wie im Schwerefeld der Erde gilt auch im [Elektrischen Feld](elektrisches%20Feld.md) der Energie-Erhaltungssatz 
> Die [Arbeit](../Physik/Mechanische%20Arbeit.md) und das Potenzial (von [Potentielle Energie](../Physik/Energieerhaltung.md)) im Statischen [E-Feld](elektrisches%20Feld.md) führt uns zur [elektrischen Spannung](elektrische%20Spannung.md)

## Statisches [E-Feld](elektrisches%20Feld.md) $\iff$ Gravitationsfeld

|                Gravitationskraft                 | [Coulomb-Kraft](Coulomb-Kraft.md) / [Coulomb-Kraft](Coulomb-Kraft.md) |
| :----------------------------------------------: | :-----------------------------------------------------------------------------------: |
|            $\vec{F} = m\cdot \vec{g}$            |                              $\vec{F} = q \cdot \vec{E}$                              |
| $\vec{F} = m\cdot \dfrac{G\cdot M}{\vec{r}^{2}}$ |          $\vec{F} = q \cdot \dfrac{Q}{4\pi\varepsilon_{0}\cdot \vec{r}^{2}}$          |
|          ![invert_light\|400](assets/GravKraft.png)          |                        ![invert_light\|525](assets/EKraft.png)                        |

|               Gravitationsfeld der Erde mit der Masse $M$                | [elektrisches Feld](elektrisches%20Feld.md) einer Ladung $Q$ |
|:------------------------------------------------------------------------:|:------------------------------------------------------------:|
| $\vec{g} = -G\cdot M\cdot \dfrac{1}{ \mid \vec{r}\mid^{3}}\cdot \vec{r}$ |   $\mid\vec{E}\mid = \dfrac{Q}{4\pi\varepsilon_{0}r^{2}}$    |
|                ![invert_light\|425](assets/GravFeld.png)                 |                  ![\|500](assets/EFeld.png)                  |

| $F_{G}$                                                                                 | $F_{E}$                                                                                  |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| auf eine Masse $m$ wirkt im Gravitationsfeld $\vec{g}$ der Masse $M$ eine [Kraft](../Physik/Kraft.md) $F_{G}$ | Auf eine Ladung $q$ wirkt durch das durch $Q$ hervorgerufene [E-Feld](elektrisches%20Feld.md) $\vec{E}$ eine [Kraft](Coulomb-Kraft.md) |

> [!warning] Unterschied zum G-Feld
> Ladungen können unterschiedliche Vorzeichen haben, Massen nicht. Elektrische Ladungen können sich daher anziehen und abstoßen, während sich massebehaftete Körper immer anziehen.

## Feldstärke in einem Leiter

$$
\begin{align}
&\vec{E} = \frac{\vec{J}}{\sigma}=\vec{J}\cdot \rho
\end{align}
$$

# Beispiele

- Überlegung zu [Linienladung](Linienladung.md)
- Überlegung zu [Flächenladung](Flächenladung.md)
- Überlegung zu [[Kugelförmige Flächenladung]]

> [!EXAMPLE]- Stromfluss in Leitern  
> ![](assets/AufgabeLeitfaehigkeit.png)
>
> > [!SUCCESS]- Lösung  
> > ![](assets/UE01_k12136610-1.jpg)

> [!EXAMPLE]- Stromfluss in Leitern 2  
> ![](assets/AufgabeLeitfähigkeit2.png)
>
> > [!SUCCESS]- Lösung  
> > ![](assets/UE01_k12136610-2.jpg)

# Tags

- [ESD](../Hardwareentwicklung/ESD.md)
- [Coulomb-Kraft](Coulomb-Kraft.md)
- [Elektrisches Feld – Wikipedia](https://de.wikipedia.org/wiki/Elektrisches_Feld)

# Flashcards

Was beschreibt das elektrische Feld?;;Das elektrische Feld beschreibt Kraftwirkungen auf Objekte, die eine elektrische Ladung tragen.
<!--SR:!2024-03-10,2,190-->
Wie verhält sich ein *Elektron* (kinematisch), welches in ein *in x-Richtung orientiertes* homogenes [elektrisches Feld](elektrisches%20Feld.md) eingebracht wird?;;es beschleunigt in negative x-Richtung.
<!--SR:!2024-03-09,7,250-->
Ein leifähiger elliptischer Zylinder wird in ein homogenes [E-Feld](elektrisches%20Feld.md) eingebracht: ![](assets/feldAequiPotLinien.png) welches sind die Feldlinien und welches die Äquipotentiallinien
?
Normal zur Ellipse: Feldlinien
Tangential zur Ellipse: Äquipotentiallinien
<!--SR:!2024-03-21,13,266-->


