---
tags: 
aliases:
  - Fourier Transformation
keywords:
  - Zeitbereich
  - Frequenzbereich
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 4. März 2024
professor:
  - Andreas Stelzer
def:
  - FT
  - IFT
---
 

# Fourier Transformation

Die Fouriertransfomration ist eine [[Integraltransformation]]. Im Vergleich zur [Fourierreihe](Fourier%20Reihe.md) werden bei der Fouriertransformation die diskreten Frequenzen $k\omega_{0}$ durch die kontinuierliche Kreisfrequenz $\omega$ ersetzt.

$F(j\omega)$ ist die **Fourier-Transformierte** oder das Fourierspektrum der Funktion $f(t)$:

> [!def] **D1 - FT)** Fouriertransformation - Fourierintegral ^FT
> $$\mathcal{F}\{f(t)\}(j\omega) = F(j\omega) = \int_{-\infty}^{\infty} f(t)\cdot e^{-j\omega t}dt \qquad t \in \mathbb{R}$$
> 
> - [Transformationskern](Integraltransformation.md): komplexe Exponentialfunktion $e^{ -j\omega t }$
> - Kurzschreibweise: $\mathcal{F}\{f(t)\}(j\omega) = F(j\omega)$



> [!def] **D2 - IFT)** Inverse Fouriertransformation ^IFT
> $$\mathcal{F}\{F(j\omega)\}^{-1}(t) = f(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(\omega)\cdot e^{j\omega t}d\omega$$

## Sätze und Korrespondenzen

> [!satz] **S1 - FTR)** Rechenregeln der Fouriertransformation ^FTR

| Nr     | Operation                        |                                                      Zeitbereich                                                       |                                                       Frequenzbereich ($\omega$-Domäne)                                                       |
| :----- | :------------------------------- | :--------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------: |
| (i)    | Transformation                   |                                                         $f(t)$                                                         |                              $\mathcal{F}\{f(t)\}$<br>$=\int_{-\infty}^{\infty}f(t)e^{ j\omega t }\mathrm{~d}t$                               |
| (ii)   | inverse<br>Transformation        | $\mathcal{F}^{-1}\{F(j\omega)\}$<br>$=\frac{1}{2\pi}\int_{-\infty}^{\infty}F(j\omega)e^{ j\omega t }\mathrm{~d}\omega$ |                                                                 $F(j\omega)$                                                                  |
| (iii)  | Linearität                       |                                                 $af_{1}(t)+b f_{2}(t)$                                                 |                                                       $aF_{1}(j\omega)+bF_{2}(j\omega)$                                                       |
| (iv)   | Dualität                         |                                                        $F(jt)$                                                         |                                                               $2\pi f(-\omega)$                                                               |
| (v)    | Ähnlichkeit                      |                                                        $f(at)$                                                         |                                        $\dfrac{1}{\lvert a \rvert}F\left( \dfrac{j\omega}{a} \right)$                                         |
| (vi)   | Spiegelung                       |                                                        $f(-t)$                                                         |                                                                 $F(-j\omega)$                                                                 |
| (vii)  | Zeitverschiebung                 |                                                      $f(t-t_{0})$                                                      |                                                       $F(j\omega)e^{ -j\omega t_{0} }$                                                        |
| (viii) | Frequenzverschiebung             |                                                $f(t)e^{ j\omega_{0}t }$                                                |                                                           $F(j\omega-j\omega_{0})$                                                            |
| (ix)   | Konjugation                      |                                                       $f^{*}(t)$                                                       |                                                               $F^{*}(-j\omega)$                                                               |
| (x)    | Differentation im<br>Zeitbereich |                                     $\dfrac{\mathrm{d}^{n}}{\mathrm{d}t^{n}}f(t)$                                      |                                                           $(j\omega)^{n}F(j\omega)$                                                           |
| (xi)   | Differentation im<br>Bildbereich |                                                    $(-jt)^{n}f(t)$                                                     |                                           $\dfrac{\mathrm{d}^{n}}{\mathrm{d}\omega^{n}} F(j\omega)$                                           |
| (xii)  | Faltung im<br>Zeitbereich        |             $f_{1}(t)*f_{2}(t)$<br>$\int_{-\infty}^{\infty}f_{1}(\uptau)f_{2}(t-\uptau)\mathrm{~d}\uptau$              |                                                        $F_{1}(j\omega)F_{2}(j\omega)$                                                         |
| (xiii) | Faltung im<br>Frequenzbereich    |                                                   $f_{1}(t)f_{2}(t)$                                                   | $\frac{1}{2\pi}F_{1}(j\omega)F_{2}(j\omega)$<br>$=\frac{1}{2\pi}\int_{-\infty}^{\infty}F_{1}(j\theta)F_{2}(j\omega-j\theta)\mathrm{~d}\theta$ |

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
> Ihr gegenüber steht die [Fourier Reihe](../../Systemtheorie/Fourier%20Reihe.md), mit welcher sich das Spektrum periodischer Funktionen berechnen lässt.  
> Sie ist in vielen Bereichen von Wissenschaft und Technik unerlässlich.
> 
> - Vor allem bei der Datenkomprimierung spielt sie eine große Rolle. Um sie von einem Computer ausführen zu lassen gibt es die [Diskrete Fourier Transformation](DFT.md) ([[DFT]]) und die Schnelle Fourier Transformation ([FFT](../../Softwareentwicklung/ds-algo/FFT.md)).

## Unterschied zur Fourierreihe

Der Ursprung der Fouriertransformation ist auf die Fourierreihe zurückzuführen:

> [!info] zur Fourier-Reihe:
> Eine *periodische* Funktion $f$ lässt sich in Form der Fourier-Reihe als Summe unendlich vieler **Sinusschwingungen** darstellen.

> [!info] zur Fouriertransformation  
> Die **Fourier-Transformation** löst (auch) bei *nicht-periodischen* Funktionen die Aufgabe, diese als Überlagerung von [harmonischen Schwingungen](../../Physik/harmonische%20Schwingungen.md) darzustellen.
> 
> - Die Berechnung von $F$ aus $f$ heißt *Fourier-Transformation* der Funktion $f$.  
>
> - Dadurch entsteht aus einer reellen Funktion $f$ eine [komplexwertige](Komplexe%20Zahlen.md) Funktion $F$.

>[!success] Die Zeitfunktion $f$ liegt im **Original-** oder **Zeitbereich**, während ihre Fourier-Transformierte im **Frequenz-** oder **Bildbereich** liegt.  
> Folgende Schreibweisen sind üblich: $F(\omega)=\mathcal{F}\{f(t)\}$