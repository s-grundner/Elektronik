---
tags:
  - Baugruppe/Oszillator
aliases:
  - Barkhausen Kriterien
  - Barkhausen
  - "#Baugruppe/Oszillator"
  - Oszillator
keywords: 
subject:
  - Einführung Elektronik
  - VL
  - hwe
semester: WS24
created: 2nd January 2023
professor:
  - Bernhard Jakoby
source:
  - Siegbert Schrempf
satz:
  - BHK
---
 

# Harmonische Oszillatoren

Im Folgenden betrachten wir Schaltungen zur Erzeugung von Sinusschwingungen, sog. harmonische Oszillatoren, die wir durch mitgekoppelte (positiv rückgekoppelte) Systeme ohne Eingang realisieren.

![invert_dark|600](assets/RKNW.png)

>[!example]- Verstärker mit Parallelschwingkreis
> ![500](assets/Oszillatoren%202025-01-14%2010.38.37.excalidraw.md)
> 
> **Verstärker:** ([Nicht-Invertierender Verstärker](../OPV-Nicht-Invertierender%20Verstärker.md))
> $$A(j\omega)= \frac{U_{a}}{U_{e}}= 1+\frac{R_{N}}{R_{1}}$$
> 
> **Rückkoppelnetzwerk:** ([Parallelschwingkreis](Parallelschwingkreis.md))
> $$k(j\omega)= \frac{U_{e}}{U_{a}}= \frac{\frac{1}{Y}}{R+\frac{1}{Y}}=\frac{1}{YR+1}\quad \text{mit} \quad Y=j\left( \omega C-\frac{1}{\omega L} \right)$$

## Schwingbedingungen - Barkhausen-Kriterien

Es ist der Zustand gesucht, in der das Netzwerk Selbstständig schwingt. 

Für die Ausgangsspannung erhält man:

$$U_{a} = A \cdot U_{a} \cdot k \implies  U_{a}(1-Ak) = 0$$

Für frequenzabhängige Netzwerke heißt das, dass (neben der trivialen Lösung $U_{a}=0$) der Ausgang genau dann gleich 0 ist, wenn für die *frequenzabhängige* Schleifenverstärkung gilt:

$$A(j\omega) \cdot k(j\omega) = 1$$



> [!satz] **S1 - BHK)** Barkhausekriterien
> Amplitudenbedingung: $\lvert A(j\omega) \cdot k(j\omega) \rvert =1$
> Phasenbedingung: $\arg(A(j\omega) \cdot k(j\omega)) = 0$

### Hinweise

Möglichkeiten die Schwingbedingung Herzuleiten:

> [!info] Aufteilung in Verstärkungs- und Rückkoppelnetzwerk:
> Ist die Schaltung solcherart, dass Rückkoppelnetzwerk und Verstärker leicht zu identifizieren sind, setzt man die komplexe Schleifenverstärkung (Verstärkung mal Rückkoppelfaktor) eins.
> 
> Zu diesem Zweck müssen zuerst Verstärkung und Koppelfaktor getrennt berechnet werden. Beim dafür notwendigen ”Auftrennen“ der Rückkopplung ist aber zu beachten, dass dadurch die Belastung des entsprechenden Schaltungsteils nicht verändert wird. Gegebenfalls muss eine Lastimpedanz ergänzt werden.
> 

> [!info] Komplexere Schaltungen
> Bei vielen Transistoroszillatoren ist die Rückkopplung nicht so leicht aufzutrennen. In diesem Fall stellt man Maschen und Knoten für das Kleinsignalersatzschaltbild auf, wobei es hilfreich sein kann, Parallel- oder Serienschaltungen von einzelnen Bauelementen bereits als Ersatzadmittanzen oder -impedanzen anzuschreiben.
> 
> Wichtig ist in diesem Zusammenhang, dass durch etwaiges Zusammenfassen die Steuergröße des Transistors nicht innerhalb eines solchen Ersatznetzwerkes verschwindet. Das Gleichungssystem ist dann nach einer Variablen aufzulösen, bewährt hat sich dafür die Basis-Emitterspannung (die Gate-Sourcespannung) oder der Basisstrom des Transistors.
> 
> Die sich ergebende Schwingbedingung im Zahlenraum der komplexen Zahlen ergibt dann zwei reelle Schwingbedingungen, meist eine für die Schwing(kreis)frequenz und eine zweite für die Bauelemente.

## Typen

| LC Oszillatoren                                  | RC Oszillatoren                                             | Passive Schwinger                                     | Digital                                                     |
| ------------------------------------------------ | ----------------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------------- |
| [Gesteuerte Schwingkreise](LC%20Oszillatoren.md) | [Wien-Brücke Oszillator](Wien-Brücke%20Oszillator.md)       | [Quarzoszillator](Quarzoszillator.md)                 | [Discrete Time Oscillator](Discrete%20Time%20Oscillator.md) |
| [Parallelschwingkreis](Parallelschwingkreis.md)  | [Phasenschieber Oszillator](Phasenschieber%20Oszillator.md) | [Pierce-Gate Oszillator](Pierce-Gate%20Oszillator.md) | [Phase Locked Loop](Phase%20Locked%20Loop.md)               |
| [Colpitts Oszillator](Colpitts%20Oszillator.md)  | [NE555](NE555.md)                                           |                                                       |                                                             |
| [Serienschwingkreis](Serienschwingkreis.md)      | [Kippstufe](Kippstufe.md)                                   |                                                       |                                                             |
| [VCO](Voltage%20Controlled%20Oscillator.md)      | [Relaxationsoszillator](Relaxationsoszillator.md)           |                                                       |                                                             |
|                                                  | [Ringoszillator](Ringoszillator.md)                         |                                                       |                                                             |

> [!question] Diese Oszillatoren sind harmonisch, d.h. Sie erzeugen eine Fundamentale Schwingung und gegeben harmonische Oberschwingungen...
> d.h. Vielfache der Grundfrequenz. Wie stark diese ausgprägt sind, wird durch den [Klirrfaktor](Klirrfaktor.md) beschrieben.

---

# Misc Notes

![[assets/Oszillatoren 2025-01-14 10.25.42.excalidraw]]


![Pasted image 20230124212033](assets/Pasted%20image%2020230124212033.png)

| Verstärker                                                        | Rückkoppler                                            |
| ----------------------------------------------------------------- | ------------------------------------------------------ |
| - $U_{2}=A\cdot U_{1}$                                            | - $U_{3}= k\cdot U_{2}$                                |
| - parasitäre Phasenverschiebung $\alpha$ von $U_{2}$ nach $U_{1}$ | - Rückkoppelnetzwerk (z.B. [Schwingkreise](../../Physik/Schwingkreise.md))          |
|                                                                   | - Phasenverschiebung $\beta$ <br> $U_{2}$ nach $U_{3}$ |

>[!summary] $U_{1}=U_{3}=k\cdot U_{2}=\underbracket{k\cdot A}_{g}\cdot U_{1}$  
> $g$ … Schleifenverstärkung
>
> >[!IMPORTANT] $g=1$, wenn das BHK erfüllt ist

