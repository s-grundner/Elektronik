---
tags: ["MCU", "Baugruppe/Oszillator"]
aliases: ["Schwingquarz", "XTAL", "Crystaloscillator", "Quarz"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 17th January 2023
---

# Quarzoszillator

> [!INFO] Schwingquarze beruhen auf dem Prinzip des Piezoelektrischen Effekts
> Der Quarz ist daher ein Mechanisches Bauelement 

## Symbol

![500|325](../assets/quarz.png)

> [!hint] Elektrisches Ersatzschaltbild des mechanischen Verhaltens  
> ![500|325](../assets/elek_esb_quarz.png)
> 
> ![400|350](../assets/quarz_mechschwing.png)
> 
> $L_{1}\dots$ Serien-[Induktivität](../../Elektrotechnik/Induktivitäten.md) (das Schwingen der Masse des Resonators)
> $C_{1}\dots$ Serien-[Kapazität](../../Elektrotechnik/Kapazität.md) (Elektrizitätskonstante des Quarzes)
> $R_{1}\dots$ Verlustwiderstand (Dämpfer. Innere [Reibung](../../Physik/Reibungskraft.md)/mechanische Verluste)
> $C_{0}\dots$ Streukapazität der Elektroden

## [Ableitung](../../Mathematik/Analysis/Differenzialrechnung.md) Der Resonanzfrequenz

$R_{1}$ vernachlässigbar

> [!NOTE] $s=\sigma+j\omega$
> $$
\begin{align*}
Z_{1} &= \frac{1}{sC_{1}}+sL_{1}= \frac{1+s^{2}L_{1}C_{1}}{sC1}\\
Z_{2} &= \frac{1}{sC_{0}}
\end{align*}
> $$
>
>$$
\begin{align*}
Z_{g} &=\frac{1+s^{2}L_{1}C_{1}}{s(C_{0}+C_{1})+s^{2}C_{0}C_{1}L_{1}} = \frac{Z(s)}{N(s)} \rightarrow \frac{=0 \text{ bei Reihenresonanz}}{=0\text{ bei Parallelresonanz}}\\
\end{align*}
> $$

## Bauteileigenschaften

Reale Wellenform des Schwingquarz

| ![](assets/WAVXTAL1.png) | ![](assets/WAVXTAL2.png) |     
| ----------------------------------------------- | ----------------------------------------------- |

# Tags

[ST Application Note](https://www.st.com/resource/en/application_note/an2867-oscillator-design-guide-for-stm8afals-stm32-mcus-and-mpus-stmicroelectronics.pdf)
