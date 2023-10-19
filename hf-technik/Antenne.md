---
tags: ["RF"]
aliases: ["Antennen"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
created: 23rd November 2022
---

# Antennen

## Grundbegriffe und Kenngrößen

Antennen erzeugen und empfangen [Elektromagnetische Wellen](../Physik/Elektromagnetische%20Wellen.md), die sich im freien Raum ausbreiten:
- Im Sendefall: Antenne wandelt an die an ihrem [Tor](Streuparameter.md) zugeführte [Leistung](../Physik/Elektrische%20Leistung.md) möglichst effizient in eine [EM-Welle](../Physik/Elektromagnetische%20Wellen.md) um.
- Im Empfangsfall: Die Antenne nimmt aus einen [EM-Wellenfeld](../Physik/Elektromagnetische%20Wellen.md) [Leistung](../Physik/Elektrische%20Leistung.md) auf und stellt diese an ihrem [Netzwerktor](Streuparameter.md) zur Verfügung.

### Antennen als Wellentypwandler

- Zumeist ist nur das ferne [EM-Feld](../Physik/Elektromagnetische%20Wellen.md) von technischem Interesse
- Da jede Antenne in hinreichend großem Abstand als klein angesehen werden kann, ist eine Beschreibung in [Kugelkoordinaten](Kugelkoordinaten.md) zweckmäßig.
- Die Antenne erzeugt ein Wellenfeld (Freiraumwelle), welches [Leistung](../Physik/Elektrische%20Leistung.md) von der Antenne fortführt (a).
- Im Empfangsfall (b) nimmt eine Antenne Energie aus einem Wellenfeld auf und regt eine Leitungswelle an ihrem Netzwerktor (Tor 2) an.

>[!summary] Sende- & Empfangsfall  
>![](assets/ant_sende_empf.png)

> [!INFO] Der Sendeund Empfangsfall sind [reziprok](Reziprozität.md).

#### Feldkomponenten $\vec{E}$ und $\vec{H}$

$\vec{E}\dots$ [E-Feldstärke](../Elektrotechnik/Elektrisches%20Feld.md#Elektrische%20Feldstärke)  
$\vec{H}\dots$ [H-Feldstärke](../Hardwareentwicklung/Magnetisches%20Feld.md#Magnetisches%20Feld)  
Das Kreuzprodukt beider [Vektoren](../Mathe/mathe%20(3)/Vektorrechung.md) ergibt den [Poynting Vektor](Poynting%20Vektor.md):

$$\vec S=\frac{1}{2}\vec E\times \vec H^{\ast}$$  
[Transversale Elektromagnetische Welle](Transversale%20Elektromagnetische%20Welle.md)

### Nahfeld und Fernfeld

 
Bei der Beschreibung von Antennen macht es einen großen Unterschied, ob man sich für die Feldverteilung im unmittelbaren Umfeld der Antenne (==Nahfeld==) oder nur für Beobachtungspunkte in größerer Entfernung (==Fernfeld==) interessiert

> [!caution] Die wichtigen Antennenkenngrößen sind alle für das Fernfeld einer Antenne definiert


>[!summary] Feldzonen  
>![Ant_feldzonen](assets/Ant_feldzonen.png)

#### Vereinfachungen beim Übergang vom Nahins Fernfeld:

- Das Nahfeld zeichnet sich durch starke reaktive Feldanteile aus, in denen elektrische und magnetische Energie gespeichert wird.
- Im Fernfeld dominiert hingegen der radial orientierte Leistungstransport.

Der *Fernfeldabstand* hängt von der verwendeten Wellenlänge $\uplambda$ und den geometrischen Abmessungen der Antenne ab.

Feldabstand bei:
- elektrisch kleinen Antennen: $r\geq 2\uplambda$
- elektrisch großen Antennen: $r\geq$

 

### Kenngrößen für das Strahlungsfeld einer Antenne

#### Richtcharakteristik $C_{i}$

![richtc_graph](assets/richtc_graph.png)

#### Richtfunktion $D$

## Hertzscher [Dipol](Dipol.md)

# Drahtantennen

# Antennenbauformen

[Richtantennen](Richtantennen.md)

# Quellen

![Starlink und Richtantennen](https://www.youtube.com/embed/qs2QcycggWU)

- Fringing Field -> Randfeld

## 9:27:

- [TEM-Welle](Transversale%20Elektromagnetische%20Welle.md) -> Amplituden sind Normal zur Ausbreitungsrichtung
- $\vec E\times\vec H$ visualisiert

## 25:30

Quadratur Amplituden [Modulation](Modulation.md) ([QAM](Quadratur%20Amplituden%20Modulation.md))

![Gustrau](assets/Gustrau.pdf)