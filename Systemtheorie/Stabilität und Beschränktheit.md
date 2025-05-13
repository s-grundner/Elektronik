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
release: false
title: Stabilität und Beschränktheit
---

# Stabilität und Beschränktheit

> [!def] **D1 - BIBO)** Ein System heißt BIBO Stabil wenn das System auf jedes beschränkte Eingangssignal mit einem beschränkten Ausgangssignal reagiert. ^BIBO
> 
> Beschränkt bedeutet, dass der Betrag einer Funktion kleiner als eine Endliche konstante $M_{1}$ ist: 
> 
> $$\lvert x(t) \rvert<M_{1}<\infty\quad\forall t$$
> 
> Daraus folgt, dass die Impulsantwort eines Stabilen Systems absolut integrierbar sein muss:
> 
> $$\int_{-\infty}^{\infty} \lvert h(t) \rvert \mathrm{~d}t < M_{2} <\infty$$


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
