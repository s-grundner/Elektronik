---
tags:
  - Baugruppe/OPV
  - Baugruppe/Verstärker
aliases:
  - OPV
  - "#Baugruppe/OPV"
keywords: 
subject:
  - VL
  - Technische Elektronik
  - Einführung Elektronik
semester: SS25
created: 28. Februar 2025
professor:
  - Timm Ostermann
release: false
title: Operations-Verstärker
---
 

# Operations-Verstärker

## Grundschaltungen

> [!important] Wichtig bei Grundschaltungen von Invertierenden Verstärkern:
> - Die Eingangsspannung $U_e$ wird immer invertiert, d.h. das Vorzeichen wird umgekehrt.
> - Das Bauteil am Eingang Prägt den Strom in das Bauteil der Rückkopplung ein 

```dataview
TABLE FROM #Baugruppe/OPV
```


- Invertierender Verstärker
- Integrator ([Aktiver Tiefpass](Filter-Verstärker/Aktiver%20Filter.md))
- Differenzierer ([Aktiver Hochpass](Filter-Verstärker/Aktiver%20Filter.md))
- Instrumentenverstärker
- [Schmitttrigger](Schmitt%20Trigger.md)
- [OPV-Konstantstromquelle](OPV-Konstantstromquelle.md)
- [Transimpedanz-Verstärker](Transimpedanz-Verstärker)


## Reale Eigenschaften von OPVs

### Charakteristische Größen

$A_D\ldots$ Frequenzabhängige Verstärkung
$A_{D 0}\ldots$ Verstärkung ohne nachgeschaltetem Tiefpass
$\tau_0\ldots$ Zeitkonstante des Tiefpasses
$k\ldots$  Rückkopplungsfaktor, abhängig von externer Beschaltung
$f_{g 0}\ldots$ Grenzfrequenz des OPs für den unbeschalteten Fall
$f_g\ldots$ Grenzfrequenz des beschalteten OPs
$f_T\ldots$ Transitfrequenz, Frequenz bei $\operatorname{der}\left|A_D(f)\right|=1$  ist.
$\mathrm{SR}\ldots$ Slew Rate

> [!info] Slew-Rate: $SR>\frac{du}{dt}\rightarrow u(t)\dots$ Beschaltungssignal
> Die Slewrate muss größer als der größte Signalflankenanstieg in einer Schaltung sein.

| **Unbeschalteter OPV** (also $k=0$)                  | **Rückgekoppelter OPV**                                    |
| --------------------------------------------------- | ---------------------------------------------------------- |
| $A_{D}(f) = \dfrac{A_{D0}}{1+\jmath 2\pi f\uptau_{0}}$     | $A_{D}(f)=\dfrac{A_{D0}}{1+A_{D 0}k+j 2\pi f\uptau_{0}}$ |
| $f_{g_{0}} = \dfrac{1}{2\pi\uptau_{0}}$                  | $f_{g}=f_{g 0}\cdot A_{D 0}$                               |
|                                                     | $\lvert A_{D}(f) \rvert=1\to f=f_{T}$                      |
| ![500](assets/53_TP_OPV.png)                        | ![500](assets/53_TP_OPV_k.png)                             |

#### Größenordnungen der Größen

| Größe                    | ideal    | bipolar |       | JFET  |       | CMOS |       | Einheit          | Bezeichung      |     |
| :----------------------- | :------- | :------ | :---- | :---- | :---- | :--- | :---- | :--------------- | --------------- | --- |
|                          |          | std.    | präz. | std.  | präz. | std. | präz. |                  |                 |     |
| $U_{\text {offs}}$ (max)   | 0        | 3       | 0.025 | 2     | 0.1   | 2    | 0.1   | $mV$             | Offsetspannung  |     |
| $I_B$ (typ)              | 0        | 50 nA   | 25 pA | 50 pA | 40 fA | 1 pA | 2 fA  | $@ 25^{\circ} C$ | Biasstrom       |     |
| $f_T$ (typ)              | $\infty$ | 2       | 2000  | 5     | 400   | 2    | 10    | $MHz$            | Transitfrequenz |     |
| $SR$ (typ)               | $\infty$ | 2       | 4000  | 15    | 300   | 2    | 10    | $V / \mu s$      | Slew-Rate       |     |
| $U_0$ (min)              | 0        | 5       | 1.5   | 10    | 5     | 2    | 1     | $V$              |                 |     |
| $U_0$ (max)              | $\infty$ | 36      | 44    | 36    | 36    | 15   | 15    | $V$              |                 |     |
| $k_{\text {offs}}$ (max)   | 0        | 5       | 0.1   | 20    | 1     | 10   | 3     | $\mu V /K$       |                 |     |
| $e_n$ (typ)              | 0        | 10      | 1     | 20    | 3     | 30   | 7     | $nV / \sqrt{Hz}$ |                 |     |

> [!info] **std**: Standard-OPV, **präz**: Präzisions-OPV


## Modell für Realen OPV

Das schaltbild des realen OPV wird um Eingangsstrom und Offsetspannung erweitert.

# Quellen

- [uni-muenster.de/Physik.AP/Veranstaltungen/F-Praktikum/anleitungen/Operationsverstaerker.pdf](https://www.uni-muenster.de/Physik.AP/Veranstaltungen/F-Praktikum/anleitungen/Operationsverstaerker.pdf)
- [HTL OPV](assets/pdf/OPV.pdf)
- [HTL OPV Grundschaltungen](assets/pdf/OPV%20Grundschaltungen.pdf)
