---
tags: 
aliases:
  - Anpass-Netzwerk
  - Matched Termination
created: 25. September 2023
subject:
  - HF-Systemtechnik 1
  - KV
semester: WS24
professor:
  - Reinhard Feger
---

# Impedanz Anpassung

> [!info] Mit Impedanz Anpassung erzielt man:
> - Stromanpassung (Strom ist maximal, $R_{i}\gg R_{L}$) 
> - Spannungsanpassung (elektrische Spannung ist maximal, $R_{i}\ll R_{L}$)
> - Leistungsanpassung (Leistung ist maximal, $R_{i} = R_{L}$)
> 
> Primär lässt sich durch den Leitungsabschluss der [Reflexionsfaktor](../HF-Technik/Reflexionsfaktor.md) einstellen.

## Anpassnetzwerk


> [!info] $\frac{\lambda}{4}$-Transformator
> $$\boxed{ Z_{E}\cdot Z_{A}=Z_{L}^{2} }$$

> [!summary] Herleitung (Eingangsimpedanz - Verlustlose Leitung)  
> $$Z_{E} = Z_{A}\cdot \dfrac{1+j \frac{Z_{L}}{Z_{A}}\tan(\beta \cdot l_{e})}{1+ j\frac{Z_{A}}{Z_{L}}\tan(\beta \cdot l_{e})} \qquad  \beta \cdot l_{e} = \dfrac{2\pi}{\lambda}\cdot \dfrac{\lambda}{4}= \dfrac{\pi}{2}$$  
> $\tan$ ist an der Stelle $\frac{\pi}{2}$ singulär $\to$ *$Z_{E}=\dfrac{Z_{L}^{2}}{Z_{A}}$* bzw. *$Z_{E} = Z_{A}\cdot Z_{L}^{2}$*

## Abschlussimpedanz

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


# Tags

- [Paralleler Leitungsabschluss](Paralleler%20Leitungsabschluss.md)
- [Serieller Leitungsabschluss](../Hardwareentwicklung/Serial%20Termination.md)

# Quellen

[^1]: [TI AN-903](https://www.ti.com/lit/an/snla034b/snla034b.pdf?ts=1695571735636&ref_url=https%253A%252F%252Fwww.google.com%252F)
