---
tags: 
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
> - Man ist nicht auf [Induktivitäten](../Elektrotechnik/Induktivitäten.md) angewiesen
>     - Bei niedrigen Frequenzen sind große Induktivitäten nötig.
>     - umständlich und schlechte elektrische Eigenschaften
> - Hohe Güte, da keine Induktivitäten verwendet werden

> [!info]- Übergangsbereiche von Filtern
> 
> deale Tiefpässe (sog. brick-wall filter) existieren nicht. Daher können reale Filter einen idealen Filter nur approximieren. In der Praxis werden die Filtereigenschaften in sog. Durchlass-, Übergangs- und Sperrbereichen definiert und in einem Toleranzschema zusammengefasst. Der Verlauf des zu designenden Filters sollte dann innerhalb der definierten Grenzen liegen.
> 
> ![](assets/Pasted%20image%2020241212004843.png)

## Filter Charakteristika

1. **Filter mit kritischer Dämpfung**
    - Durch rückwirkungsfreie kaskadierung von Filtern 1. Ordnung erreicht.
    - Abnahme mit $n \cdot 20 \mathrm{~dB} /$ Dekade (mit $n$ der Ordnungszahl) nach der Grenzfrequenz.
2. **[[Bessel-Filter]]**
3. **[[Butterworth-Filter]]**
4. **[Tscheybyscheff Typ 1](Tscheybyscheff-Filter.md#Typ%201) Filter**
5. **[Tscheybyscheff Typ 2](Tscheybyscheff-Filter.md#Typ%202) Filter**
6. **[[Cauer]](Elliptischer)-Filter**

| ![](assets/Pasted%20image%2020241212005303.png) |
|:-----------------------------------------------:|
|    Tiefpässe 4. Ordnung verschiedener Arten     |

## Übertragungsfunktion

Tiefpässe 1. Ordnung besitzen eine allgemeine Übertragungsfunktion der Form
$$
A(j \omega)=\frac{\underline{U}_A}{\underline{U}_E}=\frac{V_0}{1+\frac{j \omega}{\omega_0}}
$$
und Tiefpässe 2. Ordnung
$$
A(j \omega)=\frac{\underline{U}_A}{\underline{U}_E}=\frac{V_0}{1+\dfrac{j \omega}{\omega_0} \cdot \dfrac{1}{Q}+\left(\dfrac{j \omega}{\omega_0}\right)^2}
$$

> [!info] Filter höherer Ordnung können einfach durch Kaskadierung einzelner Filterstufen erreicht werden.
> - Die gesamte Ordnung ergibt sich dann aus der Summe der Ordnungen der einzelnen Stufen;
> - die Frequenzgänge der einzelnen Filterstufen multiplizieren sich.


> [!warning] Das bedeutet jedoch nicht, dass z. B. aus der Kaskadierung von zwei Butterworth-Tiefpässen 2. Ordnung ein Butterworth-Tiefpass 4. Ordnung entsteht.
>- Das kaskadierte Gesamtfilter hat eine andere Grenzfrequenz als die Teilfilter und evtl. auch eine andere Filtercharakteristik.
> - Deshalb sind die einzelnen Teilfilter stets so zu dimensionieren, dass gesamt die gewünschte Filtercharakteristik erreicht wird.

## Schaltungsentwicklung

> [!info] Aktive Filter 1. Ordnung
> Basieren auf einem Passiven RC-Glied mit nachgeschaltenem Verstärker/Impedanzwandler
>
> - Nicht invertierender Tiefpass
> - Invertierender Tiefpass

> [!info] Aktive Filter 2. Ordnung
> - Sallen-Key Topologie: Einfache Gegenkopplung
> - Multiple-Feedback Topologie: Mehrere Gegenkopplungen


> [!info] Aktive Filter 