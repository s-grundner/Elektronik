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
  - VL
  - Einführung Elektrotechnik
  - Elektrotechnik
  - Grundlagen der Hochfrequenztechnik
semester: SS24
created: 7. April 2024
professor:
  - Andreas Springer
  - Bernhard Jakoby
  - Reinhard Feger
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

![invert_dark|400](../_assets/Wechselstromtechnik%202025-01-15%2020.22.21.excalidraw.svg)

%% [Edit in Excalidraw](Wechselstromtechnik 2025-01-15 20.22.21.excalidraw.md) %%


Man nutzt *rotierende* [komplexe Zeiger](../Mathematik/Analysis/Eulersche%20Formel.md) zur Darstellungen von Wechselspannungen und -strömen: 

$$\underline{ u }(t) = \hat{u}\cdot\left(\cos(\omega t+ \varphi) + \underbrace{\color{orange} j\sin(\omega t+ \varphi) }_{ \text{wird eingeführt} }\right) = \hat{u}\cdot e^{ j(\omega t + \varphi)}$$

> [!warning] Physikalisch vorhanden und Messbar ist nur der Realteil
> 
> $$
> u(t) = \mathrm{Re}(\underline{u}(t)) = \hat{u}\cos(\omega t+\varphi_{u})
> $$

## Notation

- $\underline{u}(t)$ ... Gesamtes Signal
- $\hat{u}$ … Reeller Spitzenwert
- $\underline{\hat{u}}$ … **Phasor**: Komplexe Amplitude (auch $\hat{u}\angle\varphi$)

$$
\underline{u}(t)=\hat{u}\cdot e^{ j(\omega t + \varphi_{u}) }
= {\color{orange}\underbrace{ \hat{u}\cdot e^{ j(\varphi_{u}) } }_{ \underline{\hat{u}} }}\cdot e^{ j(\omega t) }
= {\color{orange}\underline{\hat{u}}\cdot e^{ j(\omega t) }}
$$

Für Berechnungen verwendet man dann nur $\underline{\hat{u}}$, da der $e^{ j\omega t}$ Term durch die linearität erhalten bleibt.

### Vereinfachung von Berechungen

> [!exmple] Geziegt ist hier, wie eine berechnung mit Phasorschreibweise die klassische Zeitbereichsrechnung vereinfacht. #incomplete 
> 
> -  [Widerstand](Widerstand.md) $R$
> 
> $$
> \begin{aligned}
> u(t) & =\hat{u} \cos \left(\omega t+\varphi_u\right) \\
> i(t) & =\hat{i} \cos \left(\omega t+\varphi_i\right) \\
> \hat{u} & =R \hat{i} \quad \text { und } \quad \varphi_u=\varphi_i
> \end{aligned}
> $$
> 
> - [Kondensator](Kapazität.md) $C$
> 
> $$
> \begin{align}
> i(t) &= C \frac{du(t)}{dt}\\
> u(t) &= \frac{1}{C} \int i(t) \, dt
> \end{align}
> $$


### Effektivwert Zeiger

> [!info] Notation mit **Effektivwertzeiger**
> 
> In der Energietechnik ist die Verwendung des Effektivwertzeigers üblich.
> Anstatt dem Spitzenwert $\hat{u}$ wird der Effektivwert als Länge der Zeiger verwendet.
> 

$$
\underline{U}=\frac{\underline{\hat{u}}}{\sqrt{ 2 }}\qquad \underline{I}=\frac{\underline{\hat{\imath}}}{\sqrt{ 2 }}
$$

Wichtig ist es, keine konventionen zu Vermischen.

> [!success] Diese Konvention hat keinen Einfluss auf die Berechnung des Netzwerks, hat aber einen Vorteil:
> 
> Wenn man eine Gleichspannung äquivalent zum Effektivwert an einen Widerstand anhängt, ist die Leistung des Gleichstromnetzwerks genauso groß wie die Mittlere Leistung des Wechselstromnetzwerks. 
> - Faktor $\sqrt{ 2 }$ kommt vom Quadratischen Mittelwert

## Inversion von Zeigern

Nützlich für die grafische Netzwerkanalyse. #incomplete 

## Felder und Elektromagnetismus

#Elektrodynamik

Die die vereinfachung der Phasorschreibweise kann auch auf elektrische und magnetische [Vektorfelder](../Mathematik/Analysis/Vektoranalysis/index.md) angewandt werden und ist besonders hilfreich bei der Berechnung von Feldern in der HF-technik. Vorrausgesetzt sei wieder:

- Sinusförmige Wellenausbreitung
- Konstante frequenz oder zumindest ausreichend Schmalbandig.
- Eingeschwungener Zustand der Welle

> [!exmple] Ein sinusiodes elektrisches Feld, welches in die $\mathbf{e}_{x} = (1,0,0)^T$ richtung polarisiert ist lässt sich in Phasor schreibweise wiefolgt anschreiben:

- Das sinusförmige Wechselfeld in abhängigkeit der Zeit:

$$
\mathbf{E}(x,y,z,{\color{orange}t}) = \mathbf{e}_{x} A(x,y,z) \cos(\omega {\color{orange}t} + \phi)
$$

- der **Phasor** des elektrischen Feldes als implizit rotierender Zeiger. Beachte dass hier die Zeitabhängigkeit wegfällt.

$$
\underline{\mathbf{E}}(x,y,z) = \mathbf{e}_{x}A(x,y,z)e^{ j\phi }
$$

Möchte man die zeitbereichsform aus dem Phasor berechnen, wird der implizit angenommene $e^{ j\omega t }$ Term wieder hinzumultipliziert und der Realteil gebildet, um den Kosinus (siehe [Eulersche Formel](../Mathematik/Analysis/Eulersche%20Formel.md)) wieder zu erhalten.

$$
\mathbf{E}(x,y,z,t) = \mathrm{Re}\{\mathbf{\underline{E}}(x,y,z)e^{ j\omega t }\}
$$

### Phasorschreibweise der Maxwellgleichungen

> [!question] [Maxwell](Maxwell.md)

Auch die Maxwellgleichungen lassen sich in der Phasorschreibweise notieren. Hier werden alle Zeitableitungen zu einer multiplikation mit $j\omega$. Das lässt sich durch eine überlegung mittels der [Fouriertransformation](../Systemtheorie/Fouriertransformation.md) bestätigen.

> [!satz] **S)** MWG in Phasorschreibweise
> 
> | | |
> | - | - |
> | [1. MWG - Durchflutungssatz](Maxwell.md#1.%20MWG%20-%20Durchflutungssatz) | $\nabla \times \mathbf{\underline{H}} = j\omega \mathbf{\underline{D}}+\mathbf{\underline{J}}$ |
> | [2. MWG - Induktionsgesetz](Maxwell.md#2.%20MWG%20-%20Induktionsgesetz) | $\nabla \times \mathbf{\underline{E}} = -j\omega\mathbf{\underline{B}}-\mathbf{\underline{M}}$ |
> | [3. MWG - Gaußsches Gesetz](Maxwell.md#3.%20MWG%20-%20Gaußsches%20Gesetz) | $\nabla \cdot \mathbf{\underline{D}} = \rho$ |
> | [3. MWG - Quellenfreiheit des B-Feldes](Maxwell.md#4.%20MWG%20-%20Quellenfreiheit%20des%20B-Feldes) | $\nabla \cdot \mathbf{\underline{B}} = 0$ |
> 

## Referenzen

http://www.gdanielak.de/Tutorium/ET_I/5_Zeigerbilder/Zeigerdiagramme.pdf