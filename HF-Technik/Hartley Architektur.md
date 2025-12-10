---
tags:
aliases:
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 15th November 2025
professor:
release: true
title: Hartley Architektur
---

# Hartley Architektur

Mit der Hartley Architektur lässt sich das konzept der Übertragung von Komplexwertigen signalen schaltungstechnisch realisieren. Relevant für [Software Defined Radio](HF-Technik/Software%20Defined%20Radio.md)

![invert_dark](assets/HartleyArch.png)

## Mathematische Grundlagen


Komplexwertige Signal können eine asymmetrisches Spektrum haben und es wird sich mithilfe der komplexen rechnung herausstellen, dass durch diese methode die Bandbreite Besser Ausgenutz werden kann.



$$
x_{\text{cplx}}(t) = x_{\mathrm{i}}(t) + \jmath x_{\mathrm{q}}(t) = \left| x_{\text{cplx}}(t) \right| e^{ \jmath \arg(x_{\text{cplx}}(t)) }
$$

Das Signal wird nun auf **zwei träger** als Reellwertiges signal übertragen:

$$
\begin{align}
x(t) &= \Re\{x_{\text{cplx}}(t)e^{ \jmath 2\pi f_{0}t }\} \\
&= x_{\mathrm{i}}(t) \cos(2\pi f_{0}t) - x_{\mathrm{q}}(t)\sin(2\pi f_{0} t)
\end{align}
$$
(solange die Bandbreite von $x_{\text{cplx}}(t)$ kleiner als die Trägerfrequenz $f_{0}$ ist $\iff B_{\text{cplx}} \ll f_{0}$)

## Betrachtung im Spektrum

Komplexwertige signale haben die eigenschaft, dass sie ein asymmetrisches Spektrum besitzen.

![](assets/Excalidraw/Quadratur%20Amplituden%20Modulation%202025-11-15%2013.35.54.excalidraw.svg)
