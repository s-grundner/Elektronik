---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einf. ET
semester:
  - WS23
  - B1
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

> [!success] erleichtert das Rechnen

Sinusförmige Zeit Funktionen werden zu komplexen Zeigern
- Erleichtern das Rechnen

$u(t) = \hat{u}\cos(\omega t+\varphi_{u})$ wird zu $u(t) = u_{eff}\cdot e^{ j(\omega t+ \varphi) }$

realer Anteil ist nur der Cosinus: [Eulersche Formel](../Mathematik/mathe%20(3)/Eulersche%20Formel.md)

$u(t) = u\cdot(\cos(\omega t+ \varphi) + \underbrace{ j\sin(\omega t+ \varphi) }_{ \text{wird eingeführt} }) = u\cdot e^{ j(\omega t + \varphi)}$

$$
\underline{u}(t) = \hat{u}\cdot e^{ j(\omega t+\varphi_{u}) }
$$
… Zurückzuführen auf die [Eulersche Formel](../Mathematik/mathe%20(3)/Eulersche%20Formel.md)


> [!warning] Physikalisch vorhanden und Messbar ist nur der Realteil
> $$
> u(t) = \mathrm{Re}(\underline{u}(t)) = \hat{u}\cos(\omega t+\varphi_{u})
> $$

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

# Rechnen ohne Zeiger

[Widerstand](Widerstand.md) $R$

$$
\begin{aligned}
u(t) & =\hat{u} \cos \left(\omega t+\varphi_u\right) \\
i(t) & =\hat{i} \cos \left(\omega t+\varphi_i\right) \\
\hat{u} & =R \hat{i} \quad \text { und } \quad \varphi_u=\varphi_i
\end{aligned}
$$

[Kondensator](Kapazität.md) $C$

$$
\begin{align}
i(t) &= C \frac{du(t)}{dt}\\
u(t) &= \frac{1}{C} \int i(t) \, dt
\end{align}
$$