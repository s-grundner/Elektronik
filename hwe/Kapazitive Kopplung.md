---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 6th March 2023
---

# Kapazitive Kopplung
Die Übertragung der Störgröße auf den Nutzkreis erfolgt über das
elektrische Feld.
Ursache für Kapazitive beeinflussung sind parasitäre (d.h nicht beabsichtigte)
Kapazitäten zwischen Leitern die zu verschiedenen Stromkreisen gehören.
![600](hwe/assets/Pasted%20image%2020230316093012.png)
Für den (allgemeinen) Fall, dass die [Impedanz](hwe/Impedanz.md) der Koppelkapazität sehr viel
größer ist als die [Impedanz](hwe/Impedanz.md) des Nutzkreises folgt:

$$
\begin{align*}
\text{für }\dfrac{1}{j\omega C_{K}}&\gg(R_{i}||R_{L})\text{ gilt}\\
i_{\text{stör}}&\approx C\cdot \frac{du_{\text{stör}}}{dt}\\
\end{align*}
$$

> [!summary] 
> $$
> \begin{align*}
> u_{L}&= u_{SIG}\cdot \frac{R_{L}}{R_{L}+ R_{i}} + i_{\text{stör}}\cdot \frac{R_{i}\cdot R_{L}}{R_{i}+R_{L}}\\
> u_{L}&= \frac{R_{L}}{R_{L}+ R_{i}}\cdot (u_{SIG}+ i_{\text{stör}}\cdot R_{i})\\
> \end{align*}
> $$

# Schirmung
>[!info] Die Koppelkapazität teilt sich auf:
>Die Wirksame Koppelkapazität $C_{K}$ wird reduziert auf die [Kapazität](hwe/Kapazität.md) $C_{S2}$ zwischen Schrim und Nutzkreis.
>Bei gleicher Amplitude und $\frac{d}{dt}$ der Störquelle verringert sich damit die eingekoppelte Störspannung.
>![Pasted image 20230316091847](hwe/assets/Pasted%20image%2020230316091847.png)

> [!important] ESB
> ![500](hwe/assets/Pasted%20image%2020230316091915.png)

Der Schirm muss jeweils aus gut leitendem Material bestehen, damit der über ihn abfliessende Strom keinen nennenswerten Spannungsabfall über der Schirmimpedanz $Z_{s} = R_{s}+j\omega L_{s}$ erzeugt.


> [!example] PCB mit übereinander Kreuzende Leiterbahnen
> ![525](hwe/assets/kap_kopplung_bsp1.png)
> ![Modellbildung](hwe/assets/Modellbildung.png)

# Tags