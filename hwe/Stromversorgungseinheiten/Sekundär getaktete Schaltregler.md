---
tags: ["Sekundär getaktete SMPS"]
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 2nd October 2022
---

# Sekundär getaktete Schaltregle
>![SekGetaktSMPS](assets/SekGetaktSMPS.png)
### 1. Netztraffo/Gleichrichter
Niederfrequenter Teil
### 2. Spannungsregelung
Hochfrequenter Teil

| Stufe | Beschreibung           |
| ----- | ---------------------- |
| A     | Schalter               |
| B     | Energiespeicher/Filter |
| C     | Regler                 |
| D     | Ansteuerschaltung      | 

### 3. Zu versorgende Schaltung
```ad-note
Es wird oft Analoge und Digitale Masse **Sternförmig** an die Masse des Netzteils geführt
```

## Eigenschaften
### Einsatzgebiete
- Dort wo eine galvanische Trennung bereits vorhanden ist.
- Bei [Akku](chemie/Sekundärelement.md) betrieben Geräten
### Prinzip 
- Mittles Schaltglied werden Energieportionen aus der Eingangsspannugsquelle übernommen und in der [Induktivität](hwe/Induktivitäten.md) gespeichert.
- $f\approx 20kHz - 2MHz$, des Tastverhältnis bestimmt den Energiefluss.
- Tiefpass am Ausgang glättet den Kontinuierlichen Energiefluss.

### Typen
[Buck Converter](hwe/Stromversorgungseinheiten/Buck%20Converter.md)
[Boost Converter](hwe/Stromversorgungseinheiten/Boost%20Converter.md)
[Inverswandler](hwe/Stromversorgungseinheiten/Inverswandler.md)

--- 
# Tags
![SMPS_intro](hwe/assets/pdf/SMPS_intro.pdf)
