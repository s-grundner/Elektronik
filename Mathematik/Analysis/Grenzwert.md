---
tags:
  - Analysis/Reihen
aliases:
  - Konvergenz
  - konvergiert
  - limes
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 27th February 2025
professor:
draft: true
title: Grenzwert
---



# Grenzwert einer Unendlichen Folge

> [!def] **D1 - LIM)** Eine Zahl $g$ heißt *Grenzwert* oder *Limes* einer unendlichen Folge ($c_{n}$), wenn sich ihre Glieder beliebig dieser Zahl nähern.  
> Das bedeutet, dass fast alle (= alle bis auf endlich viele) Folgeglieder der Zahl $g$ so nahe kommen, wie man es nur wünscht.   
> 
> Man sagt, dass die Folge ($c_n$) gegen $g$ konvergiert und schreibt:  
> $c_{n}\rightarrow g$ für $n\rightarrow \infty$ oder $\lim_{n\rightarrow\infty}c_{n}=g$.

Eine Folge, die einen Grenzwert besitzt, heißt *konvergent*, andernfalls heißt sie *divergent*.

Besitzt eine konvergente Folge den Grenzwert $0$, so heißt sie *Nullfolge*.  
Übersteigen fast alle Folgeglieder jede noch so große Zahl bzw. unterschreiten sie jede noch  
so kleine (negative) Zahl, so heißt die Folge ($c_{n}$) bestimmt divergent.

>[!summary] Man schreibt:  
> $\lim_{n\rightarrow\infty} c_{n}=\infty$ bzw. $\lim_{n\rightarrow\infty} c_{n}=-\infty$ 

## Absolute Konvergenz und Stabilität

> [!satz] **S1 - STFO)** Stabile Folgen ^STFO
>  Eine Folge $f[n]$ ist stabil, wenn sie absolut summierbar ist:
>  $$\sum_{n=0}^{\infty} \lvert f[n] \rvert < M < \infty$$

## Gleichmäßige Konvergenz
