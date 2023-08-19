---
tags: []
aliases: ["Leiterplatte", "PCB", "Leiterplatten-Design", "PCB-Design"]
created: 19th August 2023
---

# PCB-Layout

## [Schirmung](Schirmung.md) von Leiterbahnen

## Maßnahmen zur elektromagnetischen Verträglichkeit ([EMV](Elektromagnetische%20Verträglichkeit.md#Komponenten%20und%20Konzepte%20zur%20Verbesserung))

### Stack-Up

1. Dünnes Dielektrikum zwischen Signal-Layer und GND-Layer
	- Verbessert die Kopplung zwischen Signal und GND
	- verringert [Induktivität](Induktivitäten.md)
	- erhöht [Kapazität](Kapazität.md) zwischen Flächen
	$\Big(C=\dfrac{\varepsilon_{0}\cdot\varepsilon_{r}\cdot A}{d}\Big)$
2. Mindestens 1x GND Layer über/unter einem Signal/Power Layer
	- Grenzt E- und H-Felder ein
	- verringert [Induktivität](Induktivitäten.md)
	- gute Stromrückfluss
	- gute Leistungsverteilung
3. Keine aneinander angrenzenden Signal-Layer

### Leiterbahnen und Anpassung

1. Leiterbahnen kurz halten
2. Wellenwiderstand / [Impedanz](Impedanz.md) Anpassen
	- Abschlusswiderstand
3. Man strebt grundsätzlich [elektrisch kurze Leitungen](../hf-technik/Leitung.md) an
4. Leiterbahnen am Rand der Platine vermeiden
	- Niedriges [VSWR](../hf-technik/Stehwellenverhältnis.md)
	- keine [Reflexionen](../hf-technik/Reflexionsfaktor.md)
1. Leiterbahnen *niemals* über Referenzlücken routen

### Durchkontaktierungen / Vias

> [!hint] Induktivität wird mit der Distanz größer
> Vias in paaren Platzieren
> - Power und GND Vias ==dicht== nebeneinander Platzieren
> - Mit jedem Signal Via ein Referenz-Via ==dicht== daneben Platzieren 

# Tags

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)