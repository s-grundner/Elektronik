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

erreicht werden. Setzt man in [QTRF](#^QTRF) für $z=e^{ j\omega T_{a} }$ ein, so erhält man

$$
\frac{e^{ j\omega T_{a} } - 1}{e^{ j\omega T_{a} +1 }} = \tanh \left( \frac{j\omega T_{a}}{2} \right) = \tan \left( \frac{\omega T_{a}}{2} \right)
$$
Es hat sich als sinnvoll erwiesen, den Normierungsfaktor $T_{a}/2$ auch bei der transformierten Frequenz $\Omega$ zu verwenden, und aus

$$
\Omega \frac{T_{a}}{2} = \tan \left( \frac{\omega T_{a}}{2} \right) \qquad \implies \qquad \Omega = \frac{2}{T_{a}}\tan \left( \frac{\omega T_{a}}{2} \right)
$$




---

# Referenzen

- Ähnlichkeit zur Transformationsvorschrtift des Reflexionsfaktors im Smith-Chart