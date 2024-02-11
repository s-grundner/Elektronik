---
tags:
  - Baugruppen/Leistung
aliases:
  - LDO
created: 27. Dezember 2023
---


# Low Dropout Regulator

Ein Low-Dropout Regulator ist eine Art [linearer Spannungsregler](Linearregler.md) mit einem möglichst geringen Spannungsabfall über dem Ein- und Ausgangskontakt.
LDOs werden verwendet, um das Rauschen in Versorgungsleitungen zu eliminieren aber auch, um eine (etwas) höhere [Spannung](../../Elektrotechnik/Spannung.md) in eine niedrigere [Spannung](../../Elektrotechnik/Spannung.md) zu regeln. In diesem Fall werden die 5 Volt der USB-[Schnittstelle](../../Digitaltechnik/{MOC}%20Schnittstellen.md), in die von den Peripherien am Board benötigten, 3,3 Volt heruntergeregelt.

## Vorteil gegenüber [Schaltreglern](Schaltnetzteil.md)

Gegenüber [Schaltreglern](Schaltnetzteil.md) haben sie den Vorteil, dass sie kompakt sind und kein Schaltrauschen verursachen. Auch der Wirkungsgrad ist aufgrund der niedrigen Dropout-[Spannung](../../Elektrotechnik/Spannung.md) hoch genug, jedoch geringer als bei [Schaltreglern](Schaltnetzteil.md).
Mit einem maximalen Ausgangsstrom von 1 Ampere reicht er vollkommen aus, den Gitcon mit Strom zu versorgen. Jedoch ist zu beachten, dass, um die Stabilität zu gewährleisten, ein 22μF (Tantal/[Elektrolyt](../../Chemie/Elektrochemie.md)) [Kondensator](../../Elektrotechnik/Kapazität.md) am Ausgang angebracht werden sollte.
C6 und C7 halten hier die Ein- und Ausgangsspannung bei Spannungseinbrüchen möglichst konstant. Außerdem leuchtet eine rote LED leuchtet auf, wenn das Gerät eingesteckt ist.

![](assets/Pasted%20image%2020231227001552.png)