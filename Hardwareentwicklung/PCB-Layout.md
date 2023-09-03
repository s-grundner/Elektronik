---
tags: []
aliases: ["Leiterplatte", "PCB", "Leiterplatten-Design", "PCB-Design"]
source: ["Rick Hartley", "Mike Creeden"]
created: 19th August 2023
---

# PCB-Layout

![500](assets/Pasted%20image%2020230822172103.png)

- **DFS - Lösbarkeit:** Kann das Board gelöst werden, EDA Kompetenz, Schaltung Abschätzen
- **DFP - Performance/Leistung:** Signal Integrität, EMV (Strahlt das PCB, ist das PCB empfindlich zu Strahlung), Thermisch, Strom 
- **DFM - Produzierbarkeit:** So Früh wie möglich die Bauteil Versorgung/Verfügbarkeit prüfen, mit dem Produktionshaus auseinander setzen. Erst Materialien/Stack-Up wählen

## Hochfrequenz Leitungen

## [Schirmung](Schirmung.md) Von Leiterbahnen

## Maßnahmen Zur Elektromagnetischen Verträglichkeit ([EMV](Elektromagnetische%20Verträglichkeit.md#Komponenten%20und%20Konzepte%20zur%20Verbesserung))

### Stack-Up

1. Dünnes Dielektrikum zwischen Signal-Layer und GND-Layer
	- Verbessert die Kopplung zwischen Signal und GND
	- verringert [Induktivität](Induktivitäten.md)
	- erhöht [Kapazität](Kapazität.md) zwischen Flächen  
	$\Big(C=\dfrac{\varepsilon_{0}\cdot\varepsilon_{r}\cdot A}{d}\Big)$
2. Mindestens 1x GND Layer über/unter einem Signal/Power Layer
	- Grenzt Eund H-Felder ein
	- verringert [Induktivität](Induktivitäten.md)
	- gute Stromrückfluss
	- gute Leistungsverteilung
3. Keine aneinander angrenzenden Signal-Layer

### Leiterbahnen Und Anpassung

1. Leiterbahnen kurz halten
2. Wellenwiderstand / [Impedanz](Impedanz.md) Anpassen
	- Abschlusswiderstand
3. Man strebt grundsätzlich [elektrisch kurze Leitungen](../HF-Technik/Leitung.md) an
4. Leiterbahnen am Rand der Platine vermeiden
	- Niedriges [VSWR](../HF-Technik/Stehwellenverhältnis.md)
	- keine [Reflexionen](../HF-Technik/Reflexionsfaktor.md)
5. Leiterbahnen *niemals* über Referenzlücken routen

### Durchkontaktierungen / Vias

> [!hint] Induktivität wird mit der Distanz größer  
> Vias in paaren Platzieren
> - Power und GND Vias ==dicht== nebeneinander Platzieren
> - Mit jedem Signal Via ein Referenz-Via ==dicht== daneben Platzieren 

# Tags

![EM Field and High-Speed Routing Principles - Mike Creeden](https://www.youtube.com/watch?v=3Is7bra3tsc)

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)