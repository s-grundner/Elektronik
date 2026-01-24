---
tags:
aliases:
  - D'Alembert
keywords:
  - Telegrafengleichung
  - Telegrafenleitungsgleichung
  - Zeitbereichsbetrachtung
subject:
  - VL
  - Mathematik 3
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 9th December 2025
professor:
  - Reinhard Feger
release: true
title: Wellengleichung
---

# Wellengleichung

Eine größe $u$ wird als Welle bezeichnet, wenn die Größe im ort als auch über die Zeit eine änderung aufweist.

![invert_dark](../../_assets/Excalidraw/Wellengleichung%202026-01-22%2020.37.51.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Wellengleichung%202026-01-22%2020.37.51.excalidraw.md)%%

> Eindimensionale Raumwelle

## Eindimensionale Raumwelle

Die Wellengleichung ist eine [Partielle DGL](Partielle%20Differenzialgleichung.md) und dient zur mathematischen Beschreibung der Ausbreitung von Raumwellen. In der Elektrotechnik vorallem der Ausbreitung von [elektromagnetischen Wellen](../../Physik/Feldtheorie/index.md)

> [!def] **D)** eindimensionale, homogene Wellengleichung
>
> $$
> \frac{\partial^{2}u}{\partial t^{2}}=c^{2}\cdot \frac{\partial^{2}u}{\partial x^{2}}
> $$

- $c$ ist die Ausbreitungsgeschwindigkeit der Welle
- und $u(x,t)$ als Wellenfunktion.

Die Lösung einer solchen DGL hat die Form:

$$
u(z,t) = A \cos(\omega t -kz) + B \cos(\omega t + kz)
$$

## Allgemeine Raumwelle

Erweitert auf eine Allgemeine Dimension $n$:

> [!def] **D)** mehrdimensionale homogene Wellengleichung
>
> $$
> \frac{\partial^{2}u}{\partial t^{2}}=c^{2}\cdot \left(\frac{\partial^2 u}{\partial x_1^2}+\frac{\partial^2 u}{\partial x_2^2}+\cdots+\frac{\partial^2 u}{\partial x_n^2}\right)  = c^{2}\Delta u
> $$
> Mit dem [Laplace Operator](Vektoranalysis/Laplace%20Operator.md) $\Delta = \nabla^{2}$.

Auch in anderen Schreibweisen

- Subskript als notation für die Ableitung:

$$
u_{tt} = c^{2}u_{\mathbf{xx}} = f(\mathbf{x},t)
$$

- Einführen des D'Alembert Operators $\Box$:

$$
\Box u = 0 \quad \text{mit} \quad \Box = \frac{1}{c^{2}} \frac{\partial^{2}}{\partial t^{2}} - \sum_{i=1}^{n} \frac{\partial^{2}}{\partial x_{i}^{2}}
$$

## Beispiele Für Wellengleichungen

[Telegrafengleichung](../../Elektrotechnik/Telegrafengleichung.md)

