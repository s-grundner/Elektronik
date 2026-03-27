---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signalverarbeitung
semester: SS25
created: 24th March 2025
professor: 
release: false
title: Diskreter LTI-Zustandsraum
---

# Zustandsbeschreibung von zeitdiskreten LTI-Systemen

> [!question] :LiArrowBigLeftDash: [LTI-Systeme](LTI-Systeme.md) |📍

[LTI-Zustandsraum](Zeitkontinuierlich/LTI-Zustandsraum.md) ***:LiRefreshCcw:***

---

> [!satz] **S1 - LTI-MIMO)** Zeitdiskretes LTI-Übertragungssystem lässt sich in die Form ^LTI-MIMO
> 
>  $$
> \begin{align}
> \mathbf{x}_{k+1} &= \mathbf{A}\mathbf{x}_{k}+\mathbf{B}\mathbf{u}_{k}, \quad \mathbf{x}(0) = \mathbf{x}_{0}\tag{Zustandsgl.}\\
> \mathbf{y}_{k} &= \mathbf{C} \mathbf{x}_{k} + \mathbf{D} \mathbf{u}_{k} \tag{Ausgangsgl.}
> \end{align}
> $$
> 
> überführen. Die Matrizen $\mathbf{A}$,$\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ sind die Koeffizienten(matrizen) der **Zustandsraumdarstellung** 
> $$
> \begin{align}
> &\mathbf{A} \text{ : Dynamikmatrix } (n\times n)
> &&\mathbf{B} \text{ : Eingangsmatrix } (n \times p) \\
> &\mathbf{C} \text{ : Ausgangsmatrix } (q\times n) && \mathbf{D} \text{ : Durchgangsmatrix } (q\times p)
> \end{align}
> $$

## Lösung der Zustandsgleichung

Die Lösung der Differenzengleichung folgt aus der Rekursionsvorschrift.

$$
\begin{align}
\mathbf{x}_{1} &= \mathbf{Ax}_{0}+\mathbf{Bu}_{0} \\
\mathbf{x}_{2} &= \mathbf{Ax}_{1}+\mathbf{Bu}_{1} \\
&= \mathbf{A}(\mathbf{Ax}_{0}+\mathbf{Bu}_{0}) +\mathbf{Bu}_{1} = \mathbf{A}^{2}\mathbf{x}_{0} + \mathbf{ABu}_{0} + \mathbf{Bu}_{1} \\
&\ \ \vdots
\end{align}
$$

> [!satz] **S2 - LTI-LSG)** Lösung der Zustandsgleichung
> 
> $$
> \begin{align}
> \mathbf{x}_{k} &= \mathbf{A}^{k}\mathbf{x}_{0}+\sum_{i=0}^{k-1} \mathbf{A}^{k-i-1} \mathbf{Bu}_{i} \\
> \mathbf{y}_{k} &= \mathbf{C} \mathbf{x}_{k} + \mathbf{D} \mathbf{u}_{k}
> \end{align}
> $$

