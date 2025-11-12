---
tags:
aliases:
  - LTSpice
  - NGSpice
keywords:
  - LTSpice
  - NGSpice
subject:
  - VL
  - Technische Elektronik
  - KV
  - Analoge Schaltungstechnik
semester: SS25
created: 22nd May 2025
professor:
draft: false
title: LTSpice
---

# Spice

> https://github.com/iic-jku/analog-circuit-design

## Analysearten

- `op`: Kleinsignal Arbeitspunkt
- `dc`: Spannung oder Strom von - bis
- `tran`: Einschaltverhalten
- `ac`: Spektrum

## NgSpice

> [Manual PDF](https://ngspice.sourceforge.io/docs/ngspice-43-manual.pdf)
> [Online Docs](https://nmg.gitlab.io/ngspice-manual/introduction.html)


Command fängt mit punkt (`.`) an: Direkte SPICE-Simulator befehle

interactive mode:

```ngspice
.control
# Interactive script
.endc
```
### Simulationen

- `op`: Arbeitspunkt
	- Kleinsignalverhalten mit konstanten Spannungen
- `dc`: Gleichspannungssweep
	- `dc <Spannungsquelle> <min> <max> <step>`
- `tran`
- `ac`