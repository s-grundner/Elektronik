---
tags: 
aliases:
  - EMV
keywords: 
subject:
  - VL
  - EMV und SI
semester: WS24
created: 4. September 2023
professor:
  - Timm Ostermann
---
 

# Elektromagnetische Verträglichkeit

Elektromagnetische Verträglichkeit beschreibt die Fähigkeit eines Gerätes oder Systems in seiner elektromagnetischen Umgebung zufriedenstellend zu funktionieren ohne selbst unzulässige Störungen in diese Umgebung einzubringen.

![700](assets/EMV-einfluesse.png)

> [!INFO] EMV ist eine horizontale Disziplin  
> … die sich durch alle Bereiche der Elektrotechnik zieht.
> 
> ![600](assets/EMV-horiz.png)

## EMV-Beeinflussungsmodell

> [!hint] (1) [Störquelle](Störquelle.md)
> EME: Electromagnetic Emission - gesamte Ausstrahlung der Einrichtung
> - CE: Conducted Emission - Leitungsgeführte Ausstrahlung
> - RE: Radiated Emission - Abgestrahlte Ausstrahlung

$$\Downarrow$$

> [!hint] (2) Kopplungsmechanismus  
> Der Kopplungsmechanismus ist der physikalische Zusammenhang über den eine von der [Störquelle](Störquelle.md) ausgehende Störung auf die Senke einwirkt.  
> Kopplungsarten
> 1. [Kapazitive Kopplung](Kapazitive%20Kopplung.md) (über **gemeinsames** E-Feld)
> 2. Induktive Kopplung (über **gemeinsames** H-Feld)
> 3. [Galvanische Kopplung](Galvanische%20Kopplung.md) (über **gemeinsame** Impedanz)

$$\Downarrow$$

> [!hint] (3) Störsenke  
> Elektronische Einrichtung, deren Funktion durch die Störgrößen beeinträchtigt werden kann.
> 
> EMS: Electromagnetic Suscetibility - Störfestigkeit, Empfindlichkeit
> - CS: Conducted Susceptibility
> - RS: Radiated Susceptibility

---

> [!hint] Störgröße  
> Eine elektromagnetische Größe (Spannung-/ Stromfeldstärke) die eine unerwünschte Beeinflussung erzeugt.

# Komponenten und Konzepte zur Verbesserung

> [!INFO] Von Leistungselektronik bis Mikroelektronik gibt es eine große breite, und in der technischen Umsetzung sehr unterschiedliche, Maßnahmen.
> 
> ![400](assets/EMV-horiz2.png)
> 
> Kleine Chip-Kondensatoren gehen bis zu sehr hohen Resonanzfrequenzen.

1. E und H-Felder Eindämmen ([Schirmung](Schirmung.md))
2. ICs verwenden, welche die Anwendungen mit den langsamsten Anstiegsund Abfallzeiten betreiben können
3. Hochfrequente bzw. hochenergetische Leiterbahnen so kurz wie möglich halten
4. Leistungsabgabe verbessern
	- Entkopplung/[Abblockkondensator](Abblockkondensator.md)
	- [Induktivität](../Elektrotechnik/Induktivität.md) minimieren
	- [Kapazität](../Elektrotechnik/Kapazität.md) maximieren
		- Dünne Dielektrika mit hoher Dielektrizitätszahl
		- $\Big(C=\dfrac{\varepsilon_{0}\cdot\varepsilon_{r}\cdot A}{d}\Big)$
5. Gutes [PCB-Layout](PCB-Layout.md)/Stack-Up

> [!caution] Die Frequenz in digitalen Schaltkreisen liegt in den Flanken, nicht im Takt.  
> Schon bei niedrigen getakteten Schaltkreisen können Effekte der HF-Technik eintreten.

> [!caution] Die Energie in Schaltkreisen liegt in den Feldern im [Dielektrikum](../Physik/Konstanten/Dielektrikum.md) Zwischen den Leiterbahnen bzw im Isolator von Twisted-Wire Paar.

# Tags

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)