---
tags:
aliases:
keywords:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 9th February 2026
professor:
release: false
title: Zufall
---

# Phänomen: Zufall

Durch Simulationen von einfachen Zufallsexperimenten wie:

- Würfeln
- Münzwerfen
- Ziehen von Kugeln aus einer Urne

ein Gefühl für das Phänomen Zufall vermitteln.

## Pseudozufallszahlen

Um Simulationen zu den Experimenten am Computer statt in der Realität durchführen zu können, müssen Zufallszahlen *generiert* werden.

> [!hint] Dazu sind folgende **Mathematica** Befehle hilfreich:
> 
> - `RandomReal[]`  bzw  `RandomReal[{zmin,zmax}]`
> liefert eine auf dem Intervall $[0,1]$ bzw. dem Intervall $[z_{\text{min}},z_{\text{max}}]$ gleichmäßig verteilte Pseudozufallszahl.
> 
> - `RandomReal[{zmin,zmax},k]`
> erzeugt eine Liste von $k$ auf dem Intervall $[z_{\text{min}},z_{\text{max}}]$ gleichmäßig verteilten Pseudozufallszahlen.
> 
> - `RandomInteger[]`  bzw  `RandomInteger[{zmin,zmax}]`
> liefert eine auf der Menge $\{0,1\}$ bzw der Menge $\{i|z_{\text{min}}\leq i \leq z_{\text{max}}\}$ gleichmäßig verteilte Pseudozufallszahl.
> 
> - `RandomInteger[{zmin,zmax},k]`
> erzeugt eine Liste von $k$ auf der Menge $\{i|z_{\text{min}}\leq i \leq z_{\text{max}}\}$ gleichmäßig verteilten Pseudozufallszahlen.
> 
> - `RandomSample[liste]`
> liefert eine pseudozufällige Permutation der Liste `liste`.
> 
> - `RandomSample[liste,k]`
> erzeugt eine Liste mit den ersten $k$ Elementen einer pseudozufälligen Permutation der Liste `liste`.

## Referenzen

[Phänomen Zufall - Prof. Dimitry Efrosinin - Mathematica](../../xEDU/B5_WS25/WuSP/01_Phaenomen_Zufall.nb)