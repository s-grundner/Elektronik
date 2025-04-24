---
tags:
  - tikz
aliases:
  - FIR
  - IIR
keywords: 
subject:
  - Signalverarbeitung
  - VL
semester: SS25
created: 12th March 2025
professor: 
draft: true
title: Diskrete Systeme
---

# Zeitdiskrete LTI-Systeme

> [!question] :LiArrowBigLeftDash: [Zeitdiskrete Lineare Systeme](Zeitdiskrete%20Lineare%20Systeme.md) |📍| [Zeitdiskreter LTI-Zustandsraum](Zeitdiskreter%20LTI-Zustandsraum.md) :LiArrowBigRightDash:

[Kontinuierliche LTI-Systeme](LTI-Systeme.md) ***:LiRefreshCcw:***

---

## Systemantwort (FIR / IIR)

IIR: Infinite Impulse Response
- Es gibt zwar endlich viele koeffizienten
- Aber unendlich elemente in $h[n]$ (impulsantwort)

FIR: Finite Imulse Response
- Nur Digital Möglich
- Immer BIBO Stabil

## Rekursive Systeme

Rekursive Systeme: Für die [Differenzengleichung](../Mathematik/Analysis/Differenzengleichung.md#^DZGL) des System gilt $a_{i}\neq 0 \quad\forall i$
- IIR - Systeme
- Akkumulator
- Moving Average

Bei FIR: Die Berechnung der Faltung ist äquivalent zur auswertung der DZGL
Bei IIR: Unendliche Faltung aber endliche Summen in der DZGL, daher DZGL Einfacher auszuwerten. 
- In Matlab: `filter()` Wertet DZGL aus. `conv()`wertet die Faltung aus.

M, N Auch bei Filter ist die Ordnung (bereich 2 ... 8)

## Kettenschaltung

Um ein gewünschtes Verhalten eines zeitdiskreten LTI-Systems zu erzielen, werden oft einzelne, leicht zu beschreibende Systeme kaskadiert. 

```tikz
\usepackage{tikz}
\usetikzlibrary{shapes, arrows, positioning}
\begin{document}
\begin{tikzpicture}[auto,>=latex', transform shape, scale=1.5]

\tikzstyle{block} = [draw, shape=rectangle, minimum height=3em, minimum width=3em, node distance=2cm, line width=2pt]

%Creating Blocks and Connection Nodes
\node at (0,0) (in1) {$x[n]$};
\node [block, right of=in1] (h1) {$h_1[n]$};
\node [block, right of=h1] (h2) {$h_2[n]$};
\node [right = of h2] (out1) {$y[n]$};
\path (h1) -- coordinate (mid) (h2);
\node [block, below of = mid] (h) {$h[n]$};
\node at (in1 |- h) (in2) {$x[n]$};
\node at (out1 |- h) (out2) {$y[n]$};

%Conecting Blocks
\draw[->, line width=2pt] (in1) -- (h1) -- (h2) -- (out1);
\draw[->, line width=2pt] (in2) -- (h) -- (out2);
\end{tikzpicture}
\end{document}
```

Die Reaktion des ersten Systems auf den Einheitsimpuls ist $h_{1}[n]$ somit wird die Ausgangsfolge des zweiten Systems und damit die Impulsantwort des Gesamtsystems (oder Ersatzsystems) $h[n]$ zu:

$$ h[n] = h_{1}[n] * h_{2}[n] $$

Wegen der kommutativität der [Faltung](Faltungssumme.md), ist die Reihenfolge der kaskadierung nicht relevant.

---

# Beispiele für ZD-LTI-Systeme

> [!example] Ideale Verzögerung ^BSP1
> *Ausgangssignal:* $y[n] = x[n-n_{d}]$ mit $-\infty< n <\infty, n_{d} \in \mathbb{N}$
> *Impulsantwort:* $h[n] = \delta[n-n_{d}]$
> 
> Durch Betrachtung von $h[n]$ folgt unmittelbar, dass es sich um ein kausales, BIBO stabiles LTI-System handelt.

> [!example] Summierer, Akkumulator oder diskreter Integrator ^BSP2
> *Ausgangssignal:*
> *Impulsantwort:*
> 
> Durch Betrachtung von $h[n]$ folgt unmittelbar

> [!example] Gleitende Mittelwert Bildung - [Moving Average](Moving%20Average.md) ^BSP3

> [!example] Vorwärts-Differenz-System ^BSP4
> *Ausgangssignal:* $y[n] = x[n+1]-x[n]$
> *Impulsantwort:* $h[n] = \delta[n+1]-\delta[n]$
> 
> Dieses BIBO stabile LTI System ist nicht kausal, da der aktuelle Wert der Ausgangsfolge von einem zukünftigen Wert der Eingangsfolge abhängt. Startet das Eingangssignal beispielsweise bei $n=1$, so startet das Ausgangssignal bereits bei $n=0$
> 

> [!example] Rückwärts-Differenz-System ^BSP5
> *Ausgangssignal:* $y[n] = x[n]-x[n-1]$
> *Impulsantwort:* $h[n] = \delta[n]-\delta[n-1]$
> 
> Diese System ist wiederum kausal

---