---
tags: 
aliases:
  - komplexer Zeiger
  - Zeigerdiagramme
keywords: 
subject:
  - VL
  - Elektrotechnik
semester: SS24
created: 7. April 2024
professor: 
cited:
---
 

# Zeigerdarstellung

> [!info] *rotierende* komplexe Zeiger dienen zur Darstellung von Wechselspannungen und -strömen.
> Voraussetzungen:
> - [Netzwerk](Schaltungsanalyse.md) ist linear
> - keine Einschalt-/Umschaltvorgänge
> - Kreisfrequenz aller Ströme und Spannungen ist konstant

$$u(t) = \hat{u}\cdot(\cos(\omega t+ \varphi) + \underbrace{ j\sin(\omega t+ \varphi) }_{ \text{wird eingeführt} }) = \hat{u}a\cdot e^{ j(\omega t + \varphi)}$$

… Zurückzuführen auf die [Eulersche Formel](../Mathematik/mathe%20(3)/Eulersche%20Formel.md)

> [!warning] Physikalisch vorhanden und Messbar ist nur der Realteil
> $$
> u(t) = \mathrm{Re}(\underline{u}(t)) = \hat{u}\cos(\omega t+\varphi_{u})
> $$

> [!success] erleichtert das Rechnen

## Notation

$\underline{u}$ … komplexe Amplitude
$\hat{u}$ … Spitzenwert

$$
\begin{align}
\underline{u}(t) &= \hat{u}\cdot e^{ j(\omega t + \varphi_{u}) } \\
&= \underbrace{ \hat{u}\cdot e^{ j(\varphi_{u}) } }_{ \underline{u} }\cdot e^{ j(\omega t) } \\
&= \underline{u}\cdot e^{ j(\omega t) }
\end{align}
$$

### Alternative mit Effektivwertzeiger

Statt dem Spitzenwert wird der Effektivwert verwendet

Diese Konvention kommt aus der Energietechnik
- Die Länge der Zeiger ist um den Faktor $\sqrt{ 2 }$ kürzer

$$
\underline{U}=\frac{\underline{\hat{u}}}{\sqrt{2}} \quad \underline{I}=\frac{\hat{\hat{i}}}{\sqrt{2}}
$$

> [!info] [Quadratischer Mittelwert](Quadratischer%20Mittelwert.md)
> Physikalische Interpretation des Quadratischen Mittelwertes in der Elektrotechnik:
> - Periodische Spannung an einem [Widerstand](Widerstand.md) -> ein Strom fließ
> - Produkt aus Strom und Spannung ist Leistung
> 
> Wenn man eine Gleichspannung äquivalent zum Effektivwert an einen Widerstand anhängt Ist die Leistung des Gleichstromnetzwerks genauso groß wie die Mittlere Leistung des Wechselstromnetzwerks. 

## Inversion von Zeigern

Nützlich für die grafische Netzwerkanaly

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