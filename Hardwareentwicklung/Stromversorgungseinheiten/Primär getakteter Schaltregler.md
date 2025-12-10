---
tags: ["Baugruppe/Versorgung/SMPS"]
aliases: ["Primär getakteter SMPS", "Primär getaktete SMPS"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 2nd October 2022
---

# Primär getakteter [Schaltregler]({MOC}%20Schaltnetzteil.md)

![PrimGetaktSMPS](../../_assets/PrimGetaktSMPS.png)

## Eigenschaften

### Nachteile gegenüber [Sekundär getaktete Schaltregler](Sekundär%20getaktete%20Schaltregler.md)

- Potenzialtrennung in der Ansteuerlogik
- relativ hohe Welligkeit in $U_{a}$
- Anforderungen der Bauelemente hoch

## Anforderungen

### Schalttransistor

- Spannungsfestigkeit $>800V$
- Schnelle Schaltzeiten

### [Diode](../Halbleiter/Diode.md)

- Netzgleichrichter unproblematisch
- Sekundär Gleichrichter Diodn
	- Schnelle Schottky Schaltdioden ($U_{Fo} \approx 0.4V$)
 

### Übertrager

- Ferritkern
- Speichertransformator
- geringer [Streuverlust](../../HF-Technik/Streuparameter.md) (Streuverlust verursacht Selbstinduktion)

![325](../../_assets/Trafo-Streuung.png)

### Glättungskondensator

- Low ESR (Equivalent Series Resistance)
- Low ESL (Equivalent Series Inductance)

### Layout

- Hohe Frequenzen
- Hohe Ströme
- [EMV](../Elektromagnetische%20Verträglichkeit.md) gerechter Aufbau
- [EMV](../Elektromagnetische%20Verträglichkeit.md) Filter
- kurze Leitungsführung

# Typen

[Sperrwandler](Sperrwandler.md)

---

# Tags

![SMPS_intro](../../xEDU/xLiteratur/Schaltungstechnik/SMPS_intro.pdf)

![Schaltnetzteile_Schmidt-Walter](../../xEDU/xLiteratur/DigitalAnalogST/Schaltnetzteile_Schmidt-Walter.pdf)
