---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 15th April 2026
professor:
release: false
title: D-Flip Flop
---

# D-Flip Flop

> [!question] [Sequenzielle Logik](Sequenzielle%20Logik.md)

![invert_dark|500](../_assets/RA-DFF-1.png)

S und R werden aus D berechnet

$$
S = D, R = ¬D
$$

Enable steuert die Datenübernahme ([AND als Tor](Grundgatter.md#AND%20als%20Tor))

- Das D-Latch heißt transparent, wenn das Schreibsignal E aktiv ist
- E muss lange genug aktiv sein, damit sich der neue Zustand im RS-FF einstellen kann
- Das D-Latch ist pulsgesteuert (Schreibpuls E)
- Einfache 1-Bit Speicherzelle

![invert_dark|600](../_assets/RA-DFF.png)