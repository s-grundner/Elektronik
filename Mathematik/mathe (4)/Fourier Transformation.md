---
tags:
  - HTL-Diplomarbeit
aliases:
  - Fouriertransformiert
  - Fouriertransformation
  - Fourier Analyse
subject:
  - mathe
source:
  - Rudolf Frauenschuh
  - Laurenz Hölzl
  - Daniel Ch. v. Grüningen
created: 27th April 2022
---

# Fourier Transformation

> [!INFO] Trivia  
> Die [Fourier Transformation](Fourier%20Transformation.md) ist eine Integraltransformation, welche 1822 von Jean Baptiste Fourier eingeführt wurde und genutzt wird, um das diskrete Frequenzspektrum aperiodischer Signale zu ermitteln.  
> Ihr gegenüber steht die [Fourier Reihe](Fourier%20Reihe.md), mit welcher sich das Spektrum periodischer [Funktionen](../Abbild.md) berechnen lässt.  
> Sie ist in vielen Bereichen von Wissenschaft und Technik unerlässlich.
> 
> - Vor allem bei der Datenkomprimierung spielt sie eine große Rolle. Um sie von einem Computer ausführen zu lassen gibt es die [Diskrete Fourier Transformation](DFT.md) ([[DFT]]) und die Schnelle Fourier Transformation ([FFT](../../Softwareentwicklung/ds-algo/FFT.md)).

## Unterschied zur [Fourierreihe](Fourier%20Reihe.md)

Der Ursprung der Fouriertransformation ist auf die [Fourierreihe](Fourier%20Reihe.md) zurückzuführen:

> [!INFO] zur [Fourier-Reihe](Fourier%20Reihe.md):  
> Eine *periodische* [Funktion](../Abbild.md) $f$ lässt sich in Form der [Fourier-Reihe](Fourier%20Reihe.md) als Summe unendlich vieler **Sinusschwingungen** darstellen.

> [!INFO] zur Fouriertransformation (auch Fourier-Analyse)  
> Die nun zu besprechenden **Fourier-Transformation** löst (auch) bei *nicht-periodischen* [Funktionen](../Abbild.md) die Aufgabe, diese als Überlagerung von **[harmonischen Schwingungen](../../Physik/harmonische%20Schwingungen.md)** darzustellen.
> 
> - Die Berechnung von $F$ aus $f$ heißt *Fourier-Transformation* der [Funktion](../Abbild.md) $f$.  
>
> - Dadurch entsteht aus einer reellen [Funktion](../Abbild.md) $f$ eine [komplexwertige](Komplexe%20Zahlen.md) [Funktion](../Abbild.md) $F$.

>[!SUCCESS] Man sagt, dass die Zeitfunktion $f$ im **Original-** oder **[Zeitbereich](Komplexe%20Zahlen.md)** liegt, während ihre Fourier-Transformierte im **Frequenz-** oder **Bildbereich** liegt.  
> Folgende Schreibweisen sind üblich: $F(\omega)=\mathcal{F}\{f(t)\}$ oder $f(t) \multimap F(\omega)$

## Fouriertransformierte

$\mathcal{F}(f(t))\dots$ Fouriertransformation von $f(t)$

$$
\begin{align*}
\mathcal{F}\{f(t)\} = F(\omega) = \int_{-\infty}^{\infty} f(t)\cdot e^{-j\omega t}dt && t \in \mathbb{R}
\end{align*}
$$

### Rücktransformation

