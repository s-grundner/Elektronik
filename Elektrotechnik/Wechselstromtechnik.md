---
tags:
  - Schaltungsanalyse
aliases:
  - Wechselstrom
  - komplexer Zeiger
  - Zeigerdiagramme
  - Phasor
keywords:
subject:
  - Einführung Elektrotechnik
  - Elektrotechnik
  - VL
semester: SS24
created: 7. April 2024
professor:
  - Andreas Springer
  - Bernhard Jakoby
---
 

# Wechselstromtechnik

Wird ein [elektrisches Netzwerk](Lineare%20Elektrische%20Netzwerke.md) mit Wechselstrom betrieben, so kann die [komplexe Rechnung](../Mathematik/Analysis/Komplexe%20Zahlen.md) zur Ermittlung der Spannungen und Ströme des Netzwerks angewendet werden. Dies gilt nur unter bestimmten Vorraussetzungen. 

> [!hint] Vorraussetzungen:
> - [Netzwerk](Lineare%20Elektrische%20Netzwerke.md) ist linear
> - Es wird der Eingeschwungene (stationäre) Zustand betrachtet
>   - Argument der Winkelfunktionen ist konstant
>   - Größen dürfen sich nur entsprechend langsam verändern
> - Ausbreitungsgeschwindigkeit von Wellen wird vernachlässigt
> - Das gesamte Netzwerk wird mit der selben Kreisfrequenz betrieben

## Zeigerdarstellung

![[../_assets/Wechselstromtechnik 2025-01-15 20.22.21.excalidraw]]


Man nutzt *rotierende* [komplexe Zeiger](../Mathematik/Analysis/Eulersche%20Formel.md) zur Darstellungen von Wechselspannungen und -strömen: 

$$\underline{ u }(t) = \hat{u}\cdot\left(\cos(\omega t+ \varphi) + \underbrace{\color{orange} j\sin(\omega t+ \varphi) }_{ \text{wird eingeführt} }\right) = \hat{u}\cdot e^{ j(\omega t + \varphi)}$$

> [!warning] Physikalisch vorhanden und Messbar ist nur der Realteil
> $$u(t) = \mathrm{Re}(\underline{u}(t)) = \hat{u}\cos(\omega t+\varphi_{u})$$

## Notation

- $\underline{u}(t)$ ... Gesamtes Signal
- $\hat{u}$ … Reeller Spitzenwert
- $\underline{\hat{u}}$ … **Phasor**: Komplexe Amplitude (auch $\hat{u}\angle\varphi$)

$$
\underline{u}(t)=\hat{u}\cdot e^{ j(\omega t + \varphi_{u}) }
= {\color{orange}\underbrace{ \hat{u}\cdot e^{ j(\varphi_{u}) } }_{ \underline{\hat{u}} }}\cdot e^{ j(\omega t) }
= {\color{orange}\underline{\hat{u}}\cdot e^{ j(\omega t) }}
$$

### Effektivwert Zeiger

> [!info] Notation mit **Effektivwertzeiger**
> 
> In der Energietechnik ist die Verwendung des Effektivwertzeigers üblich.
> Anstatt dem Spitzenwert $\hat{u}$ wird der Effektivwert als Länge der Zeiger verwendet.
> 

$$
\underline{U}=\frac{\underline{\hat{u}}}{\sqrt{ 2 }}\qquad \underline{I}=\frac{\underline{\hat{\imath}}}{\sqrt{ 2 }}
$$

Wichtig ist es, keine konventionen zu Verischen.

> [!success] Diese Konvention hat keinen Einfluss auf die Berechnung des Netzwerks, hat aber einen Vorteil:
> 
> Wenn man eine Gleichspannung äquivalent zum Effektivwert an einen Widerstand anhängt Ist die Leistung des Gleichstromnetzwerks genauso groß wie die Mittlere Leistung des Wechselstromnetzwerks. 
> - Faktor $\sqrt{ 2 }$ kommt vom Quadratischen Mittelwert

## Inversion von Zeigern

Nützlich für die grafische Netzwerkanalyse

# Rechnen ohne Zeiger

## [Widerstand](Widerstand.md) $R$

$$
\begin{aligned}
u(t) & =\hat{u} \cos \left(\omega t+\varphi_u\right) \\
i(t) & =\hat{i} \cos \left(\omega t+\varphi_i\right) \\
\hat{u} & =R \hat{i} \quad \text { und } \quad \varphi_u=\varphi_i
\end{aligned}
$$

## [Kondensator](Kapazität.md) $C$

$$
\begin{align}
i(t) &= C \frac{du(t)}{dt}\\
u(t) &= \frac{1}{C} \int i(t) \, dt
\end{align}
$$


# Quellen

http://www.gdanielak.de/Tutorium/ET_I/5_Zeigerbilder/Zeigerdiagramme.pdf