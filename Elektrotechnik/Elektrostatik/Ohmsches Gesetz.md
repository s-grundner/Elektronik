---
tags:
  - Schaltungsanalyse
aliases:
  - Ohmschen Gesetz
created: 11. Februar 2024
keywords:
subject:
  - VL
  - Einführung Elektrotechnik
  - PR
semester: WS23
professor:
  - Bernhard Jakoby
release: true
title: Freiraumwellenwiderstand
---


# Das Ohmsche "Gesetz" - ein Modell

> [!question] [Materialgesetze](Materialgesetze.md)

---

Das Ohmsche Gesetz besagt, dass Strom linear über eine Materialeigenschaft - dem Widerstand - mit der [elektrische Spannung](Elektrostatik/elektrische%20Spannung.md) zusammenhängen

> [!satz] **S)** Ohmsches Gesetz ^S1-OHM
> 
> $$
> I = \frac{1}{R}\cdot U \qquad [R] = \Omega = \mathrm{\frac{kg~m^{2}}{A^{2}~s^{3}}}
> $$

Aus sicht der Feldtheorie ist diese beziehung äquivalent zu

> [!satz] **S)** Ohmsches Gesetz ^S2-OHM
> 
> $$
> \mathbf{J} = \sigma \mathbf{E} \qquad [\sigma] = \frac{1}{\Omega} = \mathrm{S}
> $$
> 

## Hintergrund

> [!info] Das [Drude-Modell](Drude-Modell.md) hat uns gelehrt,
> dass wir uns nicht wundern müssen, dass die Elektronen nicht kontinuierlich beschleunigen, sondern im mittel eine konstante Geschwindikgeit annehmen.

$$
\begin{align}
U&=\int_l \vec{E} \cdot d \vec{s} \qquad\vec{E}=\frac{\vec{J}}{\sigma}\implies \vec{E}\mid\mid d\vec{s}\\
U&=\int_l E d s=E \int_l d s=E l=\frac{J}{\sigma} l=I \frac{1}{\sigma A} l\\
&\implies R=\frac{U}{I}=\frac{1}{\sigma A} l=\frac{\rho}{A} l
\end{align}
$$


![invert_dark|500](../../_assets/Excalidraw/Ohmsches%20Gesetz%202024-03-18%2022.31.23.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Ohmsches%20Gesetz%202024-03-18%2022.31.23.excalidraw.md)%%


 

## Widerstand ls Bauelement

**Farbkennzeichnung**

| Farbe   | Werte | Multiplikator | Toleranz      |
| ------- | ----- | ------------- | ------------- |
| schwarz | $0$   | $10^{0}$      | -             |
| braun   | $1$   | $10^{1}$      | $\pm 1 \%$    |
| rot     | $2$   | $10^{2}$      | $\pm 2 \%$    |
| orange  | $3$   | $10^{3}$      | -             |
| gelb    | $4$   | $10^{4}$      | -             |
| grün    | $5$   | $10^{5}$      | $\pm 0.5 \%$  |
| blau    | $6$   | $10^{6}$      | $\pm 0.25 \%$ |
| violett | $7$   | $10^{7}$      | $\pm 0.1 \%$  |
| grau    | $8$   | $10^{8}$      | -             |
| weiß    | $9$   | $10^{9}$      | -             |
| gold    | -     | $10^{-1}$     | $\pm 5 \%$    |
| silber  | -     | $10^{-2}$     | $\pm 10 \%$   |
| keine   | -     | -             | $\pm 20 \%$   |


## Referenzen

- [Spannungsteiler](Elektrische%20Netzwerke/Spannungsteiler.md)
- [TDR](../../Analog-Design/TDR.md)