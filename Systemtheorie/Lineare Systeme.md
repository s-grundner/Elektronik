---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Signalverarbeitung
semester: SS25
created: 24th March 2025
professor: 
release: false
title: Lineare Systeme
---
 

# Lineare Zeitvariante Systeme

> [!question] :LiArrowBigLeftDash: [Dynamische Systeme](Dynamische%20Systeme.md) |📍| [LTI-Systeme](LTI-Systeme.md) :LiArrowBigRightDash:

[Zeitdiskrete Lineare Systeme](Zeitdiskrete%20Lineare%20Systeme.md) :LiRefreshCcw:

---

> [!satz] **S1 - ZSGL)** Zustands- und Ausgangsgleichungen für Lineare Übertragungssysteme ^ZSGL
 >
> $$
> \begin{align}
> \mathbf{\dot{x}}(t) = \mathbf{A}(t) \mathbf{x}(t) + \mathbf{B}(t) \mathbf{u}(t) \tag{Zustandsgl.}\\
> \mathbf{y}(t) = \mathbf{C}(t) \mathbf{x}(t) + \mathbf{D}(t) \mathbf{u}(t) \tag{Ausgangsgl.}
> \end{align}
> $$ 
> Die Matrizen $\mathbf{A}$,$\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ sind die Koeffizienten(matrizen) der **Zustandsraumdarstellung** ^ZSRM
> $$
> \begin{align}
> &\mathbf{A}(t) \text{ : Dynamikmatrix } (n\times n)
> &&\mathbf{B}(t) \text{ : Eingangsmatrix } (n \times p) \\
> &\mathbf{C}(t) \text{ : Ausgangsmatrix } (q\times n) && \mathbf{D}(t) \text{ : Durchgangsmatrix } (q\times p)
> \end{align}
> $$

(Zur Erinnerung: Zeilen $\times$ Spalten)

