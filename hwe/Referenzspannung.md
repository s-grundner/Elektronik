---
tags: []
aliases: ["Band-Gap Referenz", "bandgap reference"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 6th April 2022
---

# Referenzspannung

## Erzeugung vom Referenzspannungen (Band Gap Reference)

Man nutzt die **Bandabstand-Spannung** eines [Halbleiter](Halbleiter/Halbleiter.md) Bauelements zur Erzeugung einer Hochgenauen Referenzspannung $~1{,}2V$

### Grundlagen

1. [Bandabstand](https://de.wikipedia.org/wiki/B%C3%A4ndermodell)  
[Halbleitermaterialien](Halbleiter/Halbleiter.md) weisen einen Abstand in Elektronen Volt $eV$ zwischen Valenzband und Leitungsband auf.  
$U_{g}= \frac{W_{g}}{e}$  
wobei $e$ die [](../physik/Konstanten%20Verzeichnis.md#Elementar%20Ladung.md|Elementar%20Ladung) ist.

![Baendermodell](assets/Baendermodell.png)

1. [Shockley Gleichung](../physik/Shockley%20Gleichung.md)  
$I_{c}= I_{s}\cdot(e^{\frac{U_{BE}}{\eta\cdot U_{T}}}-1)$  
Näherung:  
$I_{c}=I_{s}\cdot e^{\frac{U_{BE}}{\eta \cdot U_{T}}}$  
$U_{BE}= U_{T}\cdot \ln(I_{c}/I_{s})$

| Formelzeichen | Bezeichnung                                    | Formel                                                                  |
| ------------- | ---------------------------------------------- | ----------------------------------------------------------------------- |
| $\eta$        | [Transistorgeometrie](Halbleiter/{MOC}%20Transistor.md) $(\eta=1)$ |                                                                         | 
| $U_{T}$       | Temperaturspannung                             | $U_{T}=\frac{k\cdot T}{e}\simeq 25mV$ <br> $k\cdots$ [Boltzmannkonstante](Konstanten%20Verzeichnis.md) |
| $I_{s}$       | Sättigungssperrstrom                           |                                                                         |

1. Temperaturabhängigkeit der Basis-Emitter-Spannung  
$U_{BE}=U_{g}+D_{T}\cdot T +\underbrace{[(\eta -1)U_{T}\cdot(1-\ln(\frac{T}{T_{0}}))]}_{\text{vernachlässigbar}}$

| Formelzeichen | Bezeichnung          | Formel          |
| ------------- | -------------------- | --------------- |
| $U_{g}$       | Bandgap              |                 |
| $D_{T}$       | Temperaturdurchgriff | $D_{T}=-2mV/°K$ |
| $\eta -1$     | Materialkonstante    |                 |

$U_{BE}$ wird mit steigender Erwärmung des Transistors kleiner, da $D_{T}$ *negativ* ist.

### Schaltung der [Bandabstandsreferenz](https://de.wikipedia.org/wiki/Bandabstandsreferenz)

![400](assets/Bandabstandsreferenz.png)

#### $U_{PTAT}$ Proportional to absolute temperature

Mit den folgenden Schritten lässt sicht herleiten, dass $U_{ref}$ konstant bleibt.  
Mit der folgenden [](Kirchhoffsche%20Regeln#Maschen%20Regel%7CMasche) lässt sich auf die Spannung über die Kollektorwiderstände ermitteln:

| Schritt | Herleitung                                                                                                                                                                                                                                                                                                                                        | Beschreibung                                                                                                                                                                                                                                                                                                                                                                                                                   |
|:-------:| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|    1    | $$\begin{align*}I_{C1}\cdot R_{C1} &= I_{C2}\cdot R_{C2}\\\rightarrow \frac{I_{C1}}{I_{C2}} &= \frac{R_{C1}}{R_{C2}}\\I_{C2} &= \left.I_{C1}\cdot \frac{R_{C1}}{R_{C2}}\right\|_{I_{C}\approx I_{E}}\end{align*}$$                                                                                                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                |
|    2    | $$\begin{align*}U_{BE2} &= U_{BE1}+\Delta U_{BE}\\\Delta U_{BE}&= U_{BE2}-U_{BE1}\\&= U_{T}\cdot(\ln(\frac{I_{C2}}{I_{S}})-\ln(\frac{I_{C1}}{I_{S}}))\\&= U_{T}\cdot(\ln(\frac{I_{C2}}{I_{S}}\cdot\frac{I_{S}}{I_{C1}}))\\&= \underbrace{U_{T}}_{\frac{k\cdot T}{e}}\cdot\ln(\frac{I_{C2}}{I_{C1}})\\\frac{k\cdot T}{e}&\propto T\end{align*}$$   | Idee:<br>Die Spannung $U_{BE}$ hat mit $-2 \frac{mV}{K}$ einen Negativen Temperaturkoeffizienten $\Delta U_{BE}$<br>und damit auch die Spannung $U_{PTAT}$<br>(über $I_{C1}$, $I_{C2}$), besitzen einen **positiven [Temperatur](Temperatur%20und%20Teilchenmodell.md)koeffizienten**.<br>Durch **Summation der Spannungen** ($U_{ref}=\Delta U_{BE}+U_{PTAT}$) ergibt sich bei entsprechender Dimensionierung<br>eine **Kompensation** der [Temperatur](Temperatur%20und%20Teilchenmodell.md)koeffizienten. |
|    3    | $$\begin{align*}U_{R2} &= R_{C}(I_{E1}+ I_{E2})\\&= \frac{R_{2}}{R_{1}}\cdot\Delta U_{BE} + \frac{R_{C1}}{R_{C2}} \cdot \frac{R_{2}}{R_{1}}\cdot\Delta U_{BE}\\&= \frac{R_{2}}{R_{1}}\cdot\Delta U_{BE}(1+\frac{R_{C1}}{R_{C2}})\\&= U_{T}\cdot \ln(\frac{R_{C1}}{R_{C2}})\cdot \frac{R_{2}}{R_{1}}\cdot(1+\frac{R_{C1}}{R_{C2}})\\\end{align*}$$ |                                                                                                                                                                                                                                                                                                                                                                                                                                |
|    4    | $$\begin{align*}\frac{dU_{ref}}{dT} &= 0\\U_{ref}&=U_{g2}+D_{T}\cdot T + U_{Ptat}\\\rightarrow \frac{dU_{ref}}{dT} &= D_{T} + \frac{k}{e}\cdot\ln(\frac{R_{C1}}{R_{C2}})\cdot \frac{R_{2}}{R_{1}}\cdot(1+\frac{R_{C1}}{R_{C2}})\end{align*}$$                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                |


> [!INFO] Eine Günstige Annahme bei der Dimensionierung: $R_{C1} = 10\cdot R_{C2}$

Es erfolgt eine Dimensionierung der Widerstände, sodass:
$$
\begin{align*}
	D_{T}= \frac{-k}{e}\cdot \frac{R_{2}}{R_{1}}\cdot\left(\frac{1+R_{C1}}{R_{C2}}\right)\cdot\ln\left(\frac{R_{C1}}{R_{C2}}\right) = -2 \frac{mV}{K}
\end{align*}
$$
mit:
$$
\begin{align*}
\frac{k}{e} = \frac{U_{T}}{T} = \frac{25mV}{300K}
\end{align*}
$$

Dimensionierung

$$
\begin{align*}
D_{T} &= -2 \frac{mV}{K} = \frac{-25mV}{300K}\cdot \frac{R_{2}}{R_{1}}\underbrace{\left(10+1\right)\ln(10)}_{11\cdot2,3 = 25,33}\\
D_{T} &= \frac{-25mV}{300K}\cdot 25,33\cdot \frac{R_{2}}{R_{1}}\\
-2,11 \frac{mV}{K}\cdot\frac{R_{1}}{R_{2}} &= -2 \frac{mV}{K}\\
R_{1}&\approx R_{2} 
\end{align*}
$$

---

# Tags

[Chemische Bindungen](../chemie/Chemische%20Bindungen.md)
