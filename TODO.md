---
tags: []
aliases: []
created: 19. Januar 2024
---

# TODO

Elektrotechnische Bauteile bzgl DGL neu strukturieren

- [ ] Elektrotechnik Übungsbeispiele in entsprechendes File Eintragen
	- [ ] Filter
	- [ ] ZeigerDiagramme / Wechselstromtechnik
	- [ ] Alte Übungen (wie Kondensator usw)
- [ ] Differentialgleichungs-Einträge Aktualisieren
	- Besser Hierarchisch unterteilen
	- zu den verschiedenen Arten von DGL hinführen
	- im übergeordneten kapitel beschreiben was die art von DGL ausmacht
	- Leichteres suchen von lösungsansätzen

# Quellen Zitieren

```dataview
TABLE file.folder
WHERE cited
AND !contains(file.folder, "00") 
AND !contains(file.folder, "10")
AND !contains(file.folder, "assets")
AND !contains(file.folder, "xEDU")
AND !contains(file.folder, "xPN")
AND !contains(file.folder, "xORG")
AND !contains(file.folder, "Uebung")
AND !contains(file.name, "{")
```