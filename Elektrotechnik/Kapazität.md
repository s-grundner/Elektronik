---
tags: 
aliases:
  - Kondensator
  - Kapazitäten
subject:
  - hwe
source:
  - Michael Offenhuber
  - Siegbert Schrempf
created: 11th April 2023
---

# Der Kondensator - ein Ladungsspeicher

> [!INFO] Der Kondensator – ein Ladungsspeicher  
>  Ein Kondensator ist eine Anordnung von zwei Elektroden, bei der durch räumliche Nähe eine elektrostatische Beeinflussung der [Ladungen](Statisches%20E-Feld.md) auf den beiden Elektroden stimuliert oder ausgenützt wird.  
>  Die entsprechende Kenngröße heißt *Kapazität*.

> [!warning] parasitäre Kapazität  
>  Da die im folgenden beschriebenen Effekte im Prinzip zwischen allen Leitern auftreten (also auch welchen die räumlich weiter entfernt sind), tritt die Kapazität im Prinzip zwischen allen Leitern auf – oft auch unerwünschter Weise, man spricht von parasitären Kapazitäten.

![InlineL|450](assets/KondensatorBatterie.png)

> [!TIP] [Ladungen](Statisches%20E-Feld.md) verschieben sich solange, bis das [E-Feld](Elektrisches%20Feld.md) in den Leitern verschwindet und im Kondensator verteilt ist:
> 1. [Spannungsquelle](elektrische%20Spannung.md) von elektrischem Feld umgeben
> 2. Feld wirkt auf bewegliche Elektronen im eingebrachten Kondensator und Anschlussdrähten
> 3. Die [Ladungen](Statisches%20E-Feld.md) verschieben sich solange, bis das Feld in allen Leitern verschwindet (Platten und Drähte), d.h. dort dann konstantes Potenzial. Das Feld wird dadurch verzerrt.
> 4. Im Zuge dieser Verschiebungen wurden die Platten [geladen](Statisches%20E-Feld.md). Das Feld zwischen den Platten ist mit der [Potenzialdifferenz](elektrische%20Spannung.md) (durch [Spannungsquelle](elektrische%20Spannung.md) vorgegeben) verknüpft, erzeugt wird es vornehmlich durch die [Ladungen](Statisches%20E-Feld.md) auf dem Platten.

## Kenngrößen im Kondensator

### [Geometrie](../Mathematik/mathe%20(4)/Geometrie.md)

- Plattenkondensator
- Zylinderkondensator
- Drehkondensator
- Vielschichtkondensator

### [Dielektrikum](Dielektrikum.md)

Verschiedene Bauformen von Kondensatoren haben unterschiedliche Dielektrika:
- MLCC - Multilayer Ceramic Capacitor
- ELKO - Elektrolytkondensator
- TALKO - Tantalelektrolytkondensator

### [Ladung](Statisches%20E-Feld.md) Und Kapazität im Kondensator

$$
Q=C\cdot U
$$

### Energie im Kondensator

Die Energie im Kondensator lässt sich durch die eingespeiste [Leistung](../Physik/Elektrische%20Leistung.md) berechnen:  
Die integrationsvariable $\uptau$ dient zur Unterscheidung zur Laufzeivariable $t$: 

$$
W_m(t)-W_{m(0)}=\int_{0}^{t} p(\uptau) \, d \uptau =\int_{0}^{t} i(\uptau) \cdot u(\uptau) \,d \uptau \\
$$

Der [Strom](elektrischer%20Strom.md) im Kondensator ist Abhängig von der Änderungsrate der angelegten [Spannung](elektrische%20Spannung.md) und der Kapazität, also folglich: $i(t) = C\cdot \frac{du}{dt}$  

$$=\int_{0}^{t} C \frac{d u}{d \uptau}\cdot u(\uptau) \,d \uptau$$

Das beliebig kleine Zeit Intervall $d\uptau$ kürzt sich aus der Gleichung

$$
=\int_{0}^{t} C \frac{d u}{\cancel{ d \uptau }}\cdot u \,\cancel{ d \uptau }
=\int_{0}^{u(t)} C\cdot u\cdot \, d u
=\frac{C u(t)^2}{2}
$$

# Kondensator in der [Wechselstromtechnik](Wechselstromtechnik.md) und [Impedanz](Impedanz.md)

## Idealer Kondensator

$$
jX_{C}=\frac{1}{j\omega C}
$$

## Realer Kondensator

> [!summary] ESB  
> ![InlineL|400](assets/cap_esb.png)
> 
> - $R_{ESR}$: dielektrische und elektrische Verluste
> - $ESR$: equivalent series resistance
> - $L$: intrinsische parasitäre [Induktivität](Induktivitäten.md) durch Anschlusskontakte

$$
\begin{align*}
\underline{Z} &= R_{ESR}+j\omega L+ \frac{1}{j\omega C}\\
X&=0\quad\text{bei } f_{r}\\
f_{0} &= \frac{1}{2\pi}\cdot \frac{1}{\sqrt{LC}}
\end{align*}
$$

> [!INFO] Wertebereich von der Bauform abhängig  
> $C\approx1nF$  
> $L\approx1\mu H$  
> $R_{ESR}\approx0.1\Omega$

# Tags

[Abblockkondensator](Abblockkondensator.md)