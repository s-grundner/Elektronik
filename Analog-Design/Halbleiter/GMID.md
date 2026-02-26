---
tags:
aliases:
subject:
  - KV
  - Analoge Schaltungstechnik
semester: WS25
created: 26th February 2026
professor:
release: false
title: GMID
---

# gm / ID

Dimensionierung von MOSFETs - Freiheitsgrade: $W$, $L$, $I_{\mathrm{D}}$ (Biasstrom)
Traditionell *Square Law Model*: $I_{D}$ hängt quadratisch mit einer Threshholdspannung zusammen.
Bei kleiner werdenden $V_{\mathrm{GS}}$ nicht mehr akkurat. Diffusionsstromanteil des Biasstroms wird höher.
 
## Modell

Wieso ist $g_{\mathrm{m}} / I_{\mathrm{D}}$ ein Sinnvoller Parameter zur Dimensionierung eines MOSFETs:

- In Vielen Schaltungen möchte man ein eine **große Verstärkung** erzeielen. $\to$ Großes $g_{\mathrm{m}}$
- Das Möchte man mit einem Möglichst **geringen Biasstrom** $I_{\mathrm{D}}$ erzielen (für geringste Verlustleistung).
- Damit ist das Maximieren von $g_{\mathrm{m}} / I_{\mathrm{D}}$ sinnvoll für die Dimensionierung.
- Problem: $f_{\mathrm{T}}$ ist maximal für *geringes* $g_{\mathrm{m}} / I_{\mathrm{D}}$. Tradeoff zw. Geschwindigkeit und Leistungsaufnahme

![invert_dark|500](../../../_assets/gmid-graph.png)

## Vorgehen

Ebenen zur Dimensionierung mit $\frac{g_{\mathrm{m}}}{I_{\mathrm{D}}}$ Methode.

1. Initial Guess für $g_{\mathrm{m}} / I_{D}$ und $L$ (siehe Abbildung). Arbeitspunkt finden.
2. Formeln vom Kleinsignal ESB herleiten. $g_{\mathrm{m}} / I_{\mathrm{D}}$ und $L$ Manuell anpassen bzgl der gewählten Tradeoffs.
3. Optimierungsproblem mit software Lösen mit sweep von $g_{\mathrm{m}} / I_{\mathrm{D}}$ 

## Charakterisierung In Sättigung

Regionen:

- Weak Inversion (kleines $V_{\mathrm{GS}}$): $\dfrac{g_{\mathrm{m}}}{I_{\mathrm{D}}} = \dfrac{1}{n V_{\mathrm{T}}}$
- Strong Inversion (klassisches *Square Law Modell*): $\dfrac{g_{\mathrm{m}}}{I_{\mathrm{D}}}=\dfrac{2}{V_{\mathrm{GS}}-V_{\mathrm{th}}} = \dfrac{2}{V_{\mathrm{od}}}$

Wichtige Graphen

- $g_{\mathrm{m}} / I_{\mathrm{D}} = f(V_{\mathrm{GS}})$
- $f_{\mathrm{T}} = f(V_{\mathrm{DS}})$
- Strichlierte Linie: $f_{\mathrm{T, max}} / 10$ als sinnvolle Maximalfrequenz des Nutzsignals.

![invert_dark|500](../../../_assets/Pasted%20image%2020260226170450.png)

## Charakterisierung in Triode Mode

Für die charakterisierung der 

| ![invert_dark\|500](../../../_assets/Pasted%20image%2020260226174030.png) | ![invert_dark\|500](../../../_assets/Pasted%20image%2020260226174048.png) |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
|                                                                           |                                                                           |

![invert_dark|400](../../../_assets/Pasted%20image%2020260226164741.png)