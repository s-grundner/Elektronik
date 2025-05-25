---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 24th March 2025
professor: 
release: false
title: kontinuierlicher LTI-Zustandsraum
---
 

# Zustandsbeschreibung von LTI-Systemen

> [!question] :LiArrowBigLeftDash: [LTI-Systeme](LTI-Systeme.md) |📍

[Zeitdiskreter LTI-Zustandsraum](Zeitdiskreter%20LTI-Zustandsraum.md) ***:LiRefreshCcw:***

---

Die Vorige Betrachtung auf Eingrößensysteme wird nun auf den MIMO fall erweitert. Mit der zusätzlichen beschränkung auf die Zeitinvarianz, vereinfacht sich die Zustands- / Ausgangsgleichung zu konstanten Koeffizientenmatrizen. 

> [!quote] Ein LTI System erfüllt die Eigenschaften: **Linearität** und **Zeitinvarianz**
>  Linearität $\impliedby \mathbf{A,B,C,D} \neq f(u,x)$
> Zeitinvarianz $\impliedby \mathbf{A,B,C,D}$ $\neq f(t)$

Das mathematische Modell für die Zustandsgleichung und die algebraische Ausgangsgleichung bilden ein LTI-System, wenn sie folgende Form haben:

> [!satz] **S1 - LTI-MIMO)** Mehrgrößen LTI Übertragungssystem in der [Zustandsraum](Zustandsbeschreibung.md#^ZSGR)-Darstellung ^LTI-MIMO
> 
>  $$
> \begin{align}
> \dot{\mathbf{x}}(t) &= \mathbf{A}\mathbf{x}(t)+\mathbf{B}\mathbf{u}(t), \quad \mathbf{x}(0) = \mathbf{x}_{0}\tag{Zustandsgl.}\\
> \mathbf{y}(t) &= \mathbf{C} \mathbf{x}(t) + \mathbf{D} \mathbf{u}(t) \tag{Ausgangsgl.}
> \end{align}
> $$
> 
> Die Matrizen $\mathbf{A}$,$\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ sind die Koeffizienten(matrizen) der **Zustandsraumdarstellung** 
> $$
> \begin{align}
> &\mathbf{A} \text{ : Dynamikmatrix } (n\times n)
> &&\mathbf{B} \text{ : Eingangsmatrix } (n \times p) \\
> &\mathbf{C} \text{ : Ausgangsmatrix } (q\times n) && \mathbf{D} \text{ : Durchgangsmatrix } (q\times p)
> \end{align}
> $$

Hat der Eingang sowie der Ausgang die dimension $1$, so handelt es sich um ein *Eingrößensystem* und 

> [!satz]- **S2 - LTI-SISO)** Eingrößen LTI-Übertragungssystem in der [Zustandsraum](Zustandsbeschreibung.md#^ZSGR)-Darstellung ^LTI-SISO
> 
>  $$
> \begin{align}
> \dot{\mathbf{x}}(t) &= \mathbf{A}\mathbf{x}(t)+\mathbf{b}u(t), \quad \mathbf{x}(0) = \mathbf{x}_{0}\tag{Zustandsgl.}\\
> y(t) &= \mathbf{c}^\mathrm{T} \mathbf{x}(t) + du(t) \tag{Ausgangsgl.}
> \end{align}
> $$
> 
> Die $\mathbf{A}$,$\mathbf{b}$, $\mathbf{c}$ und $d$ sind die Koeffizienten der **Zustandsraumdarstellung** 
> $$
> \begin{align}
> &\mathbf{A} \text{ : Dynamikmatrix } (n\times n)
> &&\mathbf{b} \text{ : Eingangsvektor } (n)\\
> & \mathbf{c} \text{ : Ausgangsvektor } (n) && d \text{ : Durchgangsfaktor } 
> \end{align}
> $$


Ist der Eingangsvektor $\mathbf{u} \neq \mathbf{0}$ handelt es sich um ein **Übertragungsystem**, sonst um ein **freies** System. In diesem Fall heißt das freie System aufgrund seiner Zeitinvarianz auch **autonom**.

|               | Linear                                                                                                                     | Nicht linear                                               |
| :------------ | :--------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------: |
| Zeitinvariant | $\begin{align}\dot{x}(t) = \mathbf{A}x(t)+ \mathbf{B}u(t)\\ y(t) = \mathbf{C} x(t)+ \mathbf{D}u(t)\end{align}$             | $\begin{align}\dot{x} = f(x,u)\\y = g(x,u)\end{align}$     |
| Zeitvariant   | $\begin{align}\dot{x}(t) = \mathbf{A}(t)x(t)+ \mathbf{B}(t)u(t)\\ y(t) = \mathbf{C}(t) x(t)+ \mathbf{D}(t)u(t)\end{align}$ | $\begin{align}\dot{x} = f(x,u,t)\\y = g(x,u,t)\end{align}$ |

^LTI-TABLE

## Lösung der Zustandsgleichung

> [!hint] Bei der Zustandsgleichung handelt es sich um ist ein [Lineare DGL-Systeme 1. Ordung mit konstanten Koeffizienten](../Mathematik/Analysis/Lineare%20DGL-Systeme%201.%20Ordung%20mit%20konstanten%20Koeffizienten.md)

Zur Lösung der Zustandsgleichungen wird die Methode der [Variation der Konstanten](../Mathematik/Analysis/Variation%20der%20Konstanten.md#^VARK) Angewandt.

Für echtlineare LTI-Systeme ist der Startzeitpunkt $t_{0}=0$. Aus [Eigenschaft (iv)](../Mathematik/Analysis/Fundamentalmatrix.md#^TRSM-Eigenschaften) der Transitonsmatrix folgt für die Lösung

> [!satz] **S3 - LTI-LSG)** Eindeutige Lösung von LTI-Systemen ^LTI-LSG
> $$
> \mathbf{x}(t)=\mathbf{\Phi}(t)\mathbf{x}_0+\int_{0}^t \mathbf{\Phi}(t-\tau) \mathbf{Bu}(\tau) \mathrm{~d}\tau 
> $$

Da die Koeffizientenmatrizen **konstant** sind, lässt sich ein Ansatz über die [Matrix-Exponentialfunktion](../Mathematik/Analysis/Matrix-Exponentialfunktion.md) anschreiben.

> [!satz] **S4 - TRSM-LTI)** [Transitionsmatrix](../Mathematik/Analysis/Fundamentalmatrix.md) von LTI-Systemen ^TRSM-LTI
> $$ \mathbf{\Phi}(t) = e^{ \mathbf{A}t } $$

Um die Fundamentalmatrix aus ihrem Matrix-Exponential aufzulöse, möchte man das System in seine [Jordannormalform](../Mathematik/Algebra/Jordannormalform.md) überführen.

## Laplacetransformation von Eingrößensysteme

> [!info] Da hier speziell nur Matrizen Großgeschrieben werden,
> wird die Korrespondenz im Bildbereich mit $\mathbf{x}\circ\mkern-7px-\mkern-7px\bullet \mathbf{\hat{x}}$ bezeichnet

Wendet man die [Laplacetransformation](Laplacetransformation.md) auf das [Eingrößensystem](#^LTI-SISO) an, folgt

$$
\begin{align}
s\mathbf{\hat{x}} - \mathbf{x}_{0} &= \mathbf{A\hat{x}} + \mathbf{b}\hat{u}  \\
\hat{y} &= \mathbf{c^\mathrm{T}\hat{x}} + d \hat{u}.
\end{align}
$$

Umgeformt auf $\mathbf{\hat{x}}$ und in $\hat{y}$ eingesetzt erhält man

$$
\begin{align}
\mathbf{\hat{x}}(s) &= (s \mathbb{1}-\mathbf{A})^{-1}(\mathbf{x}_{0}+\mathbf{b}\hat{u}) \\
\hat{y}(s) &= \mathbf{c}^\mathrm{T}(s\mathbb{1}-\mathbf{A})^{-1}(\mathbf{x}_{0}+\mathbf{b}\hat{u}) + d \hat{u}
\end{align}
$$

### Lösung des Systems

Aus der Allgemeinen Fundamentallösung des Systems 

![](Kontinuierlicher%20LTI-Zustandsraum.md#^TRSM-LTI)

folgt mid dem [Dämpfunggssatz](Laplacetransformation.md#^LAPK) eine alternative Berechnungsvorschrift

$$
\mathcal{L}\left\{ \mathbf{\Phi}(t) \right\} (s) = \mathbf{\hat{\Phi}}(s) = (s\mathbb{1}-\mathbf{A})^{-1}
$$

## Reglerentwurf für LTI-Systeme

> [!info] [Zustandsregler](Zustandsregeler.md) 

> [!info] [Zustandsbeobachter](Zustandsbeobachter.md)
