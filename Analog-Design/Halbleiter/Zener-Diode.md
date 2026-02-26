---
tags:
  - Halbleiter/Diode
aliases:
created: 22nd August 2023
title: Zener-Diode
---

# Zener-Diode

Zener-Dioden sind pn-Dioden mit genau eingestellter Durchbruchsspannung.

> [!hint] Wegen der extremen Steilheit der Kennlinie im Sperrbereich, eignet sich die Zener-Diode gut als **Spannungsreferenz**.
> Sie wird zu diesem Zweck über einen Serienwiderstand vorgespannt.

## Anwendung

- [Ungeregelte Spannungsstabilisierung](../Stromversorgungseinheiten/Ungeregelte%20Spannungsstabilisierung.md)

## Funktionsweise

Grundsätzlich gibt es zwei Durchbruchmechanismen, weche die Einstellung der Durchbruchspannung ermöglchen:

### Zener-Effekt

Für $U_{Z}< 5V$:

Bei hoher Dotierung des pn-Übergangs ist die Raumladungszone klein. Ist die Sperrspannung so groß, dass das Valenzband des p-Halbleiters höher als das Leitungsband des n-Halbleiters ist, können die Elektronen in das Valenzband des p-Halbleiters gelangen. 

### Lawinen-Effekt

Für $U_{Z}> 7V$:

Elektronen werden im großen E-Feld derart beschleunigt, dass sie genügend Energie besitzen, um bei einer Kollision mit einem anderen Valenzelektron dieses ins Leitungsband zu heben. Dieses neu erzeugte Elektronen-Loch Paar trätg nun zur Leitung bei und kann weitere Paare durch Kollision erzeugen.