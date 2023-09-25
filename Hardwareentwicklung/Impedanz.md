---
tags: 
aliases: 
subject:
  - hwe
  - ksn
source:
  - ""
created: 11th April 2023
---

# Impedanz

# Abschlussimpedanz

![](assets/Pasted%20image%2020230925093312.png)

> [!IMPORTANT] Für hochfrequente Logik-Signale ([elektrisch kurz](../HF-Technik/Leitung.md) im vergleich zur Flankenanstiegszeit) führen Fehlanpassungen an einer der Impedanzen $Z_{S}$, $Z_{0}$ bzw. $Z_{L}$ zu [Reflexionen](../HF-Technik/Reflexionsfaktor.md).
> Probleme:
> - Overshoot oder Undershoot
> - Signalintegritätsprobleme ([SI](Signalintegrität.md)) (Logik-Schwellen, Überschreitung von maximum ratings)
> - Probleme mit [EMV](Elektromagnetische%20Verträglichkeit.md) (erhöhte Frequenzanteile, Abstrahlungen)

> [!INFO] Eine Anpassung der [Leitung](../HF-Technik/Leitung.md) unterdrückt diese Probleme
> Leitungen können länger sein
> Die Datenrate kann erhöht werden
> Bessere [SI](Signalintegrität.md) und [[EMC]]

> [!WARNING] Es gibt verschiedene Arten von Abschlussanpassung:
> - Seriell (Widerstand am Ausgang der Quelle (Treiber))
> - Parallel (Widerstand parallel zur Senke, Verbunden mit einer *Terminationvoltage* oder Masse)
> - weitere: AC parallel, Thevenin, Diode

## Paralleler Abschlusswiderstand



## Serieller Abschlusswiderstand

# Tags

[Induktivitäten](Induktivitäten.md)

[Kapazität](Kapazität.md)

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)