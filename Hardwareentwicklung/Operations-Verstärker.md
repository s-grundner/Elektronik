---
tags:
  - OPV
  - Baugruppen/Verstärker
aliases:
  - OPV
subject:
  - hwe
source:
  - Siegbert Schrempf
created: 2nd January 2023
---

# Operations-Verstärker

## Grundschaltungen

- Nicht-Invertierender Verstärker
- Invertierender Verstärker
- [Umkehrsummierer](OPV-Umkehrsummierer.md) / Addierer
- [Subtrahierer](OPV-Subtrahierer.md)
- Integrator (aktiver Tiefpass)
- Differenzierer (aktiver Hochpass)
- Instrumentenverstärker
- [Schmitttrigger](Schmitt%20Trigger.md)
- Konstantstromquelle

## Praxistipps

Slew-Rate: $SR>\dfrac{du}{dt}\rightarrow u(t)\dots$ Beschaltungssignal 

## Reale Eigenschaften von OPVs

| Größe                    | ideal    | bipolar |       | JFET  |       | CMOS |       | Einheit          | Bezeichung      |
|:------------------------ |:-------- |:------- |:----- |:----- |:----- |:---- |:----- |:---------------- | --------------- |
|                          |          | std.    | präz. | std.  | präz. | std. | präz. |                  |                 |
| $U_{\text {offs}}$ (max) | 0        | 3       | 0.025 | 2     | 0.1   | 2    | 0.1   | $mV$             | Offsetspannung  |
| $I_B$ (typ)              | 0        | 50 nA   | 25 pA | 50 pA | 40 fA | 1 pA | 2 fA  | $@ 25^{\circ} C$ | Eingangsstrom   |
| $f_T$ (typ)              | $\infty$ | 2       | 2000  | 5     | 400   | 2    | 10    | $MHz$            | Transitfrequenz |
| $SR$ (typ)               | $\infty$ | 2       | 4000  | 15    | 300   | 2    | 10    | $V / \mu s$      | Slew-Rate       | 
| $U_0$ (min)              | 0        | 5       | 1.5   | 10    | 5     | 2    | 1     | $V$              |                 |
| $U_0$ (max)              | $\infty$ | 36      | 44    | 36    | 36    | 15   | 15    | $V$              |                 |
| $k_{\text {offs}}$ (max) | 0        | 5       | 0.1   | 20    | 1     | 10   | 3     | $\mu V /K$       |                 |
| $e_n$ (typ)              | 0        | 10      | 1     | 20    | 3     | 30   | 7     | $nV / \sqrt{Hz}$ |                 |

> [!info] **std**: Standard-OPV, **präz**: Präzisions-OPV

# Quellen

[uni-muenster.de/Physik.AP/Veranstaltungen/F-Praktikum/anleitungen/Operationsverstaerker.pdf](https://www.uni-muenster.de/Physik.AP/Veranstaltungen/F-Praktikum/anleitungen/Operationsverstaerker.pdf)

![OPV](assets/pdf/OPV.pdf)

![OPV Grundschaltungen](assets/pdf/OPV%20Grundschaltungen.pdf)
