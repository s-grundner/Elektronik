---
tags:
aliases:
subject:
  - VL
  - Machine Learning and Pattern Classification
semester: SS26
created: 14th June 2026
professor:
release: false
title: Random Forest Classifier
---

# Random Forest Classifier

> [!question] [Decision Trees](Decision%20Trees.md)

Man generiert eine *Ensemble* an Bäumen (= Wald) welche unabhängig von den anderen ein neues Datenobjekt klassifiziert.

Hat man von jedem baum eine Klassifizierung erhalten, wählt man eine Klasse aus der Verteilung aus. z.B. Die Meist vorkommende Klasse, oder auswahl nach Gewichtung.

Wichtig: die verscheidenen bäume müssen jeweils **unkorrelierte** Fehler aufweisen.

- Wie?: **Randomisierung** der Bäume.

Möglichkeit 1: Dataset randomisieren

![invert_dark|800](../../_assets/Excalidraw/Random%20Forest%20Classifier%202026-06-14%2014.34.58.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Random%20Forest%20Classifier%202026-06-14%2014.34.58.excalidraw.md)%%

Möglichkeit 2: Lernprozess Randomisieren

- Pro Split werden nicht alle Trainingsdaten in betracht gezogen, sondern nur eine Zufällige Auswahl.