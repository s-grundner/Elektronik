---
tags:
  - tikz
aliases:
  - Messunsicherheiten
  - Messunsicherheit
  - Guide to the expression of Uncertainty in Measurement
  - Messabweichungen
keywords:
subject:
  - VL
  - Elektrische Messtechnik und Sensorik
semester: SS25
created: 25th March 2025
professor:
release: false
title: GUM
---

# Guide to the expression of Uncertainty in Measurement

> [!question] [Messen](Messtechnik.md)

Der GUM schreibt vor wie die unsicherheit einer Messgröße zu ermitteln ist.

![Messen](Messtechnik.md#^MESSGR)

## Messunsicherheiten

**Ursachen**

- Störung der Messeinrichtung
- Ablesende Person

**Arten**

| Art                                           | Entgegenwirkung                     |
| --------------------------------------------- | ----------------------------------- |
| [statistische Messabweichungen](statistische%20Messabweichungen.md) (stets unbekannt) | Wiederholungsmessungen              |
| bekannte systematische Messabweichung         | bekannte Abweichung kompensieren    |
| unbekannte systematische Messabweichung       | schwierig, oft nur grob Abschätzbar |

## Fehlerfortpflanzung

> [!question] Wie setzen sich mehrere Unsicherheiten zusammen

Ist eine zu Ermittelnde Größe durch eine Funktion $f(\mathbf{x})$ aus $N$ unkorrelierter Messgrößen $\mathbf{x} = [x_{1}, x_{2}, \dots, x_{N}]$ mit eigenen Unsicherheiten $\mathbf{u}(\mathbf{x})$ gegeben, gehen die Unsicherheiten wiefolgt auf die zu Ermittelnde größe über.

> [!satz] Propagation von Unsicherheiten
> $$
> u(f(\mathbf{x})) = \sqrt{ \sum_{i=1}^{N} (c_{i} \cdot u(x_{i}))^{2} }, \qquad c_{i} = \frac{\partial f}{\partial x_{i}}(x_{i})
> $$
> dabei heißt $c_i$ die **Sensitivität**. Ist $f(x_i) = x_i$, also ein direkter Messwert, ist $c=1$. Dann ist die Vereinfachte fehlerfortpflanzung die [euklidsche Norm](../Mathematik/Algebra/Norm.md) aller Unsicherheiten.
> $$
> u(\mathbf{x}) = \sqrt{ \sum_{i=1}^{N} u(x_{i})^{2}}
> $$


## Messmethoden

> [!question] Wie ergibt sich die Unsicherheit eines Messwertes

Zur bestimmung der Unsicherheit, ist immer wichtig, wie die Messgröße verteilt ist. Dazu gibt GUM zwei Methoden vor.

In der Praxis liegen immer eine endliche Anzahl $n$ an Messungen vor, weshalb für die Verteilungen der Zufallsvariablen / Messgrößen die Schätzwerte ($s$ statt $\sigma$, $\bar{x}$ statt $\mu$) verwendet werden.

Die einzelenen unsicherheiten $u(x_{i})$ der Messgrößen $x_{i}$ sind durch die Messmethode bestimmt.

### Typ A Methode

- Wiederholungsmessungen
- möglichst identische Bedingungen
- Beruhend auf **Häufigkeitsverteilungen**


```tikz
% Minimalbeispiel: einfache Glockenkurve
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=newest}
\begin{document}
\begin{tikzpicture}[scale=1.5]
\begin{axis}[
	domain=-4:4, samples=200,
	axis lines=middle,
	xlabel=$x$, ylabel=$f(x)$,
	xmin=-4, xmax=4, ymin=0, ymax=0.45,
	ticks=none,
	width=10cm, height=5cm
]
	\addplot[thick, smooth] {exp(-(x^2))/4};
\end{axis}
\end{tikzpicture}
\end{document}
```

![600](../_assets/Excalidraw/GUM%202025-07-02%2014.42.42.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/GUM%202025-07-02%2014.42.42.excalidraw.md)%%

> [!satz] Standard Unsicherheit Nach Typ A
> $$u(\bar{x})= \frac{u(x_{i})}{\sqrt{ N }}$$
> Dabei ist $u(x_{i})$ die Unsicherheit der Einzelmesswerte mit
> $$u(x_{i}) = \sqrt{ \sum_{i=1}^{N} (x_{i} - \bar{x}) }$$

### Typ B Methode

- Andere Informationsquelle
- Kalibrierschein, Geräte Handbuch
- Umgebungsbediungungen
- Beruhend auf A-Priori Verteilung

![1200](../_assets/Excalidraw/GUM%202025-07-02%2014.46.40.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/GUM%202025-07-02%2014.46.40.excalidraw.md)%%

> [!example] Bsp
> - Geeichtes Messgerät: Toleranzgrenzen
> - Auflösung einer Anzeige: Auflösungsintervall

### Typ A und B Methode in Kombination

---

## Ressourcen

[Python Uncertainties](../Softwareentwicklung/Python/Python%20Uncertainties.md)

---

## Beispiele

- [INTERNAL_UE02](../xEDU/B4_SS25/EMTS/UE/UE02.md#6.%20GUM)