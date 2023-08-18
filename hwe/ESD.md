---
tags: []
aliases: ["ESD", "Elektrostatische Entladung"]
created: 17th August 2023
---

# Elektrostatische Entladung

ESD ist die Abkürzung für "electrostatic discharge" und beschreibt die plötzliche Entladung eines Objekts auf ein anderes, wenn sie miteinander in Kontakt treten. Der Potentialunterschied zwischen den Objekten, kann je nach Material mehrere **Kilovolt** erreichen.

Integrierte Schaltkreise, wie sie in diesem Projekt enthalten sind, sind typischerweise sehr empfindlich gegenüber statischer Entladung. Aufgrund des vielen Interagieren mit der Platine, zum Beispiel beim Ein- und Ausstecken, muss mittels TVS [Dioden](hwe/Dioden.md) (Transient Voltage Suppression) eine Abschirmung gegen statische Entladung am USB-Eingang vorhanden sein.

![](digitaltechnik/assets/ESD-Connector.png)

# Tags
- [TVS](hwe/TVS-Diode.md)