---
tags: 
aliases:
  - Anpass-Netzwerk
  - paralleler Leitungsabschluss
created: 25. September 2023
---

# Impedanz Anpassung

> [!info] Mit Impedanz Anpassung erzielt man:
> - Stromanpassung (Strom ist maximal, $R_{i}\gg R_{L}$) 
> - Spannungsanpassung (elektrische Spannung ist maximal, $R_{i}\ll R_{L}$)
> - Leistungsanpassung (Leistung ist maximal, $R_{i} = R_{L}$)

## 1 Anpassnetzwerk

## 2 $\frac{\lambda}{4}$-Transformator

$$Z_{E}\cdot Z_{A}=Z_{L}^{2}$$

> [!summary] Herleitung (Eingangsimpedanz - Verlustlose Leitung)  
> $Z_{E} = Z_{A}\cdot \dfrac{1+j \frac{Z_{L}}{Z_{A}}\tan(\beta \cdot l_{e})}{1+ j\frac{Z_{A}}{Z_{L}}\tan(\beta \cdot l_{e})} \qquad  \beta \cdot l_{e} = \dfrac{2\pi}{\lambda}\cdot \dfrac{\lambda}{4}= \dfrac{\pi}{2}$  
> $\tan$ ist an der Stelle $\frac{\pi}{2}$ singulär $\to$ *$Z_{E}=\dfrac{Z_{L}^{2}}{Z_{A}}$* bzw. *$Z_{E} = Z_{A}\cdot Z_{L}^{2}$*

## 3 Abschlussimpedanz

![TL_QundS](../HF-Technik/assets/TL_QundS.png)

> [!IMPORTANT] Für hochfrequente Logik-Signale (elektrisch kurz im vergleich zur Flankenanstiegszeit) führen Fehlanpassungen an einer der Impedanzen $Z_{S}$, $Z_{0}$ bzw. $Z_{L}$ zu Reflexionen.  
> Probleme:
> - Overshoot oder Undershoot durch Reflexionen
> - Signalintegritätsprobleme (SI) (Logik-Schwellen, Überschreitung von maximum ratings)
> - Probleme mit EMV (erhöhte Frequenzanteile, Abstrahlungen)

> [!info] Eine Anpassung der Eingangsimpedanz unterdrückt diese Probleme  
> Leitungen können länger sein  
> Die Datenrate kann erhöht werden  
> Bessere SI und EMC

> [!WARNING] Es gibt verschiedene Arten von Abschlussanpassung:
> - Seriell (Widerstand am Ausgang der Quelle (Treiber))
> - Parallel (Widerstand parallel zur Senke, Verbunden mit einer *Terminationvoltage* oder Masse)
> - weitere: AC parallel, Thevenin, Diode


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


# Quellen

[^1]: [TI AN-903](https://www.ti.com/lit/an/snla034b/snla034b.pdf?ts=1695571735636&ref_url=https%253A%252F%252Fwww.google.com%252F)
