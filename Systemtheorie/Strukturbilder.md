---
tags: 
aliases: 
keywords: 
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 6. März 2025
professor:
  - Markus Schöberl
release: false
title: Strukturbilder
---
 
# Strukturbilder

Blöcke von Standard Operationen:

|                     Integration                      | Multiplikation mit einem konstanten Faktor |                 Summation                 |
| :--------------------------------------------------: | :----------------------------------------: | :---------------------------------------: |
|      ![invert_dark\|300](../_assets/StruktInt.png)       | ![invert_dark\|300](../_assets/StruktFakt.png) | ![invert_dark\|300](../_assets/StruktSum.png) |
| $$y(t) = y(0) + \int_{0}^{t}u(\tau)\mathrm{~d}\tau$$ |               $$y=k\cdot u$$               |          $$y=u_{1}+u_{2}-u_{3}$$          |


- Differenzialgleichungen werden umgeformt in deren zugehörige Integralgleichung mit den Entsprechenden Anfangswerten.

> [!question]  Warum keinen Block fürs differenzieren?
> 
> die physik kann nicht differenzieren. man müsste in die zukunft schauen.
> 
> - Integrieren: alle bisherigen werte aufsummieren
> - Ableiten: Man muss beobachten, wie sich der Wert in kleines zeitstück im voraus ändert hat. 
> - siehe: [Differenzieren](../Mathematik/Analysis/Differenzialrechnung.md#^fig1). hier rechnet man ja $x_{0}+\Delta x$


