---
tags: 
aliases: 
keywords: 
subject:
  - Einf. ET
  - "335.005"
  - VL
semester:
  - WS23
  - B1
created: 12th January 2024
professor:
---
 

# Wechselstromtechnik

## Vorraussetzung

Quasistationäre Betrachtung:
- Netzwerk ist linear
- Argument der Winkelfunktionen ist konstant
- Wir betrachten den Eingeschwungenen (stationären) zustand
  - Größen dürfen sich nur entsprechend langsam verändern
- Ausbreitungsgeschwindigkeit von Wellen wird vernachlässigt
- Das gesamte Netzwerk wird mit der selben Kreisfrequenz betrieben

### Linearität

![[../assets/Excalidraw/Wechselstromtechnik 2024-03-19 01.08.27.excalidraw]]

### Zeiger

Sinusförmige Zeitfunktionen werden zu komplexen Zeigern
- Erleichtern das Rechnen

$u(t) = \hat{u}\cos(\omega t+\varphi_{u})$ wird zu $u(t) = u_{eff}\cdot e^{ j(\omega t+ \varphi) }$

realer Anteil ist nur der Cosinus: Eulersche Formel

$u(t) = u\cdot(\cos(\omega t+ \varphi) + \underbrace{ j\sin(\omega t+ \varphi) }_{ \text{wird eingeführt} }) = u\cdot e^{ j(\omega t + \varphi)}$

#### Rechnen ohne Zeiger

Widerstand $R$

$$
\begin{aligned}
u(t) & =\hat{u} \cos \left(\omega t+\varphi_u\right) \\
i(t) & =\hat{i} \cos \left(\omega t+\varphi_i\right) \\
\hat{u} & =R \hat{i} \quad \text { und } \quad \varphi_u=\varphi_i
\end{aligned}
$$


Kondensator $C$

$$
\begin{align}
i(t) &= C \frac{du(t)}{dt}\\
u(t) &= \frac{1}{C} \int i(t) \, dt
\end{align}
$$

## Parallelschaltung zu Serienschaltung

Ersatzbild ist nur für *eine* Frequenz gültig

## Serienschaltung zu Parallelschaltung