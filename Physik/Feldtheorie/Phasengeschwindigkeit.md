---
tags:
aliases:
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 18th January 2026
professor:
  - Reinhard Feger
release: true
title: Phasengeschwindigkeit
---

# Phasengeschwindigkeit

Die Geschwindigkeit mit der sich einen Welle in einem Medium fortbewegt, bezeichnet man als Phasengeschwindigkeit.

> [!def] **D) Phasengeschwindigkeit** $v_{p}$
> 
> $$
> v_{p} = \frac{\omega}{k} = \frac{1}{\sqrt{ \mu\epsilon }}
> $$

- $k$ ... [Wellenzahl](Wellenzahl.md)
- $\epsilon$, $\mu$ ... [Materialparameter](../../Elektrotechnik/Materialgesetze.md)


Die Phasengeschwindigkeit für eine Welle ergibt sich, indem die örtliche bewegung eines referenzpunktes auf der Welle (z.B. Wellenspitze) über eine Zeitliche Änderung betrachtet wird.  Im Vakuum ist die Phasengeschwindigkeit die Lichtgeschwindigkeit $c_{0}$.

$$
v_{p}= \frac{1}{\sqrt{ \epsilon_{0}\mu_{0} }} = c_{0}
$$

> [!exmple] Für eine Welle mit der Amplitude in $y$ Richtung die sich in $z$ Richtung ausbreitet, hat die [Lösung der Wellengleichung](Wellengleichung.md#Lösung%20der%20Wellengleichung) in verlustlosen Medien die Form

$$
E_{y}(z,t) = E^{+}\cos(\omega t-kz) + \cancelto{ 0 }{E^{-}}\cos(\omega t+kz)
$$

- Ohne Rücklaufende Welle ($E^{-}=0$)

![invert_dark|500](../../_assets/Excalidraw/Phasengeschwindigkeit%202026-01-22%2016.44.00.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Phasengeschwindigkeit%202026-01-22%2016.44.00.excalidraw.md)%%

Um einen festen Punkt auf der Welle zu halten, muss sich die Welle in $+z$ richtung bewegen wenn die zeit vergeht:

$$
\omega t - 
$$

## Für Wellen einer Leitung

Auf einer Leitung ist die Phasengeschwindigkeit von den Leitungsbelägen abhängig.

> [!def] **D)** Phasengeschwindigkeit einer Welle auf einer Leitung
> $$
> v_{p} = \frac{\omega}{\beta} = \frac{1}{\sqrt{ L'C' }}
> $$

- $\beta$ ... Phasenbelag
- $L',C'$ ... Induktivitäts- / Kapazitätsbelag