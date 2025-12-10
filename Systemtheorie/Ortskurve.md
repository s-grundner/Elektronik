---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 16th May 2025
professor:
draft: true
title: Ortskurve
title: Ortskurve
release: false
---


# Ortskurve

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

![[../Hardwareentwicklung/assets/Ortskurve 2024-01-17 09.24.11.excalidraw|844]]

# Referenzen

[05_Ortskurven](../Messtechnik/assets/pdf/05_Ortskurven.pdf)