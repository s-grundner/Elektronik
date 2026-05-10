---
tags:
  - Baugruppe/Komponente
aliases:
  - Kondensator
  - Kapazitäten
keywords:
subject:
  - VL
  - Einführung Elektrotechnik
semester: WS23
created: 15th January 2026
professor:
  - Michael Offenhuber
  - Siegbert Schrempf
  - Bernhard Jakoby
title: Kapazität
release: true
---

# Der Kondensator

> [!INFO] Der Kondensator – ein Ladungsspeicher  
>  Ein Kondensator ist eine Anordnung zweier Elektroden mit unterschiedlichem [Potenzial](Elektrostatik/elektrische%20Spannung.md), bei der durch räumliche Nähe ein elektrostatisches Feld entsteht. Die entsprechende Kenngröße heißt *Kapazität*.

![invert_dark|400](../../_assets/KondensatorBatterie.png)

> [!TIP] [Ladungen](Elektrostatik/Elektrisches%20Feld.md) verschieben sich solange, bis das [E-Feld](Elektrostatik/Elektrisches%20Feld.md) in den Leitern verschwindet und im Kondensator verteilt ist:
> 1. Feld wirkt auf bewegliche Elektronen im eingebrachten Kondensator und Anschlussdrähten
> 2. Die [Ladungen](Elektrostatik/Elektrisches%20Feld.md) verschieben sich solange, bis das Feld in allen Leitern verschwindet (Platten und Drähte), d.h. dort dann konstantes Potenzial. Das Feld wird dadurch verzerrt.
> 3. Im Zuge dieser Verschiebungen wurden die Platten [geladen](Elektrostatik/Elektrisches%20Feld.md). Das Feld zwischen den Platten ist mit der [Potenzialdifferenz](Elektrostatik/elektrische%20Spannung.md) (durch [Spannungsquelle](Elektrostatik/elektrische%20Spannung.md) vorgegeben) verknüpft, erzeugt wird es vornehmlich durch die [Ladungen](Elektrostatik/Elektrisches%20Feld.md) auf dem Platten.

## Kapazität

> [!def] **D - CAP)** Die Kapazität ist der Proportionalitätsfaktor zwischen [Ladung](Elektrostatik/elektrische%20Ladung.md) und Spannung zwischen zweier Elektroden
> 
> $$
> Q=C\cdot U \qquad [C] = \mathrm{F = \frac{s}{\Omega} = \frac{A^{2}~s^{4}}{kg~m^{2}}}
> $$
> 
> - $\mathrm{F}$ ... Farad

> [!important]- Begründung der proportionalität: Feld einer Punktladung
> $$
> \left.\begin{align}
> U = \int \vec{E}\cdot d\vec{s} \implies U \propto E \\
> E = Q \cdot \frac{1}{4\pi\varepsilon_{0}r^{2} }\implies E \propto Q
> \end{align}\right\} \implies U \propto Q
> $$

Vorgehen zum Ermitteln der Kapazität bei Verschiedenen Geometrien:

1. 

### Plattenkondensator

![invert_light](../../_assets/Plattenkondensator.png)

Aus der Überlegung zur [Flächenladung](../Elektrostatik/Flächenladung.md) kennen wir, dass für die beiden Platten gilt:

$$
\mathbf{E}= \frac{Q}{2A\cdot \varepsilon} \cdot \hat{\mathbf{e}}_{d}
$$

- $\hat{\mathbf{e}}_{d}$ ... Einheits-Normalvektor von Positiver zur Negative Platte

> [!hint] Das Feld der jeweiligen Seite der Platte das zur anderen zeigt, verläuft in die selbe Richtung, wird also [überlagert](../../Dictionary/Superposition.md). (wobei sich die äußeren Felder aufheben).
> für das Feld im Kondensator ergibt sich: $\lvert \vec{E} \rvert = \frac{Q}{2A\cdot \varepsilon} + \frac{Q}{2A\cdot \varepsilon} = \frac{Q}{A\cdot \varepsilon}$
> 
> Mit der [elektrischen Spannung](Elektrostatik/elektrische%20Spannung.md) im [E-Feld](Elektrostatik/Elektrisches%20Feld.md): $U = \lvert \vec{E} \rvert \cdot d$
> 
> $$
> \frac{U}{d} = \frac{Q}{A\cdot \varepsilon}\implies Q = \varepsilon_{0} \cdot \frac{A}{d} \cdot U = C\cdot U\implies C = \varepsilon \cdot \frac{A}{d} 
> $$
>
> - $\varepsilon = \varepsilon_{0}\cdot\varepsilon_{r}$
> - $\varepsilon_{0}$ … [Dielektrizitätskonstante](Dielektrikum.md)
> - $\varepsilon_{r}$ … Relative [Permittivität](Dielektrikum.md) des [Dielektrikums](Dielektrikum.md)
>   


