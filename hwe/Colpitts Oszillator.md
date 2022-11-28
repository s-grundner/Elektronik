---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 22nd November 2022
---

# Colpitts Oszillator
Besteht aus Emitter/Basis/Collector Schaltung mit einer Rückkopplung:

| <mark style="background: #FFB86CA6;">Colpitts:</mark> [[Kanalkapazität\|kapazitiv]] | <mark style="background: #FFB86CA6;">Hartley:</mark> [[Induktivitäten\|induktiv]] | <mark style="background: #FFB86CA6;">Meissner:</mark> transformatorisch |
| ----------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| ![[Pasted image 20221128102513.png]]                                                | ![[Pasted image 20221128102527.png]]                                              | ![[Pasted image 20221128102551.png]]                                                                        |

Häufigste Kombination: Colpitts Oszillator (mit kapazitiver Rückkopplung)
Vorteil: 
- einfache Kapazitäten
- nur eine [[Induktivitäten|Induktivität]]

## Schaltung
![[Pasted image 20221128102638.png]]


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


# Quellen
![[Pasted image 20221128095623.png|800]]
![[Pasted image 20221128095705.png|700]]
![[Pasted image 20221128095501.png|500]]
![[Pasted image 20221128095752.png|525]]