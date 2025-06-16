---
tags:
  - Algorithmus/Mathe
aliases:
  - Inverse
  - Gauß-Jordan
  - Invertierbarkeit
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 27. Januar 2024
professor:
  - Andreas Neubauer
---
 

# Invertieren einer Matrix

Eine Matrix ist genau dann invertierbar, wenn sie regulär ist.

> [!hint] Invertierbar $\iff$ Regulär

![](Reguläre%20Matrizen.md#^REGM)

Systematisch lässt sich eine Matrix mit dem Gauß-Jordan-Verfahren Invertieren

## 2x2 Matrix

$$
\mathbf{A}^{-1}=\begin{pmatrix}
a & b \\ c & d
\end{pmatrix}^{-1}= \frac{1}{\underbrace{ ad-bc }_{ \det \mathbf{A} }} \begin{pmatrix}
d & -b \\ -c & a
\end{pmatrix}
$$

> [!hint] die Matrix es Zweiten terms ist die Adjunkte matrix von $\mathbf{A}$

## Gauß-Jordan Verfahren

Dieses Verfahren funktioniert für beliebige invertierbar Matrizen.

Prinzip: Man nimmt an der zu invertierenden Matrix elementare Zeilenumformungen durch bis aus ihr die Elementarmatrix wird. Man nimmt die **selben umformungen** an der Einheitsmatrix vor. Diese Umgeformte Einheitsmatrix ist dann die Inverse.