---
tags:
aliases:
subject:
  - SE
  - Bachelorarbeit
semester: SS26
created: 25th April 2026
professor:
release: false
title: Adaptive Filter
---

# Sample Adaptive Filter

> [!question] [Optimale Filter](Optimale%20Filter.md)

---

Ziel ist es, dass sich der Filter jenen koeffizienten annähert, sodass sich mit einem Eingangssignal $x[k]$ der Ausgang $\hat{y}[k]$ ergibt, der, wenn von dem gewünschten Signal $y[k]$ abgezogen, eine **Funktion** des Fehlers $e[k]$ bzw. **Upadate Vorschrift** *minimiert*.

## Funktion

![invert_dark](../../_assets/Pasted%20image%2020260425170219.png)

Der Update Algorithmus justiert mit jeder *Sampling-Time* die filter koeffizienten $\mathbf{w}[k]$ nach, sodass eine bestimmte Funktion der differenz zwischen Ist-Ausgang $\hat{y}[k]$ und dem gewünschten Soll-Ausgang $y[k]$ minimiert wird.

$$
\mathbf{w}[k] = \begin{pmatrix}
w_{0}[k] \\ w_{1}[k] \\ \vdots \\ w_{p-1}[k]
\end{pmatrix}
$$

- $\mathbf{w}[k]$ startet bei einem beliebigen Anfangswert. 
- Mit jedem Sample, werden die koeffizienten aktualisiert.
- Rekursive Methode:

$$
\mathbf{w}[k] = \mathbf{w}[k-1] + f(e[k-1])
$$

## Kenngrößen

- **Filter Typ:** FIR- bzw. IIR Filter.
- **Filter Ordnung:** Die Anzahl an Filterkoeffizienten ist oft unbekannt. Die Ordnung ist daher mittels a priori wissen oder experimentell herauszzufinden.

> [!quote] Hier werden nur FIR-Filter Betrachtet


## Anpassungs-Algorithmus

Zwei häufig benutzte Algorithmen zur Anpassung der Filterkoeffizienten sind

- [[LMS]]
- RMS

Faktoren, welche die Wahl des Algorithmus beeinflussen sind:

- die **Rechenkomplexität**,
- die **Geschwindigkeit der Anpassung** an den optimalen Betriebszustand,
- der **minimale Anpassungsfehler**,
- die **numerische Stabilität** und
- die **Robustheit** des Algorithmus gegenüber anfänglichen Parameterzuständen.