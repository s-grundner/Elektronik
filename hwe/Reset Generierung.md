---
tags: []
aliases: ["Reset"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 31st January 2023
---

# Reset Generierung

> [!todo] Aufgaben
> Beim Systemstart:
> - Deaktivieren aller Systemkomponenten bis die Versorgungspannung stabil ist.
> - Zurücksetzen aller Systemkomponenten in einen definierten Anfangszustand.
> 
> Im laufenden Betrieb:
> - Aufheben von Systemblockaden
> - zurücksetzen aller Systemkomponenten in einen definierten Anfangszustand
> - bei Spannungseinbruch

## Möglichkeiten zur Resetgenerierung

> [!info] Bestimmende Faktoren der Resetdauer
> - Hochfahren der Systemkomponenten, [[Schaltnetzteil|Schaltregler]], [[Phase Locked Loop|PLL]]
> - Pipeline Strukturen im µC

### Power on Reset (POR)
Reset bei Systemstart
![[POR-LZD.png|325]]
#### Einfachster Aufbau
> [!note] Schaltung
> ![[POR-schaltung.png|500]]

## Reset bei Spannungseinbruch

![[reset-spg-einbruch.png|725]]

# Watchdog
Ein Watchdog weckt eine Schaltung wieder auf, wenn sie z.B. keine Rückmeldung erhält.

$\rightarrow$ "seed-key" Prinzip
![[assets/watchdog.png|450]]
> [!error] Wenn der Key nicht mit dem im LUT übereinstimmt, führt der Watchdog einen Reset durch.

# Tags
[[Open Collector]]