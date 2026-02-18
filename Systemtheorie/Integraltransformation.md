---
tags:
aliases:
  - Bildbereich
  - Transformationskern
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
  - Andreas Stelzer 🕊️
title: Integraltransformation
---

 

# Integraltransformationen

Mit Hilfe von Integraltransformationen werden [Signale](Signale.md) aus Gründen 

- einer **besseren Darstellbarkeit** (Interpretierbarkeit) oder 
- einer **einfacheren Handhabbarkeit** (Rechenaufwand) 

in eine **alternative Darstellungsform** übergeführt

> [!example] Beispiele:
> 
> - [Fouriertransformation](Fouriertransformation.md): Darstellung über Zeit oder Frequenz
> - [Laplacetransformation](Laplacetransformation.md): $s$-Bereich zur einfacheren Analyse

Weiterführend bei den Frequenzbereichsmethoden in der [Systemtheorie](index.md#Frequenzbereichsmethoden)

## Integrationskern

Eine wichtige Rolle spielt dabei der **Integrationskern**, der die Bewertung der ursprünglichen Funktion in Abhängigkeit der neuen **Zielvariable** steuert.

Der Integrationskern $\theta(s,t)$ hängt somit von der Zeitvariablen $t$ als der unabhängigen **Zielvariablen** $s$ ab. Durch Multiplikation des Signals $x(t)$ mit dem Integrationskern $\theta(s,t)$ und der Integration über $t$ mit $s$ als Paramete, gewinnt man die **Bildfunktion** $X(s)$ mit der **Bildvariable** $s$.

$$
X(s) = \underset{ T }{ \int } x(t) \cdot \theta(s,t)\mathrm{~d}t\quad \text{mit } t \in T,s \in S
$$

Hierbei ist:

- $T$ der Grundraum im Zeitbereich
- $S$ der Grundraum im Ziel- oder Bildbereich (häufig Frequenzbereich)

## Reziprozitätsbedingung

Damit aus der transformierten Funktion $X(s)$ die ursprüngliche Funktion $x(t)$ wieder rekonstruiert werden kann, müssen die Transfomraitonskerne die *Reziprozitätsbedingung* erfüllen.

Für die Hintransformation mithilfe des Kernes $\theta(s, t)$
- mit $t \in T$ als unabhängiger Variablen vor der Transformation
- und $s \in S$ als unabhängie Varaiable danach, also

$$
X(s) = \underset{ T }{ \int } x(t) ~\theta(s,t)  \mathrm{~d}t\quad \text{mit } s \in S  
$$
kann mithilfe eines zu $\theta(s,t)$ **reziproken Kernes** $\varphi(t,s)$ das ursprüngliche Signal $x(t)$ rekonstruiert werden:

$$
x(t) \overset{ ! }{ = } \underset{ S }{ \int } X(s) ~\varphi(t,s)  \mathrm{~d}s\quad \text{mit } t \in T  
$$

> [!question] Zur erfüllung der Reziprozitätsbedingung muss der Kern der Rücktransformation passend zur Hintransformation gewählt werden.

### Selbstreziproke Kerne

Bei **selbstreziproken Kernen** erfüllt das Paar der Kerne für die Hin- und Rücktransformation die Bedingung:

$$\varphi(t,s) = \theta^{*}(s,t)$$

> [!example] Ein Beispiel dafür ist die [Fouriertransformation](Fouriertransformation.md) bei der $T=S=\mathbb{R}$ und $s=\omega=2\pi f$ mit den Transformationskernen
> 
> $$
> \begin{align}
> \theta(s,t) &= e^{-j\omega t} \\
> \varphi(t,s) &= e^{j\omega t} = \theta^{*}(s,t)
> \end{align}
> $$
> 
> Die Reziprozitätsbedingung für die Fouriertransformation:
> 
> $$
> \int_{-\infty}^{\infty} \theta(\omega, t') \varphi(t, \omega) \mathrm{~d}\omega = \int_{-\infty}^{\infty} e^{ j\omega(t-t') } \mathrm{~d}\omega = 2\pi\delta(t-t')  
> $$

> ist somit bis auf einen Faktor $2\pi$ erfüllt.

