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
### Nachteile gegenüber [Sekundär getaktete Schaltregler](Sekundär%20getaktete%20Schaltregler.md)
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
- geringer [Streuverlust](../../hf-technik/ksn%20(5)/Streuparameter.md) (Streuverlust verursacht Selbstinduktion)
>![325](../assets/Trafo-Streuung.png)
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
![SMPS_intro](../assets/pdf/SMPS_intro.pdf)
![Schaltnetzteile_Schmidt-Walter](../assets/pdf/Schaltnetzteile_Schmidt-Walter.pdf)