---
tags: []
aliases: ["Primär getakteter SMPS", "Primär getaktete SMPS"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 2nd October 2022
---

# Primär getakteter [[Schaltnetzteil|Schaltregler]]
![[PrimGetaktSMPS.png]]
## Eigenschaften
### Nachteile gegenüber [[Sekundär getaktete Schaltregler]]
- Potenzialtrennung in der Ansteuerlogik
- relativ hohe Welligkeit in $U_{a}$
- Anforderungen der Bauelemente hoch
## Anforderungen
### Schalttransistor
- Spannugsfestigkeit  $>800V$
- Schnelle Schaltzeiten
### Diode
- Netzgleichrichter unproblematisch
- Sekundär Gleichrichter Diodn
	- Schnelle Schottky Schaltdioden ($U_{Fo} \approx 0.4V$)
### Übertrager
- Ferritkern
- Speichertransformator
- geringer [[Streuparameter|Streuverlust]] (Streuverlust verursacht Selbstinduktion)
>![[Trafo-Streuung.png|325]]
### Glättungskondensator
- Low ESR (Equivalent Series Resistance)
- Low ESL (Equivalent Series Inductance)

### Layout
- Hohe Frequenzen
- Hohe Ströme
- EMV gerechter Aufbau
- EMV Filter
- kurze Leitungsführung

# Typen
[[Sperrwandler]]

---
# Tags
![[SMPS_intro.pdf]]
![[Schaltnetzteile_Schmidt-Walter.pdf]]