---
tags: []
aliases: []
subject: ksn
source: ["Martin Aichriedler"]
---

# Kanalkapazität

$$
\begin{align*}
C &= F_{max}\\
[C]&= \frac{1bit}{sym\cdot 1s}
\end{align*}
$$
$C$ ist der maximale [Informationsfluss](Informationsfluss.md) der über einen gegebenen Nachrichtenkanal fehlerfrei übertragen werden kann.
Gilt als absolute Obergrenze für die Leistungsfähigkeit eines Nachrichtenkanals.

| Bezeichnung    | Formel                                                      | Einheit     |
| -------------- | ----------------------------------------------------------- | ----------- |
| Kanalkapazität | $C=\Delta f\cdot ld\left(1+ \frac{P_{s}}{P_{n}}\right)$ | $[C] = \frac{bit}{s}$            | 
| Kanaldynamik   | $D=ld\left(1+ \frac{P_{s}}{P_{n}} \right)$              | $[D] = bit$ |

| Komponente | Bezeichnung    |
| ---------- | -------------- |
| $\Delta f$ | Bandbreite     |
| $P_{s}$    | Signalleistung |
| $P_{n}$    | Rauschleistung |

![400](../assets/Nachrichtenquader-Sprachübertragung.svg.png)
