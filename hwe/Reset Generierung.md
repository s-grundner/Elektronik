---
tags: []
aliases: []
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

## Reset bei Spannungseinbruch

![[reset-spg-einbruch.png|725]]

# Watchdog
$\rightarrow$ "seed-key" Prinzip
![[assets/watchdog.png|450]]
> [!error] Wenn der Key nicht mit dem im LUT übereinstimmt, führt der Watchdog einen Reset durch.

# Tags
[[Open Collector]]