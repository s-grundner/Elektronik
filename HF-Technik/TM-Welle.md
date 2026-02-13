---
tags:
aliases:
  - Transversale magnetische Welle
  - TM-Mode
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 9th February 2026
professor:
release: false
title: TM-Welle
---

# Transversale magetische Welle

> [!question] [Modellbildung](Leitergeometrie.md#Modellbildung), [TEM-Welle](TEM-Welle.md)

---

> [!hint] Transversale M-Wellen sind charakterisiert mit $H_{z} = 0$ und $E_{z} \neq 0$.
> Nur die Das H-Feld hat keine komponente in die Ausbreitungsrichtung $\hat{\mathbf{z}}$.

Gleichungen (3.5) aus dem Transversal-Modell werden zu:

$$
\begin{align}
H_{x} &= \frac{j \omega\epsilon}{k_{c}^{2}} \frac{ \partial E_{z} }{ \partial y } \quad \text{(3.23a)} &&
E_{x} = -\frac{j \beta}{k_{c}^{2}} \frac{ \partial E_{z} }{ \partial x } \quad\text{(3.23c)} \\
H_{y} &= -\frac{j \omega\epsilon}{k_{c}^{2}} \frac{ \partial E_{z} }{ \partial x } \quad\text{(3.23b)} &&
E_{y} = -\frac{j \beta}{k_{c}^{2}} \frac{ \partial E_{z} }{ \partial y } \quad\text{(3.23d)}\\
\end{align}
$$

Für eine Sinnvolle lösung muss gelten $\beta \neq k \implies k_{c}\neq 0$. Die Fortpflanzungskonstante $\beta = \sqrt{ k^{2}-k_{c}^{2}}$ ist eine Funktion der Frequenz und der Geometrie.

> [!important] Die Gleichungen die die Wellen beschreiben sind nun keine Laplacegleichung mehr und daher nicht mehr von einer Elektrostatischen Differenz im Potenzial beschreibar.
> - TM Wellen können sich daher innerhalb eines geschlossenen **Einleiters**, sowie zwischen Zwei oder Mehrleitern ausbreiten.
> - TM Wellen Funktionieren nicht mehr bis zum statischenfall. Ab einer gewissen unteren Frequenz wird die Welle direkt gedämpft und wird zu einer Evaneszenten Welle.

Um die PDGL in (3.19) lössen zu können, muss erst ein Ausdruck für $E_{z}$ gefunden werden. Die [Helmholtzsche DGL](Helmholtzsche%20Differenzialgleichung.md) für die $E_{z}$ komponente lautet:

$$
\left( \frac{ \partial^{2} }{ \partial x^{2} } + \frac{ \partial^{2} }{ \partial y^{2} } +\frac{ \partial^{2}  }{ \partial z^{2} } + k^{2} \right) E_{z} = 0
$$

Mit $E_{z}(x,y,z) = e_{z}(x,y) e^{ -j\beta z }$. Die Helmholtz DGL zu zwei dimensionen reduziert werden und mit $k_{c}^{2} = k^{2}-\beta^{2}$ gilt:

$$
\left( \frac{ \partial^{2} }{ \partial x^{2} } + \frac{ \partial^{2} }{ \partial y^{2}}   + k_{c}^{2} \right) e_{z} = 0 \tag{3.25}
$$

Diese Gleichung muss mittels Randwertbedingungen der gegebenen Geometrie gelöst werden.

## Wellenwiderstand

Der Freiraumwellenwiderstand (*nicht die charakteristische Impedanz*) ist

$$
Z_{\text{TM}} = \frac{E_{x}}{H_{y}} = \frac{-E_{y}}{H_{x}} = \frac{\beta}{\omega\epsilon} = \frac{\beta\eta}{k}
$$

Man kann erkennen, dass der Freirumwellenwiderstand von der Frequenz abhängig ist.

### Analyse von TM-Moden

Um die Leiterkenngrößen von TM Wellen zu ermitteln, kann folgende Herangehensweise vorgenommen werden:

1. Die reduzierte Helmholtz DGL (3.25) für die Longitudinale Komponente $e_{z}(x,y)$ lösen.
	- Die Lösung beinhaltet unbekannte Konstanten und die unbekannte [Grenzwellenzahl](../Physik/Feldtheorie/Wellenzahl.md) $k_{c}$.
2. (3.23) verwenden, um die transversalen Anteile $\mathbf{e}(x,y)$ zu berechnen.
3. Randwerte für die Feldkomponenten definieren, um die unbekannten Konstanten  und $k_{c}$ zu bestimmen.
4. Die [Ausbreitungskonstanten](../Physik/Feldtheorie/Wellenzahl.md#Grenzwellenzahl) und die Wellenimpedanz $Z_{\text{TM}}$ berechnen.