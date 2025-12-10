---
tags:
  - Systeme/LTI
  - Systeme/Kontinuierlich
aliases:
  - Zustandsbeobachtung
  - Beobachternormalform
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 25. Mai 2025
professor: 
release: false
title: Zustandsbeobachter
---

# Lineare Zustandsbeobachtung

:LiRefreshCcw: [Zustandsregler](Zustandsregeler.md) 

---

Ein Nachteil des Zustandsreglers ist, dass seine Implementierung die Messung **aller** Zustandsgrößen $\mathbf{x}$ erfordert. Man möchte ein dynamisches System 

$$
\begin{align}
\mathbf{\dot{z}} &= \mathbf{\hat{A}z} + \mathbf{\hat{B}}_{u}\mathbf{u} + \mathbf{\hat{B}}_{y}\mathbf{y}, \qquad \mathbf{z} (0) = \mathbf{z}_{0} \\
\mathbf{\hat{x}} &= \mathbf{\hat{C}z} + \mathbf{\hat{D}}_{u}\mathbf{u} + \mathbf{\hat{D}}_{y}\mathbf{y}
\end{align}
$$

geeigneter Dimension $n$ mit den **Eingängen** $\mathbf{u}$ und $\mathbf{y}$ konstruieren, welches als **Ausgang** einen *Schätzwert* $\mathbf{\hat{x}} \in \mathbb{R}^{n}$ für $\mathbf{x}$ liefert.

![invert_dark|600](../_assets/Pasted%20image%2020250525200012.png)

Dieses System beziechnet man als Beobachter.