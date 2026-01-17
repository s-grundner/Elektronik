---
tags:
aliases:
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 16th January 2026
professor:
  - Feger
release: true
title: Verlustwinkel
---


# Verlustwinkel

Ein material, das gemischt konduktive und dielektrische Verluste aufweist, charakterisiert man mit dessen Verlustwinkel bzw. dessen Tangens.

![invert_dark|300](../_assets/Excalidraw/Verlustwinkel%202026-01-16%2019.40.26.excalidraw.svg)

%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/Verlustwinkel%202026-01-16%2019.40.26.excalidraw.md)%%

> [!def] **D)** Verlustwinkel
> $$
> \tan\delta := \frac{\omega\epsilon''+\sigma}{\omega \epsilon'}
> $$

Der Verlustwinkel ist ein Wert zur beschreibung der [Güte](../Hardwareentwicklung/Filter-Verstärker/Güte.md). Dieser muss immer zusammen mit einer Frequenz gegeben sein.

## Herleitung

Aus

- dem [Durchflutungssatz (MW1)](Maxwell.md#1.%20MWG%20-%20Durchflutungssatz) in Phasorschreibweise,
- der [komplexen Permittivität](Dielektrikum.md#Elektrodynamik%20-%20Allgemein)
- und dem Materialgesetz [M2](Materialgesetze.md#^MATG) und [M3](Materialgesetze.md#^MATG)

erhält man

$$
\begin{align}
\nabla \times \mathbf{\underline{H}} &= j\omega \mathbf{\underline{D}} + \mathbf{\underline{J}} \\
&= j\omega \epsilon\mathbf{\underline{E}} + \sigma\mathbf{\underline{E}} \\
&= j\omega(\epsilon'-j\epsilon'') \mathbf{\underline{E}} + \sigma\mathbf{\underline{E}} \\
&= j\omega\left( \epsilon'-j\epsilon'' - j\frac{\sigma}{\omega} \right)\mathbf{\underline{E}} \\
&= (\omega\epsilon''+\sigma + j\omega\epsilon')\mathbf{\underline{E}}
\end{align}
$$

Man kann erkennen, dass das die dielektrische Dämpfung bei einer einzigen frequenz nicht mehr unterscheidbar vom Verlust des Leitwertes ist. Man charakterisiert daher die Verluste mit dem Verlustwinkel.

Der komplexe Faktor vor dem elektrischen Feld kann nun in Real und Imaginärteil  zerlegt werden. Beachtet man, dass der Verlustwinkel zwischen **Zeiger und Abzisse** (nicht der Ordinate!) liegt, berechnet sich der Winkel mit

$$
\begin{gather}
\delta = \arctan \left( \frac{\mathrm{Re}}{\mathrm{Im}}\right) =\arctan \left( \frac{\omega \epsilon'' + \sigma}{\omega\epsilon'} \right)  \\
\Updownarrow \\
\tan\delta = \frac{\omega\epsilon''+\sigma}{\omega\epsilon'}
\end{gather}
$$
