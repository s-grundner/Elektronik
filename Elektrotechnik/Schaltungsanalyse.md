---
tags:
  - "#Schaltungsanalyse"
aliases:
  - Netzwerkanalyse
  - "#Schaltungsanalyse"
  - elektrische Netzwerke
  - elektrisches Netzwerk
keywords: 
subject:
  - VL
  - Elektrotechnik
semester:
  - SS24
  - B2
created: 4. März 2024
professor:
  - Andreas Springer
---
 

# Schaltungsanalyse

> siehe: Netzwerke aus der [Netzwerktechnik](../Netzwerktechnik/{MOC}%20Netzwerke.md) 

> [!info] Berechnungen von Strömen und Spannungen von Netzwerken erfolgen auf elementare Weise durch:
> - (optionale) Vereinfachung des Netzwerkes
> - Aufstellen der [Maschen und Knotengleichungen](Kirchhoffsche%20Regeln.md)
> - Anwendung des (verallgemeinerten[^1]) Ohm'schen Gesetzes

## Systematische Analyse [linearer](lineare%20Systeme.md) Netzwerken

> [!hint] Lineare elektrische Netzwerke bestehen ausschließlich aus:
> - linearen Widerständen
> - [Induktivitäten](Induktivitäten.md)
> - [Kapazitäten](Kapazität.md)
> - [idealen Quellen](lineare%20Quellen.md)

Lineare Widerstände, [Induktivitäten](Induktivitäten.md) und [Kapazitäten](Kapazität.md) werden durch die bereits bekannten Strom-Spannungsbeziehungen für R, L, und C beschreiben.

Ideale Quellen mit Innenwiderstand werden als “reale Quellen” oder besser als [lineare Quellen](lineare%20Quellen.md) bezeichnet.

> [!info] Eine systematisches Verfahren ([Algorithmus](../Softwareentwicklung/ds-algo/{MOC}%20Algorithmus.md)) für die Analyse ist notwendig für:
> - Analyse komplexerer Netzwerke
> - Computer gestützte Verfahren

### Aufbau eines Netzwerks

> [!info] Ein Netzwerk besteht im allgemeinen aus $n$-Polen ($n\geq 2$)
> Da sich $n$-Pole durch Zweipole modellieren lassen, betrachten wir **Nur aus Zweipolen bestehende Netzwerke**
> - z.B lassen sich für [Transistoren](../Hardwareentwicklung/Halbleiter/{MOC}%20Transistor.md), die in der Regel drei Anschlüsse haben, Ersatzschaltbilder angeben, die Ausschließlich aus Zweipolen bestehen.

Wir nehmen an, dass alle Zweipole ($R$, $L$, $C$, Quellen) bekannt sind und dass das Netzwerk aus $k$ Knoten und $z$ Zweigen.

### Topologien

### Verfahren Für die Analyse

- [[Knotenpotentialverfahren]]
- [[Maschenstromverfahren]]

### Grafische Netzwerkanalyse

Grafisch Hilfsmittel wie [Zeigerdiagramme](../Elektrotechnik/Zeigerdarstellung.md) und [Ortskurven](../Hardwareentwicklung/Ortskurve.md) erlauben ein rasches Verständnis des Verhaltens eines Wechselstrom netzwerks

Im Zusammenhang mit den Zeigerdiagrammen werden wir uns noch mit der [Inversion von Zeigern](../Elektrotechnik/Zeigerdarstellung.md#Inversion%20von%20Zeigern) beschäftigen
  - um z.B. Z- oder Y-[Zeigerdiagramme](../Elektrotechnik/Zeigerdarstellung.md) von Schaltungen zeichnen zu können, die eine Mischung aus Bauelementen in Serien- und Parallelschaltung enthalten

# Tags

[1^]: Für den Fall der [Wechselstromtechnik](Wechselstromtechnik.md)