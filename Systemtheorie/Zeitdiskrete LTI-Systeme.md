---
tags:
  - tikz
aliases:
  - FIR-Systeme
  - IIR-Systeme
keywords: 
subject:
  - Signalverarbeitung
  - VL
semester: SS25
created: 12th March 2025
professor: 
release: false
title: Diskrete Systeme
---

# Zeitdiskrete LTI-Systeme

> [!question] :LiArrowBigLeftDash: [Zeitdiskrete Lineare Systeme](Zeitdiskrete%20Lineare%20Systeme.md) |📍| [Zeitdiskreter LTI-Zustandsraum](Zeitdiskreter%20LTI-Zustandsraum.md) :LiArrowBigRightDash:

[Kontinuierliche LTI-Systeme](LTI-Systeme.md) ***:LiRefreshCcw:***

---

#todo

## IIR- / Rekursive Systeme

IIR: Infinite Impulse Response
- Es gibt zwar endlich viele koeffizienten
- Aber unendlich elemente in $h[n]$ (impulsantwort)

Rekursive Systeme: Für die [Differenzengleichung](../Mathematik/Analysis/Differenzengleichung.md#^DZGL) des System gilt $a_{i}\neq 0 \quad\forall i$
- IIR - Systeme
- Akkumulator
- Moving Average

Bei IIR: Unendliche Faltung aber endliche Summen in der DZGL, daher DZGL Einfacher auszuwerten. 
- In Matlab: `filter()` Wertet DZGL aus. `conv()`wertet die Faltung aus.

M, N Auch bei Filter ist die Ordnung (bereich 2 ... 8)

## FIR- / nicht rekursive Systeme

FIR: Finite Imulse Response
- Nur Digital Möglich
- Immer BIBO Stabil
Bei FIR: Die Berechnung der Faltung ist äquivalent zur auswertung der DZGL

## Kettenschaltung

Um ein gewünschtes Verhalten eines zeitdiskreten LTI-Systems zu erzielen, werden oft einzelne, leicht zu beschreibende Systeme kaskadiert. 

![invert_dark|500](../_assets/dzgl.png)

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