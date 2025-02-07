---
tags:
  - Halbleiter
aliases:
  - "#Halbleiter"
  - Halbleiterelektronik
keywords: 
subject:
  - Einführung Elektronik
  - VL
semester: WS24
created: 7. Februar 2025
professor:
  - Bernhard Jakoby
---
 
# Halbleiterphysik

## Bändermodell des [Siliziums](Silizium.md)

Bandstruktur: Aufpreizung der erlaubten Energieniveaus (siehe [Teilchen im Kasten](../../Elektrotechnik/Teilchen%20im%20Kasten.md)) durch Wechselwirkungen mit Nachbaratomen.

![invert_dark|700](assets/SiLeitungsValenzband.png)

Unterschiede des Bändermodells verschiedener Leiterklassen:

![1000](../../Hardwareentwicklung/assets/Baendermodell.png)




### Valenz und Leitungsband

Reines Silizium hat die Struktur eines Atomgitters.
![invert_dark|600](assets/Pasted%20image%2020250207135059.png)
- Das **Valenzband** ist das Energieniveau der Äußersten elektronen innerhalb des Gitters ([Valenzelektronen](../../Chemie/Valenzelektronen.md))
- Das **Leitungsband** ist das nächst oberste erlaubte Energieniveau auf dem sich freie elektronen aufhalten können  


Bei einem Intrinsischen[^1] halbleiter existieren grundsätzlich keine freien elektronen, da diese fest an das Atomgitter gebunden sind.

![invert_dark|500](assets/HalbleiterValenzLeitungsband.png)

Durch thermische Anregung werden einzelne Elektronen in das Leitungsband gehoben und hinterlassen freie Plätze („Löcher“). Dichte der erzeugten Ladungsträger:


$$
n_i^2=C \cdot e^{\left(-\tfrac{W_G}{k_b T}\right)}
$$

Dadurch können auch im [Valenzband](../../Chemie/Valenzelektronen.md) wieder Elektronen verschoben werden.

Statt der Bewegung dieser Valenzelektronen kann man auch das Wandern des Loches betrachten das sich wie ein positiv geladener Ladungsträger verhält. Die Löcher bewegen sich unabhängig von den „zugehörigen“ Elektronen.

## pn-Übergang

### Eigenleitungsdichte



---

[^1]: Intrinsisch: 
