---
tags:
  - MOC
  - Algorithmus/Sortieren
aliases:
  - "#Algorithmus/Sortieren"
  - Sortier-Algorithmus
  - Sortier-Algorithmen
subject: 
inst: HTBLuVA Salzburg
created: 29. November 2022
---

# Map of Content - Sortieren

```dataview
LIST FROM #Algorithmus/Sortieren
WHERE !contains(file.name, "MOC")
```

Sortieren ist eine grundlegende Technologie der Informatik. Effiziente Sortieralgorithmen werden auch eingesetzt um in großen Datenmengen schneller Suchen zu können.

> [!INFO] Definitionen:
> - **Internes Sortieren**: Daten werden in den Arbeitsspeicher ([RAM](../../Technische%20Informatik/Speicherzellen.md)) kopiert. Es kann wahlfrei auf die einzelnen Elemente zugegriffen werden.
> - **Externes Sortieren**: Daten können nicht in den Arbeitsspeicher kopiert werden (zum Beispiel zu viel). Verarbeitung auf externer Quelle.
> - **Vergleichendes Sortieren**: Verwendung eines Werts aus der Sortiermenge mit dem beim Sortieren verglichen wird ("Schlüssel").
> - **Stabiles Sortieren**: Sortierung die einen zusammengesetzten Datensatz richtig sortiert.
> 	- Beispiel: eine *alphabetisch sortierte* Personenliste wird *nach Geburtsdatum* neu sortiert, dann bleibt die alphabetische Sortierung für Personen mit gleichem Geburtsdatum erhalten (bei stabilen Sortieralgorithmen). 
> 
> Sortiert ergibt für sich für die Menge 2, 1, 1, 3 -> 1, 1, 2, 3. Ein stabiler [Algorithmus]({MOC}%20Algorithmus.md) garantiert, dass in beiden Sätzen der erste 1er der gleiche 1er ist.

## Sortierung Über Referenzen

Es gibt häufig die Forderung ein Array zu sortieren in welchem die Elemente große Strukturen sind. Der Zeitbedarf von Sortieralgorithmen ist maßgeblich durch den Zeitaufwand durch eine Verschiebung (kopieren) der Elemente im Feld geprägt. Wenn anstatt der Strukturen lediglich ein Zeiger auf die Elemente verändert wird kann der Zeitaufwand eventuell deutlich verringert werden.

## Referenzen

- [Viele Sortieralgorithmen mit JS Implementierung](http://khan4019.github.io/front-end-Interview-Questions/sort.html)
- [Ue_Sortieren](Uebung/Ue_Sortieren.md)

## Fragen

- Welche [Such-Algorithmen]({MOC}%20Suchen.md) kennen Sie?
- Wodurch unterscheiden sich die unterschiedlichen Sortieralgorithmen?
- Wie kann die Sortierdauer unterschiedlicher [Algorithmen]({MOC}%20Algorithmus.md) verglichen werden?
- Wie kann die Sortierung von Struktur-Feldern beschleunigt werden?
