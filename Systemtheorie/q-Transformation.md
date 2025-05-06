---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 7th May 2025
professor:
draft: true
title: q-Transformation
---

# q-Transformation

> [!question]  Parallel zur [z-Transformation](z-Transformation.md)

Für den Entwurf digitaler Regelkreise spielt der Frequenzgang des Abtastsystems dieselbe Rolle wie bei zeitkontinuierlichen Systemen. Die Handhabung der Funktion $G\left( e^{ j\omega T_{a} } \right)$ word hedoch durch die Tatsache erschwert, dass hier eine transzendente Funktion in $\omega$ vorliegt.

Es ist also das Ziel, die Frequenz  $\omega$ so zu transformieren, dass in einer transformierten Frequenz $\Omega$ der Frequenzgang des Abtastsystems eine rationale Funktion ist. Die ist dann möglich wenn man eine  Transformation so findetm dass die  obere Hälfte des Einheitskreises $e^{ j\omega T_{a} }$ im Intervall $0 \leq \omega < \frac{\pi}{T_{a}}$ der komlexen $w$-Ebene abgebildet wird. Genau dies kann aber mithilfe der Transformationsvorschrift 

$$ w := \frac{z-1}{z+1} \tag{QTRF} $$  ^QTRF

erreicht werden. Setzt man in [QTRF](#^QTRF) für $z=e^{ j\omega T_{A} }$