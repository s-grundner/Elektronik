---
tags:
  - flashcards/SUS1
aliases:
  - BIBO
  - Stabilität von Systemen
  - Beschränktheit von Systemen
keywords:
subject:
  - VL
  - Regelungstechnik
  - Signalverarbeitung
  - Signale und Systeme
semester: SS25
created: 8th April 2025
professor:
  - Andreas Stelzer 🕊️
release: false
title: Stabilität und Beschränktheit
---

# Stabilität und Beschränktheit

> [!def] **D1 - BIBO)** Ein System heißt BIBO Stabil wenn das System auf **jedes** beschränkte Eingangssignal mit einem beschränkten Ausgangssignal reagiert. ^BIBO
> 
> Beschränkt bedeutet, dass der Betrag einer Funktion kleiner als eine Endliche konstante $M_{1}$ ist: 
> 
> $$\lvert x(t) \rvert<M_{1}<\infty\quad\forall t$$
> 
> Daraus folgt, dass die Impulsantwort eines Stabilen Systems absolut integrierbar sein muss:
> 
> $$\int_{-\infty}^{\infty} \lvert h(t) \rvert \mathrm{~d}t < M_{2} <\infty$$


> [!satz] **S)** BIBO Stabilitätskriterium eines Systems
> Ein System ist BIBO-stabil wenn dessen Pole Stabil sind:
> 
> **Stabilität für Zeitkontinuierliche Systeme:**
>
> - Alle Pole liegen in der linken Halbebene des s-Bereichs und nicht auf der Abzisse.
> - Realteil der Pole ist $< 0$
> - Die Systemmatrix ist eine [Hurwitzmatrix](../Mathematik/Analysis/Hurwitz-Matrix.md)
> - Das Konvergenzgebiet liegt nur links der Abzisse
> 
> **Stabilität für Zeitdiskrete Systeme:**
>
> - Alle Pole liegen innerhalb (nicht auf) dem Einheitskreis
> - Betrag der Pole ist $< 1$
> - Die Systemmatrix ist eine [Einheitskreismatrix](Einheitskreismatrix.md)
> - Das Konvergenzgebiet liegt nur im Einheitskreis

Die Stabilität ist daher nur vom Nennerpolynom $n(s)$ bzw. $n(z)$ der Übertragungsfunktion abhängig. 

- $n(s)$ ist eine Hurwitzpolynom $\implies$ bis zum grad $n$ darf kein koeffizient $0$ sein

---

# Flashcards

> [!question] Was bedeutet BIBO-Stabil 
?
> > [!success]- Lösung
> > BIBO ist die Abkürzung für Bounded-Input-Bounded Output. Ein Bibo-Stabiles System reagiert auf ein Beschränktes Eingangssignal mit einem Beschränkten Ausgangssignal. 
> > - beschränkt heißt, wenn der Betrag einer Funktion kleiner als eine Endliche konstante $M_{1}$ ist: $\lvert x(t) \rvert<M_{1}<\infty$ $\forall t$
> > - Daraus folgt dass die Impulsantwort eines Stabilen Systems absolut integrierbar sein: $\int_{-\infty}^{\infty} \lvert h(t) \rvert \mathrm{~d}t < M_{2} <\infty$

> [!question] Welche bedingung muss erfüllt sein, damit ein LTI-System BIBO-stabil ist.  
?
> > [!success]- Lösung
> > Ein Bibo-Stabiles System reagiert auf ein Beschränktes Eingangssignal mit einem Beschränkten Ausgangssignal. 
> > - beschränkt heißt, wenn der Betrag einer Funktion kleiner als eine Endliche konstante $M_{1}$ ist: $\lvert x(t) \rvert<M_{1}<\infty$ $\forall t$
> > - Daraus folgt dass die Impulsantwort eines Stabilen Systems absolut integrierbar sein: $\int_{-\infty}^{\infty} \lvert h(t) \rvert \mathrm{~d}t < M_{2} <\infty$
