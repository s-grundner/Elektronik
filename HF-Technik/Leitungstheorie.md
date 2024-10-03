---
tags:
  - incomplete
  - RF
  - Nachrichtentechnik
aliases: []
created: 20th August 2023
---

# Leitungstheorie

Die Leitungstheorie wird auf [HF-Übertragungsleitungen](Transmission%20Line.md) Angewandt, also wenn es sich auf der Leitung um ein [RF-Signal](RF-Signal.md) Handelt.

> [!NOTE] Kenngrößen  
> Zur vollständigen Beschreibung der Leitungseinflüsse muss die Leitung neben ihrer Länge $l$ durch zwei zusätzliche Kenngrößen charakterisiert werden:
> - den Leitungswellenwiderstand $Z_{L}$
> - und die [Ausbreitungskonstante](Telegraphengleichung.md) $\gamma$.
> 
> Im Schaltungsentwurf sind diese mit zu berücksichtigen!

## Leitermodell

| Bezeichnung        | Formel           | Einheit                  |
| ------------------ | ---------------- | ------------------------ |
| Widerstandsbelag   | $R'=\frac{R}{l}$ | $[R']=\frac{1\Omega}{m}$ |
| Leitwertsbelag     | $G'=\frac{G}{l}$ | $[G']=\frac{1S}{m}$      |
| Induktivitätsbelag | $L'=\frac{L}{l}$ | $[L']=\frac{1H}{m}$      |
| Kapazitätsbelag    | $C'=\frac{C}{l}$ | $[C']=\frac{1C}{m}$      | 

> [!summary] [Telegraphengleichung](Telegraphengleichung.md)
>
> $$
> \frac{d^{2}u}{dz^{2}}=u(z)\cdot\gamma^{2}\\
> $$

> [!summary] komplexer Ausbreitungskoeffizient
>
> $$
> \gamma = \sqrt{(R'+j\omega L')(G'+j\omega C')} = \alpha + j\beta
> $$

> [!summary] Lösung der [Telegraphengleichung](Telegraphengleichung.md)
>
> $$
> u(z)= U_{h}\cdot e^{-\gamma\cdot z}+ U_{r}\cdot e^{\gamma\cdot z}
> $$

## Allgemein

Eingangswiderstand $Z_{E}$
$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ \frac{Z_{L}}{Z_{A}}\cdot\tanh(\gamma\cdot l)}{1+ \frac{Z_{A}}{Z_{L}}\cdot\tanh(\gamma\cdot l)}
$$

## Verlustlos

$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ j\frac{Z_{L}}{Z_{A}}\cdot\tan(\gamma\cdot l)}{1+ j\frac{Z_{A}}{Z_{L}}\cdot\tan(\gamma\cdot l)}
$$

# Tags

[Veritasium](https://www.youtube.com/watch?v=oI_X2cMHNe0)