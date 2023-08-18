---
tags: []
aliases: ["Primär getakteter SMPS", "Primär getaktete SMPS"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 2nd October 2022
---

# Primär getakteter [Schaltregler](Schaltnetzteil.md)
![PrimGetaktSMPS](../../assets/PrimGetaktSMPS.png)
## Eigenschaften
### Nachteile gegenüber [Sekundär getaktete Schaltregler](Sekund%C3%A4r%20getaktete%20Schaltregler.md)
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
- geringer [Streuverlust](Streuparameter.md) (Streuverlust verursacht Selbstinduktion)
>![325](Trafo-Streuung.png)
### Glättungskondensator
- Low ESR (Equivalent Series Resistance)
- Low ESL (Equivalent Series Inductance)

### Layout
- Hohe Frequenzen
- Hohe Ströme
- [EMV](Elektromagnetische%20Vertr%C3%A4glichkeit.md) gerechter Aufbau
- [EMV](Elektromagnetische%20Vertr%C3%A4glichkeit.md) Filter
- kurze Leitungsführung

# Typen
[Sperrwandler](Sperrwandler.md)

---
# Tags
![SMPS_intro](SMPS_intro.pdf)
![Schaltnetzteile_Schmidt-Walter](Schaltnetzteile_Schmidt-Walter.pdf)