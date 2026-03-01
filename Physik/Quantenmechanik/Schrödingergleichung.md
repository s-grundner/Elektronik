---
tags:
aliases:
  - Kopenhagener Deutung
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 27th February 2026
professor:
release: false
title: Schrödingergleichung
---

# Schrödungergleichung

Aus den Überlegungen zum [Atommodell](../Atommodell.md) von Bohr und der Überlegung von De Broglie der massebehafteten Teilchen als *Materiewelle*, bei der die Lösung etwa die Form 

$$
\psi(t,x) \propto e^{ -j\omega t } e^{ jkx } = e^{ -j \tfrac{E}{\hbar} t}e^{ j\tfrac{p}{\hbar} x }
$$

habe, entdeckte Schrödunger schließlich die [Partielle DGL](../../Mathematik/Analysis/Partielle%20Differenzialgleichung.md) in Form einer [Wellengleichung](../Feldtheorie/Wellengleichung.md):

> [!satz] **S)** Schrödungergleichung für ein freies Teilchen
> 
> $$
> - \frac{\hbar}{2m} \frac{ \partial^{2} \psi(x,t) }{ \partial x^{2} } = j \frac{ \partial \psi(x,t)}{ \partial t }
> $$

Zur Erinnerung

$$
\omega = \frac{E}{\hbar} \quad k = \frac{p}{\hbar}
$$

> [!success]- Bestätigung
> 
> Klassisch ist die Energie für ein Freies massebehaftetes Teilchen $E_{\mathrm{kin}}= \dfrac{mv^{2}}{2} = \dfrac{p^{2}}{2m}$
> 
> Setzt man die Lösung der Materiewelle $\psi(x,t) = e^{ -j\omega t } e^{ jkx }$ ein, erhält man
> 
> $$
> \begin{align}
> -\frac{\hbar}{2m} \frac{ \partial^{2} }{ \partial x^{2} } e^{ -j\omega t }e^{ j k x } &= j \frac{ \partial }{ \partial t } e^{ -j\omega t }e^{ j k x } \\
> -\frac{\hbar}{2m} (-jk)^{2} e^{ -j\omega t }e^{ j k x } &= j (-j\omega) e^{ -j\omega t }e^{ j k x } \\
> -\frac{\hbar}{2m}(-1)k^{2} &= \omega  \\
> \frac{\hbar}{2m} \left( \frac{p}{\hbar} \right)^{2} = \frac{E}{\hbar} &\implies E = \frac{\hbar^{2}}{2m} \frac{p^{2}}{\hbar^{2}}=\frac{p^{2}}{2m}
> \end{align}
> $$

Weiter verallgemeinert ist die Betrachtung eines Teilchens in einem Potenzial $V(x)$ 

$$
E = E_{\mathrm{kin}} + V(x) = \frac{p^{2}}{2m} + V(x)
$$
auch dafür lässt sich eine Wellengleichung finden

> [!satz] **S)** Schrödingergleichung für ein Teilchen in einem Potenzial $V(x)$
> 
> $$
> -\frac{\hbar^{2}}{2m} \frac{ \partial^{2}\psi(x,t) }{ \partial x^{2} } + V(x)\psi(x,t) = j\hbar \frac{ \partial \psi(x,t) }{ \partial t } 
> $$

Dazu hat man sich nun von der *erratenen Lösung* der Materiewelle verabschieded und weitere Lösungen gesucht, welche dann tatsächlich von bedeutungs waren.

Damit wurde ein neues Fundamentales Naturgesetz entdeckt. Jedoch bleibt noch aus wie das Ergebnis zu interpretieren ist. 

## Kopenhagener Deutung

- Die Lösung der Wellengleichung ist im allgemeinen eine komplexe Wellenamplitude $\psi(x,t)$.

Interpretiert wird diese Wellenamplitude als Aufenthalts[wahrscheinlichkeitssdichte](../../Mathematik/Statistik/Wahrscheinlichkeitsverteilungsdichte.md) (PDF), wobei

$$
\left| \psi(x,t) \right|^{2} \mathrm{d}x
$$

die Wahrscheinlichkeit ist, dass sich das Teilchen im Bereich $[x,x+\mathrm{d}x]$ befindet.

Die Lösung erlaubt unbekannte Konstanten. Diese werden so gewählt, dass die PDF auf $1$ Normiert ist;

$$
\int_{-\infty}^{\infty}\left| \psi(x,t) \right|^{2} \mathrm{~d}x = 1
$$

> [!question] Warum das Betragsquadrat?
> Nicht selbstverständlich, jedoch die einzige Sinnvolle Möglichkeit, eine reelle Wahrscheinlichkeit zu erhalten.
> 
> - z.B. nur den Realteil zu nehmen könnte auch negative werte leifern, was für eine Wahrscheinlichkeit keinen Sinn ergibt.