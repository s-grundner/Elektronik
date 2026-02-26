---
tags:
aliases:
keywords:
subject:
  - KV
  - Analoge Schaltungstechnik
semester: WS25
created: 14th October 2025
professor:
release: false
title: xschem
---

# XSchem

> [!question] [Docs](https://xschem.sourceforge.io/stefan/xschem_man/xschem_man.pdf)

Strommessen: Spannungsquelle mit 0V platzieren, oder ammeter

Wenn netze gleich heißen, sind sie verbunden: Highlight mit `K`. `Shift+K` um highlights zu entfernen.

ANAS: Verändern der Schaltung save file erzeugen

## Symbole

Namen für Symbole müssen immer mit dem Richtigen Buchstaben beginnen: z.B: Widerstand -> R, Spannungsquelle -> V

- `ammeter`:
- `lab_pin`: Label
- `code` oder `code_shown`: Spice Instruktionen

## Simulator

> [!question] [NgSpice](Spice.md)

Konfigurieren des NGSpice Terminals

```xschemrc
set terminal {xterm \
	-fa Monospace \
	-fs 20 \
	-bg black \
	-fg white \
	-xrm "XTerm*VT100.Translations: #override \
	Ctrl Shift <Key>C: copy-selection(CLIPBOARD)\n \
	Ctrl Shift <Key>V: insert-selection(CLIPBOARD)"}
```