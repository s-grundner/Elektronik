---
tags: 
aliases:
  - Messunsicherheiten
  - Messunsicherheit
  - Guide to the expression of Uncertainty in Measurement
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

Ist eine zu Ermittelnde Größe durch eine Funktion $f(\mathbf{x})$ aus $N$ unkorrelierter Messgrößen $\mathbf{x} = [x_{1}, x_{2}, \dots, x_{N}]$ mit eigenen Unsicherheiten $\mathbf{u}(\mathbf{x})$ gegeben, gehen die Unsicherheiten wiefolgt auf die zu Ermittelnde größe über.

Bezeichnungen der Messgrößen

- $x_{i}$ ... Einzelmesswert
- $\bar{x}$ ... Mittelwert über eine Endliche Anzahl an Einzalmesswerte

> [!satz] Propagation von Unsicherheiten
> $$u(f) = \sqrt{ \sum_{i=1}^{N} (c_{i} \cdot u(x_{i}))^{2} }$$
> mit den Gewichtungsfaktoren $\mathbf{c}$ der Messgrößen.
> $$c_{i} = \frac{\partial f}{\partial x_{i}}$$

Die einzelenen unsicherheiten der Messgrößen sind durch die Messmethode bestimmt.


## Typ A Methode

- Wiederholungsmessungen
- möglichst identische Bedingungen
- Beruhend auf **Häufigkeitsverteilungen**

![600](../assets/Excalidraw/GUM%202025-07-02%2014.42.42.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../assets/Excalidraw/GUM%202025-07-02%2014.42.42.excalidraw.md)%%

> [!satz] Standard Unsicherheit Nach Typ A
> $$u(\bar{x})^2= \frac{u(x_{i})}{\sqrt{ N }}$$
> Dabei ist $u(x_{i})$ die Unsicherheit der Einzelmesswerte mit
> $$u(x_{i}) = \sqrt{ \sum_{i=1}^{N} (x_{i} - \bar{x}) }$$

## Typ B Methode


- Andere Informationsquelle
- Kalibrierschein, Geräte Handbuch
- Umgebungsbediungungen
- Beruhend auf A-Priori Verteilung

![1200](../assets/Excalidraw/GUM%202025-07-02%2014.46.40.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../assets/Excalidraw/GUM%202025-07-02%2014.46.40.excalidraw.md)%%

> [!example] Bsp
> - Geeichtes Messgerät: Toleranzgrenzen
> - Auflösung einer Anzeige: Auflösungsintervall

## Typ A und B Methode in Kombination

---

## Ressourcen

[Python Uncertainties](../Softwareentwicklung/Python/Python%20Uncertainties.md)

---

## Beispiele

- [INTERNAL_UE02](../xEDU/B4_SS25/EMTS/UE/UE02.md#6.%20GUM)