---
tags:
  - incomplete
  - Signale/Diskret
aliases: 
subject:
  - Signale und Systeme
  - VL
created: 3rd February 2023
professor:
  - Andreas Stelzer
semester: WS24
---

# Faltung

> [!question] Bei [LTI-Systemen](LTI-Systeme.md) lässt sich das Ausgangssignal $y$ durch Faltung des Eingangssignals $x$ mit der Impulsantwort $h$ Des Systems berechnen.
> Die Faltungsoperation ist definiert durch das Faltungsintegral bei zeitkontinuierlichen und durch die Faltungssumme bei zeitdiskreten Signalen.

$$
\begin{align*}
y(t)&=x(t)\ast h(t)=\int_{-\infty}^{\infty}x(\uptau)\cdot h(t-\uptau)d\uptau=\int_{-\infty}^{\infty}x(t-\uptau)\cdot h(\uptau)d\uptau
\end{align*}
$$

![Convolution_of_box_signal_with_itself](assets/Convolution_of_box_signal_with_itself.gif)

## Eigenschaften der Faltung

> [!important] Die Faltung erfüllt folgende Eigenschaften
> 
> - kommutativ $(f * g)(t)=(g * f)(t)$
> - assoziativ: $(f *(g * h))(t)=((f * g) * h)(t)$
> - distributiv: $(f *(g+h))(t)=(f * g+f * h)(t)$
> - multilinear mit $a \in \mathbb{C}$ (linear in jeder Variablen) oder assoziativ mit der skalaren Multiplikation:
> $(a(f * g))(t)=((a f) * g)(t)=(f *(a g))(t)$
> 
> Die Menge $L_1\left(\mathbb{R}^n\right)$ bildet zusammen mit der Addition und der Faltung einen kommutativen Ring, der für die Faltung kein neutrales Element besitzt. Dies ändert sich bei der Erweiterung auf Distributionen, mit $\delta(t)$ als Einselement.

- Wenn zwei stetige Funktionen gefaltet werden ist das Ergebnis wieder stetig.

### Spezielle Funktionen

> [!important] Die Faltung von $f(t)$ mit der Sprungfunktion $\sigma(t)$
> 
> $$(f * \sigma)(t)=\int_{-\infty}^{\infty} f(\tau) \sigma(t-\tau) \mathrm{d} \tau=\int_{-\infty}^t f(\tau) \mathrm{d} \tau$$
> 
> entspricht der Fläche unter der Funktion $f(t)$.
> 
> Also Liefert die Faltung mit der Sprungfunktion die Stammfunktion von $f$:
> Systeme mit dem Einheitssprung als Impulsantwort sind ein **Integrator**
>

> [!important] Die Faltung von $f(t)$ mit der Dirac-Distribution $\delta(t)$
> 
> $$ (f * \delta)(t)=\int_{-\infty}^{\infty} f(\tau) \delta(t-\tau) \mathrm{d} \tau=f(t) $$
> 
> ergibt wieder die Funktion selbst, was unmittelbar aus der Abtasteigenschaft der Dirac-Distribution folgt. Damit ist $\delta(t)$ die „**Einsfunktion**" der Faltung.
> 
> Die Eigenschaften Fläche unter der Kurve bzw. Abtastwert der Funktion entsprechen umgekehrt der Definition der Funktionale der zugehörigen Distributionen $\sigma(t)$ und $\delta(t)$.
> Diese Eigenschaft ist die **Abtasteigenschaft** der [Dirac-Distribution](../Mathematik/Algebra/Delta-Impuls.md).



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


Wie lautet die Systemantwort $y(t)$ ? Skizzieren Sie Eingangsund Ausgangssignal!
**(c)** Das Eingangssignal sei nun ein um $t_0$ zeitverschobener Dirac-Impuls,

$$
x(t)=\delta\left(t-t_0\right)
$$


Wie lautet die Antwort des Systems $y(t)$ ?

> [!success]- Lösung


>[!example] FAL003

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    thick, axis lines=middle,
    xmin=-4, ymin=-1, xmax=4, ymax=3, xtick={-3,-2,-1,0,1,2,3}]

\addplot[domain=-3:-1]{0.5*(x+3)};
\addplot[domain=0:2]{0.5*x};

\draw[dashed] (-1, 0) -- (-1, 1);
\draw[dashed] (2, 0) -- (2, 1); 
\draw[dashed] (-3, 1) -- (3, 1); 

\end{axis}
\end{tikzpicture}

\end{document}
```

$$
x(t) = \frac{1}{2}(t+3)\cdot \operatorname{rect}\left( \frac{t-(-2)}{2} \right)-\frac{1}{2}t\cdot \operatorname{rect}\left( \frac{t-1}{2} \right)
$$

$$
\begin{align}
y(t) &= (x*h)(t) = ((x_{1}+x_{2})*(h_{1}+h_{2}))(t) \\
&= (\underbrace{ x_{1}*h_{1} }_{ y_{11} }+\underbrace{ x_{1}*h_{2} }_{ y_{12} }+\underbrace{ x_{2}*h_{1} }_{ y_{21} }+\underbrace{ x_{2}*h_{2} }_{ y_{22} })(t)
\end{align}
$$

Grenzen $y_{11}$

1. $-3>t: y_{11}(t) = 0$
2. $-3 \leq t < -1: y_{11}= \int_{-3}^{t} \frac{1}{2}(\uptau+3)\,\mathrm{d}\uptau = \frac{1}{2}\left( \frac{\uptau^{2}}{2} +3\uptau\right)\Big|_{-3}^t=\frac{1}{4}(t^{2}+6t+9)$
3. $-1\leq t<0: y_{11}(t)=\int_{-1}^{-3} x_{1}(\uptau)\,\mathrm{d}\uptau=1$
4. $0\leq t\leq 2: y_{11}(t)=\int_{t-3}^{-1} \frac{1}{2}(\uptau+3)\,\mathrm{d}\uptau = \frac{1}{2}\left( \frac{\uptau^{2}}{2}+3\uptau \right)\Big|_{t-3}^{-1}= \frac{1}{4}(-t^{2}+1)$ 
