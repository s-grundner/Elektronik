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

Die Wirkung tritt nicht vor der Ursache ein!

> [!def] **D1 - KAUS)** Kausalität eines Systems
> Hängt das Ausgangssignal zu einem bestimmten Zeitpunkt $t_0$ nur von dem Verlauf des Eingangssignals bis einschließlich zu diesem Zeitpunkt ab (vergangene Werte bis inklusive aktuellem Wert), so bezeichnet man das System als kausal
> 
> $$y\left(t_0\right)=\mathcal{T}\left\{x\left(t \leq t_0\right)\right\}$$

> [!satz] Die Impulsantwort $h(t)$ eines kausalen Systems ist kausal, d.h.
> $$h(t)=0 \quad \forall \quad t<0$$

---

> [!hint] Alle realen Systeme gehorchen diesem „Naturgesetz".
> - Allerdings können Idealisierungen in der Systemtheorie auf nichtkausale Systeme führen und es ist oft einfacher mit diesen zu rechnen. Durch die Einführung einer künstlichen Verzögerung ist bei einem zeitbegrenzten nichtkausalen Anteil auch eine Realisierung möglich.