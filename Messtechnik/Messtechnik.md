---
tags:
aliases:
  - Messung
  - Messen
keywords:
  - Messprinzip
  - Messmethode
  - Messverfahren
  - Messeinrichtung
  - Messkette
subject:
  - Elektrische Messtechnik und Sensorik
  - VL
semester: SS25
created: 5th March 2025
professor:
  - Marco Da Silva
release: false
title: Messtechnik
---
 

# Messtechnik

Messen ist das quantitative Erfassen einer Größen. Es dient dazu diese Messgröße für uns wahrnehmbar zu machen. Dabei gilt es festzustellen, wie vertrauenswürdig dieses Medium zur Erfassung der Größe ist -> [Messunsicherheiten](GUM.md). 

> [!hint] **Vorraussetzungen sind:**
> - Existenz eines Zahlensystems
> - Definition einer Messgröße
> - Festlegung der Einheit

![invert_dark|900](../_assets/mestechnik.png)

> [!def] Angabe einer Messgröße ^MESSGR
> $$ \text{Physikalische Größe} = \text{Zahlenwert } \cdot \text{ Einheit } + \text{Unsicherheit} $$

## Begriffe der Messtechnik

> [!info] Begriffe nach DIN 1319
> - **Messprinzip** heißt charakteristische physikalische Erscheinung die bei der Messung benutzt wird. 
> - **Messmethode** heißt die spezielle, vom Messprinzip unabhängige Art des Vorhergehens be der Messung.
>     - *Ist die Methode optisch, elektrisch, mechanisch...*
> - **Messverfahren** ist die praktische Anwendung eines Messprinzips und einer Messmethode.
> - **Messeinrichtung** besteht aus einem Messgerät oder mehreren zusammenhängenden Messgeräten mit zusätzlichen Einrichtungen.
>     - *verkörperung, realer aufbau, z.B. Multimeter*
> - **Messkette** Spezifizierung der Blöcke im Umfang der Messung
> 

**Messgeräte** sind die im Signalfluss liegenden Geräte einer Messeinrichtung. Die zwischen den Messgeräten Ausgetauschten **Signale** ($y_{1}, y_{2}$) Enthalten die informationen über die zu messende Größe.
![invert_dark|1000](assets/Messkette.png)


Die Gesamtheit der Systeme die Ein- und Ausgang miteinander verknüpfen, ist die **Messkette**, z.B.:

- **Aufnehmer:** Sensoren, Detektoren, Fühler
- **Anpasser:** Messverstärker, Messumformer, Rechengerät, Encodierung
- **Ausgeber:** Anzeige, Datenausgabe, Zähler
- **Hilfsgerät:** Liefert Hilfsenergie um die Operationen der Systeme der Messkette zu ermöglichen

### Anforderungen an den Messverstärker

Messverstärker haben die Aufgabe, elektrische Messgrößen in Signale höherer Leistung umzuformen, mit den Anforderungen:

- Geringe Rückwirkung auf die Messgröße
- Definiertes Übertragungsverhalten
- Geringes Eigenrauschen
- Gutes dynamisches verhalten
	- d.h. Die Bandbreite ist angepasst an die Frequenz der Messgröße
- Eingeprägtes Ausgangssignal
	- Ausgangswiderstand $\to 0$ für Spannungsausgang
	- Ausgangswiderstand $\to \infty$ für Stromausgang

## Messen nicht elektrischer Größen

Die Physikalische Größe steuert eine elektrische Größe: 

1. **Direkte**/ Aktive Umwandlung (self generating): Der Sensor erzeugt selbst die Energie.
    - *Thermoelement*: Bimetallstreifen Mobilität der Elektronen in verschiedenen Metallen wird als elektrische Messgröße wahrnehmbar.
    - *Photodiode*
2. **Passive** Umwandlung (modulating)
    - Element das seinen elektrischen Widerstand ändert

---

- [GUM](GUM.md)