---
tags: []
aliases: ["WSK"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 4th October 2022
---

# Wahrscheinlichkeit
Unter der Wahrscheinlichkeit $P(\omega)$ eines Ausgang eines Zufallsexperiments verstehen wir den [[Grenzwert]] der Folge $\langle h(\omega)\rangle$
$$

$$
## Ereignis 
Oft interessiert uns nicht für die Wahrscheinlichkeit einkombies einzelnen $\omega\in\Omega$, sondern alle $\omega$ mit bestimmten Eigenschaften

```ad-example
title: Roulette $\dots$ geraden Zahlen
Das Ereignis $E$ ist eine Teilmenge der Grundmenge $\Omega$
z.B $E=\{2;4;\dots;36\}$
```

## Wahrscheinlichkeitsfunktion

```ad-example
title: Laplace Experiment
Fall, der häufig vorkommt
$P(\omega_1)=P(\omega_2)\dots=P(\omega_n)\qquad \notin$



```
## Rechnen mit Wahrscheinlichkeiten
Zwei Ereignisse heißen ausschließlich oder unvereinbar, wenn sie nicht gemeinsam auftreten können.

```ad-example
title: gerade und ungerade Zahl bei Roulette
Wenn die Ereignisse E&F unvereinbar sind, dann gilt:
$P(E\&F) = P(E) + P(F)$
```
Sei $E^C$ das Gegenereignis zu $E$, dann gilt:
$P(E^C)=1-P(E)$
$P(gerade) = 1-P(ungerade)$

``` ad-example
title: 26 Schüler: 2 haben den selben Geburtstag
$P(\text{min. 2 den selben Geb.}) = 1-P(\text{es gibt keine 2 mit selben Geb.})$

$\frac{364}{365}\cdot\frac{364}{365}\cdot\frac{363}{365}\dots\frac{340}{365} = \frac{365!}{365^{26}\cdot339!}=0.4$
$1-0.4=0.6$

```

## [[Zufallsvariablen]]

# Tags


```ad-example
title: 16) Unter 9 Passagieren sind 4 Schmuggler und 5 ehrliche Leute. Ein Zollbeamter wählt drei Personen zur Kontrolle aus. Alle drei entpuppen sich als Schmuggler. Berechne die WSK, rein zufällig ein so gutes Ergebnis zu erzielen.
Ziehen ohne zurücklegen
![[Pasted image 20221012125710.png]]
$$
\frac{4}{9}\cdot \frac{3}{8}\cdot \frac{2}{7} = \frac{1}{21}
$$
```

```ad-example
title: 18. Welches Ereignis ist wahrscheinlicher:
a) 4 Würfe mit einem Würfel und dabei mindestens eine Sechs oder
b) 24 Würfe mit 2 Würfeln und dabei mindestens eine Doppelsechs.
![[Pasted image 20221012130725.png]]

$$
P(\geq 1 '6') = 1-P(\neg '6')
$$

```