Mit der Ähnlichkeit zum kontinuierlichen LTI-System, findet man auch hier einen Term mit den Eigenschaften einer [Transitionsmatrix](../../Mathematik/Analysis/Differentialgleichungen/Fundamentalmatrix.md#Transitionsmatrix):

$$
\mathbf{\Phi}(k) = \mathbf{A}^k \quad \text{erfüllt} \quad \begin{cases}
\mathbf{\Phi}(0) &= \mathbf{I} \\
\mathbf{\Phi}(k+l) &=\mathbf{\Phi}(k)\mathbf{\Phi}(l) \\
\mathbf{\Phi}^{-1}(k) &= \mathbf{\Phi}(-k) \\
\mathbf{\Phi}(k+1) &= \mathbf{A\Phi}(k)
\end{cases}
$$

Im gegensatz zu DGL-Systemen, unterscheidet man hier, dass $\mathbf{\Phi}$ hier nicht immer [regulär](../../Mathematik/Algebra/Reguläre%20Matrizen.md) sein kann, sondern nur dann, wenn die Dynamikmatrix $\mathbf{A}$ ebenfalls regulär ist.

## Jordannormalform

Für den Zietdiskreten Fall ist die Vorgehensweise zur [Jordannormalform](../../Mathematik/Algebra/Jordannormalform.md) weigehend gleich wie für Zeitkontinuierliche Systeme

### Fall 1: Einfache Eigenwerte

Für das System 

$$
\mathbf{z}_{k+1}=\lambda_i \mathbf{I} \mathbf{z}_k
$$

mit $\operatorname{dim}(\mathbf{z})=l$ folgt:

Das charakteristische Polynom ist $p(\lambda)=\left(\lambda-\lambda_i\right)^l$. Es gilt $k_i^a=k_i^g=l$. Die Lösung des Systems für den Anfangswert $\mathbf{z}(0)=\mathbf{z}_0$ lautet

$$
\mathbf{z}_k=\lambda_i^k \mathbf{z}_0 .
$$

### Fall 2: Vielfache Eigenwerte

Für das System

$$
\mathbf{z}_{k+1}=\left[\begin{array}{ccccc}
\lambda_i & 1 & 0 & \ldots & 0 \\
0 & \lambda_i & 1 & \ldots & 0 \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & \ldots & \lambda_i & 1 \\
0 & 0 & \ldots & 0 & \lambda_i
\end{array}\right] \mathbf{z}_k
$$

mit $\operatorname{dim}(\mathbf{z})=l$ folgt: Das charakteristische Polynom ist $p(\lambda)=\left(\lambda-\lambda_i\right)^l$. Es gilt $k_i^a=l, k_i^g=1$. Die Lösung des Systems für den Anfangswert $\mathbf{z}(0)=\mathbf{z}_0$ lautet

$$
\mathbf{z}_k=\left[\begin{array}{ccccc}
\lambda_i^k & \binom{k}{1} \lambda_i^{k-1} & \binom{k}{2} \lambda_i^{k-2} & \ldots & \binom{k}{l-1} \lambda_i^{k-l+1} \\
0 & \lambda_i^k & \binom{k}{1} \lambda_i^{k-1} & \ldots & \binom{k}{l-2} \lambda_i^{k-l+2} \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & \ldots & \lambda_i^k & \binom{k}{1} \lambda_i^{k-1} \\
0 & 0 & \ldots & 0 & \lambda_i^k
\end{array}\right] \mathbf{z}_0,
$$

wobei man $\binom{k}{l} \lambda_i^{k-l}=0$ für $k<l$ setzt.

### Konjugiert Komplexe Eigenwerten

Für das System

$$
\mathbf{z}_{k+1}=\left[\begin{array}{cc}
\alpha_i & \beta_i \\
-\beta_i & \alpha_i
\end{array}\right] \mathbf{z}_k
$$

mit $\operatorname{dim}(\mathbf{z})=2$ folgt: Das charakteristische Polynom ist $p(\lambda)=\left(\lambda-\alpha_i\right)^2+\beta_i{ }^2$. Es gilt $k_i^a=k_i^g=1$ für die Eigenwerte $\lambda_{i, 1}=\alpha_i+\mathrm{j} \beta_i, \lambda_{i, 2}=\alpha_i-\mathrm{j} \beta_i$. Die Lösung des Systems für den Anfangswert $\mathbf{z}(0)=\mathbf{z}_0$ lautet

$$
\mathbf{z}_k=r^k\left[\begin{array}{rr}
\cos (k \phi) & \sin (k \phi) \\
-\sin (k \phi) & \cos (k \phi)
\end{array}\right] \mathbf{z}_0
$$

mit

$$
r=\sqrt{\alpha_i^2+\beta_i^2} \quad \text { und } \quad \phi=\arg \left(\alpha_i+\mathrm{j} \beta_i\right) .
$$


Auch mehrfache komplexe Eigenwerte können analog behandelt werden. Beispielhaft betrachte man das System

$$
\mathbf{z}_{k+1}=\left[\begin{array}{rcrr}
\alpha_i & \beta_i & 1 & 0 \\
-\beta_i & \alpha_i & 0 & 1 \\
0 & 0 & \alpha_i & \beta_i \\
0 & 0 & -\beta_i & \alpha_i
\end{array}\right] \mathbf{z}_k,
$$

dessen Transitionsmatrix durch

$$
\boldsymbol{\Phi}(k)=r^k\left[\begin{array}{cc}
{\left[\begin{array}{rr}
\cos (k \phi) & \sin (k \phi) \\
-\sin (k \phi) & \cos (k \phi)
\end{array}\right]} & \frac{k}{r}\left[\begin{array}{rr}
\cos ((k-1) \phi) & \sin ((k-1) \phi) \\
-\sin ((k-1) \phi) & \cos ((k-1) \phi)
\end{array}\right] \\
{\left[\begin{array}{ll}
0 & 0 \\
0 & 0
\end{array}\right]} & {\left[\begin{array}{rr}
\cos (k \phi) & \sin (k \phi) \\
-\sin (k \phi) & \cos (k \phi)
\end{array}\right]}
\end{array}\right]
$$

gegeben ist.

## Eigenschwingungen

Die Behandlung der Eigenschwingungen von zeitdiskreten LTI-Systemen erfolgt analog zu jener von zeitkontinuierlichen Systemen. Es werden auch hier spezielle Lösungen des autonomen Systems

$$
\mathbf{x}_{k+1}=\mathbf{A} \mathbf{x}_k
$$

mit Hilfe von Eigenvektoren gesucht. Mit dem Ansatz

$$
\mathbf{x}_k=\mathbf{v} w_k
$$

aus Gl. (3.19) folgt die Beziehung

$$
\begin{aligned}
\mathbf{v} w_{k+1} & =\mathbf{A} \mathbf{v} w_k=\lambda_i \mathbf{v} w_k \\
\mathbf{0} & =\mathbf{v}\left(w_{k+1}-\lambda_i w_k\right)
\end{aligned}
$$

und damit die spezielle Lösung

$$
\mathbf{x}_k=\lambda_i^k \mathbf{v} w_0 .
$$


Diese Lösung wird wieder Eigenschwingung genannt. Sie verbleibt für alle $k$ im linearen Unterraum span ($\{v\}$).

## Ruhelagen

Betrachtet man

$$
\mathbf{x}_{k+1}=\mathbf{A} \mathbf{x}_k+\mathbf{B} \mathbf{u}_k
$$

und wählt für $\left(\mathbf{u}_k\right)=\left(\mathbf{u}_s, \mathbf{u}_s, \ldots\right)$ eine konstante Stellfolge, dann lautet die Bestimmungsgleichung für die Ruhelagen

$$
\mathbf{x}_s=\mathbf{A} \mathbf{x}_s+\mathbf{B} \mathbf{u}_s .
$$

> [!hint] Im Unterschied zu Zeitkontinuierlichen Ruhelagen gilt 
> - Zeitkontinuierlich: $\dot{\mathbf{x}}(t) = 0$
> - Zietdiskret: $\mathbf{x}_{k+1} = \mathbf{x}_{k}$

Diese Gleichung ist nun genau dann lösbar, wenn

$$
\mathbf{B} \mathbf{u}_s \in \operatorname{im}(\mathbf{A}-\mathbf{E}) \quad \text { oder } \quad \operatorname{rank}(\mathbf{A}-\mathbf{E})=\operatorname{rank}\left(\left[\mathbf{A}-\mathbf{E}, \mathbf{B} \mathbf{u}_s\right]\right)
$$

gilt. Im Falle $\mathbf{u}_s=\mathbf{0}$ hat das System also mindestens eine Ruhelage. Man beachte in diesem Zusammenhang auch die Tabelle 3.1 und ersetze $\mathbf{A}$ durch $\mathbf{A - E}$.
3.2.5 Allgemeines Lösungsverhalten

Die Lösungen eines linearen autonomen Systems zu einem Eigenwert $\lambda_i=\alpha_i+\mathrm{j} \beta_i$ können als Linearkombination der Größen

$$
k^l r^k \cos (k \phi), \quad k^l r^k \sin (k \phi) \text { mit } 0 \leq l<n
$$

und $r=\sqrt{\alpha_i^2+\beta_i^2}, \phi=\arg \left(\alpha_i+\mathrm{j} \beta_i\right)$ dargestellt werden. Daraus folgt unmittelbar der folgende Satz.
Satz 3.7 (Asymptotische Stabilität). Eine Ruhelage $\mathbf{z}_s=\mathbf{0}$ des Systems ist genau dann global asymptotisch stabil, wenn alle Eigenwerte der Matrix A betraglich kleiner als 1 sind. D.h., ist $\lambda_i=\alpha_i+\mathrm{j} \beta_i$ ein Eigenwert von $\mathbf{A}$, dann muss gelten

$$
r=\sqrt{\alpha_i^2+\beta_i^2}<1 .
$$


Für jeden Anfangszustand $\mathbf{z}_0$ läuft die Folge $\mathbf{z}_k$ für $k \rightarrow \infty$ in den Punkt $\mathbf{0}$ ein. D.h. für alle $\mathbf{z}_0 \in \mathbb{R}^n$ gilt, aus $\mathbf{z}(0)=\mathbf{z}_0$ folgt

$$
\lim _{k \rightarrow \infty}\left\|\mathbf{z}_k\right\|=0 .
$$

## Linearisierung

Die Linearisierung von zeitdiskreten nichtlinearen Systemen erfolgt wie in Abschnitt 3.1.6 für zeitkontinuierliche Systeme beschrieben, mithilfe einer Taylorreihenentwicklung. Wir werden dies für eine spezielle Klasse von zeitdiskreten Systemen, den Abtastsystemen,