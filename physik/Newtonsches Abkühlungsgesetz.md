---
tags: []
aliases: []
subject: ["physik"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 29th March 2022
last_edited: 11th April 2022
---

# Newtonsches Abkühlungsgesetz
## Beschreibung
Das Newtonsche Abkühlungsgesetz besagt, dass die Temperaturänderung eines betrachteten Objekt proportional zur Temperaturdifferenz der Umgebungstemperatur und der [[Temperatur und Teilchenmodell|Temperatur]] des Objekts ist.
Es gilt daher:
$$
\begin{align*}
	\frac{dT}{dt} \propto (T_{umgebung}-T(t)) \rightarrow\frac{dT}{dt}=k\cdot(T(t)-T_{umgebung})\\
\end{align*}
$$
Der Temperaturkoeffizient $k$ in $s^{-1}$ wird bei der Abkühlung des Objektes negativ, sonst positiv.

## Herleitung des Temperaturverlaufs $T(t)$
Die [[lineare DGL 1. Ordnung]] löst sich wiefolgt:
$$
\begin{align*}
	\frac{dT}{dt} &= k\cdot(T(t)-T_{umgebung})\\
	\frac{dT}{dt}-k\cdot T(t) &= -k\cdot T_{umbegung}
\end{align*}
$$
Der homogene Teil wird mittels dem [[lineare DGL 1. Ordnung#Lösung der homogenen DGL 1 Ordnung mit Exponentialansatz|Exponentialansatzes]] gelöst:
$$
\begin{align*}
	T_{h}(t) = C\cdot e^{k\cdot t}
\end{align*}
$$
Der Lösung der inhomogenen DGL wird anhand des [[lineare DGL 1. Ordnung#Lösung der inhomogenen DGL 1 Ordnung|Störterms]] $-k\cdot T_{umgebung}$ ermittelt:
# Tags