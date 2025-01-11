---
tags:
  - tikz/pgfplot
  - Analysis/Numerik
  - Analysis/DGL
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 16. Dezember 2024
professor: 
def: 
satz:
---
 

# Numerische DGL

> [!quote] Wozu Numerische Verfahren?
>  Bei nichtlinearen Gleichungen stößt man sehr bald an Grenzen. Schon für einfach aussehende Gleichungen, wie z.B.
> 
> $$x^{\prime}=t-x^2 \quad \text { oder } \quad x^{\prime \prime}=6 x^2+t$$
> 
> lässt sich die Lösung nicht mehr mit Hilfe elementarer Funktionen darstellen.
> Man braucht daher Näherungsmethoden. Dabei unterscheidet man zwischen **analytischen** und **numerischen** Näherungsverfahren.

## Analytische Verfahren

- Aus dem Satz von Lindelöf: [Sukzessive Approximation](sukzessive%20Approximation.md).
- Falls die Funktion $f$ in der der [AWP](../{MOC}%20DGL.md) höher differenzierbar ist, kann man auch mit Hilfe der Taylorentwicklung weitere Näherungsverfahren herleiten.

## Numerische Verfahren

> [!quote] Was die Rechengeschwindigkeit für große Systeme betrifft, haben sich im computerbasierten numerischen Rechnen sogenannte [Diskretisierungsverfahren](Diskretisierungsverfahren.md) durchgesetzt:
> - Das einfachste Verfahren dieser Art ist das [Euler-Verfahren](Euler-Verfahren.md).
> - Die Allgemeine Form dieser Verfahren sind [Explizite Einschrittverfahren](Diskretisierungsverfahren.md#Explizite%20Einschrittverfahren).

> [!hint] Grundprinzip dieser Verfahren:
> - *unendlich* dimensionales Problem der Bestimmung von Funktionen, wird in *endlich* dimensionale Aufgabe transformiert.
> - die Berechnung von [Vektoren](../Algebra/Vektor.md) mit reellwertigen Komponenten.

Es werden [Diskretisierungsverfahren](Diskretisierungsverfahren.md) für Anfangswert-, Randwertund Eigenwertprobleme definiert.

