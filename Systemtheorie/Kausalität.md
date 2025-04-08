---
tags: 
aliases:
  - Kausal
  - Antikausal
keywords: 
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 4. Februar 2025
professor:
---
 

# Kausalität

> [!quote] **Die Wirkung tritt nicht vor der Ursache ein!** - Alle realen Systeme gehorchen diesem „Naturgesetz".
> Allerdings können Idealisierungen in der Systemtheorie auf nichtkausale Systeme führen und es ist oft einfacher mit diesen zu rechnen. Durch die Einführung einer künstlichen Verzögerung ist bei einem zeitbegrenzten nichtkausalen Anteil auch eine Realisierung möglich.

---


> [!def] **D1 - KAUS)** Kausalität
> **(a)** Ein [Signal](Signale.md) :LiAudioWaveform: $x(t)$ oder :LiBarChart2: $x[n]$ heißt kausal, wenn
> - :LiAudioWaveform: $x(t) = 0$ für $t < 0$
> $$\underset{ \text{Zeitkont.} }{  }\qquad  \underset{ \text{Zeitdiskret} }{ x[n] = 0 \text{ für } n < 0 } $$
> **(b)** Ein [System]({MOC}%20Systemtheorie.md) heißt kausal, wenn
> 

Hängt das Ausgangssignal zu einem bestimmten Zeitpunkt $t_0$ nur von dem Verlauf des Eingangssignals bis einschließlich zu diesem Zeitpunkt ab (vergangene Werte bis inklusive aktuellem Wert), so bezeichnet man das System als kausal 
 
> [!satz] **S1)** Die Impulsantwort $h(t)$ eines kausalen Systems ist kausal, d.h.
> $$h(t)=0 \quad \forall \quad t<0$$

## Antikausal

Ein Antikausales Signal ist nu für alle Zeiten vor $t_{0}$

---

# Flashcards

> [!question] Wann ist ein Signal antikausal? 
?
> > [!success]- Lösung
> Ein Signal ist antikausal, wenn es nur für $t < 0$ definiert bzw verschieden von Null ist.