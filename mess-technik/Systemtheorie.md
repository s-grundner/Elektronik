---
tags: []
aliases: []
subject: ["mtrs"]
source: ["Norbert Irnleitner"]
created: 7th November 2022
---

# Systemtheorie

## [Übertragungsfunktion](%C3%9Cbertragungsfunktion)

Häufiger als Zeitabhängige Funktionen sind Frequenzabhängige Funktionen -> [Übertragungsfunktion](%C3%9Cbertragungsfunktion)

Einzelne Frequenzen können im nicht eingeschwungenen Zustand von der Intensität her verändern -> Ein System lässt sich nur im Eingeschwngen Zustand beschreiben: [Übertragungsfunktion](%C3%9Cbertragungsfunktion) nur im eingeschwungenen Zustand.

## [Fourier Reihe](../../mathe/mathe%20(4)/Fourier%20Reihe.md)

$$
\begin{align*}
f(\omega) &= \sum\limits_{i=1}^{n}a_{i}\cdot e^{j\omega\cdot t} &&\qquad \text{sofern Phase bekannt (Diskrete Fourierreihe)}\\
f(\omega) &= \sum\limits_{i=1}^{n}a_{i}\cdot \cos(\omega_{i}\cdot t) &&\qquad \text{sofern Phase irrelevant (Diskrete Cosinusreihe)}
\end{align*}
$$

## [Fourier Transformation](../../mathe/mathe%20(4)/Fourier%20Transformation.md)

wenn zeitabhängige funktionen mit zunehmender frequenz nicht konvergieren, kann keine fouriertranformation angewandt werden:
- Hohe Frequenzen müssen gegen 0 gehen -> Lösung: [Laplace Transformation](../../mathe/mathe%20(4)/Laplace%20Transformation.md)
$$
\begin{align*}
\mathcal{F}\{f(t)\} = F(\omega) = \int_{-\infty}^{\infty} f(t)\cdot e^{-j\omega t}dt && t \in \mathbb{R}\qquad 
\end{align*}
$$
- $\mathcal{F\{f(t)\}}= F(\omega)$ ist das Spektrum von $f(t)$

Bsp.: [Stefan-Boltzmann](../../physik/Schwarzkörperstrahlung.md) Spektrum 

## [Laplace Transformation](../../mathe/mathe%20(4)/Laplace%20Transformation.md)

$$
\begin{align*}
\mathcal{L}\{f(t)\} &= \mathcal{F}\{f(t)\cdot e^{-\delta t}\} = F(\omega)\\
F(\omega) &= \int_{-\infty}^{\infty}f(t)\cdot\underbrace{e^{-\delta t}\cdot e^{-j\omega t}}_{e^{-(\delta+j\omega)t}}dt\\
F(\omega) &= \int_{-\infty}^{\infty}f(t)\cdot e^{-(\delta+j\omega)t} dt\qquad s = \delta+j\omega\\
F(s) &= \int_{0}^{\infty}f(t)\cdot e^{-st}dt\\

\end{align*}
$$

# Quellen

![MTRS 4-5](assets/PDF/MTRS%204-5.pdf)
