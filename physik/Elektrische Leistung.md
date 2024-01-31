---
tags: []
aliases:
  - Leistung
  - Leistungsabfall
subject:
  - physik
source:
  - Michael Offenhuber
  - Martin Aichriedler
  - Siegbert Schrempf
  - Angela Lindner
created: 24th November 2022
---

# [Elektrische Leistung](https://de.wikipedia.org/wiki/Elektrische_Leistung)

$$
P=U\cdot I=I^{2}\cdot R=\frac{U^{2}}{R}
$$

![Elektrische Leistung 2024-01-17 08.51.56.excalidraw](assets/Elektrische%20Leistung%202024-01-17%2008.51.56.excalidraw.md)

# Quellen

# Komplexe Leistung

## Wirkleistung

$P=U \cdot I \cdot \cos \varphi$ -> $\varphi = \varphi_{u} - \varphi_{i}$ 
Einheit: Watt

## Bildleistung

$Q=U\cdot I\cdot \sin \varphi$
Einheit: VAR - Volt Ampere Reaktiv

## Scheinleistung

$S=\sqrt{ P^2+Q^2 } = \mid S\mid$
Einheit: VA - Volt-Ampere

## Blindleistungskompensation

$\cos \varphi_{k}$ … Leistungsfaktor

$S=\frac{P}{\cos \varphi_{k}}$


![[assets/Elektrische Leistung 2024-01-26 10.52.55.excalidraw]]

### Beispiele

![450](assets/Pasted%20image%2020240126111442.png)


$$
\begin{align}
Y &= \frac{1}{R}+\frac{1}{X_{L}}+\frac{1}{X_{C}} \\
&=\frac{1}{R}+\frac{1}{j\omega L}+j\omega C \\
Z&=\frac{1}{Y} \\
arg(Z) &= \varphi = \arccos(0.95) =-18.19°\\
arg(Z) &= \varphi =\arctan()
\end{align}
$$