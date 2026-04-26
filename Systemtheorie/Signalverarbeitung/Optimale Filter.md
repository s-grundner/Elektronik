---
tags:
aliases:
  - Optimum Filters
  - Optimaler Schätzer
  - Optimum Estimator
subject:
  - SE
  - Bachelorarbeit
  - VL
  - Optimum and Adaptive Signal Processing Systems
semester: SS26
created: 25th March 2026
professor:
release: false
title: Optimale FIlter
---

# Optimale Filter

Bei Optimalen Filtern werden die Koeffizienten nach einer Kostenfunktion so berechnet, sodass der Fehler für den gewünschten Ausgang minimal wird.

![invert_dark](../../_assets/Pasted%20image%2020260325141459.png)

Ziel ist es, die optimalen Koeffizienten für den Filter zu berechnen, sodass für jeden Eingang $x[k]$ der Filter den Ausgang $\hat{y}[k]$ liefert sodass, für ein Referenz Signal $y[k]$ eine Funktion des Fehlers $e[k]$ (Kostenfunktion) minimal ist.

> [!info] Man möchte einen **linearen Schätzer** (Filter, en. linear estimator) finden, dessen Ausgang die gewünschte Systemantwort unter bestimmten Optimierungs-Kriterien (minimierung Kostenfunktion) abbildet.

Erfüllt der Schätzer diese Aufgabe, wird er als *optimaler Schätzer* bezeichet.

> [!important] Begriff *Optimal / Optimum*
> 
> - Optimaler Filter heißt **nicht** "bester" Filter, sondern ein Filter der sich nach der Gewichtung einer Kostenfunktion einstellt.
> - Ändern sich die Annahmen nach denen sich die Gewichtung der Kostenfunktion ergibt.
> - Die Annahmen ergeben sich nach den statistischen Eigenschaften des Eingangssignals und den Performance Kriterien.

Um mathematische Modelle für optimale Filter zu entwickeln, setzen wir voraus, dass die gewünschte Systemantwort sowie die Eingangssignale realisierungen von [Stochastische Prozesse](../../Mathematik/Statistik/Stochastische%20Prozesse.md) sind.

## Anwendungen für Optimale Filter

- [Systemidentifikation](Systemidentifikation.md)
- [Inverse Systemidentifikation](Inverse%20Systemidentifikation.md) (Equalization, Systemausgleich)
- [Rauschunterdrückung / -verminderung](Rauschunterdrückung.md)
- [Signalprediction](Signalprediction.md)

## Filter Topologien

 > [!question] Filter Topologien bestimmen das Optimal-Kriterium an die Kostenfunktion
> 
> - [Wiener Filter](Wiener%20Filter.md): (*en. Minimum Mean Square Error - MMSE*)
> - [Least Squares Filter](Least%20Squares%20Filter.md): (*en. Least-Squares - LS*)

## Adaptive Filter

Adaptive Filter prüfen kontinuierlich nach dem Optimum und aktualisieren die Filter parameter.

![invert_dark](../../_assets/Excalidraw/Optimale%20Filter%202026-04-25%2015.15.35.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Optimale%20Filter%202026-04-25%2015.15.35.excalidraw.md)%%

## Block Adaptive Filter

- Koeffizienten berechnung nur durch bekannte Ein und Ausgangs **Blöcke**
- Länge der Blöcke bestimmt die Güte der Filterkoeffizienten

> [!question] Methoden
> [LS-Filter](Least%20Squares%20Filter.md) / [Wiener Filter](Wiener%20Filter.md), die in gewissen abständen neue Trainingsphasen durchlaufen.

## Sample Adaptive Filter

> [!question] [Sample Adaptive Filter](Sample%20Adaptive%20Filter.md)

- Feedback der Samples, um Koeffizienten kontinuierlich anzupassen.
- Eingang kann weiterhin mit zufallssignal beaufschlagt werden.
- Einschwingvorgang der Filterkoeffizienten.

