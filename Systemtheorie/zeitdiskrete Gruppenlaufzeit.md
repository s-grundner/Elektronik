---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 4th June 2025
professor:
release: false
title: zeitdiskrete Gruppenlaufzeit
---

# Gruppenlaufzeit zeitdiskreter Systeme

> [!question] [Gruppenlaufzeit](Gruppenlaufzeit.md) :LiRefreshCcw:

---

$H\left( e^{ j\Omega } \right)$ ist der [Frequenzgang](Zeitdiskrete%20Übertragungsfunktion.md) eines zeitdiskreten LTI-Systems.

> [!def] **D1 - GRLZ)** Gruppenlaufzeit (group delay) ^GRLZ
> $$\tau_{g}\left( e^{ j\Omega } \right) := - \frac{\mathrm{d}\arg\left\{ H\left( e^{ j\Omega } \right)  \right\} }{\mathrm{d}\Omega}$$

Die Gruppenlaufzeit ist gleich der **Anzahl an Abtastintervalle**, um die die Hüllkurve eines modulierten Signals verzögert wird.

## Phasenlaufzeit

Andere Weniger gebräuchliche größe:

> [!def] **D1 - PHLZ)** Phasenlaufzeit (phase delay) ^PHLZ
> $$\tau_{p}\left( e^{ j\Omega } \right) := - \frac{\arg\left\{ H\left( e^{ j\Omega } \right)  \right\}}{\Omega} $$

Mit dieser Größe kann die Reaktion des LTI-Systems auf eine sinusförmige Eingangsgröße der Frequenz $\Omega$ im eingeschwungenen Zustand beschrieben werden.

$$
\begin{align}
y[n] &= \left| H\left( e^{ j\Omega } \right)  \right| \cos \left( \Omega n + \arg\left\{ H\left( e^{ j\Omega } \right)  \right\}  \right)  \\
&=\left| H\left( e^{ j\Omega } \right) \right| \cos (\Omega(n-\tau_{p}))
\end{align}
$$

Die Phasenlaufzeit ist die Anzahl der Abtastintervalle, mit denen eine Sinusschwingung beim Durchlaufen des zd. LTI-Systems verzögert wird.