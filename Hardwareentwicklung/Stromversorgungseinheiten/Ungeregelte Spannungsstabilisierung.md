# Ungeregelte Spannungsstabilisierung

## Stabilisierungsschaltung Mit Einer Zener-Diode

Mittels einer [Zener-Diode](../Halbleiter/Zener-Diode.md) kann eine Ausgansspannung in einem wieten Bereich konstant gehalten werden.

| Kennwerte                                                                                                           | Schaltung                    |
| ------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| $I_{V}\dots$ Gesamtstrom <br>$I_{L}\dots$ Laststrom<br>$I_{Z}\dots$ Z-Dioden [Strom](../../Elektrotechnik/elektrischer%20Strom.md)<br>$U_{Z}\dots$ Z-Dioden Spannnung<br>$R_{V}\dots$Vorlastwiderstand<br>$R_{L}\dots$ Lastwiderstand|![400](../assets/Z-diode-regler.png) |

### Kennlinie

| Kennwerte                                                                                                                                                                                      | Kennlinie                   |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| $U_{e,min}\dots$<br>$U_{e,max}\dots$<br>$I_{Z,min}\dots$<br>$I_{Z,max}\dots$<br>$R_{V,min}\dots$<br>$R_{V,max}\dots$<br>$P_{tot}\dots$<br><br>$U_{F}\dots$<br>$U_{R}\dots$<br>$I_{F}\dots$<br>$I_{B}\dots$ | ![600](../assets/z-d-kennlinie.png) |

### Dimensionierung

$$
\begin{align*}
	U_{e} &\rightarrow \text{konstant}\\
\Delta U_{Z}\approx 0 \rightarrow U_{Z} &\rightarrow \text{konstant}\\\\

R_{V,min} = \frac{U_{e}-U_{z}}{I_{Z,max}} &\rightarrow I_{Z} = \frac{U_{e}-U_{z}}{R_V}\\
I_{Z} &= I_{Z,min}+I_{L,max}\\
&\\
P_{V} &=\left.\frac{U_{RV}^{2}}{R_{V}}\right|_{R_{L}=0}
\end{align*}
$$
Möchte man mit möglichst *geringem Stromverbrauch* auskommen, so dimensioniert man nach *$I_{Z,min}$, $I_{L,max}$ und $U_{e,min}$*.

| $R_{V,min}$                                                  | $R_{V,max}$ |
| ------------------------------------------------------------ | ----------- |
| $$R_{V,min} = \frac{U_{e,max}-U_{Z}}{I_{Z,max}+ I_{L,min}}$$ |  $$R_{V,max} = \frac{U_{e,min}-U_{Z}}{I_{Z,min}+ I_{L,max}}$$           |

Für eine *optimale Stabilisierung* ist folgendes zu beachten:
- $U_{e}\approx 2\cdot U_{Z}$
- Der *Arbeitspunkt* liegt in der *Mitte* der Kennlinie, bei *$\frac{I_{Z}}{2}$* (Gleiche Aussteuerung nach oben und unten möglich)
- *$I_{Z,min}$* darf *nicht unterschritten* werden. (Da sonst die Spannung einbricht)
- *$R_{V}$* begrenzt *$I_{Z}$* bei *$U_{e,max}$* auf *$I_{Z,max}$* 

> [!SUMMARY] Absoluter Stabilisierungsfaktor  
> $$S=\dfrac{\Delta U_{e}}{\Delta U_{a}}= \dfrac{\Delta U_{e}}{\Delta U_{Z}}$$ 

> [!WARNING] Nachteil Der Schaltung  
> Der **Regelbereich** für Laststrom ist **stark eingeschränkt**.  
> Es gilt $\Delta I_{L}=\Delta I_{Z}$  
> Eine [Längstransistorschaltung](Längsregler.md) behebt diesen Nachteil