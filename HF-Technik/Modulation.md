---
tags:
aliases:
  - Upconversion
  - Downconversion
  - Frequenzverschiebung
  - Modulationsarten
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 27th February 2025
professor:
  - Reinhard Feger
draft: true
title: Modulation
---


# Modulation

Zur verschiebung des Nutzsignals in ein gewünschtes Frequenzband kommen verschiedene Modulationsarten zum einsatz.


> [!info] Modulationsarten
> 
> | [Analoge Modulation](HF-Technik/Analoge%20Modulation.md) | [Digitale Modulation](HF-Technik/Digitale%20Modulation.md) |
> | - | - |
> | [Amplitudenmodulation](HF-Technik/Amplitudenmodulation.md) | [Amplitude Shift Keying](HF-Technik/Amplitude-Shift-Keying.md) |
> | [Quadratur Amplituden Modulation](HF-Technik/Quadratur%20Amplituden%20Modulation.md) |  Quantisierte QAM |
> | Phasenmodulation | Phase Shift Keying |
> | [Frequenzmodulation](HF-Technik/Frequenzmodulation.md) | [Frequency Shift Keying](HF-Technik/Frequency-Shift-Keying.md) |
> 


## Frequenzverschiebung

Betrachtet man einen einfachen Kosinus-Ton

$$
s_{\text{tone}} = \cos(2\pi f_{\text{tone}}t + \phi) = \cos(\alpha(t))
$$

Erzielt man rein mathematisch eine Frequenzverschiebung durch änderung des Arguments: $f_{\text{tone}} \mapsto f_{\text{tone}} + f_{0}$

$$
\begin{align}
s_{\text{TX}} &= \cos(2\pi (f_{\text{tone}}+f_{0})t + \phi) \\
&= \cos(2\pi f_{\text{tone}}t+2\pi f_{0}t + \phi) \\
&=\cos(\beta(t) + \alpha(t))
\end{align}
$$
mit $\alpha(t) = 2\pi f_{\text{tone}}t+\phi$ und $\beta(t) = 2\pi f_{0}t$

> [!question] Nun stellt sich die Frage, wie man Schaltungstechnisch erzielen kann, den Term $\beta(t)$ in das Argument des Kosinus einzufügen
> 
> Aus dem Trigonometrischen Satz für [Winkelsummen](Mathematik/Trigonometrische%20Funktionen.md#^WSUM) folgt:
> 
> $$
> \begin{align}
> \cos(\alpha(t)+\beta(t)) &= \cos\alpha(t) \cdot \cos\beta(t) - \sin\alpha(t) \cdot \sin \beta(t) \\
> &=  \cos\alpha(t) \cdot \cos\beta(t) - \cos \left( \alpha(t)-\frac{\pi}{2} \right) \cos\left( \beta(t)-\frac{\pi}{2} \right)
> \end{align}
> $$

Es ist zu sehen, dass eine Frequenzverscheibung mit

- Phasenverschiebung ($-\frac{\pi}{2}$)
- Zwei Multiplikationen und
- einer Summierung

Implementiert werden kann. 

> [!hint] Der erste Term würde nur eine einzige Multiplikation benötigen. 
> Darauf basiert das Konzept der Analogen [Amplitudenmodulation](HF-Technik/Amplitudenmodulation.md)
