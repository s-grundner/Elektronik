# Flyback Simulation

```ad-example
title: Bauteilwerte Bestimmen
Berechne die primäre Induktivität sowie das Übersetzungsverhältnis, entsprechend der im Unterricht gezeigten online [Rechenhilfe](http://schmidt-walter-schaltnetzteile.de/smps/spw_smps.html):


Gib die Größen L1 und ü = N1:N2 in der Mitschrift an.
![[Pasted image 20221013192440.png|575]]
$$
L_{2} = \frac{L_{1}}{(N_{1}:N_{2})^{2}} = \frac{88.58\mu H}{2.36^{2}} = 15.9\mu H
$$
```

```ad-example
title: LTSpice Simulation und Schaltplan
Der Duty cycle beträgt 50%.
Berechne vorab die Sperrspannungen für Diode und Transistor.

$$
U_{DS} \approx U_{e}\cdot 2
$$

Wähle Schalttransistor und Diode entsprechend ihrer erwarteten Sperrspannungen.
![[Pasted image 20221013193151.png]]
```

```ad-example
title: Zeitliniendiagramme für: $U_{e}, U_{a},U_{DS},U_{ST}, I_{L1}, I_{D}$
![[Pasted image 20221013200605.png]]
Miss mit dem Cursor den Wert von $U_{DS}$ und erkläre diesen rechnerisch.
![[Pasted image 20221013200633.png]]
$U_{DS}\approx 2\cdot U_{e}$
```

```ad-example
title: Veränderung der Magnetischen Kopplung um $2\textperthousand$ (neu: $0.998$) durch Reale Streuung
Wie verändert sich $U_{DS}$?
![[Pasted image 20221013205400.png]]
Erkläre den Effekt.
```

```ad-example
title: Füge eine (realebenfalls existierende) parasitäre DS Kapazität von 100pF über den Schalter hinweg ein
Wie verändert sich UDS?
![[Pasted image 20221013204923.png]]
Erkläre den Effekt.
```

```ad-example
title: Implementiere ein Snubber Netzwerk entsprechend der Vorlesung/Abbildung ein
![[Pasted image 20221013205941.png]]
Ideale Diode, C=10nF, R=10kWie verändert sich $U_{DS}$? Erkläre den Effekt.
![[Pasted image 20221013204707.png]]
```