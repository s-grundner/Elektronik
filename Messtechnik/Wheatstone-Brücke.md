---
tags: 
aliases: 
keywords: 
subject:
  - PR
  - Elektrische Messtechnik und Sensorik
semester: WS25
created: 27. Oktober 2025
professor:
---


# Wheatstone-Brücke


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=2, transform shape]

\draw (0,4) to[open, v=$U_H$, o-o] (0,0)
	-- ++(1, 0) coordinate (k1)
	to[vR=$R_2$, i<_=$I_2$, *-] ++(0,2) coordinate (k2)
	to[R=$R_1$, i_<=$I_1$, -*] ++(0,2) coordinate (k3)
	-- ++(-1,0);
\draw (k1) -- ++(3,0)
	to[vR=$R_4$, i<_=$I_4$] ++(0,2) coordinate (k4)
	to[vR=$R_3$, i_<=$I_3$] ++(0,2) -- ++(-3,0);
\draw (k2) to[voltmeter, v^=$U_0$, i>^=$I_0$, *-*] (k4);
\node[yshift=-18pt] at ($(k2)!0.5!(k4)$) {$R_0$};
\end{circuitikz}
\end{document}
```

Das Voltmeter mit dem die Brücke abgeglichen wird bezeichnet man als Nullinstrument (NI)

## Abgleichverfahren

> [!question] Ziel:  Es soll ein unbekannter Widerstand $R_{1}$ bestimmt werden.
> 
> Dazu werden die bekannten Brückenwiderstände  $R_{2}$, $R_{3}$ und $R_{4}$ so eingestellt, dass $U_{0}$ und $I_{0}$ Null werden **= Abgleichbedingung**.

Für die abgeglichene Brückenschaltugng gilt:

$$
\begin{align}
I_{1} &= I_{2} & I_{3} &= I_{4} \\
R_{1}I_{1} &= R_{3}I_{3} & R_{2}I_{2} &= R_{4}I_{4}
\end{align}
$$

> [!info] Hilfsspannung
> Hier gehen nur Widerstandwerte in die Rechnung ein, d.h. heißt, dass Instabilitäten der HIlfsspannung $U_{H}$ das Ergebnis nicht direkt beeinlussen.
> Der Ableich kann aber umso genauer durchgeführt werden, je größer $U_{H}$ ist. 

Daraus folgt für die Berechnung der der Widerstände der abgeglichenen Brücke:

$$
\begin{align}
\frac{R_{1}}{R_{2}} = \frac{R_{3}}{R_{4}} && \text{oder} && R_{1} = \frac{R_{2}R_{3}}{R_{4}}
\end{align}
$$

Für einen Abgleich muss mindestens einer der drei Brückenwiderstände $R_{2}$, $R_{3}$ oder $R_{4}$ stufig oder stetig veränderbar sein.

> [!success] Sind alle drei widerstände bekannt, kann der unbekannte Widerstand $R_{1}$ berechnet werden.

## Ausschlagverfahren

## Empfindlichkeit

## Messunsicherheiten

**Bei kleinem Messwiderstand:**
- Begrenzte Genauigkeit der Vergleichswiderstände selbst 
- Verfälschung der Widerstandswerte durch Zuleitungs– und Übergangswiderstände

**Bei großem Messwiderstand:**
- Leckströme

Weitere Messunsicherheiten treten durch
- die unzureichende Empfindlichkeit und Nullpunktstabilität des NI,
- durch äußere Einflüsse, die sich nicht kompensieren (z.B. einstreuende Felder, Widerstandsänderung durch unterschiedliche Erwärmung der einzelnen Brückenwiderstände) 
- sowie durch Thermospannungen auf.

> [!important] Vorteil der Messbrücke
> - keine Messunsicherheit durch $U_{H}$
> - keine Messunsicherheit durch die Nichtlinearität des NI
> - geneaue Messung von $R_{1}$ mit geringen Messstrom
> - Kompensation von Störeinflüssen.

