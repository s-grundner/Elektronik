---
tags: ["HF-Technik"]
aliases: ["Antennen"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
reference: ["Gustrau"]
created: 23rd November 2022
---

# Antennen
## Grundbegriffe und Kenngrößen
Antennen erzeugen und empfangen [Elektromagnetische Wellen](physik/Elektromagnetische%20Wellen.md), die sich im freien Raum ausbreiten:
- Im <mark style="background: #FFB86CA6;">Sendefall</mark>: Antenne wandelt an die an ihrem [Tor](hf-technik/ksn%20(5)/Streuparameter.md) zugeführte [Leistung](physik/Elektrische%20Leistung.md) möglichst effizient in eine [EM-Welle](physik/Elektromagnetische%20Wellen.md) um.
- Im <mark style="background: #FFB86CA6;">Empfangsfall</mark>: Die Antenne nimmt aus einen [EM-Wellenfeld](physik/Elektromagnetische%20Wellen.md) [Leistung](physik/Elektrische%20Leistung.md) auf und stellt diese an ihrem [Netzwerktor](hf-technik/ksn%20(5)/Streuparameter.md) zur Verfügung.

### Antennen als Wellentypwandler
- Zumeist ist nur das ferne [EM-Feld](physik/Elektromagnetische%20Wellen.md) von technischem Interesse
- Da jede Antenne in hinreichend großem Abstand als klein angesehen werden kann, ist eine Beschreibung in [Kugelkoordinaten](hf-technik/ksn%20(5)/Kugelkoordinaten.md) zweckmäßig.
- Die Antenne erzeugt ein Wellenfeld (Freiraumwelle), welches [Leistung](physik/Elektrische%20Leistung.md) von der Antenne fortführt (a).
- Im Empfangsfall (b) nimmt eine Antenne Energie aus einem Wellenfeld auf und regt eine Leitungswelle an ihrem Netzwerktor (Tor 2) an.

>[!summary] Sende- & Empfangsfall
>![](hf-technik/assets/ant_sende_empf.png)

> [!info] Der Sende- und Empfangsfall sind reziprok.

> [!question] Begriffserklärung: Reziprozität / reziprok
> `wechselseitig, gegenseitig, aufeinander bezüglich`
> Die Strahlungseigenschaften und auch die [Impedanz](hwe/Impedanz.md) sind im Sende- und Empfangsfall gleich.
> - Dieser Zusammenhang wird als Reziprozität bezeichnet.
> #### Praktisch:
>- Die Antenne gibt im Sendefall ihre maximale Strahlungdichte in eine Richtung ab.
>- Ebenso koppelt die Antenne im Empfangsfall die maximale [Leistung](physik/Elektrische%20Leistung.md) einer Welle aus, wenn sie aus einer bestimmten Richtung auf die Antenne trifft.

#### Feldkomponenten $\vec{E}$ und $\vec{H}$
$\vec{E}\dots$ [E-Feldstärke](hwe/Elektrisches%20Feld.md#Elektrische%20Feldstärke)
$\vec{H}\dots$ [H-Feldstärke](hwe/Magnetisches%20Feld.md#Magnetisches%20Feld)
Das Kreuzprodukt beider [Vektoren](mathe/mathe%20(3)/Vektorrechung.md) ergibt den [Poynting Vektor](hf-technik/ksn%20(5)/Poynting%20Vektor.md):

$$\vec S=\frac{1}{2}\vec E\times \vec H^{\ast}$$
[Transversale Elektromagnetische Welle](hf-technik/Transversale%20Elektromagnetische%20Welle.md)

### Nahfeld und Fernfeld
 
Bei der Beschreibung von Antennen macht es einen großen Unterschied, ob man sich für die Feldverteilung im unmittelbaren Umfeld der Antenne (==Nahfeld==) oder nur für Beobachtungspunkte in größerer Entfernung (==Fernfeld==) interessiert

> [!caution] Die wichtigen Antennenkenngrößen sind alle für das Fernfeld einer Antenne definiert


>[!summary] Feldzonen
>![Ant_feldzonen](hf-technik/assets/Ant_feldzonen.png)

#### Vereinfachungen beim Übergang vom Nah- ins Fernfeld:
- Das Nahfeld zeichnet sich durch starke reaktive Feldanteile aus, in denen elektrische und magnetische Energie gespeichert wird.
- Im Fernfeld dominiert hingegen der radial orientierte Leistungstransport.

Der *Fernfeldabstand* hängt von der verwendeten Wellenlänge $\uplambda$ und den geometrischen Abmessungen der Antenne ab.

Feldabstand bei:
- elektrisch kleinen Antennen: $r\geq 2\uplambda$
- elektrisch großen Antennen: $r\geq$

 
### Kenngrößen für das Strahlungsfeld einer Antenne

#### Richtcharakteristik $C_{i}$
![richtc_graph](hf-technik/assets/richtc_graph.png)

#### Richtfunktion $D$

## Hertzscher [Dipol](hf-technik/ksn%20(5)/Dipol.md)

# Drahtantennen

# Antennenbauformen
[Richtantennen](hf-technik/ksn%20(5)/Richtantennen.md)

# Quellen
<iframe width="560" height="315" src="https://www.youtube.com/embed/qs2QcycggWU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

- Fringing Field -> Randfeld

## 9:27:
- [TEM-Welle](hf-technik/Transversale%20Elektromagnetische%20Welle.md) -> Amplituden sind Normal zur Ausbreitungsrichtung
- $\vec E\times\vec H$ visuarisiert
## 25:30
Quadratur Amplituden [Modulation](hf-technik/ksn%20(4)/Modulation.md) (QAM)

![Gustrau](hf-technik/assets/Gustrau.pdf)