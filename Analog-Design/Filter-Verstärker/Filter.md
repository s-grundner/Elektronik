---
tags:
  - Baugruppe/Filter
aliases:
keywords:
subject:
  - VL
  - Elektrotechnik
semester: SS24
created: 22. Januar 2024
professor:
  - Andreas Springer
title: FIR-Filter
---
 

# Filter

> [!quote] Unter einem Filter versteht man ...
> ... ein [System](../../Systemtheorie/index.md), das gewisse Frequezkomponenten eines [Signals](../../Systemtheorie/Signale.md) im Vergleich zu anderen verändert, z.B. durch
>
> - Unterdrückung
> - Verstärkung
> - Phasenverschiebung

Diese veränderungen werden mithilfe einer [Übertragungsfunktion](../../Systemtheorie/Frequenzbereichsmethoden/Übertragungsfunktion.md) beschrieben.

## Übertragungsfunktionen

- [Tiefpass](Tiefpass.md) Filter
- [Hochpass](Hochpass.md) Filter
- [Bandpass](Bandpass.md) Filter
- Andere (Kombinationen)


> [!info] Übergangsbereiche von Filtern
> 
> deale Tiefpässe (sog. brick-wall filter) existieren nicht. Daher können reale Filter einen idealen Filter nur approximieren. In der Praxis werden die Filtereigenschaften in sog. Durchlass-, Übergangsund Sperrbereichen definiert und in einem Toleranzschema zusammengefasst. Der Verlauf des zu designenden Filters sollte dann innerhalb der definierten Grenzen liegen.
> 
> ![invert_dark|800](../../_assets/Pasted%20image%2020241212004843.png)


## Kenngrößen

- Ordnung (Steilheit)
- [Grenzfrequenz](Grenzfrequenz.md)
- [Güte](Güte.md) (Resonanzverhalten)

## Art des Aufbaus

- [Passiver Filter](Passiver%20Filter.md) / [Aktiver Filter](Aktiver%20Filter.md) / [Digitaler Filter](../../Systemtheorie/Signalverarbeitung/Digitaler%20Filter.md)
- Filtercharakteristik (Verhalten der Schaltung)
    - Form der Übertragungsfunktion
- Topologie (Realisierung der Schaltung)
> 
