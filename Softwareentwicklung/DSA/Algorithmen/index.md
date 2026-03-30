---
tags:
  - "#Algorithmus"
  - index
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
  - Rick Rabiser
title: Algorithmen
release: false
---

# Algorithmen

## Algorithmen aus Verschiedenen Gebieten

> [!hint]- Mathematik ^MOC-Mathe
>
> ```dataview
> TABLE WITHOUT ID
> file.link AS "🗺️Map of Content", complexity AS "$\mathcal{O}(n)$-Time"
> FROM #Algorithmus/Mathe AND -#MOC
> SORT file.name ASC
> ```

> [!hint]- Informatik / Digitaltechnik ^MOC-CS
>
> ```dataview
> TABLE WITHOUT ID
> file.link AS "🗺️Map of Content", complexity AS "$\mathcal{O}(n)$-Time"
> FROM #Algorithmus/Informatik AND -#MOC
> SORT file.name ASC
> ```

> [!hint]- Elektrotechnik ^MOC-Elektrotechnik
>
> ```dataview
> TABLE WITHOUT ID
> file.link AS "🗺️Map of Content", complexity AS "$\mathcal{O}(n)$-Time"
> FROM #Algorithmus/Elektrotechnik AND -#MOC
> SORT file.name ASC
> ```

## Algorithmusbegriff

> [!INFO] Ein Algorithmus ist ein schrittweises, endliches, eindeutig ausführbares Verfahren zur Berechnung gesuchter aus gegebenen Größen.
> Verfahrensvorschrift zur Lösung eines Problems
> - *nicht* die Lösung selbst, sondern eine an jemand andere gerichtete Erklärung.

> [!info]- Algorithmus $\subset$ Programm
> (lese als: Algorithmen sind ein Teilmenge von Programmen)
> - Jeder Algorithmus nach unserer Definition kann als Programm formuliert und von einem Computer ausgeführt werden
> - aber: Nicht jedes Programm ist ein Algorithmus

## 1 Eigenschaften

> [!info] Algorithmus = Problemlösungsverfahren mit folgenden Eigenschaften
> - berechnet gesuchte aus gegebenen Größen
> - schrittweise
> - eindeutig
> - ausführbar
> - endlich (statisch und dynamisch)

## Darstellungsarten von Algorithmen

| Darstellungsart              | Benutzungsszenario                                                                                            |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Stilisierte Prosa            | grobe Skizze einer Idee oder für menschlichen Prozessor (z.B. Kochbuch, Wegbeschreibung, Bedienungsanleitung) |
| Ablaufdiagramm, Struktogramm | für visuell orientierte Menschen, Überblick über Ablaufstrukturen                                             |
| Pseudocode                   | halbformal, kurz, präzise und doch sprachunabhängig; Ausformulierung in wählbarer Detailliertheit             |
| Programmier-sprache          | eindeutig, ausführbar; zur Übersetzung und Ausführung auf einem Computer                                      |

Bausteine von Ablaufdiagrammen: [D-Diagramm](../../SoftwareEngineering/Ablaufdiagramm.md)

## Informatikturm

|            | Anwendung           | Installation, Konfiguration, Betrieb           |     |
| ---------- | ------------------- | ---------------------------------------------- | --- |
|            | System-Realisierung | Entwicklung von vollständigen Systemen         |     |
| $\uparrow$ | Programmierung      |                                                |     |
| $\uparrow$ | Algorithmen         | Entwurf, Abläufe, Datenstrukturen, Komplexität |     |
| $\uparrow$ | Theorie             | abstrakt, mathematisch, Allgemein              |     |

# Tags

[What's an algorithm? - David J. Malan - YouTube](https://youtu.be/6hfOvs8pY1k)
