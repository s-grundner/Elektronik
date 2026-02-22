---
tags:
  - Analysis
aliases:
  - Fourier Transformation
  - Fourier-Transformation
keywords:
  - Zeitbereich
  - Frequenzbereich
subject:
  - VL
  - Signale und Systeme
  - Signalverarbeitung
semester: WS24
created: 4. März 2024
professor:
  - Andreas Stelzer 🕊️
def:
  - FT
  - IFT
title: Fourertransformation
release: false
---

# Fourier-Transformation

- [Zeitdiskrete Fourier-Transformation](Zeitdiskrete%20Fourier-Transformation.md) ***:LiArrowBigRightDash:***
- [Diskrete Fourier-Transformation](Signalverarbeitung/DFT.md) ***:LiArrowBigRightDash:***

---

Die Fouriertransfomration ist eine [[Integraltransformation]]. Im Vergleich zur [Fourierreihe](Fourierreihe.md) werden bei der Fouriertransformation die diskreten Frequenzen $k\omega_{0}$ durch die kontinuierliche Kreisfrequenz $\omega$ ersetzt.

$F(j\omega)$ ist die **Fourier-Transformierte** oder das Fourierspektrum der Funktion $f(t)$:

> [!def] **D1 - FT)** Fouriertransformation - Fourierintegral ^FT
> $$\mathcal{F}\{f(t)\}(j\omega) = F(j\omega) = \int_{-\infty}^{\infty} f(t)\cdot e^{-j\omega t}dt \qquad t \in \mathbb{R}\tag{FT}$$
> 
> - [Transformationskern](Integraltransformation.md): komplexe Exponentialfunktion $e^{ -j\omega t }$
> - Kurzschreibweise: $\mathcal{F}\{f(t)\}(j\omega) = F(j\omega)$



> [!def] **D2 - IFT)** Inverse Fouriertransformation ^IFT
> Für Kreisfrequenzen $\omega$
>
> $$\mathcal{F}\{F(j\omega)\}^{-1}(t) = f(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(\omega)\cdot e^{j\omega t}\mathrm{~d}\omega \tag{IFT}$$
> Für Frequenzen $f$ : $\omega = 2\pi f$
> 
> $$\mathcal{F}\{F(jf)\}^{-1}(t) = f(t) = \int_{-\infty}^{\infty} F(f)\cdot e^{j 2\pi f t}\mathrm{~d}f \tag{IFT}$$

## Sätze und Korrespondenzen

> [!satz] **S1 - FTR)** Rechenregeln der Fouriertransformation ^FTR
>
> ![Fourier](Korrespondenzen/Fourier.md#^T1)

## Eigenschaften

$F(j\omega)$ isd im allgemeinen komplex:

$$F(j\omega) = \mathrm{Re}\left\{ F(j\omega) \right\} +\mathrm{j} ~\mathrm{Im\left\{ F(j\omega) \right\} }= \left| F(j\omega) \right| e^{ j\varphi(\omega) }   $$
- $\left| F(j\omega) \right|$ ... **Betragsspektrum**
- $\varphi(\omega) = \angle F(j\omega)$ ... **Phasenspektrum**

### Konvergenzkriterium

Für die Konvergenz ist *hinreichend* aber nicht notwendig, dass

$$
\int_{-\infty}^{\infty} \lvert f(t) \rvert \mathrm{~d}t < \infty
$$


---

# Weiteres

> [!quote] Trivia  
> Die Fourier Transformation ist eine Integraltransformation, welche 1822 von Jean Baptiste Fourier eingeführt wurde und genutzt wird, um das diskrete Frequenzspektrum aperiodischer Signale zu ermitteln.  
> Ihr gegenüber steht die [Fourierreihe](Fourierreihe.md), mit welcher sich das Spektrum periodischer Funktionen berechnen lässt.  
> Sie ist in vielen Bereichen von Wissenschaft und Technik unerlässlich.
> 
> - Vor allem bei der Datenkomprimierung spielt sie eine große Rolle. Um sie von einem Computer ausführen zu lassen gibt es die [Diskrete Fourier Transformation](Signalverarbeitung/DFT.md) ([[Signalverarbeitung/DFT]]) und die Schnelle Fourier Transformation ([FFT](../Softwareentwicklung/DSA/FFT.md)).

## Unterschied zur Fourierreihe

Der Ursprung der Fouriertransformation ist auf die Fourierreihe zurückzuführen:

> [!info] zur Fourier-Reihe:
> Eine *periodische* Funktion $f$ lässt sich in Form der Fourier-Reihe als Summe unendlich vieler **Sinusschwingungen** darstellen.

> [!info] zur Fouriertransformation  
> Die **Fourier-Transformation** löst (auch) bei *nicht-periodischen* Funktionen die Aufgabe, diese als Überlagerung von [harmonischen Schwingungen](../Physik/Kinematik/harmonische%20Schwingungen.md) darzustellen.
> 
> - Die Berechnung von $F$ aus $f$ heißt *Fourier-Transformation* der Funktion $f$.  
>
> - Dadurch entsteht aus einer reellen Funktion $f$ eine [komplexwertige](../Mathematik/Analysis/Komplexe%20Zahlen.md) Funktion $F$.

>[!success] Die Zeitfunktion $f$ liegt im **Original-** oder **Zeitbereich**, während ihre Fourier-Transformierte im **Frequenz-** oder **Bildbereich** liegt.  
> Folgende Schreibweisen sind üblich: $F(\omega)=\mathcal{F}\{f(t)\}$