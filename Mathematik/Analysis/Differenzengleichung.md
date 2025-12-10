---
tags:
  - Systeme/Zeitdiskret
aliases:
  - Differenzengleichungen
  - DZGL
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Signalverarbeitung
semester: SS25
created: 11th March 2025
professor: 
release: false
title: Differenzengleichung
def:
  - DZGL
---
 
# Differenzengleichung (DZGL)

[Differenzialgleichungen](GDGL.md) ***:LiArrowBigRightDash:***

---

> [!quote] Differenzengleichungen im zeitdiskreten sind äquivalent zu den kontinuierlichen DGL 
> Man sucht hier anstatt einer Lösungsfunktion $\mathbf{x}(t;\mathbf{x}_{0}, t_{0})$ eine **Lösungsfolge** $\mathbf{x}[k;\mathbf{x}_{0},k_{0}]$


> [!def] **D1 - DZGL)** Explizite Differenzengleichung ^DZGL
> $$y[n] = -\sum_{i=1}^{M} a_{i}y[n-i] + \sum_{i=0}^{N}b_{i}x[n-i]$$

- Wenn alle $a_{i}=0$ dann heißt das System **nichtrekursiv**. der Ausgang ist nur von Folgegliedern des Eingangs.
- Sonst ist das System **rekursiv**. Man verwendet auch vergangenen Ausgänge.
- Die **Ordnung** des Systems ist $\max\{M,N\}$

---


## Differenzengleichungen im Zustandsraum

Weiterführend ist die Systemtheoretische Betrachtung von [Differenzengleichungssystemen](../../Systemtheorie/Zeitdiskrete%20Systeme.md) als Zustandsgleichungen von Übertragungssystemen.

**IIR-System $N$-ter Ordnung**

![invert_dark|400](../../_assets/Pasted%20image%2020250521103236.png)

Transponierte Direktform II
$$
y[n] = \sum_{i=1}^{N} a_{i} y[n-i] + \sum_{i=0}^{N} b_{i}u[n-i]
$$

$$
\begin{pmatrix}
x_{1}[n+1] \\ x_{2}[n+1] \\
\vdots \\
x_{N-1}[n+1] \\ x_{N}[n+1] \\
\end{pmatrix} =
\begin{pmatrix}
-a_{1} & 1 & 0 & \cdots & 0  \\
-a_{2} & 0 & 1 & \ddots & \vdots \\
\vdots & \vdots & \ddots & \ddots & 0 \\
-a_{N-1} & 0 & \vdots & 0 & 1 \\
-a_{N} & 0 & \cdots & 0 & 0
\end{pmatrix} \begin{pmatrix}
x_{1}[n] \\ x_{2}[n] \\
\vdots \\
x_{N-1}[n] \\ x_{N}[n] \\
\end{pmatrix} + \begin{pmatrix}
b_{1} - a_{1}b_{0} \\
b_{2} - a_{2}b_{0} \\
\vdots \\
b_{N-1} - a_{N-1}b_{0} \\
b_{N} - a_{N}b_{0} \\
\end{pmatrix}u[n]
$$

---

- [z-Transformation](../../Systemtheorie/z-Transformation.md)