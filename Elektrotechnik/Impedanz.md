---
tags:
  - RF
aliases:
  - Anpassung
  - anpassen
  - Anpassnetzwerk
  - Admittanz
  - Scheinwiderstand
subject:
  - hwe
  - ksn
source:
  - ""
created: 11th April 2023
---

# Impedanz

$$
\begin{align}
Z = R+jX\\
Y = G+jB
\end{align}
$$

| $Z$ | *Impedanz* <br> Scheinwiderstand | $\uparrow^{-1}$ | $Y$ | *Admittanz* <br> Scheinleitwert |
| --- | -------------------------------- | --------------- | --- | ------------------------------- |
| $R$ | *[Resistanz](Ohmsches%20Gesetz.md)* <br> Wirkwiderstand  | $\uparrow^{-1}$ | $G$ | *Konduktanz* <br> Wirkleitwert  |
| $X$ | *Reaktanz*  <br> Blindwiderstand | $\uparrow^{-1}$ | $B$ | *Suszeptanz* <br> Blindleitwert |

Für Berechnungen gilt: $Z=\frac{Z_{Z}}{Z_{N}}$ -> $\mid Z\mid=\frac{\mid Z_{Z}\mid}{\mid Z_{N}\mid}$

## Impedanz Anpassung

> [!INFO] Mit Impedanz Anpassung erzielt man:
> - Stromanpassung (Strom ist maximal, $R_{i}\gg R_{L}$) 
> - Spannungsanpassung ([elektrische Spannung](elektrische%20Spannung.md) ist maximal, $R_{i}\ll R_{L}$)
> - Leistungsanpassung ([Leistung](../Physik/Elektrische%20Leistung.md) ist maximal, $R_{i} = R_{L}$)

### Anpassnetzwerk

### $\frac{\lambda}{4}$-Transformator

$$Z_{E}\cdot Z_{A}=Z_{L}^{2}$$

> [!SUMMARY] Herleitung (Verlustlose [Leitung](../HF-Technik/Leitungstheorie.md))  
> $Z_{E} = Z_{A}\cdot \dfrac{1+j \frac{Z_{L}}{Z_{A}}\tan(\beta \cdot l_{e})}{1+ j\frac{Z_{A}}{Z_{L}}\tan(\beta \cdot l_{e})} \qquad  \beta \cdot l_{e} = \dfrac{2\pi}{\lambda}\cdot \dfrac{\lambda}{4}= \dfrac{\pi}{2}$  
> $\tan$ ist an der Stelle $\frac{\pi}{2}$ singulär $\to$ *$Z_{E}=\dfrac{Z_{L}^{2}}{Z_{A}}$* bzw. *$Z_{E} = Z_{A}\cdot Z_{L}^{2}$*

### Abschlussimpedanz

![TL_QundS](../HF-Technik/assets/TL_QundS.png)

> [!IMPORTANT] Für hochfrequente [Logik](../Mathematik/Aussagenlogik.md)-Signale ([elektrisch kurz](../HF-Technik/Leitungstheorie.md) im vergleich zur Flankenanstiegszeit) führen Fehlanpassungen an einer der Impedanzen $Z_{S}$, $Z_{0}$ bzw. $Z_{L}$ zu [Reflexionen](../HF-Technik/Reflexionsfaktor.md).  
> Probleme:
> - Overshoot oder Undershoot durch [Reflexionen](../HF-Technik/Reflexionsfaktor.md)
> - Signalintegritätsprobleme ([SI](Signalintegrität.md)) ([Logik](../Mathematik/Aussagenlogik.md)-Schwellen, Überschreitung von maximum ratings)
> - Probleme mit [EMV](Elektromagnetische%20Verträglichkeit.md) (erhöhte Frequenzanteile, Abstrahlungen)

> [!INFO] Eine Anpassung der [Leitungstheorie](../HF-Technik/Leitungstheorie.md) unterdrückt diese Probleme  
> [Leitungen](../HF-Technik/Leitungstheorie.md) können länger sein  
> Die Datenrate kann erhöht werden  
> Bessere [SI](Signalintegrität.md) und [EMC](Elektromagnetische%20Verträglichkeit.md)

> [!WARNING] Es gibt verschiedene Arten von Abschlussanpassung:
> - Seriell ([Widerstand](Ohmsches%20Gesetz.md) am Ausgang der Quelle (Treiber))
> - [Parallel](Parallel%20Termination.md) ([Widerstand](Ohmsches%20Gesetz.md) parallel zur Senke, Verbunden mit einer *Terminationvoltage* oder Masse)
> - weitere: AC parallel, Thevenin, [Diode](Halbleiter/Diode.md)

# Tags

[Kettenmatrix](../Hardwareentwicklung/Kettenmatrix.md)

[Induktivitäten](Induktivitäten.md)

[Kapazität](Kapazität.md)

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)