## Strom - Spannungsbeziehung

$$
\begin{gather}
dQ = i\cdot dt \\
Q = C\cdot U \implies dq = C\cdot du \\
i\cdot dt = C\cdot du \\
i = C\cdot \frac{du}{dt}
\end{gather}
$$

Integrieren beider seiten liefert die Kondensator-Spannung:

$$ u(t)=u\left(t_0\right)+\frac{1}{C} \int_{t_0}^t i(\tau) \mathrm{d} \tau $$

## Energie im Kondensator

Die Energie im Kondensator lässt sich durch die eingespeiste [Leistung](Elektrostatik/elektrische%20Leistung.md) berechnen:  
Die Integrationsvariable $\uptau$ dient zur Unterscheidung zur Laufzeit variable $t$: 

$$
W_m(t)-W_{m(0)}=\int_{0}^{t} p(\uptau) \, d \uptau =\int_{0}^{t} i(\uptau) \cdot u(\uptau) \,d \uptau \\
$$

Der [Strom](Elektrostatik/elektrischer%20Strom.md) im Kondensator ist Abhängig von der Änderungsrate der angelegten [Spannung](Elektrostatik/elektrische%20Spannung.md) und der Kapazität, also folglich: $i(t) = C\cdot \frac{du}{dt}$  

$$=\int_{0}^{t} C \frac{d u}{d \uptau}\cdot u(\uptau) \,d \uptau$$

Das beliebig kleine Zeit Intervall $d\uptau$ kürzt sich aus der Gleichung (Achtung Integrationsgrenzen ändern sich)

$$
=\int_{0}^{t} C \frac{d u}{\cancel{ d \uptau }}\cdot u \,\cancel{ d \uptau }
=\int_{0}^{u(t)} C\cdot u\cdot \, d u
=\frac{C u(t)^2}{2}
$$

> [!info]- Aus diesem Ausdruck für die Energie kann eine Sprungbedingung abgeleitet werden:
> Die Spannung an einer Kapazität kann sich nicht sprunghaft ändern, da eine solche Änderung auch einen Sprung in der gespeicherten Energie $W$ bedeuten würde.
> Um einen solchen zu realisieren, müsste zum Zeitpunkt des Sprungs vom angeschlossenen Netzwerk unendliche Leistung $p(t)=d W / d t$ geliefert oder aufgenommen werden.

# Kondensator in der Wechselstromtechnik

> [!question] [Wechselstromtechnik](Wechselstromtechnik.md), [Impedanz](Impedanz.md)

## Idealer Kondensator

$$
jX_{C}=\frac{1}{j\omega C}
$$

## Realer Kondensator

> [!summary] ESB  
> ![invert_light|400](../../_assets/cap_esb.png)
> 
> - $R_{ESR}$: dielektrische und elektrische Verluste
> - $ESR$: equivalent series resistance
> - $L$: intrinsische parasitäre [Induktivität](Induktivität.md) durch Anschlusskontakte

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

## Kondensator als Bauelement

## Schaltsymbol

| Symbol | ESB                               |
| ------ | --------------------------------- |
|        | ![invert_light\|400](../../_assets/cap_esb.png) |

### Geometrie und Bauformen

- [Plattenkondensator](../../HF-Technik/Parallelplattenleitung.md)
- Zylinderkondensator
- Drehkondensator
- Vielschichtkondensator (Multilayer Capacitor)

### Dielekrikum

> [!question] [Dielektrikum](Dielektrikum.md)

Verschiedene Bauformen von Kondensatoren haben unterschiedliche Dielektrika:
- [MLCC](../../Analog-Design/MLCC.md) - Multilayer **Ceramic** Capacitor
- ELKO - **Elektrolyt**kondensator
- TALKO - **Tantal Elektrolyt**kondensator

## Referenzen

- [Abblockkondensator](../../Manufacturing/Abblockkondensator.md)
