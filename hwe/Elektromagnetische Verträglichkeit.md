---
tags: []
aliases: ["EMV"]
subject: ["hwe"]
source: ["Siebgert Schrempf"]
reference: []
created: 21st February 2023
---

# Elektromagnetische Verträglichkeits
Elektromagnetische Verträglichkeit beschreibt die Fähigkeit eines Gerätes oder Systems in seiner elektromagnetischen Umgebung zufriedenstellend zu funktionieren ohne selbst unzulässige Strörungen in diese Umgebung einzubringen.
![[EMV-einfluesss.png]]
> [!info] EMV ist eine horizontale Disziplin
> ... die sich durch alle bereiche der Elektrotechnik zieht.
> ![[EMV-horiz.png|600]]
## Grundlagen und Begriffe

Prinzipiell kann die EMV an jedem der 3 Blöcke durch Maßnahmen verbessert werden.
### Kopplungsmechanismus
Der Kopplungsmechanismus ist der physikalische Zusammenhang über den eine von der Störquelle ausgehende Störung auf die Senke einwirkt.

> [!hint] Kopplungsarten
> 1. [[Kapazitive Kopplung|kapazitiv]]
> 2. induktiv
> 3. galvanisch
> 

### Störquelle
Ist das Objekt von dem die Störung ausgeht.
#### Art der Störquellen
Grundsätzlich kann zwischen externen und internen Störquellen unterschieden werden.
##### Externe Störquellen
Man untersheidet wiederum;
###### Natürliche Störquellen
- Atmospherische Entladungen (Blitz)
- Elektrostatische Entladungen (ESD) (z.B. Reibungselektrizität)
	- bei Kunststoffbeschichteten Stühlen & Tischen
	- bei Bekleidung und Böden aus synthetischen Stoffen
	- bei nicht geerdeten Werkzeugen
###### Künstliche Störquellen
- Vorhergesehene und unvorhergesehene elektromagnetische vorgänge.
- In der Energieerzeugung und Verteilung → elektrische Schaltvorgänge
- [[Schaltnetzteil]]e, Leuchtstoffröhren
- Zündsysteme von Motoren
- Fernseh / Radiosender, Mobilfunk

##### Interne Störquellen
- Lade- & Entladevorgänge von L,C
- Takterzeugung und Verteilung
- Signalwechsel auf Leitungen
- Schaltvorgänge von [[{MOC} Transistor|Transistoren]]

### Störsenke
Elektronische Einrichtung, deren Funktion durch die Störgrößen beeinträchtigt werden kann.

### Störgröße
Eine elektromagnetische Größe (Spannung-/ Stromfeldstärke) die eine unerwünnschte Beeinflussung erzeugt.

# Komponenten und Konzepte zur Verbesserung
> [!info] Von Leistungselektroink bis Mikroelektronik gibt es eine große breite, und in der technischen Umsetzung sehr unterschiedliche, Maßnahmen.

![[cap]]
Kleine Chip-Kondensatoren gehen bis zu sehr hohen Resonanzfrequenzen.

# Tags
![[Pasted image 20230316092131.png|700]]