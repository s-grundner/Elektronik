---
tags: 
aliases:
  - Abkühlung
subject:
  - physik
source:
  - Rudolf Frauenschuh
created: 29th March 2022
---

# Newtonsches Abkühlungsgesetz

## Beschreibung

Das Newtonsche Abkühlungsgesetz besagt, dass die Temperaturänderung eines betrachteten Objekt proportional zur Temperaturdifferenz der Umgebungstemperatur und der [Temperatur](Temperatur%20und%20Teilchenmodell.md) des Objekts ist.  
Es gilt daher:

$$
\begin{align*}
	\frac{dT}{dt} \propto (T_{umgebung}-T(t)) \rightarrow\frac{dT}{dt}=k\cdot(T(t)-T_{umgebung})\\
\end{align*}
$$

Der Temperaturkoeffizient $k$ in $s^{-1}$ wird bei der Abkühlung des Objektes negativ, sonst positiv.

## Herleitung des Temperaturverlaufs $T(t)$

Die [lineare DGL 1. Ordnung](../Mathematik/mathe%20(4)/lineare%20DGL%201.%20Ordnung.md) löst sich wiefolgt:

$$
\begin{align*}
	\frac{dT}{dt} &= k\cdot(T(t)-T_{umgebung})\\
	\frac{dT}{dt}-k\cdot T(t) &= -k\cdot T_{umbegung}
\end{align*}
$$

Der homogene Teil wird mittels dem [Exponentialansatz](../Mathematik/mathe%20(4)/lineare%20DGL%201.%20Ordnung.md) gelöst:

$$
\begin{align*}
	T_{h}(t) = C\cdot e^{k\cdot t}
\end{align*}
$$

Der Lösung der inhomogenen DGL wird anhand des [](../Mathematik/mathe%20(4)/lineare%20DGL%201.%20Ordnung.md#Lösung%20der%20inhomogenen%20DGL%201%20Ordnung|Störterms) $-k\cdot T_{umgebung}$ ermittelt:

# Tags