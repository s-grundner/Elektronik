---
tags: []
aliases: ["Spule", "Spulen", "Induktivität"]
subject: ["hwe"]
source: ["Siegbert Schrempf", "Michael Offenhuber"]
reference: []
created: 8th April 2022
---

# Induktivitäten
## Schaltzeichen
| Symbol        | ESB |
| ------------- | --- |
| ![[indu.png]] | ![[indu-esb.png]]    |
## Induktivitäten als Bauelemente Leistungselektronischen Schaltungen
Unter **Vernachlässigung** von **$R_{L}$** und der **parasitären Parallelkapazität $C_{L}$**, gilt für lineare Materialien der folgende Zusammenhang der die Spannung an der Induktivität beschreibt:
$$
\begin{align*}
	u_{L} = L\cdot \frac{di}{dt}
\end{align*}
$$
Die **Energie** die in einer **Induktivität** gespeichert werden kann ergibt sich aus:
$$
\begin{align*}
W &= \frac{L\cdot I^{2}}{2} 
\end{align*}
$$
Grundsätzlich kann man sagen, dass die Induktivität änderungen des **Stromes entgegenwirkt** ([[Lenzsche Regel]]).

Durch das Anlegen einer Puls-förmigen spannung an eine Induktivität folgt, dass sich **$i_{L}$ nicht linear verhält**.
>![[indu-pulse.png]]

Der in der Leistungselektronik relevante Fall ist jener einer Zeitkonstante, die viel größer ist als die Pulsfrequenz, sowie eines vernachlässigbaren Ohmschen Widerstands.
Daher gilt die folgende Näherung:
$$
\begin{align*}
i \approx \frac{1}{L}\cdot u_{L}\cdot t
\end{align*}
$$
Der nicht lineare reale Wert ergibt sich durch das Lösen der [[lineare DGL 1. Ordnung|homogenen linearen DGL 1. Ordnung]]
$$
\begin{align*}
	u_{L} &= L\cdot \frac{di}{dt}\\
	i_{L} &= \frac{u_{L}}{R}\cdot\left(1-e^{\frac{-t}{\tau}}\right)\rightarrow \tau=\frac{L}{R}
\end{align*}
$$
nach 1-mal $\tau$ sind $63\%$ des Stromes erreicht.
### Einschaltvorgang einer Induktivität
>![[indu-einsch.png]]

### Abschaltvorgang einer Induktivität
>![[indu-aussch.png]]

---
# Tags
## Wikipedia
[Induktivitäten](<https://de.wikipedia.org/wiki/Induktivit%C3%A4t_(Bauelement)>)
[Spulen](<https://de.wikipedia.org/wiki/Spule_(Elektrotechnik)>)