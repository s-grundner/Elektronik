---
tags: []
aliases: ["Schwingquarz", "XTAL", "Crystaloscillator", "Quarz"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 17th January 2023
---

# Quarzoszillator
> [!info] Schwingquarze beruhen auf dem Prinzip des [](Piezoelektrik.md#Piezoelektrischer%20Effekt%7CPiezoelektrischen%20Effekts)
> Der Quarz ist daher ein Mechanisches Bauelement 

## Symbol

![500](quarz.png)

> [!hint] Elektrisches Ersatzschaltbild des mechanischen Verhaltens
> ![500](elek_esb_quarz.png)

![400](quarz_mechschwing.png)
$L_{1}\dots$ Serien-[Induktivität](Induktivit%C3%A4ten.md) (das Schwingen der Masse des Resonators)
$C_{1}\dots$ Serien-[Kapazität](Kapazit%C3%A4t.md) (Elektrizitätskonstante des Quarzes)
$R_{1}\dots$ Verlustwiderstand (Dämpfer. Innere Reibung/mechanische Verluste)
$C_{0}\dots$ Streukapazität der Elektroden

## [Ableitung](Differenzialrechnung.md) der Resonanzfrequenz
$R_{1}$ vernachlässigbar

> [!note] $s=\sigma+j\omega$

$$
\begin{align*}
Z_{1} &= \frac{1}{sC_{1}}+sL_{1}= \frac{1+s^{2}L_{1}C_{1}}{sC1}\\
Z_{2} &= \frac{1}{sC_{0}}\\
\\
Z_{g} &=\frac{1+s^{2L_{1}C_{1}}}{s(C_{0}+C_{1})+ s^{2}C_{0}C_{1}L_{1}} = \frac{Z(s)}{N(s)} \rightarrow \frac{=0 \text{ bei Reihenresonanz}}{=0\text{ bei Parallelresonanz}}\\

\end{align*}
$$


## Bauteileigenschaften

# Tags
[ST Application Note](https://www.st.com/resource/en/application_note/an2867-oscillator-design-guide-for-stm8afals-stm32-mcus-and-mpus-stmicroelectronics.pdf)
