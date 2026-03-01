---
tags:
aliases:
  - Miller
keywords:
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 3. Dezember 2024
professor:
  - Bernhard Jakoby
release: false
---
 
# Millereffekt

> [!tldr] Millereffekt: Scheinbare vergrößerung der Ausgangskapazität

Der Miller-Effekt beschreibt die Effekt, das Kapazitäten die zwischen einen Ein- und Ausgang eines verstärkers geschalten sind einen großen Einfluss auf dessen Grenzfrequenz haben können. Das ist darauf zurückzuführen, dass sich die **Quer-Kapazität** $C_{M}$ durch zwei äquivalente Kapazitäten am Ein- und Ausgang ersetzen lässt. Diese Kapazitäten sind Parallel zu Ein-/Ausgang und ihre größe ist abhängig von der **Verstärkung** der Schaltung. Das führt zu zusätzlichen Eckfrequenzen.

![invert_dark](assets/Pasted%20image%2020250211115450.png)

![invert_dark](assets/Pasted%20image%2020250211115504.png)

## Beim BJT

Bei Verstärkerschaltungen führt die Miller kapazität also zu einer erhöhung des effektiven Eingangswiderstandes und so zu einer niedrigeren Eckfrequenz am Eingang.

Der Effekt ist in der Praxis an der Basisschaltung nicht stark ausgeprägt, da die CE-Kapazität die Miller Kapazität darstellt im Gegensatz zur CB-Kapazität oder BE-Kapazität die bei Emitter- und Kollektorschaltung die Miller Kapazitäten sind.

Die CE Kapazität ist wesentlichkleiner als die CB oder BE Kapazitäten.

> [!success] Umgehung des Miller effekts mit einer [BJT Kaskode Schaltung](BJT%20Kaskode%20Schaltung.md)