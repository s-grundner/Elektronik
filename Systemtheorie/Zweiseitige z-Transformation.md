---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 22nd May 2025
professor:
release: false
title: Zweiseitige z-Transformation
---

# Zweiseitige z-Transformation

> [!question] [Einseitige z-Transformation](z-Transformation.md)

---

> [!def] **D1 - 2ZTR)** Zweiseitige z-Transformation ^2ZTR
$$F(z) = \mathcal{Z}_{II} \{f[n]\} = \sum_{n=-\infty}^{\infty} f[n]z^{-n} = \sum_{n=-\infty}^{\infty} f[n] r^{-n}e^{ -j\Omega n } \tag{2ZTR}$$

Lässt sich auch im Zusammenhang der zeitdiskreten Fouriertransformation schreiben:

$$F(z) = \sum_{n=-\infty}^{\infty}\left( f[n]r^{-n} \right)e^{ -jn\Omega } =\mathcal{F}\{f[n]\cdot r^{-n}\}$$

$\implies$ die z-Transformation der Folge $f[n]$ ist gleich der zeitdiskreten Fouriertransformation der Folge $f[n]r^{-n}$. Wenn $r=1$ ist, dann stimmen beide Transformationen überein (sofern sie existieren)

## Uneindeutigkeit

> [!warning] Die zweiseitige z-Transformation ist nicht eindeutig

Zur Anwendung kommt daher meist nur die [Einseitige z-Transformation](z-Transformation.md).

## Existenzbedingung

> [!important] Existenzbedingung für die Existenz der z-Transformierten einer Folge $f[n]$: [Absolut Summierbar](../Mathematik/Analysis/Folgen.md)
> $$\sum_{n=-\infty}^{\infty}\left| f[n]r^{-n} \right|< M <\infty $$
> Mit dem Betrag $r$ kann also die Konvergenzeigenschaft der z-Transformierten beeinflusst werden. 

Äquivalent zum Realteil $\Re (s) = \sigma$ der Laplace-Transformation

## Umkehrintegral

Es sei $F(z)$ für alle $\lvert z \rvert \geq R$ holomorph, dann ist $F(z)$ eindeutig in eine (Laurent-) Reihe der Form wie in [1ZTR](z-Transformation#^1ZTR).

Holomorph: Komplex differenzierbar


> [!def] **D - IZTR)** Umkehrintegral der z-Transformation ^IZTR
>  $$f[n] = \frac{1}{j2\pi}\oint_{C}F(z)z^{n-1}\mathrm{~d}z$$

Die Kontur $C$ verläuft im Mathematisch positiven Sinn (gegen den Uhrzeigersinn) innerhalb des Konvergenzgebietes

> [!question] Liegt der Einheitskreis der z-Ebene im konvergenzgebiet

