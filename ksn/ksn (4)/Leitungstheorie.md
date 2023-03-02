---
tags: []
aliases: []
subject: ["ksn"]
source: ["Martin Aichriedler"]
reference: ["Gustrau HF Technik, 70"]
created: 23rd November 2022
---

# Leitermodell

| Bezeichnung        | Formel           | Einheit                  |
| ------------------ | ---------------- | ------------------------ |
| Widerstandsbelag   | $R'=\frac{R}{l}$ | $[R']=\frac{1\Omega}{m}$ |
| Leitwertsbelag     | $G'=\frac{G}{l}$ | $[G']=\frac{1S}{m}$      |
| Induktivitätsbelag | $L'=\frac{L}{l}$ | $[L']=\frac{1H}{m}$      |
| Kapazitätsbelag    | $C'=\frac{C}{l}$ | $[C']=\frac{1C}{m}$      | 

> [!summary] [[Telegraphengleichung]]
> $$
> \frac{d^{2}u}{dz^{2}}=u(z)\cdot\gamma^{2}\\
> $$

> [!summary] komplexer Ausbreitungskoeffizient
> $$
> \gamma = \sqrt{(R'+j\omega L')(G'+j\omega C')}
> $$

> [!summary] Lösung der [[Telegraphengleichung]]
> $$
> u(z)= U_{h}\cdot e^{-\gamma\cdot z}+ U_{r}\cdot e^{\gamma\cdot z}
> $$
# Telegraphengleichung

> [!summary] Kirchhoff'sche Gesetze in der Leitungstheorie
> 1. Knotenregel
> 2. Maschenregel
## Herleitung

# Leitung
| Kennwert | Formelzeichen | Beschreibung |
| -------- | ------------- | ------------ |
| [[Dämpfung]] |               |              |
|          |               |              |

## Allgemein
$$\gamma = \alpha+ j\beta$$

$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ \frac{Z_{L}}{Z_{A}}\cdot\tanh(\gamma\cdot l)}{1+ \frac{Z_{A}}{Z_{L}}\cdot\tanh(\gamma\cdot l)}
$$


## Verlustlos
$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ j\frac{Z_{L}}{Z_{A}}\cdot\tan(\gamma\cdot l)}{1+ j\frac{Z_{A}}{Z_{L}}\cdot\tan(\gamma\cdot l)}
$$

# Stehwellenverhältnis
> [!note] VSWR: Voltage Standing Wave Ratio

$s=VSWR=\frac{|U_{max}|}{|U_{min}|}=\frac{|I_{max}|}{|I_{min}|}$
# Quellen
[[Reflexionsfaktor]]