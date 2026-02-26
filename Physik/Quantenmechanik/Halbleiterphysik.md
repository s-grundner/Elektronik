---
banner: assets/banner/GrundnerWafer.png
banner_y: 0.5
banner_x: 0.5
tags:
  - Halbleiter
aliases:
  - "#Halbleiter"
  - Halbleiterelektronik
keywords:
subject:
  - Einführung Elektronik
  - VL
semester: WS24
created: 7. Februar 2025
professor:
  - Bernhard Jakoby
release: false
---
 
# <center>Halbleiterphysik</center>

## Intrinsische Halbleiter

Intrinsisch $\to$ Nicht Dotiert

### Bändermodell

> [!important] Bändermodell des [Siliziums](Silizium.md)
> 
> Bandstruktur: Aufpreizung der erlaubten Energieniveaus (siehe [Teilchen im Kasten](Teilchen%20im%20Kasten.md)) durch Wechselwirkungen mit Nachbaratomen.
> 
> ![invert_dark|1000](../../_assets/SiLeitungsValenzband.png)

Unterschiede des Bändermodells verschiedener Leiterklassen:

![invert_light|1000](../../_assets/Baendermodell.png)




### Valenz und Leitungsband

Reines Silizium hat die Struktur eines Atomgitters.
![invert_dark|600](../../_assets/Pasted%20image%2020250207135059.png)
- Das **Valenzband** ist das Energieniveau der Äußersten elektronen innerhalb des Gitters ([Valenzelektronen](../../Chemie/Valenzelektronen.md))
- Das **Leitungsband** ist das oberste erlaubte Energieniveau auf dem sich freie elektronen aufhalten können  



![invert_dark|500](../../_assets/HalbleiterValenzLeitungsband.png)

Bei einem Intrinsischen[^1] halbleiter existieren grundsätzlich keine freien elektronen, da diese fest an das Atomgitter gebunden sind.

Durch thermische Anregung und Störstellen folgt jedoch: 

> [!important] **"Löcher"** in Halbleitern
> - Durch thermische Anregung werden einzelne Elektronen in das Leitungsband gehoben und hinterlassen freie Plätze („Löcher“).
> - Dadurch können auch im [Valenzband](../../Chemie/Valenzelektronen.md) wieder Elektronen verschoben werden.
> - Statt der Bewegung dieser Valenzelektronen kann man auch das Wandern des Loches betrachten, das sich wie ein positiv geladener Ladungsträger verhält.
> - Die Löcher bewegen sich unabhängig von den „zugehörigen“ Elektronen.


Die Dichte der erzeugten Ladungsträger, also den Elektronen-Loch Paaren, ist die [Eigenleitungsdichte](Fermiverteilung.md). Diese ist für Silizium: $n_{i,\text{ Si}} = 10^{10} \mathrm{cm}^{-3}$

> [!important] [[Fermiverteilung]]: Besetzungswahrscheinlichkeit $F(W)$ in abhängigkeit von der Energie $W$
> Die Fermiverteilung beschreibt also:
> - Thermische Anregung von Elektronen $\iff$ Temperatur abhängige Wahrscheinlichkeit, einen höheren Energiezustand einzunehmen. 

### Ladungsträger Transport

Im Allgemeinen findet man bei betrachtung vom Ladungsträgertransport in Halbleitern **Drift-** und **Diffusionsströme** vor. Die Entsprechenden Stomdichten setzen sich als folgende Differentialgleichungen zusammen:

$$
\begin{align}
j_{n} = en\mu_{n}E&+\quad \!\!eD_{n}\frac{\mathrm{d}n}{\mathrm{d}x} \\
j_{p} = \underbrace{ ep\mu_{p}E }_{ \text{Driftstrom} }&-\underbrace{ eD_{p}\frac{\mathrm{d}p}{\mathrm{d}x} }_{\text{Diffusionsstrom}}
\end{align}
$$
$$j = j_{p}+j_{n}$$

#### Driftstrom

Störstellen und thermische Gitterschwingungen verursachen eine [mittlere Driftgeschwindigkeit](../../Elektrotechnik/Drude-Modell.md) der Ladungsträger.
Dabei ist $\mu$ die Beweglichkeit und $E$ die elektrische Feldstärke
Gefolgt von einer Multiplikation mit der [Elementarladung](Konstanten/Elementarladung.md) $e$ und der Ladungsträgerdichte der Löcher ($p$) bzw der Elektronen ($n$) ergibt den **Driftstrom** 

$$
\begin{align}
\left< v_{n}\right> &= -\mu_{n}E &&\implies &j_{\text{Drift,n}} = en\mu_{n}E \\
\left< v_{p}\right> &= \mu_{p}E &&\implies & j_{\text{Drift,p}} = ep\mu_{p}E
\end{align}
$$

Der resultierende Gesamtstrom durch einen Halbleiter ist

$$j_{\text{Drift}} = j_{\text{Drift,n}} + j_{\text{Drift,p}} = \sigma E$$

Der Spezifiesche Leitwert ist für einen Halbleiter demnach $\sigma = e(n\mu_{n}+p\mu_{p})$

#### Diffusionsstrom

Ein weiterer wesentlicher Mechanismus zum Ladungstransport ist, wie bei **Gasen**, die **Diffusion**.

