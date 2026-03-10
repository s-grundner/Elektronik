---
tags:
  - Baugruppe/Versorgung/SMPS
  - index
aliases:
  - SMPS
  - Switched Mode Power Supply
  - Schaltregler
  - "#Baugruppe/Versorgung/SMPS"
  - Stromversorgungseinheiten
  - Schaltnetzteil
subject:
  - hwe
created: 6th April 2022
title: Stromversorgungseinheiten
release: false
---

# Schaltnetzteil

Auch SMPS (Switched Mode Power Supply)

```dataview
TABLE WITHOUT ID file.link AS "🗺️Map of Content - SMPS" FROM #Baugruppe/Versorgung/SMPS AND -#MOC
```

^MOC

## Vor und Nachteile

> [!success] Vorteile
> - Einsatz in praktisch allen Elektrischen Geräten
>     - Consumer Gadgets (Fernseher, Mobiltelefon)
>     - Industrie
>     - [Automotive](https://en.wikipedia.org/wiki/Automotive_industry)
> - Hoher Wirkungsgrad
> - Hohe Taktfrequenz ($20\mathrm{kHz}$ bis $1\mathrm{MHz}$)
>     - kleine Bauteilgrößen
>     - hohe Wirtschaftlichkeit (Herstellung und Betrieb)
>  

> [!error] Nachteile
> - Aufwändige Schaltung
> - [EMV](../Elektromagnetische%20Verträglichkeit.md)-Störungen
> - Restwelligkeit

## Einteilung der SMPSs

Prinzipiell unterscheidet man zwischen:
- Ungeregelten SMPS
- Geregelten SMPS

## Prinzipien der Schaltregler

- [Sekundär getaktete Schaltregler](Sekundär%20getaktete%20Schaltregler.md)  
- [Primär getakteter Schaltregler](Primär%20getakteter%20Schaltregler.md)

## Layout von SMPS

Steht immer im Datenblatt des jeweiligen Schalt-ICs

- Switch-Node zwischen Spule und IC sehr Kurz
- Feedbackleitung dünn und weit weg/isoliert von der Switch Leitung

# References

- [Schmidt-Walter Schaltnetzteildimensionierung](http://schmidt-walter-schaltnetzteile.de/smps/smps.html)
- [SMPS_intro [INTERNAL]](../../xEDU/xLiteratur/Schaltungstechnik/SMPS_intro.pdf)
- [How Buck, Boost & Buck-Boost DC-DC Converters Work - YouTube](https://youtu.be/PgTR7226sHU?si=-SreeAKORy7fAJbs)
- [How to Design Buck, Boost & Buck-Boost DC-DC Converters - YouTube](https://youtube.com/watch?v=IyiCHMHE5Qg&si=NtzZZLiLk-NK0OSn)
- [Everything is Better: GaN vs Silicon Power Supplies - YouTube](https://youtu.be/vgmqUhvQlww?si=xAHHJ0pbka7vFf9a)
- GaN HEMPT vs Si MOSFET