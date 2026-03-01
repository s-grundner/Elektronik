---
tags:
aliases:
subject:
  - KV
  - Analoge Schaltungstechnik
semester: WS25
created: 28th February 2026
professor:
release: false
title: MOSFET Kaskodeschaltung
---

# MOSFET Kaskodeschaltung

> [!hint] Vorteil der Kaskode für den **Ausgang**
> Die Ausgangsimpedanz des unteren MOSFET $r_{\mathrm{out}}=\frac{1}{g_{\mathrm{ds}}}$ ist **höher** durch den self-gain $g_\mathrm{m} / g_{\mathrm{ds}}$ des Kaskode-Transistors. Eine viel bessere Methode, als dazu $L$ zu erhöhen.

> [!hint] Vorteil der Kaskode für den **Eingang**
> Eine kapazität an dem Eingangsknoten weist einen hoch-frequenteren **pol** auf, der nicht mehr im kritischen Bereich für die Stabilität der Schaltung ist.
> 
> Minimiert den [Millereffekt](../Filter-Verstärker/Millereffekt.md)