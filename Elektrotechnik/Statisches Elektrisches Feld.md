---
banner: /Elektrotechnik/assets/mast.png
tags:
  - E-Feld
  - Elektrostatik
aliases:
keywords:
subject:
  - Einführung Elektrotechnik
  - VL
semester: WS23
created: 21. Januar 2024
professor:
  - Bernhard Jakoby
banner_y: 0.336
---

# Statisches Elektrisches Feld

> [!question] [Elektrisches Feld](Elektrisches%20Feld.md)

---

> [!hint]- Folgende Behandlung des E-Feld gilt nur in der Elektrostatik und näherungsweise bei langsamen Änderungen.
> Statisch: 
> - es ändert sich nichts mehr (eingeschwungener Zustand)
> - Keine ruckartigen/schnelle Änderungen
> - in der HF Technik sind einige Vereinfachungen der Elektrostatik nicht mehr gültig

> [!info] [Coulomb-Kraft](Coulomb-Kraft.md)
>Ähnlich wie das Schwerefeld einer Masse, kann auch einer einzelnen Ladung ein elektrisches Feld $\mathbf{E}$ zugeordnet werden.  
> Die [Kraft](../Physik/{MOC}%20Kräfte.md) auf eine Ladung 𝑞, die in dieses Feld eingebracht wird ergibt sich dann aus:
> $$\mathbf{F}=q\cdot \mathbf{E}$$
> 
>> [!success] Die [Kraft](../Physik/{MOC}%20Kräfte.md) auf eine Ladung $q$ in einem von $Q$ hervorgerufenen externen Elektrischen Feld ist proportional zu $q$ und $\mathbf{E}$  
>

![230](../_assets/EFeld.png)
Das Feld das eine Ladung $Q$ um sich herum erzeugt ist, ähnlich wie beim Schwerefeld mit sternförmig auseinander gehenden Feldlinien verknüpft und mit mit dem Quadrat des Abstandes ab; sein [Betrag](../Mathematik/Algebra/Betrag.md) reduziert sich mit dem Quadrat des Abstands zu dieser Ladung:

$$|\mathbf{E}| = \frac{Q}{4\pi\varepsilon_{0}r^{2}}$$

Die Einheit der elektrischen Feldstärke ist $1 \frac{V}{m}$.

> [!important] Wie im Schwerefeld der Erde gilt auch im [Elektrischen Feld](elektrisches%20Feld.md) der Energie-Erhaltungssatz 
> Die [Arbeit](../Physik/Mechanische%20Arbeit.md) und das Potenzial (von [Potentielle Energie](../Physik/Energieerhaltung.md)) im Statischen [E-Feld](elektrisches%20Feld.md) führt uns zur [elektrischen Spannung](elektrische%20Spannung.md)

## Statisches [E-Feld](elektrisches%20Feld.md) $\iff$ Gravitationsfeld

|                                                     Gravitationskraft                                                     |                                        [Coulomb-Kraft](Coulomb-Kraft.md)                                        |
| :-----------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------: |
|                                             $\mathbf{F} = m\cdot \mathbf{g}$                                              |                                        $\mathbf{F} = q \cdot \mathbf{E}$                                        |
|                                  $\mathbf{F} = m\cdot \dfrac{G\cdot M}{\mathbf{r}^{2}}$                                   |                    $\mathbf{F} = q \cdot \dfrac{Q}{4\pi\varepsilon_{0}\cdot \mathbf{r}^{2}}$                    |
|                                        ![invert_light\|325](../_assets/GravKraft.png)                                         |                                     ![invert_light\|375](../_assets/EKraft.png)                                     |
|                                                                                                                           |                                                                                                                 |
|                                        Gravitationsfeld der Erde mit der Masse $M$                                        |                                       elektrisches Feld einer Ladung $Q$                                        |
|                      $\mathbf{g} = -\dfrac{G\cdot M}{\lvert  \mathbf{r} \rvert^{3}}\cdot \mathbf{r}$                      |     $\lvert \mathbf{E} \rvert = \dfrac{Q}{4\pi\varepsilon_{0}\lvert \mathbf{r} \rvert^{3}}\cdot \mathbf{r}$     |
|                                         ![invert_light\|275](../_assets/GravFeld.png)                                         |                                           ![\|500](../_assets/EFeld.png)                                            |
|                                                                                                                           |                                                                                                                 |
|                                                          $F_{G}$                                                          |                                                     $F_{E}$                                                     |
| auf eine Masse $m$ wirkt im Gravitationsfeld $\mathbf{g}$ der Masse $M$ eine [Kraft](../Physik/{MOC}%20Kräfte.md) $F_{G}$ | Auf eine Ladung $q$ wirkt durch das durch $Q$ hervorgerufene E-Feld $\mathbf{E}$ eine [Kraft](Coulomb-Kraft.md) |

> [!warning] Unterschied zum G-Feld
> Ladungen können unterschiedliche Vorzeichen haben, Massen nicht. Elektrische Ladungen können sich daher anziehen und abstoßen, während sich massebehaftete Körper immer anziehen.

## Elektrische Feldstärke in einem Leiter

> [!question] [Materialgesetze](Materialgesetze.md)

Die elektrische Feldstärke im Leiter ist von der Stromdichte $\mathbf{J}$ und vom Materialabhängigen spezifischen Leitwert $\sigma$ bzw spez. Widerstand $\rho=\frac{1}{\sigma}$ Abhängig. Diese Beziehung ist stark mit dem [Ohmschen Gesetz](Ohmsches%20Gesetz.md) verwandt.

$$
\begin{align}
&\mathbf{E} = \frac{\mathbf{J}}{\sigma}=\mathbf{J}\cdot \rho
\end{align}
$$

# Beispiele

- Überlegung zu [Linienladung](Linienladung.md)
- Überlegung zu [Flächenladung](Flächenladung.md)
- Überlegung zu Kugelförmige Flächenladung

> [!EXAMPLE]- Stromfluss in Leitern  
> ![](../_assets/AufgabeLeitfaehigkeit.png)
>
> > [!SUCCESS]- Lösung  
> > ![](../_assets/UE01_k12136610-1.jpg)

> [!EXAMPLE]- Stromfluss in Leitern 2  
> ![](../_assets/AufgabeLeitfähigkeit2.png)
>
> > [!SUCCESS]- Lösung  
> > ![](../_assets/UE01_k12136610-2.jpg)

# Tags

- [ESD](../Hardwareentwicklung/ESD.md)
- [Coulomb-Kraft](Coulomb-Kraft.md)
- [Elektrisches Feld – Wikipedia](https://de.wikipedia.org/wiki/Elektrisches_Feld)

# Flashcards


