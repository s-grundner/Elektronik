---
tags: []
aliases: ["Varicap", "Varaktor", "Abstimmdiode"]
subject: ["hwe"]
source: ["Siegbert SChrempf"]
reference: []
created: 19th January 2023
---

# Kapazitäts-Diode
Die Kapazitätsdiode oder Varicap, auch Varaktor oder Abstimmdiode genannt, ist ein elektronisches [[Halbleiter]]-Bauteil.
Durch Änderung der angelegten Spannung lässt sich eine Variation der Kapazität von 10:1 erreichen.
Somit steht eine elektrisch steuerbare Kapazität zur Verfügung, die die früher üblichen, erheblich größeren Drehkondensatoren weitgehend ersetzt hat.

![[varicap.png|500]]

$d = f(U)$
Die Breite der RLZ ist eine Funktion der Spannung.

>[!summary] $C=\dfrac{\varepsilon\cdot A}{d(U)}$

## Funktionsweise
- Der p-n-Übergang einer Diode hat eine Kapazität, die von der Breite der Raumladungszone abhängig ist.
- Wird eine Diode in Sperrrichtung betrieben, so entsteht am p-n-Übergang eine Ladungsträgerverarmungszone, an der sich auch ein [[elektrisches Feld]], bedingt durch die fehlenden Ladungsträger, aufbaut.
- Mit steigender Spannung vergrößert sich die Breite der ladungsfreien Zone, damit nimmt die Kapazität ab.
- Durch geeignete Dotierung können Kapazitäten im Bereich von 3 pF bis 300 pF erreicht werden.

# Tags
[[Voltage Controlled Oscillator|VCO]]
[[Phase Locked Loop|PLL]]