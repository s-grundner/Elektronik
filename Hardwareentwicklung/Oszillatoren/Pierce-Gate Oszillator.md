---
tags: ["MCU", "Baugruppe/Oszillator"]
aliases: ["Pierce Gate Oszillator", "PGO"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 1st February 2023
---

# Pierce-Gate Oszillator

> [!info] Wegen der Verzerrten Wellenform eines Schwingquarzes, ist intern zu einem Mikrocontroller ein Pierce-Gate Oszillator (PGO) verbaut.
> - Der Inverter treibt den [Schwingquarz](Quartzoszillator.md).
> - Der [Schmitt Trigger](../Schmitt%20Trigger.md) am Ausgang dient als Ausgangstreiber und sorgt dafür, dass die Flanken mit der Slewrate des [Schmitt-Triggers](../Schmitt%20Trigger.md) am Ausgang ansteigen und der [Quarz](Quartzoszillator.md) nicht Belastet wird.

|   ![](assets/WAVXTAL2.png)   |     |
| :--------------------------: | --- |
| Reale Wellenform des Quarzes |     |

## Schaltbild des PGO

 ![600](../assets/PGO.png)

## Passive Bauteile

> [!summary] $C_{L}= \dfrac{(C_{1}+C_{in})\cdot(C_{2}+C_{out})}{C_{1}+C_{in}+C_{2}+C_{out}} +C_{streu}$
> 
$R_{1} = 1M\Omega$
$R_{2} = 2k\Omega$ Begrenzt die Treiberstärke um den [Quarz](Quartzoszillator.md) nicht zu übersteuern
$C_{1}, C_{2} \dots 20-30pF \rightarrow$ bilden $C_{Last}$. Werte sind im Datenblatt des [XTAL](Quartzoszillator.md) angegeben
$C_{streu} = 2-3pF$

# Tags

[Quartzoszillator](Quartzoszillator.md)

[Schmitt Trigger](../Schmitt%20Trigger.md)
