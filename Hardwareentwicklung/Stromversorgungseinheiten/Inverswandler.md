---
tags:
  - Baugruppe/Versorgung/SMPS
aliases:
  - Buck-Boost-Converter
subject:
  - hwe
source:
  - Siegbert Schrempf
created: 26th September 2022
---

# Inverswandler

- Der Inverswandler arbeitet nach dem [Sperrwandler](Sperrwandler.md)-Prinzip
- Die Ausgangsspannung $-U_{a}$ kann größer oder kleiner als $U_{e}$ sein.

## Schaltbild

![invert_dark|700](assets/Pasted%20image%2020250511114554.png)

Der [Transistor](../Halbleiter/{MOC}%20Transistor.md) arbeitet als Schalter ($S$) der mittels PWM ($U_{st}$) angesteuert wird. Dabei wird eine $U_{a}$ mit umgekehrtem Vorzeichen zur Eingangsspannung erzeugt.

## Lauf-Zeit-Diagramm

![invert_light](../../_assets/BuckBoostLZD.png)

| Kontinuierlicher Betrieb                            | Diskontinuierlicher Betrieb                            |
| --------------------------------------------------- | ------------------------------------------------------ |
| ![invert_light\|1000](../../_assets/BuckBoostConID.png) | ![invert_light\|1000](../../_assets/BuckBoostDisconID.png) |
| $$I_{a,max}=\overline{I_{D}}$$                      | $$I_{a,min} = \overline{I_{D}}$$                       |

<div style="page-break-after: always;"></div>

## Schalter $S$ bzw. [Transistor](../Halbleiter/{MOC}%20Transistor.md) $T$

$$
U_{a} \approx -U_{e} \frac{D}{1-D} \qquad \text{mit } D = \dfrac{t_{1}}{T_{s}}
$$

### Herleitung

> [!info] $0<t<t_{1}$: $S_{\text{geschlossen}}$
> 
> $$
> \begin{align*}
> \Delta I_{L1} &= \frac{1}{L}\int^{t_{1}}_{0}{U_{e}\mathrm{d}t}= \frac{1}{L}\cdot U_{e}\cdot t_{1}
> \end{align*}
> $$

> [!info] $t_{1} < t < T_{S}$: $S_{\text{offen}}$
> 
> $$
> \begin{align*}
> \Delta I_{L2} &= \frac{1}{L} \int^{T_{s}}_{t_{1}}{(-1)\cdot (-U_a+U_{Fo})\mathrm{d}t}\\
> &=-\frac{1}{L}\cdot (-U_{a}+U_{Fo})(T_{s}-t_{1})
> \end{align*}
> $$

> [!info] $\Delta I_{L1}= -\Delta I_{L2}$
> 
> $$
> \begin{align*}
> \frac{1}{L}\cdot U_{e}\cdot t_{1} &= \frac{1}{L}\cdot (-U_{a}+U_{Fo})(T_{s}-t_{1})\\
> &\dots\\
> U_{a}& \approx -U_{e} \frac{t_{1}}{T_{s}-t_{1}} 
> \end{align*}
> $$

Arbeitszyklus: $D = \dfrac{t_{1}}{T_{s}}$

---

# Referenzen

[Walter Schmid SMPS](../../xEDU/xLiteratur/Schaltungstechnik/Schaltnetzteile_Schmidt-Walter.pdf)