$$
\mathcal{F}\{F(\omega)\}^{-1} = f(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(\omega)\cdot e^{j\omega t}d\omega
$$

## Herleitung

Durch Anwendung der [Eulersche Formel](Eulersche%20Formel.md):

$$
\begin{align*}
\cos(\varphi) &= \frac{1}{2}(e^{j\varphi}+e^{-j\varphi})\\
\sin(\varphi) &= -j\frac{1}{2}(e^{j\varphi}-e^{-j\varphi})
\end{align*}
$$

>[!summary] [Fourier Analyse](Fourier%20Reihe.md) - Komplexe Form Der [Fourier Reihe](Fourier%20Reihe.md)  
>
>$$f(t) = \frac{a_{0}}{2}+\sum^{\infty}_{n=1}\left[a_{n}\cdot\cos(n\cdot\omega_{0} t)+b_{n}\cdot\sin(n\cdot\omega_{0} t)\right]$$

$$
\begin{align*}
	f(t) &= \frac{a_{0}}{2} &&+ b_{1}\sin(\omega_{0}t) &&+ a_{1}\cos(\omega_{0}t) &&+ b_{2}\sin(2\omega_{0}t) &&+ a_{2}\cos(2\omega_{0}t) \dots
\\
	f(t) &= \frac{a_{0}}{2} &&+ b_{1}\cdot \frac{1}{2j}(e^{j\omega_{0}\cdot t}-e^{-j\omega_{0}\cdot t}) &&+ a_{1}\frac{1}{2}(e^{j\omega_{0}\cdot t} + e^{-j\omega_{0}\cdot t}) &&+ b_{2}\cdot \frac{1}{2j}(e^{j\omega_{0}2\cdot t}-e^{-j\omega_{0}2\cdot t}) &&+ a_{2}\frac{1}{2}(e^{j\omega_{0}2\cdot t}+e^{-j\omega_{0}2\cdot t}) \dots
\\
	f(t) &= \frac{a_{0}}{2} &&+ e^{j\omega_{0} t} \underbracket{(b_{1}\cdot \frac{1}{2j} + a_{1}\cdot \frac{1}{2})}_{C_{1}} &&+ e^{-j\omega_{0} t} \underbracket{(-b_{1}\cdot \frac{1}{2j} + a_{1}\cdot \frac{1}{2})}_{C_{-1}} &&+ e^{j\omega_{0}\cdot 2t} \underbracket{(b_{2}\cdot \frac{1}{2j} + a_{2}\cdot \frac{1}{2})}_{C_{2}} &&+ e^{-j\omega_{0}\cdot 2t} \underbracket{(-b_{2}\cdot \frac{1}{2j} + a_{2}\cdot \frac{1}{2})}_{C_{-2}}
\end{align*}
$$

>[!tip] $$f(t) = \frac{a_{0}}{2} + \sum\limits^{\infty}_{n=-\infty} C_{n}\cdot e^{jn\omega_{0}t} \dots \text{komplexe Form der Fourierreihe}$$

$$
\begin{align*}
	a_{n} &= \frac{2}{T} \int^{\frac{T}{2}}_{-\frac{T}{2}} f(t) \cdot\cos(n\omega_{0}t) dt
\\
	b_{n} &= \frac{2}{T} \int^{\frac{T}{2}}_{-\frac{T}{2}} f(t) \cdot\sin(n\omega_{0}t) dt
\\
	C_{n} &= \frac{1}{2}(a_{n}-jb_{n})
\\
	&= \frac{1}{2}\cdot
	\left[
		\frac{2}{T}\cdot\int^{\frac{T}{2}}_{-\frac{T}{2}} f(t)\cdot \frac{1}{2} (e^{jn\omega_{0}t} + e^{-jn\omega_{0}t}) dt -
		j\frac{2}{T} \int^{\frac{T}{2}}_{-\frac{T}{2}} f(t)\cdot \frac{1}{j2} (e^{jn\omega_{0}t} + e^{-jn\omega_{0}t}) dt
	\right]
\\
	&= \frac{1}{2T}\cdot 2\cdot\int^{\frac{T}{2}}_{-\frac{T}{2}} f(t)\cdot e^{-jn\omega_{0}t} dt
\\
	C_{n} &= \frac{1}{T}\int^{\frac{T}{2}}_{-\frac{T}{2}} f(t)\cdot e^{-jn\omega_{0}t} dt
\end{align*}
$$

$$
\begin{align*}
\omega_{0} &= \frac{2\pi}{T}\\
T &\rightarrow \infty\\
n\omega_{0}&\rightarrow\omega
\end{align*}

$$

$$
\underline{\underline{F(\omega) = \int_{-\infty}^{\infty} f(t)\cdot e^{-j\omega t}dt}}
$$