> [!hint] Deshalb werden die Elektronen und Löcher makroskopisch auch als Elektrionengas (Fermigas) und "Löcher"-Gas bezeichnet
> Die Wechselwirkung dieser "*Ladungswolken*" erfolgt via [Generation und Rekombination](#Generation%20und%20Rekombination) 

Die Diffusion von Elektronen beschreibt das Phänomen, dass aufgrund der vorhandenen thermischen Wimmelbewegungen im statischen mittel Elektronen aus einem Bereich **hoher Elektronendichte** in benachbarte Bereiche **niedriger Elektronendichte** wandern.

Äquivalent dazu ist, wie ein Gas den gesamten ihm zur Verfügung stehenden Platz einnimmt d.h in den zu ihm benachbarten Platz strömt. Dieser Strom wird umsostärker je größer der Druck bzw die Konzentration des Gases ist.

> [!info] Der sogenannte **Diffusionstrom** ist proportional zu dem *Gefälle der Ladungskonzentration*
> Also dem negativen [Gradienten](../../Mathematik/Analysis/Vektoranalysis/Gradient.md). Die untenstehenden Gleichungen sind in eindimensionaler Schreibweise mit der Ortskoordinaten $x$

$$
j_{\text{Diff,n}} = +eD_{n}\frac{\mathrm{d}n}{\mathrm{d}x} \qquad
j_{\text{Diff,p}} = -eD_{p}\frac{\mathrm{d}p}{\mathrm{d}x}
$$

Dabei sind $D_{n}$ und $D_{p}$ die Diffusionskoeffizienten, welche durch die [Einstein-Smoluchowski-Beziehung](Quantenmechanik/Einstein-Smoluchowski-Beziehung.md) gegben sind: 

![](Quantenmechanik/Einstein-Smoluchowski-Beziehung.md#^DIFKOHL)

## Generation und Rekombination

---

## Dotierte Halbleiter

Die extrem niedrige Leitfähigkeit von reinen Halbleitern lässt sich durch das Einbringen von 3- oder 5-Wertigen Fremdatomen massiv erhöhen. Dieser Vorgang heißt Dotierung.

### n-Halbleiter

- Im Silizium wird ein Atom durch ein **5-Wertiges** Atom ersetzt.
- Das 5. Elektron des Fremdatoms wird für das Kristallgitter nicht mehr benötigt und wird **frei**.
- Das Elektron wandert in das Leitungsband, wird frei beweglich und steht permanent als Leitungselektron zur verfügung

Das **Donator** Atom erhält durch die Abgabe seines Valenzelektrons eine **positive** Ladung, und hält daher das **Elektron** Lokal bei sich.
Durch das Anlegen eines [elektrischen Feldes](../../Elektrotechnik/Elektrisches%20Feld.md) entfernt sich das Elektron vom Ortsfesten Donator.

> [!info] Auswirkungen im gezeigt im Bändermodell
> Im Bändermodell würde ein Donatoratom lokal ein zusätzliches Energieniveau nahe der **Leitungsbandkante** darstellen 
> 
> ![invert_dark|600](../../_assets/Excalidraw/Halbleiterphysik%202025-02-07%2014.24.34.excalidraw.svg)
> %%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Halbleiterphysik%202025-02-07%2014.24.34.excalidraw.md)%%
> 
> Somit ist eine niedrigere Aktivierungsenergie notwendig, um ein Elektron vom Donator ins Leitungsband zu heben.

In einem derartig dotierter Halbeiter (n-Typ, n ... negativ) sind weit mehr Elektronen als Löcher Verfügbar.
- Die Elektronen stellen die so genannten **Majoritätsträger** da,
- während die Löcher die **Minoritätsträger** repräsentiern.

### p-Halbleiter

- Im Silizium wird ein Atom durch ein **3-Wertiges** Atom ersetzt.
- Dem 3-Wertigen Atom wird von benachbarten Silizium Atomen ein Elektron **entliehen**
- Durch die Nachrückung der Elektronen entsteht ein Freibewegliches **Loch**

Das **Akzeptor** Atom erhält durch die Aufnahme eines benachbarten Valenzelektrons eine **negative** Ladung, und hält daher das **Loch** Lokal bei sich.
Durch das Anlegen eines [elektrischen Feldes](../../Elektrotechnik/Elektrisches%20Feld.md) entfernt sich das Loch vom Ortsfesten Akzeptor.

> [!info] Auswirkungen im gezeigt im Bändermodell
> Im Bändermodell würde ein Akzeptoratom lokal ein zusätzliches Energieniveau nahe der **Valenzbandkante** darstellen 
> ![600](../../_assets/Excalidraw/Halbleiterphysik%202025-02-07%2014.47.50.excalidraw.md)
> Somit ist eine niedrigere Aktivierungsenergie erforderlich, Elektronen vom Valenzband auf das Akzeptor Niveau anzuheben und auf dem Valenzband ein Loch zu hinterlassen.

In einem derartig dotierter Halbeiter (p-Typ, p ... positiv) sind somit:
- die Löcher die **Majoritätsträger** und
- die Elektronen die **Minoritätsträger**.


## pn-Übergang / Diode

[^1]: Intrinsische Leitfähigkeit: Nicht Dotiert nur die Leitungsfähigkeit "von sich aus" durch Thermisch bedingte Gitterfehler