---
tags:
aliases:
  - Upconversion
  - Downconversion
  - Frequenzverschiebung
  - Momentanphase
  - Momentanfrequenz
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
> - [Analoge Modulation](Analoge%20Modulation.md)
> - [Digitale Modulation](Digitale%20Modulation.md)

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

## Momentanphase und Momentanfrequenz

Anstelle einer Amplitudenmodulation kann die Information auch direkt in das Argument des Kosinusförmigen Trägers eingeprägt werden. Es gilt im allgemeinen das Argument $\varphi(t)$ zeitlich so zu verändern, dass die information möglichst effektiv auf das gewünschte Frequenzband aufmoduliert wird.

> [!def] **D - MOMF)**  Momentanphase und Momentanfrequenz
> 
> $$
> \begin{align}
> \omega(t) &= 2\pi f(t) = \frac{\mathrm{d}\varphi}{\mathrm{d}t}(t) \\
> \varphi(t) &= \int_{0}^{t} \omega(t) \mathrm{~d}t + \varphi_{0} 
> \end{align}
> $$

### Darstellung mit Rotierenden Zeigern

Durch die darstellung der Momentanphase und frequenz als Rotierenden Zeiger, lassen sich mit dieser Methode Auch komplexwertige Signale als reelles Träger  
