---
tags: []
aliases: []
subject: ["mtrs"]
source: ["Norbert Irnleitner"]
created: 7th November 2022
---

# Systemtheorie

--- 

## Übertragungsfunktion

Häufiger als Zeitabhängige Funktionen sind Frequenzabhängige Funktionen -> Übertragungsfunktion

Einzelne Frequenzen können im nicht eingeschwungenen Zustand von der Intensität her verändern -> Ein System lässt sich nur im eingeschwungen Zustand beschreiben: Übertragungsfunktion nur im eingeschwungenen Zustand.

> [!info] [Fourier Reihe](Fourier%20Reihe.md)
> 
> $f(\omega) = \sum\limits_{i=1}^{n}a_{i}\cdot e^{j\omega\cdot t}$: sofern Phase bekannt (Diskrete Fourierreihe)
> $f(\omega) = \sum\limits_{i=1}^{n}a_{i}\cdot \cos(\omega_{i}\cdot t)$: sofern Phase irrelevant (Diskrete Cosinusreihe)
> 


> [!info]- [Fouriertransformation](Fouriertransformation.md)
> 
> wenn zeitabhängige funktionen mit zunehmender frequenz nicht konvergieren, kann keine fouriertranformation angewandt werden:
> - Hohe Frequenzen müssen gegen 0 gehen -> Lösung: [Laplacetransformation](Laplacetransformation.md)
> $$
> \begin{align*}
> \mathcal{F}\{f(t)\} = F(\omega) = \int_{-\infty}^{\infty} f(t)\cdot e^{-j\omega t}dt && t \in \mathbb{R}\qquad 
> \end{align*}
> $$
> - $\mathcal{F\{f(t)\}}= F(\omega)$ ist das Spektrum von $f(t)$
> 
> Bsp.: [Stefan-Boltzmann](../Physik/Schwarzkörperstrahlung.md) Spektrum 



> [!info] [Laplacetransformation](Laplacetransformation.md)
> 
> $$
> \begin{align*}
> \mathcal{L}\{f(t)\} &= \mathcal{F}\{f(t)\cdot e^{-\delta t}\} = F(\omega)\\
> F(\omega) &= \int_{-\infty}^{\infty}f(t)\cdot\underbrace{e^{-\delta t}\cdot e^{-j\omega t}}_{e^{-(\delta+j\omega)t}}dt\\
> F(\omega) &= \int_{-\infty}^{\infty}f(t)\cdot e^{-(\delta+j\omega)t} dt\qquad s = \delta+j\omega\\
> F(s) &= \int_{0}^{\infty}f(t)\cdot e^{-st}dt\\
> 
> \end{align*}
> $$
> 

# Quellen

![MTRS 4-5](assets/pdf/MTRS%204-5.pdf)
