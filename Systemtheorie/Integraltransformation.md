---
tags: 
aliases:
  - Bildbereich
keywords:
  - Zeitbereich
  - Bildbereich
  - Transformation
  - Transfomrmationsbedingungen
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 4. Februar 2025
professor:
---
 

# Integraltransformationen

Mit Hilfe von Integraltransformationen werden [Signale](Signale.md) aus Gründen 
- einer **besseren Darstellbarkeit** (Interpretierbarkeit) oder 
- einer **einfacheren Handhabbarkeit** (Rechenaufwand) 

in eine **alternative Darstellungsform** übergeführt

> [!example] Beispiele:
> - [Fouriertransformation](Fouriertransformation.md): Darstellung über Zeit oder Frequenz
> - [Laplacetransformation](Laplacetransformation.md): $s$-Bereich zur einfacheren Analyse

## Integrationskern

EIne wichtige Rolle spielt dabei der **Integrationskern**, der die Bewertung der ursprünglichen Funktion in abhängigkeit der neuen **Zielvariable** steuert.

Der Integrationskern $\theta(s,t)$ hängt somit von der Zeitvariablen $t$ als der unabhängigen **Zielvariablen** $s$ ab. Durch Multiplikation des Signals $x(t)$ mit dem Integrationskern $\theta(s,t)$ und der Integration über $t$ mit $s$ als Paramete, gewinnt man die **Bildfunktion** $X(s)$ mit der **Bildvariable** $s$.

$$
X(s) = \underset{ T }{ \int } x(t) \cdot \theta(s,t)\mathrm{~d}t\quad \text{mit } t \in T,s \in S
$$

Hierbei ist:
- $T$ der Grundraum im Zeitbereich
- $S$ der Grundraum im Ziel oder Bildbereich (häufig Frequenzbereich)

## Reziprozitätsbedingung

