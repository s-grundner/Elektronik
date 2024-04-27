---
tags: []
aliases: []
created: 19. Januar 2024
---

# TODO

Elektrotechnische Bauteile bzgl [DGL]({MOC}%20DGL.md) neu strukturieren
- [Filter](Filter.md)
- [Schaltvorgänge](Schaltvorgänge.md)
- [Schwingkreise](Schwingkreise.md)

Wrapper Notes für Übungsaufgaben (Template)
- [x] Mathe
- [x] DSAlgo
- [ ] Elektrotechnik
- [ ] (software?)

--- 

- [ ] Elektrotechnik Übungsbeispiele in entsprechendes File Eintragen
	- [ ] [Filter](Filter.md)
	- [ ] [ZeigerDiagramme](Zeigerdarstellung.md) / [Wechselstromtechnik](Wechselstromtechnik.md)
	- [x] Alte Übungen (wie [Kondensator](Kapazität.md) usw)
- [ ] Differentialgleichungs-Einträge Aktualisieren
	- Besser Hierarchisch unterteilen
	- zu den verschiedenen Arten von [DGL]({MOC}%20DGL.md) hinführen
	- im übergeordneten kapitel beschreiben was die art von [DGL]({MOC}%20DGL.md) ausmacht
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