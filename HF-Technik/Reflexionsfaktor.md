---
tags: []
aliases:
  - SWR
  - Stehwellenverhältnis
subject:
  - HF-Systemtechnik 1
  - KV
professor:
  - Reinhard Feger
created: 20th August 2023
semester: WS24
---

# Reflexionsfaktor

## Verlustlose TL

Der Reflexionsfaktor ist das Verhältnis der Amplituden von Hin und Rücklaufender Spannungswelle an einer Bestimmten Position einer [Transmission Line](Transmission%20Line.md).

> [!def] **D)** Reflexionsfaktor am Abschluss einer Transmissionline
> 
> $$
> \Gamma = \frac{U^+}{U^-} := \frac{Z_{L} - Z_{0}}{Z_{L}+Z_{0}}
> $$

![invert_dark|600](../_assets/Pasted%20image%2020260204173210.png)

> Verlustlose Transmissionline $\gamma = j\beta$

> [!hint]- Herleitung
> 
> Die Strom und Spannungswellen entlang einer TL werden durch die Lösung der Telegrafenleitungsgleichung beschrieben:
> 
> $$
> \begin{align}
> U(z) &= U^+ e^{ -j\beta z } + U^- e^{ j\beta z} \\
> I(z) &= \frac{U^+}{Z_{0}} e^{ -j\beta z } - \frac{U^-}{Z_{0}} e^{ j\beta z}
> 
> \end{align}
> $$
> 
> Der Leitungswellenwiderstand an der Stelle er Last ($z=0$) ist
> 
> $$
> Z_{L} = \frac{U(0)}{I(0)} = Z_{0} \frac{U^+ + U^-}{U^+ - U^-}
> $$
> 
> Löst man für $U^-$ erhält man
> 
> $$
> U^- = \frac{Z_{L} - Z_{0}}{Z_{L} + Z_{0}} U^+ = \Gamma U^+
> $$


### $\Gamma$ entlang einer Leitung Schieben

Der Refelexionsfaktor kann auch allgemein an jeder Stelle der TL betrachtet werden. Der Reflexionskoeffizient kann dann als Funktion entlang der Leitung $z \in [0;-l]$ beschrieben werden. Mit $z = -l$ erhält man:

$$
\Gamma (l) = \frac{U^- e^{ -j\beta l }}{U^+ e^{ j\beta l }} =\Gamma(0) e^{ -j 2\beta l }
$$

### Verlustbehaftete TL

Für eine [Verlustbehaftete TL](Verlustbehaftete%20TL.md) gilt $\gamma = \alpha + j\beta$, welche sich von dem Dämpfungsterm $\alpha$ von der Verlustlosen TL unterscheidet. Verschiebt man den Reflexionsfaktor auf der Leitung, ändert sich dieser sich nicht mehr nur in der Phase, sondern auch im Betrag.

$$
\Gamma(l) = \Gamma(0)e^{ -2\gamma l } = \Gamma(0) e^{ -j 2 \beta l } e^{ -2 \alpha l }
$$

## Old

![](../_assets/TL_QundS.png)

![InlineR|500](../_assets/OverUnderRefl.png)


> [!INFO] Undershoot hat in modernen digitalen Schaltungen einen größeren Einfluss
> Wegen niedrigen Logikpegel! 

# Stehwellenverhältnis

> [!NOTE] VSWR: Voltage Standing Wave Ratio

$s=VSWR=\frac{|U_{max}|}{|U_{min}|}=\frac{|I_{max}|}{|I_{min}|}$