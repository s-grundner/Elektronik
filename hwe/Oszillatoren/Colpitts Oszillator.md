---
tags: ["Oszillator"]
aliases: ["Colpitts"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 22nd November 2022
---

# Colpitts Oszillator
Besteht aus Emitter/Basis/Kollektor Schaltung mit einer Rückkopplung:

| <mark style="background: #FFB86CA6;">Colpitts:</mark> kapazitiv | <mark style="background: #FFB86CA6;">Hartley:</mark> [induktiv](Induktivit%C3%A4ten%5C) | <mark style="background: #FFB86CA6;">Meissner:</mark> transformatorisch |
| --------------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| ![colpitts1](hwe/assets/colpitts1.png)                            | ![Pasted image 20221128102527](hwe/assets/Pasted%20image%2020221128102527.png)                                              | ![Pasted image 20221128102551](hwe/assets/Pasted%20image%2020221128102551.png)                                    |

Häufigste [Kombination](mathe/mathe%20(5)/Kombination.md): Colpitts Oszillator (mit kapazitiver Rückkopplung)
Vorteil: 
- einfache Kapazitäten
- nur eine [Induktivität](hwe/Induktivitäten.md)
Schwingt wenn die Schleifenverstärkung $=1$ und die Phasendrehung über die Schlefe $0\degree$ bzw. $k\cdot2\pi$ ist.

$$V_{ges}=1 \qquad \varphi = k\cdot2\pi \qquad k=0\dots n$$

## Schaltung
![colp-sch](hwe/assets/colp-sch.png)

## Funktionsweise
- [Emitterschaltung](hwe/Kollektorfolger.md): $\varphi = 180\degree$ zwischen $U_{a}$ und $U_{e}$
- kapazitive 3-Punkt Schaltung bringt weitere $180\degree\rightarrow\sum=360\degree$
- [Barkhausen Kriterium](hwe/Oszillatoren/Barkhausen%20Kriterium.md) ist erfüllt
- [Emitterschaltung](hwe/Kollektorfolger.md) mit Basisspannungs-Teiler
- $R_{E}$ zur Temperaturkompensation
- RFC ([Radio](physik/Rundfunk.md) Frequency Choke) dt. Drosselspule
	- hebt den Massebezug des Oszillatorsignal zur Betriebsspannung auf
- Analyse der Schleifenverstärkung bringt …
	- … einerseits $\mathcal{Im}(T(f))=0$ -> $\omega_{0}$ (Resonanzfrequenz)
	- … andererseits $\frac{C_{2}}{C_{1}}=S\cdot R_{L}$ -> Steilheit $S=\frac{\Delta I_{C}}{\Delta U_{BE}}$

## Herleitung
### Kapazitive 3-Punktschaltung
Ein Teil der [Schwingkreis](mathe/mathe%20(4)/Schwingkreise.md) Spannung muss phasenrichtig rückgekoppelt werden.
![500](hwe/assets/Pasted%20image%2020221128104351.png)
![Pasted image 20221128104421](hwe/assets/Pasted%20image%2020221128104421.png)
