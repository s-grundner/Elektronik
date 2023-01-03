---
tags: []
aliases: ["Voltage-Mode"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 11th May 2022
---

# Voltage-Mode-Regelung
![[hwe/assets/Untitled Diagram 3.svg]]
$U_{a}$ wird über einen Spannungsteiler wird über einen 
Der Impulsbreitenmodulator wandelt die Ausgansspannung $U_{R}$ des [[PI-Regler]] in eine Pulsweitenmodulierte Spannung $U_{st}$ um.

## Regelmechanismus
- $U_{a}$ zu klein, $U_{a}' < U_{ref}$
- $U_{R}$ läuft hoch bis $U_{ref}-k\cdot U_{a} = 0$
- das Tastverhältnis steigt und $U_{a}$ steigt

> [!tip] Tip
> Der Regelverstärker (error amplifier) ist in der Fachliteratur als [[Transkonduktanzverstärker]] Angeführt.
> Dieser liefert einen Ausgangsstrom proportional zur Spannung $U_{d}$.
> Die $RC$ Kombination ($C_{1}$, $R_{4}$) wird in diesem Fall zwischen [[Operations-Verstärker|OPV]] Ausgang und Masse angeschlossen.
 

---
# Tags
#incomplete 