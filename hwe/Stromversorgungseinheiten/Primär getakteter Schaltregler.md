---
tags: []
aliases: ["Primär getakteter SMPS", "Primär getaktete SMPS"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 2nd October 2022
---

# Primär getakteter [Schaltregler](hwe/Stromversorgungseinheiten/Schaltnetzteil.md)
![PrimGetaktSMPS](assets/PrimGetaktSMPS.png)
## Eigenschaften
### Nachteile gegenüber [Sekundär getaktete Schaltregler](hwe/Stromversorgungseinheiten/Sekundär%20getaktete%20Schaltregler.md)
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
- geringer [Streuverlust](hf-technik/ksn%20(5)/Streuparameter.md) (Streuverlust verursacht Selbstinduktion)
>![325](hwe/assets/Trafo-Streuung.png)
### Glättungskondensator
- Low ESR (Equivalent Series Resistance)
- Low ESL (Equivalent Series Inductance)

### Layout
- Hohe Frequenzen
- Hohe Ströme
- [EMV](hwe/Elektromagnetische%20Verträglichkeit.md) gerechter Aufbau
- [EMV](hwe/Elektromagnetische%20Verträglichkeit.md) Filter
- kurze Leitungsführung

# Typen
[Sperrwandler](hwe/Stromversorgungseinheiten/Sperrwandler.md)

---
# Tags
![SMPS_intro](hwe/assets/pdf/SMPS_intro.pdf)
![Schaltnetzteile_Schmidt-Walter](hwe/assets/pdf/Schaltnetzteile_Schmidt-Walter.pdf)