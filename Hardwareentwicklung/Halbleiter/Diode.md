---
tags:
  - Halbleiter/Diode
  - "#incomplete"
aliases:
  - Dioden
  - 1N4148
subject:
  - Einführung Elektronik
  - VL
created: 16th March 2022
professor:
  - Christian Diskus
  - Bernhard Jakoby
semester: WS24
keywords:
  - Kennlinie
  - Arbeitspunkt
---

# Diode

> Siehe [Halbleiterphysik](../../Physik/Halbleiterphysik.md)

![Shockley Gleichung](../../Physik/Shockley%20Gleichung.md#^SHOC)

## Taylorreihe

Eine [Taylorreihen](../../Mathematik/Analysis/Taylorreihe.md#^TAYL) Entwcklung der Shockley Gleichung ist zur annäherung möglich.
Es wird die Gleichung an einer Bias-Spannung $U_0$ entwickelt:


$$
I_{D T}(U) \approx \underbrace{I_{\mathrm{S}}\left(\mathrm{e}^{\frac{U_0}{n U_{\mathrm{T}}}}-1\right)}_{I_0}+\underbrace{\frac{I_{\mathrm{S}}}{n U_{T}}e^{\frac{U_{0}}{nU_{T}}}}_{\frac{\mathrm{d} I}{\mathrm{~d} U}}\left(U-U_0\right)+\underbrace{\frac{I_{\mathrm{S}} }{2 n^2 U_{\mathrm{T}}^2}}_{\frac{1}{2} \frac{\mathrm{~d}^2 I}{\mathrm{~d} U^2}}\left(U-U_0\right)^2
$$

Durch das Einführen der Größe des dynamischen Leitwertes $G_{d}= \frac{\mathrm{d}I}{\mathrm{d}U}$ lässt sich die Reihe schreiben wie:

$$
I(U) \approx I_{0} + (U-U_{0})\left.G_{d}\right|_{U_{0}} + \frac{(U-U_{0})^{2}}{2}\left.\frac{\mathrm{d}G_{d}}{\mathrm{d}U}\right|_{U_{0}}
$$

Mit $U=U_{0}+U(t)$ als Spannung die um einen DC Offset schwingt ergibt sich die **Kleinsignalannäherung**:

$$
I(t) \approx I_{0}+\underbrace{ \left.G_{d}\right|_{U_{0}} }_{ G_{d0} } + \frac{U^{2}(t)}{2} \underbrace{ \left.\frac{\mathrm{d}G_{d}}{\mathrm{d}U}\right|_{U_{0}}}_{ G'_{d0} }
$$

## Überblick D-R Schaltungen

### Serien Schaltungen

| Schaltung                                   | ![1600](assets/Pasted%20image%2020241107144022.png) |
| ------------------------------------------- | --------------------------------------------------- |
| Arbeitspunkt                                | ![1600](assets/Pasted%20image%2020241107144157.png) |
| Gesamtkennlinie: <br>*Horizontale Scherung* | ![1600](assets/Pasted%20image%2020241107144325.png) |

### Parallelschaltungen

| Schaltung                                 | ![1200](assets/Pasted%20image%2020241107144523.png) |
| ----------------------------------------- | --------------------------------------------------- |
| Arbeitspunkt                              | ![1200](assets/Pasted%20image%2020241107144534.png) |
| Gesamtkennlinie: <br>*Vertikale Scherung* | ![1200](assets/Pasted%20image%2020241107144545.png) |

## Materialien

- [Silizium](../../Physik/Materialkunde/Silizium.md)
- [Germanium](../../Physik/Materialkunde/Germanium.md)

## Dioden Variationen

- [Zener-Diode](Zener-Diode.md)
- Tunnel-Diode
- [Leucht-Dioden](Leucht-Dioden)
- [Kapazitäts-Diode](Kapazitäts-Diode.md)
- [TVS-Diode](TVS-Diode.md)

## 