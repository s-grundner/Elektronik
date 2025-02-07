---
tags: 
aliases: 
keywords: 
subject:
  - Einführung Elektronik
  - VL
semester: WS24
created: 7. Februar 2025
professor:
---
 
# Fermiverteilung

Ein Elektron kann gleichzietig nur ein einziges erlaubtes Energieniveau besetzen ([Pauli-Prinzip](../Elektrotechnik/Teilchen%20im%20Kasten.md))

Die Fermiverteilung gibt an, mit welcher Wahrscheinlichkeit [...] ein Energieniveau $W$ von einem der Elektronen in einem Fermigas besetzt ist. (Bei gegbener absoluter Temparatur $T$)


> [!important] Besetzungswahrscheinlichkeit $F(W)$ in abhängigkeit von der Energie $W$
> Die Fermiverteilung beschreibt also:
> - Thermische Anregung von Elektronen $\iff$ Temperatur abhängige Wahrscheinlichkeit, einen höheren Energiezustand einzunehmen. 


> [!def] **D1 - FERM)** Fermiverteilung ^FERM
> $$F(W) = \frac{1}{1+\exp\left(\frac{W-W_{F}}{k_{b}T} \right)}$$
> $F(W)$... Besetzungswahrscheinlichkeit | $W$... Energie | $W_{F}$... Ferminiveau | $T$... Temperatur | $k_{B}$... [Boltzmannkonstante](Konstanten/Boltzmannkonstante.md)

Der Ausdurck $F(W)\mathrm{~d}W$ beschreibt die Wahrscheinlichkeit, dass das [infinitesimale](../Mathematik/{MOC}%20Analysis.md) Energieband $(W, W+\mathrm{d}W)$ bei der Temparatur $T$ besetzt ist.

> [!important] Ferminiveau
> Die in der Formel auftretende **Fermienergie** oder **Ferminiveau** $W_{F}$ ist ein chemisches Potenzial und repäsentiert jenes Energieniveau, das bei Temparatur $T=0$ aufgefüllt wäre.

![600](../assets/Excalidraw/Fermiverteilung%202025-02-07%2015.41.59.excalidraw)

---

[Fermi-Dirac-Statistik – Wikipedia](https://de.wikipedia.org/wiki/Fermi-Dirac-Statistik)