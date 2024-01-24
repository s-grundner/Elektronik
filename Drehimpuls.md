---
tags: 
aliases:
  - Drehimpulserhaltung
keywords: 
subject:
  - Physik für TechnikerInnen
  - "322.005"
semester: 1
created: 24th January 2024
professor:
---
 

# Drehimpuls $\vec{L}$

$$
\vec{L}=m\cdot(\vec{r}\times \vec{v})
$$
Drehimpuls ist nie unabhängig von der Wahl des Bezugssystems.


> [!example] Einfache Kreisbewegung mit Radius $r$
> ![[assets/Drehimpuls 2024-01-24 12.48.27.excalidraw]]

## Drehimpulserhaltung

$$
\begin{align}
\vec{L} &= m(\vec{r}\times \vec{v}) = \vec{r}\times \vec{p}\\
\frac{d\vec{L}}{dt}&=\underbrace{ \frac{d\vec{r}}{dt}\times \vec{p} }_{ =0 }+\frac{d\vec{r}}{dt}\times \vec{r}
\end{align}
$$

Der erste Term auf der rechten Seite ist Null, da das Kreuzprodukt aus zwei parallelen Vektoren immer Null ergibt: $\frac{d\vec{r}}{dt}\times \vec{p} = \vec{v}\times m\vec{v}=0$

Der zweite Term ergibt unter Verwendung des 2. Newtonschen Gesetzes:

$$
r\times \frac{d\vec{p}}{dt}=\vec{r}\times \vec{F}=\vec{M}
$$

Aus diesen Gleichungen erhalten wir die wichtige Beziehung: -> Drehmoment ist die Änderung des Drehimpuls

$$
\vec{M}=\frac{d\vec{L}}{dt}
$$

> [!important] Satz der Drehimpulserhaltung:
> Wenn auf ein Teilchen kein äußeres Drehmoment $\vec{M}$ wirkt, dann ist sein Drehimpuls *konstant*
> $\vec{M}=0\implies \vec{L} = const.$

