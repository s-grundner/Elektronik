---
tags:
  - "#Algorithmus"
aliases:
  - "#Algorithmus"
  - Algorithmus
  - Algorithmen
keywords: 
subject:
  - VL
  - Algorithmen und Datenstrukturen
semester:
  - SS24
  - B2
created: 6. März 2024
professor:
---
 

# Algorithmen

> [!INFO] Ein Algorithmus ist ein schrittweises, endliches, eindeutig ausführbares Verfahren zur Berechnung gesuchter aus gegebenen Größen.
> Verfahrensvorschrift zur Lösung eines Problems
> - *nicht* die Lösung selbst, sondern eine an jemand andere gerichtete Erklärung.


## Algorithmusbegriff

> [!info] Algorithmus $\subset$ Programm
> (lese als: Algorithmen sind ein Teilmenge von Programmen)
> - Jeder Algorithmus nach unserer Definition kann als Programm formuliert und von einem Computer ausgeführt werden
> - aber: Nicht jedes Programm ist ein Algorithmus

### Eigenschaften

> [!info] Algorithmus = Problemlösungsverfahren mit folgenden Eigenschaften
> - berechnet gesuchte aus gegebenen Größen
> - schrittweise
> - eindeutig
> - ausführbar
> - endlich (statisch und dynamisch)


### Informatikturm

|            | Anwendung           | Installation, Konfiguration, Betrieb           |
| ---------- | ------------------- | ---------------------------------------------- |
|            | System-Realisierung | Entwicklung von vollständigen Systemen         |
| $\uparrow$ | Programmierung      |                                                | 
| $\uparrow$ | Algorithmen         | Entwurf, Abläufe, Datenstrukturen, Komplexität |
| $\uparrow$ | Theorie             | abstrakt, mathematisch, Allgemein              |



## Mathematik

```dataview
LIST FROM #Algorithmus/Mathe 
```

## Informatik / Digitaltechnik

- [Such-Algorithmen](DS-Algo/{MOC}%20Suchen.md)
- [Sortier-Algorithmen](DS-Algo/{MOC}%20Sortieren.md)

```dataview
LIST FROM #Algorithmus 
WHERE !contains(tags, "Sortieren")
AND !contains(tags, "Suchen")
AND !contains(tags, "Mathe")
AND !contains(file.name, "MOC")
```

## Elektrotechnik

```dataview
LIST FROM #Algorithmus/Elektrotechnik 
```