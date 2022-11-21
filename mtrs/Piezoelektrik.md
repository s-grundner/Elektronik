---
tags: []
aliases: ["Piezogeber", "Piezo", "Piezoelektrisch", "Piezoeffekt"]
subject: ["mtrs"]
source: ["Norbert Irnleitner"]
reference: []
created: 7th June 2022
---

# Piezoelektrik
```ad-example
title: Ein Quarz mit einer Empfindlichkeit von $k= 2,3\cdot 10^{-12} \frac{As}{N}$, der Fläche $10cm^{2}$, der Dicke $1mm$, dem spezifischen Widerstand $\rho = 10^{14}\Omega cm$ und der relativen Dielektrizitätszahl $\varepsilon_{r}=5$ wird mit einer Kraft von $F=1kN$ belastet. Wie groß ist die Spannung infolge des Piezoeffektes? Wann ist die Ladung abgeklungen?


$$
\begin{align*}
R_{q} &= \frac{\rho\cdot l}{A} &&= \frac{10^{12}\cdot 10^{-3}}{10\cdot 10^{-4}} = 10^{12}\Omega
\\
C_{q} &= \frac{\varepsilon_{0}\cdot \varepsilon_{r}\cdot A}{d} &&= \frac{8.8542\cdot 10^{-12}\cdot 5\cdot 10\cdot 10^{-4}}{10^{-3}} = 44.27pF
\\\\
Q &= k\cdot F &&= 2.3\cdot 10^{-12}\cdot 10^{3} = 2.3 \cdot 10^{-9}As
\\
U_{q} &= \frac{Q}{C_{q}} &&= 51.95 V
\\\\
\uptau &= R_{q}\cdot C_{q} &&= 44.27s
\\
\uptau_{\infty} &= 5\uptau &&=221.35s\dots\text{Abklingdauer}
\end{align*}
$$

![[Pasted image 20220609235617.png|600]]

```
## Piezogeber
![[piezo_ions.png|650]]

In diesem Modell zur veranschaulichung des Piezoelektrischen Effekts werden zwei sorten von Ionen *(+q und -q)* asymmetrisch angeordnet. Wird das System nun einer mechanischen Spannung ausgesetzt, führt diese zu einer **elastischen Verzerrung** und damit zu einer **induzierten Polarisation**.

| Input       | Output |
| ----------- | ------ |
| Kraft/Druck | Spannung       |

![[piezo_esb.png]]

![[Piezo_effects.png]]

## Piezoresistiver Geber
Zur **Druckmessung in Flüssigkeiten und Gasen werden** *piezoresistive Geber* aus Silizium herangezogen. Sie sind bereits als Brücken im Sensor ausgeführt.

Es handelt sich dabei um ein **[[Dehnungsmessstreifen|DMS-System]]** aus **mehreren Streifen**, die entweder auf einer *Metallmembran* aufgeklebt oder gänzlich durch *Ätztechnik* hergestellt sind.

![[piezoresistivergeber.png|375]]

 - Die Membrane muss gasdicht sein.
 - Es muss Referenzdruck herrschen

## Piezoelektrischer Effekt
Der piezoelektrische Effekt kann genutzt werden um aus der gemessenen
Ladung die zugrunde liegende Deformation zu bestimmen.
Der Effekt ist nur von der Längenänderung nicht von Geschwindigkeit
bzw. Beschleunigung der Deformation abhängig.

## Lippmann Effekt (inverser P.e.-Effekt)
Wird ein **elektrisches Feld** angelegt, sorgt dieses für eine **Verschiebung der Ionen** im Festkörper. Da die Bindungen unterschiedlich stark sind, tritt *Deformation*, also **elastische Verzerrung** auf.
Man spricht vom **inversen piezoelektrischen (Lippman) Effekt**.

---
# Anwendung
## Typische Verstärkerschaltung
![[piezoverstaerker.svg]]
$R_{g}$ soll möglichst groß sein, weil der Piezo ein Isolator ist.
# Tags