---
tags:
aliases:
  - HDL
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 25th March 2026
professor:
release: false
title: Hardwarebeschreibungssprache
---

# Hardwarebeschreibungssprache

> [!question] HDLs
> - Verilog
> - [VHDL](VHDL.md)


 - Präzise Spezifikation/Beschreibung
 - Möglichkeit der Simulation
 - Automatisierung
 - Dokumentation
 - Beschleunigung
 - Vorlage für die physikalische Realisierung

> [!info] Ziele: Simulation und Synthese
> 
> - Übersetzung in eine Implementierungstechnoligie (FPGA, ASIC)
> - Nicht alle Konstrukte sind Synthetisierbar
> - Modellierung digitaler Schaltungen
> 	- Modellierung auf verschiedenen Abstraktionsebenen
> 	- Technologie-unabhängig - hohe Wiederverwendbarkeit
> 	- Standard - Portabilität (verschiedene Synthese- und Analysewerkzeuge)
> 	- Validierung von Designs basierend auf der gleichen Beschreibungssprache für verschiedene Abstraktionsebenen


## HDL vs. Prozedurale Programmiersprache

| Merkmal         | HDL                                                         | C                                             |
| --------------- | ------------------------------------------------------------ | --------------------------------------------- |
| Zweck           | Hardwarebeschreibung (Schaltkreise)                          | Softwarebeschreibung (Algorithmik)            |
| Nebenläufigkeit | **Nebenläufig** (alle Prozesse laufen „gleichzeitig“)        | **Sequenziell** (Befehle laufen nacheinander) |
| Zeitmodell      | Simulationszeit, Delta-Zyklen                                | Keine eingebaute Zeitlogik                    |
| Datenhaltung    | Signale, die reale Drähte/Flipflops modellieren              | Speicherwerte im RAM                          |
| Struktur        | Hierarchische Modellierung von Hardware (Komponenten, Ports) | Funktionen, Structs, Stack/Heap               |

## Software vs. Hardware

Gegenüber einer Höheren Programmiersprache wie C, wo instruktionen sequenziell ausgeführt werden, kann die Programmierung in einer HDL eher als Programmierung eines Schaltplans interpretiert werden.

| Software | Hardware |
| -------- | -------- |
| Sequentielle Ausführung | Parallele Ausführung
| Funktionsaufrufe | Instanziierung von Komponenten
| Parameterübergabe | Verdrahtung
| Datentypen | Datentypen in Beschreibung, nicht in Implementierung

