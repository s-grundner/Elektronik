---
tags: [""]
aliases: ["Antennen"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
reference: ["Gustrau"]
created: 23rd November 2022
---

# Antennen
## Grundbegriffe und Kenngrößen
Antennen erzeugen und empfangen [[elektromagnetische Wellen]], die sich im freien Raum ausbreiten:
- Im <mark style="background: #FFB86CA6;">Sendefall</mark>: Antenne wandelt an die an ihrem [[Streuparameter|Tor]] zugeführte [[Elektrische Leistung|Leistung]] möglichst effizient in eine [[Elektromagnetische Wellen|EM-Welle]] um.
- Im <mark style="background: #FFB86CA6;">Empfangsfall</mark>: Die Antenne nimmt aus einen [[Elektromagnetische Wellen|EM-Wellenfeld]] [[Elektrische Leistung|Leistung]] auf und stellt diese an ihrem [[Streuparameter|Netzwerktor]] zur Verfügung.

### Antennen als Wellentypwandler
- Zumeist ist nur das ferne [[Elektromagnetische Wellen|EM-Feld]] von technischem Interesse
- Da jede Antenne in hinreichend großem Abstand als klein angesehen werden kann, ist eine Beschreibung in [[Kugelkoordinaten]] zweckmäßig.
- Die Antenne erzeugt ein Wellenfeld (Freiraumwelle), welches [[Elektrische Leistung|Leistung]] von der Antenne fortführt (a).
- Im Empfangsfall (b) nimmt eine Antenne Energie aus einem Wellenfeld auf und regt eine Leitungswelle an ihrem Netzwerktor (Tor 2) an.

![[Pasted image 20221124144534.png]]

> [!info] Der Sende- und Empfangsfall sind reziprok.

> [!question] Begriffserklärung: Reziprozität / reziprok
> Die Strahlungseigenschaften und auch die Impedanz sind im Sende- und Empfangsfall gleich.
> - Dieser Zusammenhang wird als Reziprozität bezeichnet.
> #### Praktisch:
>- Die Antenne gibt im Sendefall ihre maximale Strahlungdichte in eine Richtung ab.
>- Ebenso koppelt die Antenne im Empfangsfall die maximale [[Elektrische Leistung|Leistung]] einer Welle aus, wenn sie aus einer bestimmten Richtung auf die Antenne trifft.

#### Feldkomponenten $\vec{E}$ und $\vec{H}$


### Nahfeld und Fernfeld

Bei der Beschreibung von Antennen macht es einen großen Unterschied, ob man sich für die Feldverteilung im unmittelbaren Umfeld der Antenne (==Nahfeld==) oder nur für Beobachtungspunkte in größerer Entfernung (==Fernfeld==) interessiert

> [!caution] Die wichtigen Antennenkenngrößen sind alle für das Fernfeld einer Antenne definiert

![[Ant_feldzonen.png]]

#### Vereinfachungen beim Übergang vom Nah- ins Fernfeld:
- Das Nahfeld zeichnet sich durch starke reaktive Feldanteile aus, in denen elektrische und magnetische Energie gespeichert wird.
- Im Fernfeld dominiert hingegen der radial orientierte Leistungstransport.

Der *Fernfeldabstand* hängt von der verwendeten Wellenlänge $\uplambda$ und den geometrischen Abmessungen der Antenne ab.

Feldabstand bei:
- elektrisch kleinen Antennen: $r\geq 2\uplambda$
- elektrisch großen Antennen: $r\geq$

 
### Kenngrößen für das Strahlungsfeld einer Antenne

#### Richtcharakteristik $C_{i}$

#### Richtfunktion $D$

# Quellen
Frage:
- $L_{max}$ welche Einheit/Physikalische größe?
- 