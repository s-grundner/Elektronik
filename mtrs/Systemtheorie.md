---
tags: []
aliases: []
subject: ["mtrs"]
source: ["Norbert Irnleitner"]
reference: []
created: 7th November 2022
---

# Systemtheorie

## [[Übertragungsfunktion]]
Häufiger als Zeitabhängige Funktionen sind Frequenzabhängige Funktionen -> [[Übertragungsfunktion]]

Einzelne Frequenzen können im nicht eingeschwungenen Zustand von der Intensität her verändern -> Ein System lässt sich nur im Eingeschwngen Zustand beschreiben: [[Übertragungsfunktion]] nur im eingeschwungenen Zustand.


## [[Fourier Reihe]]

$$
\begin{align*}
f(\omega) &= \sum\limits_{i=1}^{n}a_{i}\cdot e^{j\omega\cdot t} &&\qquad \text{sofern Phase bekannt (Diskrete Fourierreihe)}\\
f(\omega) &= \sum\limits_{i=1}^{n}a_{i}\cdot \cos(\omega_{i}\cdot t) &&\qquad \text{sofern Phase irrelevant (Diskrete Cosinusreihe)}
\end{align*}
$$
## [[Fourier Transformation]]
wenn zeitabhängige funktionen mit zunehmender frequenz nicht konvergieren, kann keine fouriertranformation angewandt werden:
- Hohe Frequenzen müssen gegen 0 gehen -> Lösung: [[Laplace Transformation]]
$$
\begin{align*}
\mathcal{F}\{f(t)\} = F(\omega) = \int_{-\infty}^{\infty} f(t)\cdot e^{-j\omega t}dt && t \in \mathbb{R}\qquad 
\end{align*}
$$
- $\mathcal{F\{f(t)\}}= F(\omega)$ ist das Spektrum von $f(t)$

Bsp.: [[Schwarzkörperstrahlung|Stefan-Boltzmann]] Spektrum 


# Quellen