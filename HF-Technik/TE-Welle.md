---
tags:
aliases:
keywords:
  - Transversale E-Welle
  - Transversale Elektrische Welle
  - TE-Mode
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 9th February 2026
professor:
release: false
title: Transversale E-Welle
---

# Transversale elektrische Welle

> [!question] [Modellbildung](Leitergeometrie.md#Modellbildung), [TEM-Welle](TEM-Welle.md)

---

> [!hint] Transversale E-Wellen sind charakterisiert mit $E_{z} = 0$ und $H_{z} \neq 0$.
> Nur die Das E-Feld hat keine komponente in Ausbreitungsrichtung.

Gleichungen (3.5) aus dem Transversal-Modell werden zu:

$$
\begin{align}
H_{x} &= -\frac{j \beta}{k_{c}^{2}} \frac{ \partial H_{z} }{ \partial x } \quad \text{(3.19a)} &&
E_{x} = -\frac{j \omega\mu}{k_{c}^{2}} \frac{ \partial H_{z} }{ \partial y } \quad\text{(3.19c)} \\
H_{y} &= -\frac{j \beta}{k_{c}^{2}} \frac{ \partial H_{z} }{ \partial y } \quad\text{(3.19b)} &&
E_{y} = \frac{j \omega\mu}{k_{c}^{2}} \frac{ \partial H_{z} }{ \partial x } \quad\text{(3.19d)}\\
\end{align}
$$

Für eine Sinnvolle lösung muss gelten $\beta \neq k \implies k_{c}\neq 0$. Die Fortpflanzungskonstante $\beta = \sqrt{ k^{2}-k_{c}^{2}}$ ist eine Funktion der Frequenz und der Geometrie.

> [!important] Die Gleichungen die die Wellen beschreiben sind nun keine Laplacegleichung mehr und daher nicht mehr von einer Elektrostatischen Differenz im Potenzial beschreibar.
> - TE Wellen können sich daher innerhalb eines geschlossenen **Einleiters**, sowie zwischen Zwei oder Mehrleitern ausbreiten.
> - TE Wellen Funktionieren nicht mehr bis zum statischenfall. 
> 

Um die PDGL in (3.19) lössen zu können, muss erst ein Ausdruck für $H_{z}$ gefunden werden. Die [Helmholtzsche DGL](Helmholtzsche%20Differenzialgleichung.md) für die $H_{z}$ komponente lautet:

$$
\left( \frac{ \partial^{2} }{ \partial x^{2} } + \frac{ \partial^{2} }{ \partial y^{2} } +\frac{ \partial^{2}  }{ \partial z^{2} } + k^{2} \right) H_{z} = 0
$$

Mit $H_{z}(x,y,z) = h_{z}(x,y) e^{ -j\beta z }$. Die Helmholtz DGL zu zwei dimensionen reduziert werden und mit $k_{c}^{2} = k^{2}-\beta^{2}$ gilt:

$$
\left( \frac{ \partial^{2} }{ \partial x^{2} } + \frac{ \partial^{2} }{ \partial y^{2}}   + k_{c}^{2} \right) h_{z} = 0 \tag{3.21}
$$

Diese Gleichung muss mittels Randwertbedingungen der gegebenen Geometrie gelöst werden.

## Wellenwiderstand

Der Freiraumwellenwiderstand (*nicht die charakteristische Impedanz*) ist

$$
Z_{\text{TE}} = \frac{E_{x}}{H_{y}} = \frac{-E_{y}}{H_{x}} = \frac{\omega\mu}{\beta} = \frac{k\eta}{\beta}
$$

Man kann erkennen, dass der Freiraumwellenwiderstand von der Frequenz abhängig ist.

### Analyse von TE-Moden

Um die Leiterkenngrößen von TE Wellen zu ermitteln, kann folgende Herangehensweise vorgenommen werden:

1. Die reduzierte Helmholtz DGL (3.21) für $h_{z}(x,y)$ lösen. Die Lösung beinhaltet unbekannte Konstanten und die unbekannte [Grenzwellenzahl](../Physik/Feldtheorie/Wellenzahl.md) $k_{c}$.
2. (3.19) verwenden, um die transversalen Anteile $\mathbf{h}(x,y)$ zu berechnen.
3. Randwerte für die Feldkomponenten definieren, um die unbekannten Konstanten  und $k_{c}$ zu bestimmen.
4. Die [Ausbreitungskonstanten](../Physik/Feldtheorie/Wellenzahl.md#Grenzwellenzahl) und die Wellenimpedanz $Z_{\text{TE}}$ berechnen