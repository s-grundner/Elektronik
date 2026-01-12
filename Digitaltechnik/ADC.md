---
banner:
tags:
aliases:
  - ADU
  - AD-Wandler
  - Analog Digital Wandler
  - Analog Digital Umsetzer
keywords:
subject:
  - VL
  - PR
  - Elektrische Messtechnik und Sensorik
  - Networked Embedded Systems
semester: WS25
created: 26. November 2025
professor:
  - Andreas Tröls
  - Marco Da Silva
---

# Analog Digital Umsetzer

Ein ADC ermittelt das Verhältnis einer analogen Eingangsgröße zu einer bekannten Referenzgröße und gibt dieses als Digitalwert an. Der unendlich großen Anzahl von möglichen Eingangsamplituden wird dabei eine endliche Anzahl von digitalen Ausgangszuständen (Codes) zugewiesen

## Full Scale Range

Der maximal zulässige Bereich der Eingangsgröße (“Full Scale Range (FSR)“) ist in $n$ gleich große Intervalle der Breite $\frac{FSR}{n}$ unterteilt. Bei der Umsetzung wird im ersten Schritt festgestellt, welchem Intervall die Eingangsgröße zugeordnet ist. Durch diese Quantisierung entsteht ein irreversibler Informationsverlust (eine endliche Anzahl von Intervallen vorausgesetzt). Diese Abweichung im Bereich von $\pm \frac{1}{2}U_{\text{LSB}}$, die als Quantisierungsabweichung bezeichnet wird, tritt bei einer möglichen nachfolgenden Digital–Analog Umsetzung zur Rückgewinnung des Signals als additives Rauschen in Erscheinung.

## In Microcontrollern

An ADC (Analog-to-Digital Converter) on a microcontroller transforms analog signals, like sensor voltages, into digital values that the microcontroller can process. This enables the microcontroller to work with real-world, continuous signals. The advantages of an ADC include precise digital representation of analog data, facilitating accurate measurements and allowing the microcontroller to interpret and respond to various environmental inputs in applications such as sensors, audio processing, and more. Other advantages are interrupts, when data is ready, DMA-based data transfer, different modes (manual-auto) and there also can be several channels per ADC.

