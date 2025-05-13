---
tags:
  - Schaltungsanalyse
aliases:
  - Frequenzgang
  - Bode
  - Ortskurven
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Elektrotechnik
semester: SS24
created: 4. September 2023
professor:
  - Andreas Springer
draft: true
title: Übertragungsfunktion
cited:
---

# Übertragungsfunktion

[Zeitdiskrete Übertragungsfunktion](Zeitdiskrete%20Übertragungsfunktion.md) ***:LiRefreshCcw:***

---


> [!def] **D1 - Übertragungsfunktion)** Transferfunction ^Transferfunction
> $$G(s) \equiv H(s) := \mathcal{L}\left\{ h(t) \right\}(s) $$

In der Regelungstechnik oft rational gebrochenes Polynom

$$
G(s) = \frac{Z(s)}{N(s)}
$$

## Frequenzgang

Der Frequenzgang ist auf der Imaginärachse der Transformierten abgebildet.

> [!def] **D - Frequenzgang)** Frequency Response ^FreqResponse
> 
> $$H(j\omega) := \mathcal{F}\{ h(t) \}(j\omega) = H(s) \Bigg|_{s = j\omega} $$

## Ortskurve

Die Ortskurve beinhaltet die selbe information wie der Frequenzgang.

> [!hint] in MATLAB
> 
> ```matlab
> nyquist()
> ```

| $R \neq f(\omega)$                | Punkt                                           |
| :-------------------------------- | :---------------------------------------------- |
| $\mathrm{j} \omega L$             | Gerade, positive imaginäre Achse                |
| $\frac{1}{\mathrm{j} \omega C}$   | Gerade, negative imaginäre Achse                |
| $R+\mathrm{j} \omega L$           | Gerade, parallel zu positiven imaginären Achse  |
| $\frac{1}{G+\mathrm{j} \omega C}$ | Halbkreis mit Mittelpunkt auf der reellen Achse |

Ortskurve dienen zur Darstellung Komplexer Parameter. Dieser aparamter ist entweder eine Impedanz $\underset{  }{ Z }$ oder eine Admittanz $\underline{ Y }(\omega)$. *Die Ortskurve zeigt den Weg, den die Zeiggerspize Folgt*.

Sie dient dabei nicht zur Grafischen ermittlung komplexen Größen (Dazu ist das Bode-Diagramm besser) sondern als Überblick zur Frequenzabhängigkeit der Größe.

![[assets/Ortskurve 2024-01-17 09.24.11.excalidraw|844]]

# Quellen

[05_Ortskurven](../Messtechnik/assets/pdf/05_Ortskurven.pdf)
