---
tags:
aliases:
keywords:
subject:
  - VL
  - Technische Elektronik
  - KV
  - Analoge Schaltungstechnik
semester: SS25
created: 22nd May 2025
professor:
release: false
title: LTSpice
---

# Spice

## Analysearten

- `op`: Kleinsignal Arbeitspunkt
- `dc`: Spannung oder Strom von - bis
- `tran`: Einschaltverhalten
- `ac`: Spektrum

## NgSpice

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