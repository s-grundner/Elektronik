---
tags: ["Sekundär getaktete SMPS"]
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 2nd October 2022
---

# Sekundär getaktete Schaltregle
>![[SekGetaktSMPS.png]]
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
- Bei [[Sekundärelement|Akku]] betrieben Geräten
### Prinzip 
- Mittles Schaltglied werden Energieportionen aus der Eingangsspannugsquelle übernommen und in der [[Induktivitäten|Induktivität]] gespeichert.
- $f\approx 20kHz - 2MHz$, des Tastverhältnis bestimmt den Energiefluss.
- Tiefpass am Ausgang glättet den Kontinuierlichen Energiefluss.

### Typen
[[Buck Converter]]
[[Boost Converter]]
[[Inverswandler]]

--- 
# Tags
![[SMPS_intro.pdf]]
