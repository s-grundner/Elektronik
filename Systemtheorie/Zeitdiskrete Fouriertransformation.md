---
tags: 
aliases: 
keywords: 
subject:
  - Signalverarbeitung
  - VL
semester: SS25
created: 19th March 2025
professor:
draft: true
title: Zeitdiskrete Fouriertransformation
---
 

# Zeitdiskrete Fouriertransformation

> [!important] Die Zeitdiskrete FT hat im gegensatz zur [DFT](DFT.md) folgende Eigenschaft
> Die Funktion im Zeitbereich ist Zeitdiskret im Frequenzbereich ist sie jedoch kontinuierlich.

Zur [Dualen Poissonschen Summenformel](Poissonsche%20Summenformel.md#^POIS2) erfolgen zwei Substituierungen:
- Zeitdiskret Abgetastete Funktion $f_{a}(nT) \Rightarrow f[n]$
- Normierte Frequenz: $\Omega=\omega T \Rightarrow \Omega_{0}=\omega_{0}T=2\pi$

> [!def] **D3 - DTFT)** Zeitdiskrete Fouriertransformation ^DTFT
> $$F_{\mathrm{d}}\left( e^{ j\Omega } \right) = \sum_{n=-\infty}^{\infty}f[n]e^{ -jn\Omega }\tag{DTFT}$$ 



> [!def] **D4 - IDTFT)** Zeitdiskrete Inverse Fouriertransformation ^IDTFT
> $$f[n]=\frac{1}{2\pi} \int_{-\pi}^{\pi}F_{\mathrm{d}}\!\left( e^{ j\Omega } \right) ~e^{ jn\Omega }\mathrm{~d}\Omega \tag{IDTFT}$$

$F(e^{ j\omega })$ ist eine Amplitudendichte -> Wird erst durch multiplikation von $e^{ j\omega }$ zur amplitude des signals $x$
## Konvergenz

Die Transformierte konvergiert nur dann, wenn $f[n]$ absolut summierbar ist:

$$\sum_{n=-\infty}^{\infty}\lvert f[n] \rvert < \infty$$

> [!bug] Diese Eigenschaft hat z.B. ein DC-Signal nicht. #inclomplete siehe [Folien]
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