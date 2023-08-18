# Flyback Simulation

> [!example] Bauteilwerte Bestimmen
>Berechne die primäre [Induktivität](Induktivit%C3%A4ten.md) sowie das Übersetzungsverhältnis, entsprechend der im Unterricht gezeigten online [Rechenhilfe](http://schmidt-walter-schaltnetzteile.de/smps/spw_smps.html):
>Gib die Größen L1 und ü = N1:N2 in der Mitschrift an.
> ![575](../assets/SperrwandlerIMG2.png)
>$$
>L_{2} = \frac{L_{1}}{(N_{1}:N_{2})^{2}} = \frac{88.58\mu H}{2.36^{2}} = 15.9\mu H
>$$
 

> [!example] LTSpice Simulation und Schaltplan
> Der Duty cycle beträgt 50%.
> Berechne vorab die Sperrspannungen für Diode und Transist
> $$
> U_{DS} \approx U_{e}\cdot 2
> $$
> Wähle Schalttransistor und Diode entsprechend ihrer erwarteten Sperrspannungen.
> ![Pasted image 20221013193151](../../assets/Pasted%20image%2020221013193151.png)
 

> [!example] Zeitliniendiagramme für: $U_{e}, U_{a},U_{DS},U_{ST}, I_{L1}, I_{D}$
> ![Pasted image 20221013200605](../../assets/Pasted%20image%2020221013200605.png)
> Miss mit dem Cursor den Wert von $U_{DS}$ und erkläre diesen rechnerisch.
> ![Pasted image 20221013200633](../../assets/Pasted%20image%2020221013200633.png)
> $U_{DS}\approx 2\cdot U_{e}$
 

> [!example] Veränderung der Magnetischen Kopplung um $2\textperthousand$ (neu: $0.998$) durch Reale Streuung
> Wie verändert sich $U_{DS}$?
> ![Pasted image 20221013205400](../../assets/Pasted%20image%2020221013205400.png)
> Erkläre den Effekt.
 

> [!example] Füge eine (realebenfalls existierende) parasitäre DS [Kapazität](Kapazit%C3%A4t.md) von 100pF über den Schalter hinweg ein
> Wie verändert sich UDS?
> ![Pasted image 20221013204923](../../assets/Pasted%20image%2020221013204923.png)
> Erkläre den Effekt.
 

> [!example] Implementiere ein Snubber Netzwerk entsprechend der Vorlesung/Abbildung ein
> ![Pasted image 20221013205941](../../assets/Pasted%20image%2020221013205941.png)
> Ideale Diode, C=10nF, R=10kWie verändert sich $U_{DS}$? Erkläre den Effekt.
> ![Pasted image 20221013204707](../../assets/Pasted%20image%2020221013204707.png)
