---
tags: 
aliases:
  - Kausal
  - Antikausal
keywords: 
subject:
  - VL
  - Signale und Systeme
  - Signalverarbeitung
semester: WS24
created: 4. Februar 2025
professor:
---
 

# Kausalität

> [!quote] **Die Wirkung tritt nicht vor der Ursache ein!** - Alle realen Systeme gehorchen diesem „Naturgesetz".
> Allerdings können Idealisierungen in der Systemtheorie auf nichtkausale Systeme führen und es ist oft einfacher mit diesen zu rechnen. Durch die Einführung einer künstlichen Verzögerung ist bei einem zeitbegrenzten nichtkausalen Anteil auch eine Realisierung möglich.

---

Äquivalente Definition für den kontinuierlichen und den zeitdiskreten Fall.

> [!def] **D1 - KAUS)** Kausalität von Signale und Systemen ^KAUS
> **(a)** Ein [Signal](Signale.md) $x$ heißt kausal, wenn
> - :LiAudioWaveform:) $x(t) = 0$ für $t < 0$
> - :LiBarChart2:) $x[n] = 0$ für $n < 0$
> 
> **(b)** Ein [System](index.md) $\mathcal{T}$ heißt kausal, wenn
> - :LiAudioWaveform: | :LiBarChart2:) zu jedem kausalen Eingangssignal $x$ ein kausales Ausgangssignal $y$ gehört.

Ein kausales System reagiert also keines falls vor einer Aktion am Eingang. Es ist nur eine instantane oder verzögerte Antwort möglich.
 
> [!satz] **S1)** Die Impulsantwort $h(t)$ eines kausalen Systems ist kausal, d.h.
> $$h(t)=0 \quad \forall \quad t<0$$

## Antikausal

Ein Antikausales Signal ist nur für alle Zeiten  $t < 0$ definiert bzw. verschieden von $0$

---

# Flashcards

> [!question] Wann ist ein Signal antikausal? 
?
> > [!success]- Lösung
> Ein Signal ist antikausal, wenn es nur für $t < 0$ definiert bzw verschieden von Null ist.