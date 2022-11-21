---
tags: ["DGL"]
aliases: ["lineare Differentialgleichungen 1. Ordnung", "lineare Differentialgleichung 1. Ordnung", "Exponentialansatz"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
---

# Lineare Differentialgleichungen 1. Ordnung
## Lineare Differentialgleichungen 1. Ordnung mit konstantem Koeffizienten
$$y'+p\cdot y=s(x)$$
Eine DGL 1. Ordnung heißt **linear**, wenn sie in der Form $y'+p\cdot y=s(x)$ geschrieben werden kann.

Der Faktor $p$ heißt **Koeffizient** der linearen DGL. ist der Koeffizient eine *Konstante*, so spricht man von einer **linearen Differentialgleichungen 1. Ordnung mit konstantem Koeffizienten**.

Die im Allgemeinen vom $x$ abhängige Funktion **$s(x)$** wird oft als **Störfunktion** bezeichnet.

Ist **$s(x)=0$** für *alle* x, heißt die lineare DGL **homogen**, sonst **inhomogen**.
$$
y'+\underbrace{p}_{\text{Koeffizient}} \cdot y=\underbrace{s(x)}_{\text{Störterm}}
$$
> Bsp.:
> $y'+x^{2}\cdot y=0\rightarrow$ **homogene lineare** DGL 1. Ordnung mit **nicht konstantem** Koeffizienten
> $y'+2\cdot y=1\rightarrow$ **inhomogene lineare** DGL 1. Ordnung mit **konstantem** Koeffizienten

Eine **homogene** lineare DGL 1. Ordnung lässt sich durch Trennung der Variablen lösen. Ist der **Koeffizient $p$** *konstant,* so kann die Lösung einfacher mit mit einem **Exponentialansatz** gefunden werden. Ist der konstante Koeffizient $p$ positiv, so klingt die Lösung exponentiell ab, sie ist "flüchtig". 

### Lösung der *homogenen*  DGL 1. Ordnung mit Exponentialansatz
$$
\begin{align*}
	y'+p\cdot y &= 0\\
	\frac{dy}{dx}+p\cdot y&= 0
		&&\Big |-p\cdot y
		\Big |:y
		\Big |\cdot dx\\
	\frac{1}{y}dy &= -p\cdot dx
		&&\Big |\int\\
	\int\frac{1}{y}dy &= -p\cdot \int 1\cdot dx\\
	\ln(y)+c_{1} &= -p\cdot x+c_{2}
		&&\Big |e\uparrow\\
\end{align*}
$$
<br>

$$
\underline{\underline{
	y(x)=c\cdot e^{-p\cdot x}
}}
$$
Grundform des Exponentialansatzes mit nicht-konstantem Faktor p(x):
$$
\begin{align*}
	y(x)=c\cdot e^{-\int p(x)d(x)}
\end{align*}
$$
> Bsp.: Kondensator entladen
> ![[c_disch.png|200]]
### Lösung der *inhomogenen*  DGL 1. Ordnung
Die allgemeine Lösung $y$ einer inhomogenen linearen DGL 1. Ordnung ([[{MOC} DGL|oder auch einer höheren Ordnung]]) ist als Summe der allgemeinen Lösung $y_{h}$ der **dazugehörigen homogenen DGL** und einer *beliebigen* **partikulären Lösung $y_{p}$** der **inhomogenen DGL **darstellbar:
$$
\begin{align*}
	y = y_{h} + y_{p}
\end{align*}
$$

Eine partikuläre Lösung $y_{p}$ der inhomogenen lineare DGL a´kann, wenn der Koeffizien $p$ konstant ist, durch einen Lösungsansatz entsprechend dem Störterm $s(x)$ gesucht werden.
Ist der Koeffizient nicht 

## Tags
[[Konstanten Verzeichnis#Eulersche Zahl|Eulersche Zahl]]