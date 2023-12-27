---
tags: 
aliases:
  - Diskrete Fourier Transformation
created: 27. Dezember 2023
source:
  - Laurenz Hölzl
  - Daniel Ch. v. Grüningen
---

# Diskrete [Fourier Transformation](../../Mathe/mathe%20(4)/Fourier%20Transformation.md)

> [!INFO]
> Tatsächlich handelt es sich bei der Diskreten [Fourier Transformation](../../Mathe/mathe%20(4)/Fourier%20Transformation.md) (DFT) um eine Annäherung der [Fourier Transformation](../../Mathe/mathe%20(4)/Fourier%20Transformation.md), welche es ermöglicht sie effizient von einem digitalen Rechner berechnen zu lassen.
Hierbei wird die Formel für die [Fouriertransformierte](../../Mathe/mathe%20(4)/Fourier%20Transformation.md#Fouriertransformierte) als Ausgangspunkt genutzt.

Das zeitkontinuierliche Signal wird durch seinen Abtastwert $x(nT)$ und das Differential durch das Abtastintervall $T$ ersetzt. Zur Annäherung des Integrals wird die Summe verwendet:

$$
X_{s}(\omega) = \sum^{\infty}_{n = -\infty} = x(nT)\cdot e^{-j\omega nT} \cdot T 
$$

Da eine unendliche Anzahl an Abtastwerten unmöglich zu berechnen ist, werden eine endliche Anzahl $N$ dieser herausgeschnitten/„gefenstert“ (engl: windowing).
Außerdem kann der Faktor $T$ aus „Bequemlichkeit“ weggelassen werden.

$$
X_{sw}(f) = \sum^{N-1}_{n=0} x(nT)
$$