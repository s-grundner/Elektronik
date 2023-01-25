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

| <mark style="background: #FFB86CA6;">Colpitts:</mark> kapazitiv | <mark style="background: #FFB86CA6;">Hartley:</mark> [[Induktivitäten\|induktiv]] | <mark style="background: #FFB86CA6;">Meissner:</mark> transformatorisch |
| --------------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| ![[Pasted image 20221128102513.png]]                            | ![[Pasted image 20221128102527.png]]                                              | ![[Pasted image 20221128102551.png]]                                    |

Häufigste Kombination: Colpitts Oszillator (mit kapazitiver Rückkopplung)
Vorteil: 
- einfache Kapazitäten
- nur eine [[Induktivitäten|Induktivität]]
Schwingt wenn die Schleifenverstärkung $=1$ und die Phasendrehung über die Schlefe $0\degree$ bzw. $k\cdot2\pi$ ist.

$$V_{ges}=1 \qquad \varphi = k\cdot2\pi \qquad k=0\dots n$$

## Schaltung
![[colp-sch.png]]

## Funktionsweise
- [[Kollektorfolger|Emitterschaltung]]: $\varphi = 180\degree$ zwischen $U_{a}$ und $U_{e}$
- kapazitive 3-Punkt Schaltung bringt weitere $180\degree\rightarrow\sum=360\degree$
- Barkhausenkriterium its erfüllt
- [[Kollektorfolger|Emitterschaltung]] mit Basisspannugsteiler
- $R_{E}$ zur Temperaturkompensation
- RFC ([[Rundfunk|Radio]] Frequency Choke) dt. Drosselspule
	- hebt den Massebezug des Oszillatorsignal zur Betriebspannung auf
- Analyse der Schleifenverstärkung bringt ...
	- ... einerseits $\mathcal{Im}(T(f))=0$ -> $\omega_{0}$ (Resonanzfrequenz)
	- ... andererseits $\frac{C_{2}}{C_{1}}=S\cdot R_{L}$ -> Steilheit $S=\frac{\Delta I_{C}}{\Delta U_{BE}}$

## Herleitung
### Kapazitive 3-Punktschaltung
Ein Teil der [[Schwingkreise|Schwingkreis]] Spannung muss phasenrichtig rückgekoppelt werden.
![[Pasted image 20221128104351.png|500]]
![[Pasted image 20221128104421.png]]
