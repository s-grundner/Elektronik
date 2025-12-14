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
release: true
title: Modulation
---


# Modulation

Zur verschiebung des Nutzsignals in ein gewünschtes Frequenzband kommen verschiedene Modulationsarten zum einsatz.

|                                                             | [Analoge Modulation](HF-Technik/Analoge%20Modulation.md) | [Digitale Modulation](HF-Technik/Digitale%20Modulation.md) |                                                                   |
| ----------------------------------------------------------- | :------------------------------------------------------: | :--------------------------------------------------------: | ----------------------------------------------------------------: |
| Informations Signal                                         |  ![invert_dark\|600](../_assets/AnalogeModulation-Sig.png)   |   ![invert_dark\|500](../_assets/DigitaleModulationSig.png)    | Informations Signal                                               |
| Träger Signal                                               |        ![invert_dark\|600](../_assets/ModCarrier.png)        |         ![invert_dark\|500](../_assets/ModCarrier.png)         | Träger Signal                                                     |
| [Amplituden Modulation](HF-Technik/Amplitudenmodulation.md) |          ![invert_dark\|600](../_assets/ModAM.png)           |           ![invert_dark\|500](../_assets/ModASK.png)           | [Amplitude Shift Keying](HF-Technik/Amplitude-Shift-Keying.md)    |
| [Frequenz Modulation](HF-Technik/Frequenzmodulation.md)     |         ![invert_dark\|600](../_assets/ModFMPM.png)          |           ![invert_dark\|500](../_assets/ModFSK.png)           | [Frequnecy Shift Keying](HF-Technik/Frequency-Shift-Keying.md)    |
| Phasen Modulation                                           |         ![invert_dark\|600](../_assets/ModFMPM.png)          |          ![invert_dark\|500 ](../_assets/ModPSK.png)           | Phase Shift Keying |

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

## Demodulation

Man unterscheidet im Allgemeinen Zwischen **Kohärenter** und **Nicht Kohärenter** Demodulation. Bei der Kohärenten Demodulation müssen die Lokalen Oszillatoren Synchron sowohl in Frequenz als auch in Phase sein.

## Synchronisation

Synchronisation der Frequenz

- Domintante Spektrallinien aus dem Spektrum Filtern
- Mit [PLL](../Hardwareentwicklung/Oszillatoren/Phase%20Locked%20Loop.md) möglich

Synchronisation der Phase

- Oft Schwieriger
- Auch mit einem PLL möglich