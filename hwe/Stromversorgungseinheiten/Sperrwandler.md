---
tags: []
aliases: ["Flyback-Converter"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 2nd October 2022
---

# Sperrwandler

- Beruht auf dem Prinzip des [Inverswandler](Inverswandler.md)s
- Gehört zu dem [Primär getakteten SMPS](Primär%20getakteter%20Schaltregler.md)

## Schaltung

![SperrwandlerIMG](../assets/SperrwandlerIMG.png)
Der Transistor arbeitet als Schalter $S$, der mit einer PWM Steuerspannung ($U_{st}$) angesteuert wird.
$$
U_{a}= U_{e}\cdot \frac{N_{2}}{N_{1}}\cdot \frac{t_{1}}{T-t_{1}}
$$

### $0<t<t_{1}$:

- $U_{DS}\approx 0$ (leitet)
- $I_{1}$ steigt linear an
- Es baut sich ein Magnetfeld mit der [](../Induktivitäten.md#Induktivitäten%20als%20Bauelemente%20Leistungselektronischen%20Schaltungen|Energie) $W = \dfrac{L_{1}\cdot Î_{1}}{2}$ auf.
- $U_{D}=0$, weil die Diode sperrt, $U_{2}$ ist zu $U_{1}$ entgegengesetzt gepolt.

### $t_{1} < t < T_{S}$

- $U_{DS} \neq 0$ (sperrt)
- $I_{1}=0$
- Die Spannung am Transformator (Speichertransformator) polen sich um.
- Die Diode wird Leitend
- Sekundärwicklung gibt die Energie an den [Kondensator](../Kapazität.md) weiter

---

# Quellen

![Schaltnetzteile_Schmidt-Walter](../assets/pdf/Schaltnetzteile_Schmidt-Walter.pdf)
