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
> $$ F_{\mathrm{d}}\left( e^{ j\Omega } \right) := \sum_{n=-\infty}^{\infty}f[n]e^{ -jn\Omega }\tag{DTFT}$$ 

Oder in expliziter Schreibweise mit $\mathcal{F}_{\mathrm{d}}\left\{ f[n] \right\}\left( e^{ j\Omega } \right) \equiv F_{\mathrm{d}}$

> [!def] **D2 - IDTFT)** Zeitdiskrete Inverse Fouriertransformation ^IDTFT
> $$f[n]=\frac{1}{2\pi} \int_{-\pi}^{\pi}F_{\mathrm{d}}\!\left( e^{ j\Omega } \right) ~e^{ jn\Omega }\mathrm{~d}\Omega \tag{IDTFT}$$


$F(e^{ j\omega })$ ist eine Amplitudendichte -> Wird erst durch Multiplikation von $e^{ j\omega }$ zur Amplitude des Signals $x$

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

## DTFT Rechensätze

> [!satz]- **S1 - DTFT-R)** Rechensätze ^DTFT-R
> ![DTFT-Korr](Korrespondenzen/DTFT-Korr.md#^DTFT-T1)

### Parseval-Theorem

#todo Parseval Theorem ergänzen. Nach bereits existierenden Notizen dazu suchen. sonst Folien.
