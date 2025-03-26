---
tags:
  - Systeme/Zeitdiskret
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Signalverarbeitung
semester: SS25
created: 25th March 2025
professor: 
draft: true
title: Diskrete Lineare Systeme
---

# Zeitdiskrete Lineare Systeme

> [!question] :LiArrowBigLeftDash: [Zeitdiskrete Systeme](Zeitdiskrete%20Systeme.md) |📍| [Zeitdiskrete LTI-Systeme](Zeitdiskrete%20LTI-Systeme.md) :LiArrowBigRightDash:

[Lineare Systeme](Lineare%20Systeme.md) ***:LiRefreshCcw:***

---

> [!def] **D1 - ZSGL)** Zustandsgleichung für Lineare Zeitdiskrete Übertragungssysteme
> $$
> \begin{align}
> \mathbf{x}_{k+1} &= \mathbf{A}(k)\mathbf{x}_{k}+\mathbf{B}(k)\mathbf{u}_{k} \tag{Zustandsgl.} \\
> \mathbf{y}_{k} &= \mathbf{C}(k) \mathbf{x}_{k}+\mathbf{D}(k)\mathbf{u}_{k} \tag{Ausgangsgl.}
> \end{align}
> $$
>
> Die Matrizen $\mathbf{A}$,$\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ sind die Koeffizienten(matrizen) der **Zustandsraumdarstellung** ^ZSRM
> $$
> \begin{align}
> &\mathbf{A}(k) \text{ : Dynamikmatrix } (n\times n)
> &&\mathbf{B}(k) \text{ : Eingangsmatrix } (n \times p) \\
> &\mathbf{C}(k) \text{ : Ausgangsmatrix } (q\times n) && \mathbf{D}(k) \text{ : Durchgangsmatrix } (q\times p)
> \end{align}
> $$