![](Zustandsbeschreibung.md#^ZSGR)

Diese Gleichungen sind ausriechend, um ein lineares Übertragungssystem vollständig zu beschrieben. Je nachdem ob die Gleichungen bestimmte Vorraussetzungen erfüllen nennt man das System auch ... 

| **Freies** System                                                                                                        | [**LTI-System**](LTI-Systeme.md) System                                                                                                                                      | **Autonomes** System                                                                                               |
| :------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------: |
| Die Stellgröße bzw. der Eingangsvektor $\mathbf{u}(t)$ ist null                                                          | Die Koeffizientenmatrizen sind konstant. Das System ist daher zusätzlich *zeitinvariant*                                                                                     | Das System ist *frei* und *zeitinvariant*                                                                          |
| $$\begin{align}\mathbf{\dot{x}}(t)&=\mathbf{A}(t)\mathbf{x}(t) \\ \mathbf{y}(t)&=\mathbf{C}(t)\mathbf{x}(t)\end{align}$$ | $$\begin{align} \mathbf{\dot{x}}(t) = \mathbf{A}\mathbf{x}(t) + \mathbf{B}\mathbf{u}(t) \\ \mathbf{y}(t) = \mathbf{C} \mathbf{x}(t) + \mathbf{D} \mathbf{u}(t) \end{align}$$ | $$\begin{align}\mathbf{\dot{x}}(t)&=\mathbf{A}\mathbf{x}(t) \\ \mathbf{y}(t)&=\mathbf{C}\mathbf{x}(t)\end{align}$$ |

 Bei LTI Systemen lassen sich Lösungen wie für [DGL-Systeme mit konstanten Koeffizienten](../Mathematik/Differentialgleichungen/Lineare%20DGL-Systeme%20mit%20konstanten%20Koeffizienten.md) ansetzen.

## Zustandsgleichung als Blockdiagramm

![invert_dark](../_assets/Pasted%20image%2020250306140047.png)

- Der **Eingangsvektor** $\mathbf{u}(t)$ wird über die **Eingangsmatrix** $\mathbf{B}$ den (abgeleiteten) Zustandsvariablen zugeführt.
- Ein Satz von *Integratoren* (für jede Zustandsvariable) bildet mit der **Systemmatrix** $\mathbf{A}$ im Rückführungszweig eine **Rückkopplungsschleife**.
- Von den Ausgängen der *Integratoren* wird der nun Integrierte **Zustandsvektor** $\mathbf{x}(t)$ über die **Ausgangsmatrix** $\mathbf{C}$ auf den **Ausgangsvektor** $\mathbf{y}(t)$ abgebildet.
- Der **Eingangsvektor** $\mathbf{u}(t)$ wird über die **Durchgangsmatrix** $D$ direkt zum **Ausgangsvektor** $\mathbf{y}(t)$ übertragen. (Geht also an den Speichernden elementen des Systems vorbei)


## Superposition

Lineare Systeme werden durch Superposition definiert. Mit bekannten Anfangsbedingungen und bekanntem Eingang gilt:

> [!def] **D)** Das mathematische Modell Gl. (2.1) und (2.2) heißt linear, wenn es die Beziehungen
> 
> $$
> \begin{aligned}
> \mathbf{x}\left(t_0, \mathbf{x}_0, \mathbf{u}(\cdot)\right) & =\mathbf{x}\left(t_0, \mathbf{x}_0, \mathbf{0}\right)+\mathbf{x}\left(t_0, \mathbf{0}, \mathbf{u}(\cdot)\right) \\
> \mathbf{x}\left(t_0, \alpha_1 \mathbf{x}_{0,1}+\alpha_2 \mathbf{x}_{0,2}, \mathbf{0}\right) & =\alpha_1 \mathbf{x}\left(t_0, \mathbf{x}_{0,1}, \mathbf{0}\right)+\alpha_2 \mathbf{x}\left(t_0, \mathbf{x}_{0,2}, \mathbf{0}\right) \\
> \mathbf{x}\left(t_0, \mathbf{0}, \beta_1 \mathbf{u}_1(\cdot)+\beta_2 \mathbf{u}_2(\cdot)\right) & =\beta_1 \mathbf{x}\left(t_0, \mathbf{0}, \mathbf{u}_1(\cdot)\right)+\beta_2 \mathbf{x}\left(t_0, \mathbf{0}, \mathbf{u}_2(\cdot)\right)
> \end{aligned}
> $$
> 
> sowie
> 
> $$
> \begin{aligned}
> \mathbf{y}\left(t_0, \mathbf{x}_0, \mathbf{u}(\cdot)\right) & =\mathbf{y}\left(t_0, \mathbf{x}_0, \mathbf{0}\right)+\mathbf{y}\left(t_0, \mathbf{0}, \mathbf{u}(\cdot)\right) \\
> \mathbf{y}\left(t_0, \alpha_1 \mathbf{x}_{0,1}+\alpha_2 \mathbf{x}_{0,2}, \mathbf{0}\right) & =\alpha_1 \mathbf{y}\left(t_0, \mathbf{x}_{0,1}, \mathbf{0}\right)+\alpha_2 \mathbf{y}\left(t_0, \mathbf{x}_{0,2}, \mathbf{0}\right) \\
> \mathbf{y}\left(t_0, \mathbf{0}, \beta_1 \mathbf{u}_1(\cdot)+\beta_2 \mathbf{u}_2(\cdot)\right) & =\beta_1 \mathbf{y}\left(t_0, \mathbf{0}, \mathbf{u}_1(\cdot)\right)+\beta_2 \mathbf{y}\left(t_0, \mathbf{0}, \mathbf{u}_2(\cdot)\right)
> \end{aligned}
> $$
> 
> für alle $\alpha_1, \alpha_2, \beta_1, \beta_2 \in \mathbb{R}, \mathbf{u}_1(\cdot), \mathbf{u}_2(\cdot) \in B V^m$ erfüllt.

1. Zeile: Superposition von Eingang und Anfangsbedingung / Zustand.
2. Zeile: Superposition zweier Zustände
3. Zeile: Superposition zweier Eingänge