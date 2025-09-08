---
tags: 
aliases:
  - Tustin
  - Bilineartransformation
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 7th May 2025
professor: 
release: false
title: q-Transformation
---

# q-Transformation

- [z-Transformation](z-Transformation.md)

---

> [!quote] Bilineartransformation nach Tustin
> Für den Entwurf digitaler Regelkreise spielt der Frequenzgang des Abtastsystems dieselbe Rolle wie bei zeitkontinuierlichen Systemen. Die Handhabung der Funktion $G\left( e^{ j\omega T_{a} } \right)$ wird jedoch durch die Tatsache erschwert, dass hier eine transzendente Funktion in $\omega$ vorliegt.

![invert_dark](assets/qVSz.png)

## Transformationsvorschrift

Dies ist dann möglich, wenn man eine Transformation so findet, dass die obere Hälfte des Einheitskreises $e^{ j\omega T_{a} }$ im Intervall $0 \leq \omega < \frac{\pi}{T_{a}}$ der komlexen $w$-Ebene abgebildet wird. Genau dies kann aber mithilfe der Transformationsvorschrift 

$$ w := \frac{z-1}{z+1} $$ 
erreicht werden.

> [!hint] Diese Transformationsvorschrift kommt von der Taylorentwicklung des natürlichen Logarithmus.
>
> Beziehung zwischen $s$ und $z$: 
>
> $$z = e^{ sT_{a} } \implies s = \frac{1}{T_{a}} \ln(z)$$
>
> Taylorreihe des $\ln$:
>
> $$\ln(z) = 2\left( \left( \frac{z-1}{z+2} \right) + \left( \frac{1}{3}\frac{z-1}{z+2} \right)^{3} + \cdots\right)$$
> 
> Taylorpolynom nach dem ersten grad abgebrochen liefert die näherung:
>
> $$ s \approx \frac{2}{T_{a}} \frac{z-1}{z+1} = q \quad \implies \quad z = \frac{1+q \frac{T_{a}}{2}}{1-q \frac{T_{a}}{2}} $$

## Frequenztransformation

> [!question] Frequency Pre-Warping

Das Ziel ist es, die Frequenz $\omega$ so zu transformieren, dass in einer transformierten Frequenz $\Omega$ der Frequenzgang des Abtastsystems eine rationale Funktion ist.

 Setzt man in $w$ für $z=e^{ j\omega T_{a} }$ ein, so erhält man

$$
\frac{e^{ j\omega T_{a} } - 1}{e^{ j\omega T_{a} } + 1} = \tanh \left( \frac{j\omega T_{a}}{2} \right) = \tan \left( \frac{\omega T_{a}}{2} \right)
$$
Es hat sich als sinnvoll erwiesen, den Normierungsfaktor $T_{a}/2$ auch bei der transformierten Frequenz $\Omega$ zu verwenden, und aus

$$
\Omega \frac{T_{a}}{2} = \tan \left( \frac{\omega T_{a}}{2} \right) \qquad \implies \qquad \Omega = \frac{2}{T_{a}}\tan \left( \frac{\omega T_{a}}{2} \right)
$$


---

> [!hint] matlab Befehl (`Control_System_Toolbox`)
>
> ```matlab
> tustin()
> ```

$$ G(q) = \frac{1-q}{3+q}, \quad T_{a}=2 \implies \Omega =1 $$

Um die realsierbarkeit / Sprungfähigkeit festzustellen muss $T_{a}$ bekannt sein. Im s-Bereich die grade von Nenner und Zähler vergleichen. Im q-Bereich Grenzwerte

---

# Referenzen

- Ähnlichkeit zur Transformationsvorschrtift des Reflexionsfaktors im Smith-Chart
- [Bilinear Transform IIR Filter Design (STM32 DSP) - Phil's Lab - YouTube](https://www.youtube.com/watch?v=oBVi0smvm8Q)