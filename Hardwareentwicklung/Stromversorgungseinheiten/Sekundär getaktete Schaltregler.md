---
tags: ["SMPS"]
aliases: ["Sekundär getakteter SMPS", "Sekundär getaktete SMPS"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 2nd October 2022
---

# Sekundär getaktete Schaltregle

>![SekGetaktSMPS](../assets/SekGetaktSMPS.png)

## 1. Netztraffo/Gleichrichter

Niederfrequenter Teil

## 2. Spannungsregelung

Hochfrequenter Teil

| Stufe | Beschreibung           |
| ----- | ---------------------- |
| A     | Schalter               |
| B     | Energiespeicher/Filter |
| C     | Regler                 |
| D     | Ansteuerschaltung      | 

## 3. Zu versorgende Schaltung

> [!NOTE] Es wird oft Analoge und Digitale Masse **Sternförmig** an die Masse des Netzteils geführt

# Eigenschaften

## Einsatzgebiete

- Dort wo eine galvanische Trennung bereits vorhanden ist.
- Bei [Akku](../../Chemie/Sekundärelement.md) betrieben Geräten

## Prinzip 

- Mittles Schaltglied werden Energieportionen aus der Eingangsspannugsquelle übernommen und in der [Induktivität](../../Elektrotechnik/Induktivitäten.md) gespeichert.
- $f\approx 20kHz - 2MHz$, des Tastverhältnis bestimmt den Energiefluss.
- Tiefpass am Ausgang glättet den Kontinuierlichen Energiefluss.

## Typen

- [Buck Converter](Buck%20Converter.md)
- [Boost Converter](Boost%20Converter.md)
- [Inverswandler](Inverswandler.md)

--- 

# Tags

![SMPS_intro](../assets/pdf/SMPS_intro.pdf)
