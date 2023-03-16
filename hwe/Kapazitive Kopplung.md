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
![[Pasted image 20230316093012.png|600]]
$$
\begin{align*}
u_{L}&= u_{SIG}\cdot \frac{R_{L}}{R_{L}+ R_{i}} + i_{stör}\cdot \frac{R_{i}\cdot R_{L}}{R_{i}+R_{L}}
\end{align*}
$$
Für den (allgemeinen) Fall, dass die [[Impedanz]] der Koppelkapazität sehr viel
größer ist als die [[Impedanz]] des Nutzkreises folgt:
# Schirmung
>[!info] Die Koppelkapazität teilt sich auf:
>Die Wirksame Koppelkapazität $C_{K}$ wird reduziert auf die Kapazität $C_{S2}$ zwischen Schrim und Nutzkreis.
>Bei gleicher Amplitude und $\frac{d}{dt}$ der Störquelle verringert sich damit die eingekoppelte Störspannung.
>![[Pasted image 20230316091847.png]]

> [!important] ESB
> ![[Pasted image 20230316091915.png|500]]

Der Schirm muss jeweils aus gut leitendem Material bestehen, damit der über ihn abfliessende Strom keinen nennenswerten Spannungsabfall über der Schirmimpedanz $Z_{s} = R_{s}+j\omega L_{s}$ erzeugt.


> [!example] PCB mit übereinander Kreuzende Leiterbahnen
> ![[kap_kopplung_bsp1.png|525]]
> ![[Modellbildung.png]]

# Tags