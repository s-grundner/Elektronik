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

> [!important] Die Faltung erfüllt folgende Eigenschaften
> 
> 1. neutrales element $e$: $\delta(t)$
>     - Die Faltung eines Signals mit dem Dirac-Impuls ergibt wieder das Signal
> 2. kommutativität: $x*h=h*x$

Wenn zwei stetige Funktionen gefaltet werden ist das Ergebnis wieder stetig.


1. Abtasteigenschaft

$$
\int_{-\infty}^{\infty}f(t)*\delta(t-t_{0})\,\mathrm{d}t = f(t_{0})
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
y(t)=\int _{0}^t 1\cdot x(\uptau) \, \mathrm{d}\uptau = \int_{0}^t e^{ -a\uptau }\cdot\sigma(\uptau)\cdot\sigma(T-\uptau)\, \mathrm{d}\uptau
$$ 


```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\newcommand\T{1}
\newcommand\ALP{0.6}

\begin{axis}[thick, axis lines=middle, xmin=0, ymin=0, xmax=4, ymax=2]
\addplot[domain=0:4]{1};
\addplot[domain=0:4]{exp(-\ALP*x)};
\draw[->] (\T, 0) -> (\T, 1);
\end{axis}
\end{tikzpicture}

\end{document}
```

>[!example] FAL003

$$
\begin{align}
y(t) &= (x*h)(t) = ((x_{1}+x_{2})*(h_{1}+h_{2}))(t) \\
&= (x_{1}*h_{1}+x_{1}*h_{2}+x_{2}*h_{1}+x_{2}*h_{2})(t)
\end{align}
$$