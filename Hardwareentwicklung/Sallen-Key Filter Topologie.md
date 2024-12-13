---
tags:
  - Baugruppen/Filter
  - HTL-Diplomarbeit
  - Mathematica
aliases:
  - Sallen-Key
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 13. Dezember 2024
professor:
---
 

# Sallen-Key Filter Topologie

> [!question] Siehe: [Aktiver Filter](Aktiver%20Filter.md), [Gegenkopplung](Kopplungsarten.md)

Der Sallen-Key Filter basiert auf einer Einfachen Gegenkopplung von Wechselsignalen, welches ein Tiefpassverhalten 2. Ordnung erzeugt. 


![](assets/Pasted%20image%2020241213050452.png)

## Übertragungsfunktion

> [!question]- **Herleitung**

|                    Bode Diagramm                     |                      Charakteristik                      |
|:----------------------------------------------------:|:--------------------------------------------------------:|
| ![600](/Hardwareentwicklung/assets/59_SallenKey.png) | ![Sallen_Key_Ortskurve](assets/Sallen_Key_Ortskurve.png) |

<center><a href="./assets/SallenKey.nb" class="internal-link">📈Mathematica Notebook</a></center>


> [!info] Unterschiedliche Wahlen des Verstärkungsfaktors $\alpha$ ergeben unterschiedliche [Filtercharakteristiken](Aktiver%20Filter.md#Filter%20Charakteristiken):
> 
> $\alpha=1$: Kritische Dämpfung
> $\alpha = 1.268$: Bessel
> $\alpha = 1.586$: [Butterworth](Butterworth%20Filter%20Charakteristik.md)
> $\alpha=2.234$: [Tschebyscheff](Tscheybyscheff%20Filter%20Charakteristik.md)

## Funktionsweise