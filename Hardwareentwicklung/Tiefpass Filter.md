---
tags: 
aliases:
  - Tiefpass
keywords: 
subject:
  - ETT Praktikum
  - " 382.050"
semester: 1
created: 22. Januar 2024
professor:
---
 

# Tiefpass Filter

_Tiefpass:_ Durch die Anordnung des Widerstands und des Kondensators weist die Schaltung ein Tiefpassverhalten auf. Das bedeutet, dass höhere Frequenzen stärker gedämpft werden als niedrigere Frequenzen. Ausschlaggebend für den Frequenzgang ist die Topologie des Filters und der Wert der _Grenzfrequenz._

> [!INFO] _Ordnung_ eines Filters  
Die Ordnung eines Filters ist gegeben durch die Anzahl der in reihe-geschalteten Filter-Baugruppen. Da in diesem Fall nur _ein_ RC-Glied verwendet wird, spricht man von einem Filter _erster (1.)_ Ordnung.

## Bauteilwerte aus [Grenzfrequenz](../Hardwareentwicklung/Grenzfrequenz.md) ermitteln

> [!EXAMPLE] $C=1\mu F$ und $f_{g} = 1kHz$
> 
> 
> Bei der Auswahl der Bauteile sind Widerstände wesentlich flexibler, weshalb wir einen festen Wert für den Kondensator wählen. 
> 
> Mit dem gewählten [Widerstand](../Hardwareentwicklung/Ohmsches%20Gesetz.md) von $150\Omega$ (gemessen $148.5\Omega$) ergibt sich die eigentliche [Grenzfrequenz](../Hardwareentwicklung/Grenzfrequenz.md): $f_{g,ist} = \frac{1}{2\pi\cdot 150\Omega\cdot 1\mu F}=1061Hz$

## Zeitkonstante $\tau$

Mit dem Sprung an der steigenden Flanke des Rechtecks lässt sich mit der Antwort des RC-Netzwerks die Zeitkonstante $\tau$ ermitteln. Die Zeitkonstante $\tau =R\cdot C$ ist jene Zeit, nach der das Ausgangssignal $63.2\%$ des Eingangssignal beträgt. Mit dem gemessenen Wert kann man dann auf deinen genaueren Wert des Kondensators rückschließen, da Kapazitäten oft schwer zu Messen sind.

Channel 2: Eingangsspannung (Rechteck 1kHz, 1V)  
Channel 1: Ausgangsspannung

| ![](assets/Pasted%20image%2020240122233008.png)    | ![](assets/Pasted%20image%2020240122233013.png)    |
| --- | --- |
| Oszillogramm gefiltertes Rechteck    | Messung von $\tau$    |

Bei der Eingangsspannung ist an den Flanken ein sichtbarer Einbruch des Rechtecksignals zu erkennen.  
Dies ist der Treiberstärke des Funktionsgenerators zu verschulden.  
Der Betrag des Stromes ist wie in der Simulation zu sehen an den Flanken am höchsten.  
Da die Ausgangsimpedanz des Treibers im Funktionsgenerator zu hochohmig für diesen Strom ist, fällt die fehlende Spannung am Innenwiderstand der Quelle ab.  
Der maximale Strom an den Flanken ergibt sich folgendermaßen:

$$
I_{max} = \frac{U_{e}}{R_{1}}=\frac{1V}{148.5\Omega})=6.7mA
$$

Da Flanken mit einer kleinen Anstiegszeit einer hohen Frequenz ( $\equiv$ hohes $\omega$ ) entsprechen, fällt die Reaktanz der Kapazität nicht mehr ins Gewicht:

Wenn für $jX_{C}=\frac{1}{j\omega C}$ gilt, dass $\omega$ $\gg$ dann ist $jX$ $\ll$

also vernachlässigbar in der Gesamtimpedanz.

# SImulationen

## LT-Spice Simulation mit Rechteckförmiger Eingangsspannung

| ![Schaltung Simulation mit Rechteck](assets/Pasted%20image%2020240122233536.png) | ![Konfiguration des Pulses](assets/Pasted%20image%2020240122233541.png) |  
| -------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |  
| Schaltung Simulation mit Rechteck | Konfiguration des Pulses |

In der Simulation wird überprüft, wie die Schaltung auf einen Puls/Einheitssprung reagiert. Hierfür wird an den Eingangsklemmen eine Spannungsquelle mit der _PULSE_ Funktion verwendet.

![Simulation Rechtecksignal](assets/Pasted%20image%2020240122233616.png)

In der Simulation ist zu erkennen, dass schnell ansteigende Flanken abgerundet werden. Die Oberwellen des Rechtecks, die über der Grenzfrequenz liegen, werden gedämpft.

## LT-Spice Simulation mit Sinusförmiger Eingangsspannung

![](assets/Pasted%20image%2020240122233851.png)

Die Abgebildete Schaltung stellt den RC-Tiefpass 1. Ordnung mit einer Sinusförmigen Eingangsspannung dar. Mit der SPICE-Directive `.step param f list` wird für die Variable `f` eine Liste mit den zu simulierenden Frequenzen erzeugt und in der Spannungsquelle als Parameter eingesetzt.

# Quellen

![](../xEDU/ELIT_PR/AnalogeDigitaleST/ELIT-PR_AD-ST_k12136610_k12306171.pdf)

