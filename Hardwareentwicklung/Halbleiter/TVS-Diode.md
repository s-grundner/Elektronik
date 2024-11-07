---
tags: []
aliases: []
created: 17th August 2023
---

# TVS-[Diode](Diode.md)

![](../ESD.md)

## Kennwerte von TVS-[Dioden](Diode.md)

### Unioder Bidirektional

Je nachdem ob die zu schützende Leitung über oder unter dem Massepotential liegt, muss man bei unidirektionalen TVS-Dioden die Polung beachten.  
Bidirektionale arbeiten in beide Richtungen.  
![invert_dark](../assets/TVS-Diode.png)

### Anzahl von Kanälen

Oft haben Konnektoren eine Vielzahl an Pole (z.B. HDMI) die geschützt werden müssen.  
Deshalb gibt es mehrere TVS-Dioden in einem einzigen Package.  
![invert_dark](../assets/SC7538.png)

### Arbeitsspannung

Die Arbeitsspannung ist die maximale [elektrische Spannung](../../Elektrotechnik/elektrische%20Spannung.md), welche im Normalbetrieb auf der Leitung vorkommt. z.B. 3.3V

### Klemmspannung

Im Falle eines [ESD](../ESD.md)-Spikes, wirkt die TVS-Diode niederohmig gegen Masse.  
Die elektrische Spannung, die dabei an der Diode abfällt, ist die Klemmspannung.  
Obwohl sie immer noch signifikant höher ist als die Betriebsspannung, ist sie aufgrund der kurzen Dauer nicht weiter gefährlich, trotzdem sollte sie in jedem Anwendungsfall möglichst gering gewählt werden.  
Einen genauen Wert dafür findet man nur sehr schwer.  
Man sollte im Datenblatt der TVS-Diode auf Verweise für typische Applikationen achten.

### Intrinsische [Kapazität](../../Elektrotechnik/Kapazität.md)

Wie bei jedem Bauteil, gibt es gewisse parasitäre Kenngrößen, die im Inneren präsent sind. Bei der TVS Diode ist die Kapazität eine störende, dennoch unvermeidbare, Größe.  
Bei TVS-Dioden mit hoher Kapazität besteht die Gefahr, dass sehr kurze ESD-Stöße nicht gefiltert werden können.  
Abgesehen von der intrinsischen Kapazität, ist zu berücksichtigen, dass auch die Leiterbahn von der Buchse zur Diode keine eigene signifikante Kapazität aufweisen darf. Dies wird durch eine möglichst kurze Leiterbahnführung sowie eine dünne Leiterbahnbreite realisiert.

### IEC61000−4−2 Rating

Die TVS-Diode verfügt über eine Rating-Stufe der IEC61000-4-2 Norm, welche Aussagen über die absoluten Höchstwerte des ESD-Spikes liefert.
