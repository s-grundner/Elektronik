---
tags:
  - Messgerät
aliases:
  - Oszilloskops
created: 22. Dezember 2023
---

# Oszilloskop

## Kanäle

![InlineR|450](assets/Pasted%20image%2020231223004759.png) [^1]

Das Oszilloskop verfügt über ein bis 4 Kanäle Kanäle, mit welchen jeweils verschiedene Signale gemessen werden können. An die BNC-Stecker unterhalb der Kanal-Menü Tasten sind die Proben für die jeweiligen Signal anzustecken.

### Kopplung

Mit der Kopplung eines Kanals lässt sich einstellen, mit welcher Referenz das Signal angezeigt wird. Bei der DC-Kopplung wird das Signal mit Bezug auf 0V dargestellt.

Bei der AC-Kopplung wird als Referenz der Mittelwert des Signals genommen, um nur den Wechselanteil des Signals darzustellen.

### Invertierung

### Bandbreitenbegrenzung

Die Bandbreitenbegrenzung wird durch einen Tiefpass im Oszilloskop realisiert, um hochfrequente Störsignale zu Filtern [^2].

## Trigger

Der Einstellung des Triggers legt fest, wann das Oszilloskop eine neue Periode des Wechselsignals aufnimmt. Üblicherweise erfolgt dies über das Festlegen eines Schwellenwertes des Signals. Es ist aber auch möglich, das Trigger Signal extern einzuspeisen. Im Fall des Agilent 5441D ist es auch möglich den Trigger auf einen der 16 Digitalen Pins zu setzen.

## Tastköpfe

Das besondere an den Tastköpfen des Oszilloskops ist, dass sie frequenzkompensierte [[Spannungsteiler]] sind.

![[OszTastkopfSpgTeiler.png]]

# Tags

[^1]: Agilent 5441D
[^2]: [Keysight EDADOCS - BW-Limit](https://edadocs.software.keysight.com/kkbopen/what-is-the-bandwidth-limit-bw-limit-feature-and-how-does-it-differ-among-the-various-models-of-infiniium-scopes-589305657.html)