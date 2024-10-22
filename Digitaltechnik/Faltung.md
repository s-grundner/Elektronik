---
tags:
  - incomplete
aliases: 
subject:
  - dic
source:
  - Robert Vogl
created: 3rd February 2023
---

# Faltung

$$
\begin{align*}
y(t)&=x(t)\ast h(t)=\int_{-\infty}^{\infty}x(\uptau)\cdot h(t-\uptau)d\uptau=\int_{-\infty}^{\infty}x(t-\uptau)\cdot h(\uptau)d\uptau
\end{align*}
$$
![Convolution_of_box_signal_with_itself](../../../Digitaltechnik/assets/Convolution_of_box_signal_with_itself.gif)

## Eigenschaften der Faltung

Bei LTI-Systemen lässt sich das Ausgangssignal $y$ durch Faltung des EIngangssignals $x$ mit der Impulsantwort

> [!important] Für die Faltung gelten die Körperaxiome:
> 
> 1. neutrales element $e$: $\delta(t)$
>     - Die Faltung eines Signals mit dem Dirac-Impuls ergibt wieder das Signal
> inverses Element $a'$: $x(t)$
>     - Die Faltung des Signals mit sich selbst ist $1$
> kommutativität: $x*h=h*x$

Wenn zwei stetige Funktionen gefaltet werden ist das Ergebnis wieder stetig.


1. Abtaseigenschaft

$$
\int_{-\infty}^{\infty}f(t)*\delta(t-t_{0})\,\mathrm{d}t
$$

---

# Beispiele

>[!example] FAL002
Gegeben sei ein LTI-System mit der Impulsantwort

$$
h(t)=\sigma(t)
$$

**(a)** Welche mathematische Funktion führt dieses System aus?
**(b)** Ein Eingangssignal $x(t)$ dieses Systems sei gegeben durch

$$
x(t)=e^{-a t} \sigma(t) \sigma(T-t) \quad \text { mit } a>0
$$


Wie lautet die Systemantwort $y(t)$ ? Skizzieren Sie Eingangs- und Ausgangssignal!
**(c)** Das Eingangssignal sei nun ein um $t_0$ zeitverschobener Dirac-Impuls,

$$
x(t)=\delta\left(t-t_0\right)
$$


Wie lautet die Antwort des Systems $y(t)$ ?

> [!success]- Lösung


(a) 

$$
\begin{align}
y(t)&= \int ^\infty_{-\infty} x(\uptau)\cdot \underbrace{ \sigma(t-\uptau) }_{ \sigma \left( \frac{\uptau-t}{-1} \right) } \, d\uptau  \\
 &= \int _{-\infty}^t x(\uptau )\, d\uptau = \int _{-\infty} \, dx 
\end{align}
$$


(b) 
$$
\begin{align}

x(t) : e^{ -at }\cdot\sigma(t)\cdot\sigma(T-t), \quad a >0

\end{align}$$

1. Bereich:

$t<0, \quad y(t)=0$

2. Bereich

$0 \leq t < T:$

$$
y(t): \int _{0}^t 1\cdot x(\uptau) \, \mathrm{d}\uptau = \int_{0}^t e^{ -a\uptau }\cdot\sigma(\uptau)\cdot\sigma(T-\uptau)\, \mathrm{d}\uptau
$$ 


```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\newcommand\T{1}
\newcommand\ALP{0.2}

\begin{axis}
\addplot{1};
\draw (\T, 0) -- (\T, 1);
\addplot{exp(-\ALP*x)}
\end{axis}
\end{tikzpicture}

\end{document}
```


