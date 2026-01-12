---
tags:
aliases:
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 31st August 2023
professor:
  - Reinhard Feger
release: true
title: Isotroper Kugelstrahler
---

# Isotroper Kugelstrahler

> [!important] Der Isotrope Kugelstrahler ist eine theoretische [Antenne](Antenne.md), die die ihr zugeführte [Leistung](../Elektrotechnik/elektrische%20Leistung.md) gleichmäßiges in alle Richtungen abstrahlt.

Die *Strahlungsleistungsdichte* $\vec{S}_{\mathrm{iso}}$ des isotropen Kugelstrahlers im *Abstand* $r$ kann aus der zugeführten Leistung $P$ und der *Kugeloberfläche* $O = 4\pi r^{2}$, auf die sich die  verteilt, berechnet werden und dient daher ideal als theoretische Bezugsgröße für die Abstrahlcharakteristik anderer Antenne.

> [!info] Leistungsdichte des Isotropen Kugelstrahlers ^S
> $$
> \vec{S}_{\mathrm{iso}}= \frac{P}{4\pi r^{2}}\cdot\vec{e_{r}} = \frac{E_{i}^{2}}{Z_{F0}}\cdot \vec{e_{r}}= H_{i}^{2}\cdot Z_{F0}\cdot \vec{e_{r}}
> $$

Die Leistungsverteilung ist über die gesamte Kugeloberfläche Gleichmäßig. Die Strahlungsleistungsdichte ist daher unabhängig von den Winkeln $\varphi$ und $\vartheta$.

## Isotroper Kugelstrahler als Bezugsgröße - Einheit dBi

Reale Antennen haben eine ungeleiche Leistungsdichteverteilung, und bündeln die Leistung abhängig von der Richtung (also $\vartheta$ und $\varphi$). Um die Richtwirkung einer Beliebigen Antenne zu quantifizieren, vergleicht man die Strahlungsleistungsdichte $S(r, \vartheta, \varphi)$ zur normierten Strahlungsleistungsdichte des isotropen kugelstrahler.


![800](../_assets/Ant_Richtwirkung_iso.png)

Setzt man Diese größen in Beziehung, erhält man die Direktivität der Antenne in der Einheit $\mathrm{dBi}$

> [!def] **Direktivität** (Directivity) $D_{\mathrm{dBi}}(\theta, \phi)$^DIRECTIVITY
> 
> $$
> D_{\mathrm{dBi}}(\theta,\phi) = 10 \log_{10} \left. \frac{S(\theta,\phi,r)}{S_{\mathrm{iso}}(r)}\right|_{r\to \infty}
> $$

## Ermittlung der Referenzleistungsdichte

Um die tatsächliche Leistungsdichte des isotropen Strahlers zu ermitteln, wird bei einer Beliebigen Antenne die Leistung von jeder richtung gemessen und gemittelt.

## Antennenwirkfläche

> [!question] [Antennenwirkfläche](HF-Technik/Antennenwirkfläche.md)

> [!satz] **Antennenwirkfläche** des Isotropen Kugelstrahlers
> 
> $$ A_{\mathrm{eff,iso}} = \frac{\lambda^{2}}{2\pi} $$

Dieser Wert kann durch mehrere Methoden Hergeleitet werden.

### Ermittlung mit der Radiansphäre eines Dipols

> [!question] [Radiansphäre](HF-Technik/Fernfeld%20und%20Nahfeld.md#Radiansphäre)

Die komplexe [Scheinleistung](Elektrotechnik/elektrische%20Leistung.md) für einen [Dipol](HF-Technik/Hertzscher%20Dipol.md) ist

$$
P(r) = \eta\frac{\pi}{3} \left| \frac{I_{0}l}{\lambda}\right|^{2} \left( 1-\jmath \frac{1}{(kr)^{3}} \right) 
$$

- $l$ ... Länge des Dipols
- $I_{0}$ ... Amplitude der Stromquelle
- $\eta = \sqrt{\frac{\mu}{\epsilon}}$ ... Intrinsischer Wellenwiderstand des Freiraumes
- $k = \frac{2\pi}{\lambda}$ ... Wellenzahl

Die Radiansphäre ist jener Radius $r_{\mathrm{rad}}$, bei dem der Blindleistungsanteil gleich dem Wirkleistungsanteil ist.

$$
\frac{1}{(kr_{\mathrm{rad}})^{3}} = 1 \implies r_{\mathrm{rad}} = \frac{\lambda}{2\pi}
$$
(Unabhängig von $l$, solange $l \ll r_{\mathrm{rad}}$)

- Innerhalb der Radiansphäre tauscht die Antenne Leistung mit der Umgebung aus
- Trifft eine Ebenenwelle auf die Antenne, wird die Leistung im Querschnitt der Radiansphäre aufgesammelt
- Somit ist die Wirkfläche genau dieser Querschnitt

$$
A_{\mathrm{eff,iso}} = \pi r_{\mathrm{rad}}^{2} = \pi \left( \frac{\lambda}{2\pi} \right)^{2} = \frac{\lambda^{2}}{4\pi}
$$

Dieser Fall gilt auch wann $l$ infinitesimal klein wird, also der Dipol zu einem Isotropen Empfänger wird. 


### Thermodynamisches Modell