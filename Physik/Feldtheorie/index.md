---
tags:
  - index
aliases:
  - EM-Wellen
  - Raumwelle
  - Elektromagnetische Welle
  - EM-Welle
  - EM-Feld
  - Elektromagnetismus
  - Elektromagnetische Wellen
  - Feldtheorie
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
created: 15th January 2026
keywords:
semester: WS25
professor:
  - Reinhard Feger
release: true
title: Elektromagnetische Wellen
---

# Feldtheorie - Elektromagnetische Wellen

Elektrische und Magnetische Wechselfelder können sich als Wellen über die Zeit im Raum ausbreiten. Das $\mathbf{E}$ und $\mathbf{H}$-Feld ist über die [Maxwell](../../Elektrotechnik/Maxwell.md)-Gleichungen miteinander verkoppelt, weshalb man von Elektromagnetischen Wellen spricht, da das eine nicht ohne das andere existiert.

Ein mathematisches Modell zur beschreibung von der zeitlichen und örtlichen Ausbreitung von elektromagnetischen Wellen bieten die [Telegrafengleichung](../../Elektrotechnik/Elektrodynamik/Telegrafengleichung.md).

> [!info] Feldwirkung in einem Medium
> Im Freiraum (Vakuum) sind reelle, eindimensionale Naturkonstanten ([$\epsilon_0$](../../Elektrotechnik/Dielektrikum.md), [$\mu_0$](../Konstanten%20und%20Einheiten/Permeablität.md)) ausreichend, um Feldwirkungen zu beschreiben. Wenn die Felder mit Materie in Berührung kommen muss berücksichtig werden, wie das Material mit den Feldern wechselwirkt. 
> 
> Die [Materialeigenschaften](../../Elektrotechnik/Materialgesetze.md) können auch linear/nichtlinear und (oder) auch isotrop/anisotrop sein.

## Wellenparameter

> [!info]  Wellenparameter sind im allgemeinen von [Materialparameter](../../Elektrotechnik/Materialgesetze.md) ($\epsilon,\mu,\sigma$) und der Frequenz $\omega$ abhängig.

- [Ausbreitungskonstante](Wellenzahl.md) ... $k$ bzw. $\gamma$
- [Phasengeschwindigkeit](Phasengeschwindigkeit.md) ... $v_{p}$
- [Wellenlänge](Wellenlänge.md) ... $\lambda$
- [Wellenimpedanz](../Konstanten%20und%20Einheiten/Wellenwiderstand.md) ... $\eta$
- [Eindringtiefe](../../HF-Technik/Skineffekt.md) ... $\delta_{S}$

### Zusammenfassung der Größen

> [!info] Zusammenfassung der Fortpflanzungskonstante $\gamma$ in unterschiedlichen Medien
> 
> |                                         |                      Verlustbehaftet <br> $\tan\delta \neq 0$                      |                Verlustlos<br> $\tan\delta = 0$                |                             Guter Leiter<br> $\tan\delta \gg 0$                              | Perfekter Leiter<br> $\tan\delta \to \infty$ |
> | --------------------------------------- | :--------------------------------------------------------------------------------: | :-----------------------------------------------------------: | :------------------------------------------------------------------------------------------: | :------------------------------------------: |
> | Komplexe Ausbreitungskonstante $\gamma$ | $\gamma = j\omega\sqrt{ \epsilon\mu }\sqrt{ 1 - j\dfrac{\sigma}{\omega\epsilon} }$ |            $\gamma=jk=j\omega\sqrt{ \epsilon\mu }$            |                      $\omega=(1+j)\sqrt{ \dfrac{\omega\mu\sigma}{2} }$                       |              $\gamma\to\infty$               |
> |                                                                                    |      $\alpha = 0,\quad \beta = k = \omega\sqrt{ \epsilon\mu }$       | $\alpha = \beta = \sqrt{ \dfrac{\omega\mu\sigma}{2} }, \quad \delta_{\mathrm{S}} := \dfrac{1}{\alpha}$ |                                              |

## Wellenausbreitung

- [Helmholtzsche Differenzialgleichung](../../HF-Technik/Helmholtzsche%20Differenzialgleichung.md)
- [Felder an Grenzflächen](../../Elektrotechnik/Felder%20an%20Grenzflächen.md)
- [Leitungstheorie](../../HF-Technik/Leitungstheorie.md)

### Zusammenfassung Felder An Grenzflächen

> [!question] [Felder an Grenzflächen](../../Elektrotechnik/Felder%20an%20Grenzflächen.md)
>
> |                 Verlustbehaftet <br> $\tan\delta \neq 0$                  |            Verlustlos<br>$\tan\delta=0$            | Gut / Perfekter Leiter <br>$\tan\delta \gg 0$ / $\tan\delta \to \infty$ |
> | :-----------------------------------------------------------------------: | :------------------------------------------------: | :---------------------------------------------------------------------: |
> |             $\hat{n}\cdot(\mathbf{D}_{2}-\mathbf{D}_{1}) = 0$             | $\hat{n}\cdot(\mathbf{D}_{2}-\mathbf{D}_{1}) = 0$  | $\hat{n}\cdot \mathbf{D} = \rho_{\mathrm{s}}$              |
> |             $\hat{n}\cdot(\mathbf{B}_{2}-\mathbf{B}_{1}) = 0$             | $\hat{n}\cdot(\mathbf{B}_{2}-\mathbf{B}_{1}) = 0$  | $\hat{n}\cdot \mathbf{B} = 0$                      |
> | $\hat{n}\times(\mathbf{E}_{2}-\mathbf{E}_{1}) = -\mathbf{M}_{\mathrm{s}}$ | $\hat{n}\times(\mathbf{E}_{2}-\mathbf{E}_{1}) = 0$ |    $\hat{n}\times\mathbf{E}=0$                       |
> | $\hat{n}\times(\mathbf{H}_{2}-\mathbf{H}_{1}) = \mathbf{J}_{\mathrm{s}}$  | $\hat{n}\times(\mathbf{H}_{2}-\mathbf{H}_{1}) = 0$ |    $\hat{n}\times\mathbf{H}=\mathbf{J}_{\mathrm{s}}$            |


## Bänder des EM-Spektrums

- [Mikrowellenbänder](../../HF-Technik/Mikrowellenbänder.md)
- [PDF](../../_assets/pdf/spectrum_20090210.pdf)

