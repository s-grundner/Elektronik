---
tags:
  - Digital/ADC
aliases:
  - Successive Approximation Register ADC
  - SAR
created: 22. Dezember 2023
---

# Successive Approximation Register ADC

Wie in Abbildung 1 zu sehen ist, wird für den Aufbau des SAR-ADCs eine Filter-Baugruppe benötigt. In diesem Aufbau wird der Filter durch ein RC-Glied realisiert.

|![](assets/Pasted%20image%2020231223180638.png)   |
|---|
|Abbildung 1: Aufbau des SAR-ADCs|

**Begriffe:**  
_Tiefpass:_ Durch die Anordnung des Widerstands und des Kondensators weist die Schaltung ein Tiefpassverhalten auf. Das bedeutet, dass höhere Frequenzen stärker gedämpft werden als niedrigere Frequenzen. Ausschlaggebend für den Frequenzgang ist die Topologie des Filters und der Wert der _Grenzfrequenz._

_Ordnung:_ Die Ordnung eines Filters ist gegeben durch die Anzahl der in reihe-geschalteten Filter-Baugruppen. Da in diesem Fall nur _ein_ RC-Glied verwendet wird, spricht man von einem Filter _erster (1.)_ Ordnung.