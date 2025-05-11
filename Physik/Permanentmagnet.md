---
tags: 
aliases: []
keywords: 
subject:
  - Elektrische Maschinen und Antriebselektronik
  - VL
semester: SS25
created: 10. März 2025
professor:
  - Wolfgang Gruber
draft: true
title: Permanentmagnet
---
 

# Permanentmagnet

> [!question] Themengebiet [Magnetisches Feld](../Elektrotechnik/Magnetisches%20Feld.md)

---

## Magnetkennlinie

## Linearisierte Entmagnetisierungs Kennlinie

| Gesamte Magnethysteresekurve                 | **Lineareisierte** Entmagnetisierungs Kennlinie (2. Quadrant) |
| -------------------------------------------- | ------------------------------------------------------------- |
| ![invert_dark\|400](../assets/EntMagnKL.png) | ![invert_dark\|400](../assets/EntMagnKL2.png)                 |

> [!def] **D1 - ENTM)** Linearisierte Entmagnetisierungs Kennlinie ^ENTM
>
> $$
> \begin{align}
> B_{m} &= B_{r} \mp \mu_{0}\mu_{r}H_{m}\\
> \mp H_{m} &= \frac{B_{\mathrm{m}}-B_{\mathrm{r}}}{\mu_{0}\mu_{\mathrm{m}}}
> \end{align}
> $$

**Vorzeichen:** $H_{m}$ ist im Arbeitspunkt negativ

Man rechnet oft in der Physik mit positiven H werten (konvention) deshalb 

- Wenn $H_{m}$ ein positiver Wert ist: Man rechnet mit $-$ in der Kennlinie
- Wenn $H_{m}$ ein negativer Wert ist: Man rechnet mit $+$ in der Kennlinie

### Arbeitsgerade und Arbeitspunkt

> [!def] **Arbeitsgerade** 
Die Arbeitsgerade ist jene Gerade, die durch die **Magnetische Rückwirkung** des angeschlossenen Magnetkreises entsteht. Dabei müssen externe Gegenfelder berüc

> [!def] **Arbeitspunkt / Betriebspunkt**
> Der Schnittpunkt der Arbeitsgerade mit der **Magnetkennlinie** bezeichnet man als Betriebspunkt / Arbeitspunkt des Permanentmageneten.

![invert_dark|300](assets/ArbeitsgeradePM.png)

#### Einfacher Magnetkreis mit PM

Beispiel eines Einfachen Eisenkreises mit Permanentmagneten und Luftspalt

![invert_dark|400](../assets/EinfPMMagnKreis.png)

> [!important] **Arbeitsgerade** $B_{\mathrm{m}}(H_{\mathrm{m}})$ einfacher Permanentmagnetischer Kreis
> $$
> B_{\mathrm{m}}(H_{\mathrm{m}}) = -\mu_{\mathrm{ges}} \mu_{0} \frac{l_{\mathrm{m}}A_{\delta}}{l_{\delta}A_{\mathrm{m}}}H_{m}
> $$

> [!hint]- Herleitung
> ![Herleitung Arbeitsgerade](#Herleitung%201)

> [!important] **Betriebspunkt** einfacher Permanentmagnetischer Kreis
> $$
> B_{\mathrm{m}} = \frac{B_{\mathrm{r}}}{\left(1+\frac{\mu_{\mathrm{m}}l_{\delta}A_{\mathrm{m}}}{\mu_{\mathrm{ges}}l_{\mathrm{m}}A_{\delta}}\right)}
> $$

> [!hint]- Herleitung
> ![Herleitung 2](#Herleitung%202)

### Energiedichte

![invert_light|400](../Elektrotechnik/assets/MagnetKLundEnergie.png)

---

# Anhang

## Herleitung 1

Ziel: $B_{\mathrm{m}}(H_{\mathrm{m}})$

- [Durchflutung](../Elektrotechnik/Durchflutung.md): Masche aufstellen, dabei wird der Eisenkreis als ideal angenommen.

$$
H_{\mathrm{m}}l_{\mathrm{m}} + H_{\delta}l_{\delta}+\underbrace{ H_{\text{Fe}}l_{\text{Fe}} }_{\approx 0} = 0
$$

- [Materialgesetz](Konstanten/Permeablität.md) anwenden: $\mu_{0}H_{\delta}= B_{\delta}$
- Mit der Luftspaltfläche Erweitern: $A_{\delta} / A_{\delta}$

$$
H_{\mathrm{m}}l_{\mathrm{m}} = -\frac{B_{\delta}}{\mu_{0}}l_{\delta}\cdot \frac{A_{\delta}}{A_{\delta}}
$$

- [Magnetischer Fluss](../Elektrotechnik/Magnetischer%20Fluss.md) einsetzen: $\Phi = B_{\delta}A_{\delta}$
- Es gibt nur eine Masche. Der Fluss durch den PM der gleiche wie durch den Luftspalt: $\Phi=B_{\mathrm{m}}A_{\mathrm{m}}$

$$
H_{\mathrm{m}}l_{\mathrm{m}} = -\frac{\Phi}{\mu_{0}A_{\delta}}l_{\delta} = -\frac{B_{\mathrm{m}}A_{\mathrm{m}}}{\mu_{0}A_{\delta}}l_{\delta}
$$
- Umformen auf $B_{\mathrm{m}}$ liefert die Arbeitsgerade

$$
B_{\mathrm{m}}(H_{m}) = -H_{\mathrm{m}} \frac{l_{\mathrm{m}}}{l_{\delta}}
$$

## Herleitung 2

Gesucht ist die Flussdichte im Permanentmagent während des Betriebs. D.h. den Schnittpunkt zwischen Arbeitskennlinie und Magnetkennlinie.

- Einsetzen von $H_{m}$ der [linearisierte Entmagnetisierungsgleichung](#^ENTM) liefert:

$$
\begin{align}
&B_{\mathrm{m}} = -\mu_{\mathrm{ges}} \cancel{ \mu_{0} } \frac{l_{\mathrm{m}}A_{\delta}}{l_{\delta}A_{\mathrm{m}}} \frac{B_{\mathrm{m}}-B_{\mathrm{r}}}{\cancel{ \mu_{0} }\mu_{\mathrm{m}}}\\
&B_{\mathrm{m}} = (B_{\mathrm{r}}-B_{\mathrm{m}}) \frac{\mu_{\mathrm{ges}}l_{\mathrm{m}}A_{\delta}}{\mu_{\mathrm{m}}l_{\delta}A_{\mathrm{m}}} \\
&B_{\mathrm{m}}\left(1+\frac{\mu_{\mathrm{ges}}l_{\mathrm{m}}A_{\delta}}{\mu_{\mathrm{m}}l_{\delta}A_{\mathrm{m}}}\right) = B_{\mathrm{r}} \frac{\mu_{\mathrm{ges}}l_{\mathrm{m}}A_{\delta}}{\mu_{\mathrm{m}}l_{\delta}A_{\mathrm{m}}} \\
&B_{\mathrm{m}}\left(1+\frac{\mu_{\mathrm{m}}l_{\delta}A_{\mathrm{m}}}{\mu_{\mathrm{ges}}l_{\mathrm{m}}A_{\delta}}\right) = B_{\mathrm{r}} \\
&B_{\mathrm{m}} = \frac{B_{\mathrm{r}}}{\left(1+\frac{\mu_{\mathrm{m}}l_{\delta}A_{\mathrm{m}}}{\mu_{\mathrm{ges}}l_{\mathrm{m}}A_{\delta}}\right)}
\end{align}
$$