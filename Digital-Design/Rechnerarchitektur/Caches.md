---
tags:
aliases:
  - Cache
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 21st June 2026
professor:
release: false
title: Caches
---

# Caches

> [!example] Bsp: Lese Datum aus dem Arbeitsspeicher unter Adresse `a`
> 
> CPU überprüft, ob eine Kopie der Hauptspeicherzelle `a` im Cache abgelegt ist
> 
> - **Falls ja (cache hit)**
> 	- so entnimmt die CPU das Datum aus dem Cache. Die Überprüfung und das eigentliche Lesen aus dem Cache erfolgt in einem Zyklus, ohne einen Wartezyklus einfügen zu müssen.
> - **Falls nein (cache miss)**
> 	- so greift die CPU auf den Arbeitsspeicher zu
> 	- lädt das Datum in den Cache und
> 	- lädt das Datum gleichzeitig in die CPU.
> 	- Anmerkung: Häufig wird mit jedem Datum auch dessen umgebender Block von Daten geladen in der Erwartung, dass folgende Zugriffe auf diese Daten erfolgen.

## Mittlere Zugriffszeit

$$
\bar{t}_{\mathrm{zugriff}} =c + (1-h)\cdot m
$$

- $c$ ... zugriffszeit des caches
- $m$ ... zugriffszeit auf Hauptspeicher
- $h$ ... Trefferrate (Hit-Rate)

## Aufbau

- **Cache Block:** Aus dem Hauptspeicher kopierte Daten 
- **Cache Tag:** Der Index (Cacheadresse) kann nicht eindeutig einer Speicherblockadresse zugeordnet werden
	- Zu jedem Block im Cache auch einen entsprechenden Tag speichern
	- Auffinden von Daten durch Abgleich der Tags des gesuchten Blocks und des Cacheeintrages 
- **Valid Bit:** Gibt an, ob ein Cacheeintrag gültig ist oder nicht
	- Am Anfang – und nach jedem Leeren des Caches – enthält der Cache keine gültigen Daten (Valid Bit wird auf 0 gesetzt)
	- Wenn der Cacheeintrag gültig ist, wird das Valid Bit auf 1 gesetzt

## Arten von Caches

-  [Direct-Mapped Cache](Direct-Mapped%20Cache.md)
	- Jedes Datum wird an eine bestimmte Stelle im Cache geschrieben 
	- Erfordert kaum zusätzliche Logik 
- [Assoziativer Cache](Assoziativer%20Cache.md)
	- Jedes Datum kann an jede Stelle im Cache geschrieben werden 
	- Vollparalleler Vergleich der Adresse vom Hauptspeicher mit allen im Adressspeicher des Caches vorhandenen Adressen
	- erfordert viel HW-Logik! 
	- Besser Trefferquote 
- [Satzassoziativer Cache](Satzassoziativer%20Cache.md)
	- Mischform aus Direct-Mapped Cache und assoziativem Cache

## Schreibzugriff

- Szenario: Schreibe Datum in den Arbeitsspeicher unter Adresse a:
- CPU überprüft, ob eine Kopie der Hauptspeicherzelle a im Cache abgelegt ist



> [!def] **D)** write-back Verfahren
> - **cache miss:** CPU schreibt das Datum in die Hauptspeicherzelle mit Adresse a. Der Inhalt des Cache wird nicht verändert.
> - **cache hit:** die Kopie der Hauptspeicherzelle im Cache wird aktualisiert und durch „dirty bit“ als verändert markiert, die Hauptspeicherzelle selbst wird erst später aktualisiert, nämlich wenn die Kopie aus dem Cache verdrängt wird


> [!def] **D)** write-through Verfahren:
> 
> - **cache miss:** CPU schreibt das Datum in die Hauptspeicherzelle mit Adresse a. Der Inhalt des Cache wird nicht verändert.
> - **cache hit:** die Kopie der Hauptspeicherzelle im Cache wird aktualisiert, die Hauptspeicherzelle selbst wird sofort aktualisiert

> [!def] **D)** write-allocation Verfahren
> - **cache miss:** CPU schreibt Datum in den Cache (markiert mit „dirty bit“), aber nicht in den Hauptspeicher (dort erst aktualisiert, wenn Kopie aus dem Cache verdrängt).
> - **cache hit:** die Kopie der Hauptspeicherzelle im Cache wird aktualisiert (markiert durch „dirty bit“), die Hauptspeicherzelle selbst wird erst später aktualisiert, nämlich wenn die Kopie aus dem Cache verdrängt wird


Vorteile von Write-back/Write-allocation: 

- Schreibzugriffe auf Cache bei cache hit ohne Wartezyklus möglich (bei Write-allocation sogar bei cache miss)
- Belastung des Systembusses kleiner, wenn das Rückschreiben in den Hauptspeicher erst nach mehreren Schreibvorgängen erfolgen muß

Nachteile von Write-back/Write-allocation

- Schwierigkeit bei der Datenkonsistenz, wenn andere Komponenten auf den Hauptspeicher zugreifen können, z.B. ein DMA-Controller oder ein zweiter Prozessor in einer Shared Memory Machine. Zu vermeiden ist, dass die anderen Module *veraltete Werte vorfinden und mit ihnen rechnen.*