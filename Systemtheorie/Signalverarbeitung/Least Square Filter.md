---
tags:
aliases:
subject:
  - SE
  - Bachelorarbeit
semester: SS26
created: 25th March 2026
professor:
release: false
title: Least Square Filter
---

# Least Square Filter

> [!question] [Optimale Filter](Optimale%20Filter.md)

LS-Filter wird als [FIR-Filter](FIR-Filter.md) betrachtet.

![invert_dark|700](../../_assets/Pasted%20image%2020260325211008.png)

Beim LS-Filter gibt es die **Trainingsphase** und die **Operationsphase**.

Trainingsphase:

- Für jeden Eingangs $x[k]$ ist ein passender Ausgang  $y[k]$ verfügbar.
- Die Filterkoeffizienten werden nach den [linearen Methode der kleinsten Quadrate (LLS)](../../Mathematik/Lineare%20Methode%20der%20kleinsten%20Quadrate.md) approximiert.
- Der Filter stellt sich dann so ein, dass der Eingang über eine optimale lineare Funktion auf den Ausgang abbildet.

## LLS in Vektorparameter Schreibweise


Für ein Signal

$$
\mathbf{s} = \begin{pmatrix}
s[0] \\ s[1] \\ \vdots \\ s[N-1]
\end{pmatrix}
$$
