---
tags: 
aliases:
  - paralleler Leitungsabschluss
created: 25. September 2023
---

# Paralleler Leitungsabschluss

> [!INFO] Oft ist die Impedanz der Quelle und der Leitung niedrig ($10\Omega-100\Omega$) gegenüber der Abschlussimpedanz ($>1000\Omega$)
> Ohne Maßnahmen treten Reflexionen in hohem Maße auf

![](assets/ParallelTerm.png)

> [!CHECK] Transmissionline (TL) wird an der Quell-Seite mit einem parallelen Abschlusswiderstand $R_{T}$ terminiert. 
> Der Widerstand wird so gewählt dass: $Z_{A}\mid\mid R_{T} = Z_{0}$.
> Aufgrund der hohen Impedanz der Last gilt: $R_{T}\approx Z_{0}$ (kleinere Widerstände dominieren in Parallelschaltungen)
> Widerstand absorbiert die Reflektierte Energie
> 

> [!QUESTION] Wann wird ein paralleler Abschluss benötigt?
> Flankenanstiegszeiten beachten
> Ist die [Leitung](../HF-Technik/Eingangsimpedanz.md) elektrisch lang?
> Anwendungen:
> - DDR ($V_{TT}$ Abschluss)
> - [CAN](../Digitaltechnik/Interfaces/CAN.md) (Split-Parallelabschluss)
> - LVDS

 | Ohne Abschluss                                  | parallel Abschluss [^1] |
 | ----------------------------------------------- | ------------------ |
 | ![](assets/SignalIntegritätReflexionSchlecht.png) | ![](assets/SignalIntegritätReflexion.png)                   |

> [!BUG] Nachteile
> - Die Quelle stark genug sein das Signal an der Last, sowie die abfallende [Leistung](../Elektrotechnik/elektrische%20Leistung.md) an $R_{T}$  zu versorgen.
> - Wenn die Quelle im passiven Zustand eine Spannung $\neq V_{T}$ ausgibt wird passiv [Strom](../Elektrotechnik/elektrischer%20Strom.md) verbraucht.
> - Große parallele Busse (z.B. DDR) die für jede [Leitung](../HF-Technik/Eingangsimpedanz.md) einen $R_{T}$ benötigen:
> 	- Obere Aspekte haben stärkeren Einfluss
> 	- komplexes Routing
> 	- benötigt viel Platz

> [!TIP] Tips
> - $V_{TT}$ wählen, dass wenig [Leistung](../Elektrotechnik/elektrische%20Leistung.md) wie möglich verschwendet wird.
> - Toleranz bei $Z_{0}$ ($5\%, 10\%$) beachten
> - Toleranz bei $R_{T}$ ($1\%, 10\%$) beachten
> - Um Undershoot ($R_{T}<Z_{0}$) zu vermeiden $\to$ *$R_{T}$ $10\%$ höher als $Z_{0}$ wählen*

## [PCB](PCB-Layout.md) Layout Guidelines

|                $\checkmark$                 | $\approx\checkmark$  <br> nur elektrisch kurze [Leitung](../HF-Technik/Eingangsimpedanz.md) |               x               |
| :-----------------------------------------: | :-----------------------------------------------------------------------------------------: | :---------------------------: |
| ![assets/ParTerm1.png](assets/ParTerm1.png) |                                ![\|249](assets/ParTerm2.png)                                | ![\|228](assets/ParTerm3.png) |


# Quellen

[^1]: [TI AN-903](https://www.ti.com/lit/an/snla034b/snla034b.pdf?ts=1695571735636&ref_url=https%253A%252F%252Fwww.google.com%252F)
