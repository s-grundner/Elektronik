---
tags: [Statistik]
aliases: []
subject: [mathe]
source: ["Rudolf Frauenschuh"]
reference: ["Ing. Mathematik 4 - Timischl/Kaiser"]
created: 4th January 2023
---

# Beschreibende Statistik
## Einleitung
### Merkmale von Merkmalsträgern *(Person, Autor, Firmen,...)*
#### qualitative Merkmale
- ohne Reihung  
	- Merkmale haben gleiche Gewichtung
	- Bsp.: Geschlecht, Augenfarbe,… 
- mit Reihung   
	- Merkmale sind unterschiedlich Gewichtet
	- Bsp.: Schulnote, Hotelsterne,… 

#### quantitative Merkmale
Ein Merkmal kann verschieden ungewichtete Größen annehmen.
- Bsp.: Alter, Körpergröße,…

### Strichliste, Häufigkeitstabelle
- absolute Häufigkeit
- relative Häufigkeit
### Darstellung von Diagramme
- Säulen Diagramm
	- für qualitative Merkmale
- Balken Diagramm
- Kreis Diagramm

## Klassenbildung
- Klasseneinteilung oder Klassierung bezeichnet in der Statistik die **Einteilung von Merkmalswerten oder statistischen Reihen in getrennte Gruppen, Klassen oder Größenklassen**.
- Jedes Element der untersuchten Gesamtheit wird in Abhängigkeit von seinem Wert auf der entsprechenden Variablen genau einer Klasse zugeordnet.
> [!example] Bsp.: Alter
> man kann das Alter in bestimmte Altersklassen einteilen:
> - Kleinkind, Jugendlicher, Erwachsener...

### Richtlinien:
1. nach Möglichkeit Klasse gleicher Breite bilden
2. Richtwert für die Anzahl der Klassen:
	- kleiner als $\sqrt{n}$
	- min. 5
	- max. 20
3. Es muss klar sein, in welche Klasse ein Wert fällt.

## Kennwerten von Stichproben
Maßzahlen, die Stellvertretend wichtige Eigenschaften einer Stichprobe beschreiben.
Grundgesamtheit $\leftrightarrow$ Stichprobe

## Lagegrundwerte
### arithmetischer Mittelwert
$\overline{x}$ ... arithmetischer Mittelwert
$\overline{x} = \dfrac{1}{n}\sum\limits_{i=1}^{n}x_{i}$
### Median (Zentralwert)
$\tilde{x}$ ... Median oder Zentralwert
- alle Werte der Größe nach Ordnen
	- geht auch für qualitative Merkmale
- Wenn $n$ ungerade
	- Wert in der Mitte nehmen
- Wenn $n$ gerade
	- arithmetisches Mittel beider mittleren Werte nehmen
### Minimum & Maximum
Kleinster und größter Wert
### Quartil
- 1. Quartil $Q1$: $25\%$ der Werte liegen darunter
- 3. Quartil $Q3$: $25\%$ der Werte liegen darüber


## Boxplot
![[Boxplot.png]]
## Streuung 
Wir bilden die Quadrate der Abweichungen vom arithmetischen Mittelwert und addieren diese: 
$\sigma^{2}$ … [[Varianz]]
$\sigma$ … [[Standardabweichung]]
$$
\begin{align*}
&\sigma^{2}= \frac{1}{n}\cdot\sum\limits_{i=1}^{n}(x_{i}-\overline{x})^{2} &&\sigma =\sqrt{\sigma^{2}}\\
\end{align*}
$$

$s^{2}$ … Stichprobenvarianz 
$s$ … Stichprobenabweichung

$$
\begin{align*}
s^{2}&= \frac{1}{n-1}\cdot\sum\limits_{i=1}^{n}(x_{i}-\overline{x})^{2} &&s=\sqrt{s^{2}}
\end{align*}
$$

# Tags