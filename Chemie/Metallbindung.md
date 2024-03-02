---
tags:
  - Chemie/Anorganisch
aliases:
  - Metall
  - Drude
  - Metalle
subject:
  - chemie
created: 31. August 2023
professor:
  - Fritz Struber
  - Bernhard Jakoby
---

# Metallbindung

![inlineR|340](assets/metall_bdg_anim.gif)

Starke Anziehungskräfte zwischen [Kationen](Ionenbindung.md) und Elektronengas (auch Fermi-[Gas](../Physik/Allgemeines%20Gasgesetz.md)) halten das Metallgitter zusammen.

## 1 Eigenschaften Von Metallen

Aus Gitteraufbau folgt:
- bei Raumtemperatur sind diese fest (Ausnahmen: $Hg,Cs,Ga$)
- sehr gute [elektrische Leiter](elektrischer%20Leiter.md) (Leiter 1. Klasse)
- sind glänzend
- sind duktil (mechanisch verformbar) $\rightarrow$ Gitterebenen gleiten übereinander
- bilden **Legierungen** (Atome im Metallgitter können ausgetauscht werden)

>[!NOTE] Legierung  
Mischung von min. zwei Metallen (oder Metalle und Nichtmetalle)

## 2 [Elektrische Leitfähigkeit](elektrischer%20Leiter.md)

> [!QUESTION] In elektrischen Leitern liegen bewegliche Ladungsträger vor.

Im Falle von Metallen arrangieren sich die Atome in einem Gitter wobei die äußeren Elektronen der Atome sich relativ *frei* zwischen den Gitterbausteinen (Atome ohne äußere Elektronen, also positiv geladene Ionen) bewegen können.

Da diese Situation für diese so genannten Leitungselektronen ähnlich ist, wie die von Molekülen eines Gases spricht von einem *Elektronengas* oder Fermi-[Gas](../Physik/Allgemeines%20Gasgesetz.md).

> [!WARNING] Das Metall ist an sich elektrisch neutral,  
>  wenn die Leitungselektronen sich aber ungleichmäßig verteilen, dann kann es zu lokalen positiven oder negativen Ladungsüberschüssen kommen.

> [!HINT] Die Leitungselektronen führen eine thermische Wimmelbewegung aus.  
> Der [Betrag](../Mathematik/Betrag.md) dieser [Geschwindigkeit](../Physik/Kinematik.md) kann in der Größenordnung von $10^6  \frac{m}{s}$ sein
>
> > [!INFO] liegt damit weit über den Driftgeschwindigkeiten, die durch elektrischen [Strom](../Elektrotechnik/elektrischer%20Strom.md) verursacht werden
> 

### 2.1 Drude-Modell - Modell für den elektrischen [Strom](../Elektrotechnik/elektrischer%20Strom.md)

Da im [Elektrischen Feld](../Elektrotechnik/Elektrisches%20Feld.md) auf ein Elektron die [elektrische Kraft](../Elektrotechnik/Elektrische%20Kraft.md) $-e\cdot \vec{E}$ wirkt und *massebehaftete* Körper (also auch Elektronen) unter Einfluss einer [Kraft](../Physik/Newtonsche%20Axiome.md) beschleunigen, müssten alle Elektronen unter Einfluss dieses E-Feldes in negative Richtung beschleunigen. 

Dies würde bedeuten, dass der [Strom](../Elektrotechnik/elektrischer%20Strom.md) mit der Zeit ansteigt. Wir wissen aber dass dem nicht so ist und der [Strom](../Elektrotechnik/elektrischer%20Strom.md) in einem Leiter bei konstanter [Spannung](../Elektrotechnik/Spannung.md) ebenfalls Konstant ist ([Ohm'sches Gesetz](../Elektrotechnik/Ohmsches%20Gesetz.md)) ist. Das lässt sich mit dem Drude-Modell zeigen.

![|600](assets/Drude.png)

Während bei der [Influenz](../Elektrotechnik/elektrische%20Influenz.md) die Ladungsträgerbewegung relativ rasch wieder zum Erliegen kommt (typischerweise Picosekunden!) wird im Falle eines kontinuierlichen elektrischen Stromflusses das treibende Feld aufrecht erhalten indem man die Elektronen am einen Ende aufnimmt und am anderen einspeist.
Dies kann durch eine elektrische Spannungsquelle bewerkstelligt werden – dadurch bleibt das treibende elektrische Feld trotz der Elektronenbewegung aufrecht.

> [!warning] Unter Annahme eines konstanten Feldes 𝐄 würde ein Elektron mit der [Kraft](../Physik/Newtonsche%20Axiome.md) −𝑒𝐄 beschleunigt.
> Tatsächlich stellt sich aber eine mittlere Driftgeschwindigkeit 𝐯 ein, die in erster Näherung proportional zu 𝐄 ist.
> Der Grund liegt in der Wechselwirkung (Stößen) mit dem Gitter.