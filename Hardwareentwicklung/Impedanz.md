---
tags:
  - RF
aliases:
  - Anpassung
  - anpassen
  - Anpassnetzwerk
subject:
  - hwe
  - ksn
source:
  - ""
created: 11th April 2023
---

# Impedanz

## Impedanzanpassung

$$
\begin{align}
Z = R+jX\\
Y = G+jB
\end{align}
$$
|     |          |
| --- | -------- |
| $Z$ | impedanz |
| R   | Re         |

### Anpassnetzwerk

### $\frac{\lambda}{4}$-Transformator

$$
Z_{E}\cdot Z_{A}=Z_{L}^{2}
$$

## Abschlussimpedanz

![TL_QundS](../HF-Technik/assets/TL_QundS.png)

> [!IMPORTANT] Für hochfrequente Logik-Signale ([elektrisch kurz](../HF-Technik/Leitungstheorie.md) im vergleich zur Flankenanstiegszeit) führen Fehlanpassungen an einer der Impedanzen $Z_{S}$, $Z_{0}$ bzw. $Z_{L}$ zu [Reflexionen](../HF-Technik/Reflexionsfaktor.md).
> Probleme:
> - Overshoot oder Undershoot durch [Reflexionen](../HF-Technik/Reflexionsfaktor.md)
> - Signalintegritätsprobleme ([SI](Signalintegrität.md)) (Logik-Schwellen, Überschreitung von maximum ratings)
> - Probleme mit [EMV](Elektromagnetische%20Verträglichkeit.md) (erhöhte Frequenzanteile, Abstrahlungen)

> [!INFO] Eine Anpassung der [Leitungstheorie](../HF-Technik/Leitungstheorie.md) unterdrückt diese Probleme
> Leitungen können länger sein
> Die Datenrate kann erhöht werden
> Bessere [SI](Signalintegrität.md) und [EMC](Elektromagnetische%20Verträglichkeit.md)

> [!WARNING] Es gibt verschiedene Arten von Abschlussanpassung:
> - Seriell (Widerstand am Ausgang der Quelle (Treiber))
> - [Parallel](Parallel%20Termination.md) (Widerstand parallel zur Senke, Verbunden mit einer *Terminationvoltage* oder Masse)
> - weitere: AC parallel, Thevenin, [Diode](Halbleiter/Diode.md)


# Tags

[Induktivitäten](Induktivitäten.md)

[Kapazität](Kapazität.md)

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)