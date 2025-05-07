---
tags: []
aliases:
  - DTFT
keywords: 
subject:
  - VL
  - Signale und Systeme
  - Signalverarbeitung
semester: SS25
created: 19th March 2025
professor: 
draft: true
title: Zeitdiskrete Fouriertransformation
---
 

# Zeitdiskrete Fourier-Transformation

[Fouriertransformation](Fouriertransformation.md) ***:LiArrowBigRightDash:***
[Diskrete Fourier-Transformation](DFT.md) ***:LiArrowBigRightDash:***

---

> [!important] Die Zeitdiskrete FT hat im gegensatz zur [DFT](DFT.md) folgende Eigenschaft
> Die Funktion im Zeitbereich ist Zeitdiskret im Frequenzbereich ist sie jedoch kontinuierlich.

Zur [Dualen Poissonschen Summenformel](Poissonsche%20Summenformel.md#^POIS2) erfolgen zwei Substituierungen:
- Zeitdiskret Abgetastete Funktion $f_{a}(nT) \Rightarrow f[n]$
- Normierte Frequenz: $\Omega=\omega T \Rightarrow \Omega_{0}=\omega_{0}T=2\pi$

> [!def] **D1 - DTFT)** Zeitdiskrete Fouriertransformation ^DTFT
> $$F_{\mathrm{d}}\left( e^{ j\Omega } \right) = \sum_{n=-\infty}^{\infty}f[n]e^{ -jn\Omega }\tag{DTFT}$$ 

> [!def] **D2 - IDTFT)** Zeitdiskrete Inverse Fouriertransformation ^IDTFT
> $$f[n]=\frac{1}{2\pi} \int_{-\pi}^{\pi}F_{\mathrm{d}}\!\left( e^{ j\Omega } \right) ~e^{ jn\Omega }\mathrm{~d}\Omega \tag{IDTFT}$$

$F(e^{ j\omega })$ ist eine Amplitudendichte -> Wird erst durch multiplikation von $e^{ j\omega }$ zur amplitude des signals $x$

## Konvergenz

> [!satz] **S - KONV)** Die Transformierte $F_{\mathrm{d}}\left( e^{ j\Omega } \right)$ konvergiert nur dann, wenn die Folge $f[n]$ [absolut summierbar](../Mathematik/Analysis/Folgen.md#^STFO) ist

> [!bug] #todo Mit informationen aus den Folien ergänzen. Diese Eigenschaft hat z.B. ein DC-Signal nicht. siehe [Folien]
> Man kann nichts destotrotz ein Spektrum angeben, jedoch benötigt man Analoge Dirac-Impulse um das Spektrum darzustellen.

---

Eine wesentliche Eigenschaft für zeitdiskrete anwendungen ist, dass die Faltung im Bildbereich zur Multiplikation wird. 
Selbe idee, warum man für verstärkungen eine Logarothmustransformation vornimmt, damit diese einfacher zu rechnen sind. 
 

## Eigenschaften der DTFT

Verschobenes Signal:
 Amplitudenspektrum ist gleich, Verschiebung macht sich nur in der Phase erkennbar
Transformationsvorschriften funktionieren nur in richtung Zeitbereich -> Bildbereich.
Warum? Ein Zeitdiskretes Signal hat ein kontinuierliches Spektrum. Zu einem Kontinuierlichen Spektrum passen auch kontinuierliche Zeitsignale

### Parseval-Theorem

#todo Parseval Theorem ergänzen. Nach bereits existierenden Notizen dazu suchen. sonst Folien.

## DTFT - Transformationstabelle

$$

\begin{array}{|rcl|}
\hline
\displaystyle x[n]:=\dfrac{1}{2 \pi} \int\limits_{-\pi}^\pi X\left(e^{j \theta}\right) e^{j \theta n} \mathrm{d}\theta
& \circ\mkern-7px-\mkern-7px\bullet &
X\left(e^{j \theta}\right):=\sum\limits_{n=-\infty}^{\infty} x[n] e^{-j \theta n} \\ \hline

x\left[n-n_0\right]
& \circ\mkern-7px-\mkern-7px\bullet &
e^{-j \theta n_0} X\left(e^{j \theta}\right) \\ 

e^{j \theta_0 n} x[n]
& \circ\mkern-7px-\mkern-7px\bullet &
X\left(e^{j\left(\theta-\theta_0\right)}\right) \\

x^*[n]
& \circ\mkern-7px-\mkern-7px\bullet &
X^*\left(e^{-j \theta}\right) \\

x[-n]
&\circ\mkern-7px-\mkern-7px\bullet &
X\left(e^{-j \theta}\right) \\

\displaystyle(x * y)[n]=\sum\limits_{k=-\infty}^{\infty} x[k] y[n-k]
& \circ\mkern-7px-\mkern-7px\bullet &
X\left(e^{j \theta}\right) Y\left(e^{j \theta}\right) \\

x[n]\cdot y[n]
& \circ\mkern-7px-\mkern-7px\bullet &
\displaystyle\dfrac{1}{2 \pi}(X * Y)\left(e^{j \theta}\right)=\dfrac{1}{2 \pi} \int\limits_{-\pi}^\pi X\left(e^{j \lambda}\right) Y\left(e^{j(\theta-\lambda)}\right) \mathrm{d}\lambda \\

x_e[n]=\dfrac{1}{2}\left(x[n]+x^*[-n]\right)
& \circ\mkern-7px-\mkern-7px\bullet &
\Re e\left\{X\left(e^{j \theta}\right)\right\} \\

x_o[n]=\dfrac{1}{2}\left(x[n]-x^*[-n]\right)
& \circ\mkern-7px-\mkern-7px\bullet &
j \Im m\left\{X\left(e^{j \theta}\right)\right\} \\

\Re e\{x[n]\}
& \circ\mkern-7px-\mkern-7px\bullet &
X_e\left(e^{j \theta}\right)=\dfrac{1}{2}\left(X\left(e^{j \theta}\right)+X^*\left(e^{-j \theta}\right)\right) \\

j \Im m\{x[n]\}
& \circ\mkern-7px-\mkern-7px\bullet &
X_o\left(e^{j \theta}\right)=\dfrac{1}{2}\left(X\left(e^{j \theta}\right)-X^*\left(e^{-j \theta}\right)\right) \\

n\cdot x[n]
& \circ\mkern-7px-\mkern-7px\bullet &
j \dfrac{\mathrm{d}X\left(e^{j \theta}\right)}{\mathrm{d}\theta} \\

\sum\limits_{k=-\infty}^{n} x[k]
& \circ\mkern-7px-\mkern-7px\bullet &
\dfrac{1}{1-e^{-j \theta}} X\left(e^{j \theta}\right)+\pi X\left(e^{j \theta}\right) \delta_{2 \pi}(\theta) \\ \hline
\end{array}
$$
