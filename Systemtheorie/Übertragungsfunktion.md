---
tags:
  - Schaltungsanalyse
aliases:
  - Frequenzgang
keywords:
subject:
  - VL
  - Regelungstechnik
  - Elektrotechnik
semester: SS24
created: 4. September 2023
professor:
  - Andreas Springer
release: false
title: Übertragungsfunktion
---

# Übertragungsfunktion

[Zeitdiskrete Übertragungsfunktion](Zeitdiskrete%20Übertragungsfunktion.md) ***:LiRefreshCcw:***

---

Für die Übertragungsfunktion eines Systems, bildet man die [einseitige Laplacetransformation](Laplacetransformation.md) dessen Impulsantwort.

Bei der Übertragungsfunktion betrachtet man nur den Eingeschwungenen Zustand. Damit eine Übertragungsfunktion existiert müssen alle Einschwingvorgänge (die homogene Lösung) und Transiente Vorgänge abklingen.

> [!def] **D1 - Übertragungsfunktion)** Transferfunction ^Transferfunction
> $$G(s) \equiv H(s) := \mathcal{L}\left\{ h(t) \right\}(s) $$

In der Regelungstechnik oft rational gebrochenes Polynom

$$ G(s) = \frac{Z(s)}{N(s)} $$

## Frequenzgang

Der Frequenzgang ist auf der Imaginärachse der Transformierten abgebildet. Der Frequenzgang eines Systems existiert nur wann dieses auch stabil ist.

> [!def] **D - Frequenzgang)** Frequency Response ^FreqResponse
> 
> $$H(j\omega) := \mathcal{F}\{ h(t) \}(j\omega) = H(s) \Bigg|_{s = j\omega} $$

Darstellungsformen des Frequenzganges:

- [Bode Plot](Bode%20Plot.md)
- [Ortskurve](Regelungstechnik/Ortskurve.md)

# Quellen