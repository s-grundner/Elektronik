---
tags: []
aliases: []
created: 30th August 2023
---

# Exponentialansatz

Mit dem Exponentialansatz lassen sich lineare [DGL](../{MOC}%20DGL.md) berechnen.

Da die $e$-Funktion abgeleitet wieder sich selbst ergibt, ist es möglich für die Ableitung in einer Differentialgleichung dieses Funktion einzusetzen und lediglich die Faktoren zu bestimmen.  

> [!hint] Grundform des Exponentialansatzes mit nicht-konstantem Faktor $p(x)$: (DGL 1. Ordnung)
>
> $$y(x)=c\cdot e^{-\int p(x)dx}$$

$$
\begin{align*}
	y'+p\cdot y &= 0\\
	\frac{dy}{dx}+p\cdot y&= 0 &&\Big |-p\cdot y\Big |: \Big |\cdot dx\\
	\frac{1}{y}dy &= -p\cdot dx &&\Big |\int\\
	\int\frac{1}{y}dy &= -p\cdot \int 1\cdot dx\\
	\ln(y)+c_{1} &= -p\cdot x+c_{2}&&\Big |e\uparrow\\
\end{align*}
$$

$$
\underline{\underline{
	y(x)=c\cdot e^{-p\cdot x}
}}
$$