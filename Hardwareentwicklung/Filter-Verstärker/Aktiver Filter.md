---
tags:
  - Baugruppe/OPV
  - Baugruppe/Filter
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 12. Dezember 2024
professor:
---
 

# Aktiver Filter

> Fortsetzung von: [[Filter]]

Aktive Filter sind ausgezeichnet durch ein verstärkendes Element (z.B. [OPV](Operations-Verstärker.md)) und haben die eigenschaft den eingang nicht zu Belasten. D.h. eine hochohmige Eingangsimpedanz und eine niederohmige Ausgangsimpedanz. (Impedanzwandlung)

> [!success] Vorteil gegenüber [Passiven Filtern](Passiver%20Filter.md):
> - Neben Filterfunktion kann auch eine Verstärkung im Durchlassbereich eingestellt werden 
> - Beliebeige Filtercharakteristik kann realisiert werden
> - Kaskadierung mehrerer Filter rückwirkungsfrei möglich
> - Man ist nicht auf [Induktivität](../../Elektrotechnik/Induktivität.md) angewiesen
>     - Bei niedrigen Frequenzen sind große Induktivitäten nötig.
>     - umständlich und schlechte elektrische Eigenschaften
> - Hohe Güte, da keine Induktivitäten verwendet werden

> [!info]- Übergangsbereiche von Filtern
> 
> deale Tiefpässe (sog. brick-wall filter) existieren nicht. Daher können reale Filter einen idealen Filter nur approximieren. In der Praxis werden die Filtereigenschaften in sog. Durchlass-, Übergangsund Sperrbereichen definiert und in einem Toleranzschema zusammengefasst. Der Verlauf des zu designenden Filters sollte dann innerhalb der definierten Grenzen liegen.
> 
> ![](assets/Pasted%20image%2020241212004843.png)

## Filter Charakteristiken

1. **Filter mit kritischer Dämpfung**
    - Durch rückwirkungsfreie kaskadierung von Filtern 1. Ordnung erreicht.
    - Abnahme mit $n \cdot 20 \mathrm{~dB} /$ Dekade (mit $n$ der Ordnungszahl) nach der Grenzfrequenz.
2. **[[Bessel-Filter]]**
3. **[Butterworth](Butterworth%20Filter%20Charakteristik.md)**
4. **[Tscheybyscheff Typ 1](Tscheybyscheff%20Filter%20Charakteristik.md#Typ%201) Filter**
5. **[Tscheybyscheff Typ 2](Tscheybyscheff%20Filter%20Charakteristik.md#Typ%202) Filter**
6. **[[Cauer]](Elliptischer)-Filter**

| ![](assets/Pasted%20image%2020241212005303.png) |
|:-----------------------------------------------:|
|    Tiefpässe 4. Ordnung verschiedener Arten     |

## Übertragungsfunktion

> [!info] Filter höherer Ordnung können einfach durch Kaskadierung einzelner Filterstufen erreicht werden.
> - Die gesamte Ordnung ergibt sich dann aus der Summe der Ordnungen der einzelnen Stufen;
> - die Frequenzgänge der einzelnen Filterstufen multiplizieren sich.


> [!warning] Das bedeutet jedoch nicht, dass z. B. aus der Kaskadierung von zwei Butterworth-Tiefpässen 2. Ordnung ein Butterworth-Tiefpass 4. Ordnung entsteht.
>- Das kaskadierte Gesamtfilter hat eine andere Grenzfrequenz als die Teilfilter und evtl. auch eine andere Filtercharakteristik.
> - Deshalb sind die einzelnen Teilfilter stets so zu dimensionieren, dass gesamt die gewünschte Filtercharakteristik erreicht wird.

### Allgemeine Tiefpässe

**Tiefpässe 1. Ordnung** besitzen eine allgemeine Übertragungsfunktion der Form
$$
A(j \omega)=\frac{\underline{U}_A}{\underline{U}_E}=\frac{V_0}{1+\dfrac{j \omega}{\omega_0}}
$$

**Tiefpässe 2. Ordnung** besitzen eine allgemeine Übertragungsfunktion der Form

$$
A(j \omega)=\frac{\underline{U}_A}{\underline{U}_E}=\frac{V_0}{1+\dfrac{j \omega}{\omega_0} \cdot \dfrac{1}{Q}+\left(\dfrac{j \omega}{\omega_0}\right)^2}
$$

### Allgemeine Hochpässe

**Hochpässe 1. Ordnung** besitzen eine allgemeine Übertragungsfunktion der Form:

$$
A(j \omega)=\dfrac{V_0}{1+\dfrac{\omega_0}{j \omega}}
$$

**Hochpässe 2. Ordnung** besitzen eine allgemeine Übertragungsfunktion der Form:

$$
A(j \omega)=\frac{V_0}{1+\dfrac{\omega_0}{j \omega} \cdot \dfrac{1}{Q}+\left(\dfrac{\omega_0}{j \omega}\right)^2}
$$

### Allgemeine Bandpässe

**Bandpässe 2. Ordnung** besitzen eine allgemeine Übertragungsfunktion der Form:

$$
A(j \omega)=\dfrac{V_0}{\dfrac{1}{Q}+j\left(\dfrac{\omega}{\omega_0}-\dfrac{\omega_0}{\omega}\right)}=\dfrac{V_0 \cdot \dfrac{j \omega}{\omega_0}}{1+\dfrac{j \omega}{\omega_0} \cdot \dfrac{1}{Q}+\left(\dfrac{j \omega}{\omega_0}\right)^2} 
$$

## Schaltungsentwürfe - Topologien

> [!info] [Einfache Aktive Filter 1. Ordnung](Einfache%20Aktive%20Filter%201.%20Ordnung.md)
> Basieren auf einem Passiven RC-Glied mit nachgeschaltenem Verstärker/Impedanzwandler
>
> - **(TP)** Nicht invertierender Tiefpass
> - **(TP)** Invertierender Tiefpass 
> - **(HP)** Nicht invertierender Hochpass
> - **(HP)** Invertierender Hochpass


> [!info] Aktive Filter 2. Ordnung
> - **(TP)** [Sallen-Key Topologie](Sallen-Key%20Filter%20Topologie.md): Filter mit Einfach Gegenkopplung
> - **(TP)** [[Multiple-Feedback Filter Topologie]] : Filter mit Mehrfach Gegenkopplung
> - **(TP+BP)**: [[Biquad Filter Topologie]] nach Tow-Thomas
> - **(TP+BP+HP)**: [[State-Variable Topologie]] nach KHN (Kerwin-Huelsman-Newcomb)
> - Andere [Integratorfilter](OPV-Integrator.md#Integratorfilter)

