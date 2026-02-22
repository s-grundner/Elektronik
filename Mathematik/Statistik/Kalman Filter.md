---
tags:
aliases:
  - Linear Quadratic Estimator
  - LQE
subject:
  - KV
  - Regelungstechnik
semester: SS26
created: 22nd February 2026
professor:
release: false
title: Kalman Filter
keywords:
  - Zustandsbeobachter im Mehrgrößenfall
---

# Kalman Filter

- [Zustandsbeobachter](../../Systemtheorie/Regelungstechnik/Zustandsbeobachter.md)

- - -

Durch einen Zustandsbeobachter werden (falls möglich) die Eigenwerte der Matrix des *Fehlersystems* $\mathbf{A}+\hat{\mathbf{K}}\mathbf{C}$ vorgegeben [^1].

> [!hint] Im Eingrößenfall gelingt dies sofern das System vollständig beobachtbar ist mit der Formel von Ackermann.

Ähnlich wie beim Zustandsreglerentwurf ist eine günstige Wahl der vorgegebenen Eigenwerte keinesfalls trivial - auch hier kann das Lösen einer Optimierungsaufgabe Abhilfe schaffen.

Im Zeitkontinuierlichenfall wird folgendes [LTI-System](../../Systemtheorie/Kontinuierlicher%20LTI-Zustandsraum.md) als Steckenmodell betrachtet:

$$
\begin{align}
\dot{\mathbf{x}} &= \mathbf{Ax} + \mathbf{Bu}(t) + \mathbf{d}, \quad \mathbf{x}(0)= \mathbf{x}_{0}\\
\mathbf{y} &= \mathbf{Cx} + \mathbf{Du}(t) + \mathbf{n}
\end{align}\tag{1}
$$

Hier sind nun die *Störung* $\mathbf{d}$ dem Zustand und das *Messrauschen* $\mathbf{n}$ dem Ausgang beaufschlagt. Das Modell $(1)$ wird nun als [stochastischer Prozess](Stochastische%20Prozesse.md) mit den [Zufallsvariablen](Zufallsvariable.md) $\mathbf{x},\dot{\mathbf{x}},\mathbf{d},\mathbf{n},\mathbf{y}$ und dem *deterministischen* Eingang $\mathbf{u}(t)$ Aufgefasst.

Unter der Annahme, dass die ergodischen Prozesse $\mathbf{d},\mathbf{n}$ [stationär](Stochastische%20Prozesse.md#Stationäre%20stochastische%20Prozesse) mit Mittelwert $\mu=0$ ist sind folgende Bedingungen erfüllen

$$
\begin{align}
\operatorname{Cov}(\mathbf{d}) = \hat{\mathbf{Q}}\delta(t-\tau),\quad \hat{\mathbf{Q}}\geq \mathbf{0}, \quad \mathbb{E}(\mathbf{d})=0 \\
\operatorname{Cov}(\mathbf{n}) = \hat{\mathbf{R}}\delta(t-\tau),\quad \hat{\mathbf{Q}}\geq \mathbf{0}, \quad \mathbb{E}(\mathbf{n})=0 \\
\end{align}
$$

- $\delta(t)$ ... [Dirac-Distribution](../Delta-Impuls.md)

Außerdem soll hier gelten, dass Rauschen und Störung nicht miteinander korreliert (= [unabhängige Zufallsvariablen](Zufallsvariable.md#Unabhängige%20Zufallsvariable)) sind, also gilt

$$
\operatorname{Cov}(\mathbf{dn}^{T}) \overset{ \vec{\mu}_{\mathrm{d}}=\vec{\mu}_{\mathbf{n}}=\mathbf{0} }{ = } \mathbb{E}(\mathbf{\mathbf{dn}}^{T}) = \mathbf{0}
$$

## Schätzung

Ein Kalman Filter ist ein linearer Schätzer der so entworfen wird, dass die [Varianz](Varianz.md#Allgemeiner%20Fall) des Schätzfehlers

$$
\operatorname{Var}(\mathbf{x}(t)) = \mathbb{E}\left( (\mathbf{x}(t) - \hat{\mathbf{x}}(t))^{T} \cdot (\mathbf{x}(t)- \hat{\mathbf{x}}(t)) \right)
$$

Minimal wird. Das Ergebnis zeigt folgender Satz

#incomplete



[^1]:Prinzipiell könnte man die Eigenwert- vorgabe auch auf den Mehrgrößenfall erweitern. Da jedoch dann die Konstruktion der Beobachternormalform aufwändiger wird, verzichten wir an dieser Stelle darauf. 