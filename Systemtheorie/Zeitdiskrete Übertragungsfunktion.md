---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 7th May 2025
professor:
draft: true
title: Zeitdiskrete Übertragungsfunktion
---

# Zeitdiskrete Übertragungsfunktion

[Kontinuierliche Übertragungsfunktion](Übertragungsfunktion.md) ***:LiRefreshCcw:***

---

 Für die Übertragungsfunktion eines Zeitdiskreten Systems, bildet man die [einseitige z-Transformation](z-Transformation.md) dessen Impulsantwort. 

> [!def] **D1 - Übertragungsfunktion)** Transferfunction ^ZD-Transferfunction
> $$H(z) := \mathcal{Z}\left\{ h[n] \right\} $$

## Frequenzgang

Man erhält den Frequenzgang indem man die Übertragungsfunkton auf der Zylinderebene des Einheitskreis auswertet ($z = r\cdot e^{ j\Omega }, r=1$). Daraus erschließt sich auch, dass das Spektrum eines diskreten Systems **periodisch**.

Das Funktioniert nur wenn das LTI-System [BIBO-Stabil](z-Transformation.md#^BIBO) ist, da nur dann der Einheitskreis teil des Konvergenzgebietes ist. Diese Auswertung ist identisch zur [DTFT](Zeitdiskrete%20Fourier-Transformation.md).


> [!def] **D - Frequenzgang)** Frequency Response ^ZD-FreqResponse
> 
> $$H\left( e^{ j\Omega } \right) := \mathcal{F}_{\mathrm{D}}\left\{ h[n] \right\} = H(z) \Bigg|_{z = e^{ j\Omega }} $$
