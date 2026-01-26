---
tags:
aliases:
  - HF-Signal
  - RF-Signal
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
  - KV
  - HF-Systemtechnik 1
semester: WS25
created: 4. Oktober 2024
professor:
  - Reinhard Feger
release: true
title: RF-Signale
---

# Leitungstheorie - RF-Signale

> [!question] Vergleiche [Feldtheorie](../Physik/Feldtheorie/index.md)

Bei höher werdenden Frequenzen lässt sich die ausbreitung von Strom und Spannung (dual zum E und H Feld) als Welle beschreiben. 

Ein mathematisches Modell zur Beschriebung von der zeitlichen und örtlichen Ausbreitung von U und I Wellen bietet die [Telegrafenleitungsgleichung](Telegrafenleitungsgleichung.md).

Signale, die sich in Form einer Welle auf einer Leitungs ausbreiten, bezeichnet man als RF-Signal.

## Wellenparameter

> [!info] Wellenparameter sind im Allgemeinen von Leitungsbelägen ($L', C', G',R'$), welche aus dem Verwendeten Material *und der Leitungsgeometrie* resultieren, und der Frequenz $\omega$ abhängig.

- Ausbreitungskonstante
- Phasengeschwindigkeit
- Wellenlänge
- Characteristische Impedanz
- Eindringtiefe

Der Phasenbelag ist mit der [Wellenlänge](../Physik/Feldtheorie/Wellenlänge.md) des Signals verknüpft und bestimmt, wie schnell sich die Welle auf der Leitung ausbreitet ([Phasengeschwindigkeit](../Physik/Feldtheorie/Phasengeschwindigkeit.md)).

$$\lambda=\frac{2\pi}{\beta}, \quad v_{p} = \lambda f = \frac{\omega}{\beta}$$

### Zusammenfassung der Größen

## Wellenausbreitung

- Transmission Line Modell
- Reflexionsfaktor / SWR / Anpassung
- Eingangsimpedanz

## Ab wann muss für eine Leitung die Leitungstheorie betrachtet werden?

> [!question] Was ist ein RF Signal?
> 
> - Ist die Leitungslänge viel größer als die Wellenlänge ist spricht man von einem RF-Signal
> - Ist am Ende der Leitung der **gleiche pegel** wie am Anfang? $\to$ Beim RF-Signalen nicht trivial.
> - Hauptsächlich von Komponentengrößen und Verbindungslängen abhängig.

> [!success] Besonderheiten bei RF-Signalen
> - Leitungen auf denen RF-Signale übertragen werden, müssen als [Transmission Lines](Transmission%20Line.md) (TLs) behandelt werden.
> - Auf einer TL müssen nicht nur zeitliche sondern auch **örtliche** Änderungen berücksichtigt werden. Betrachtung als [Welle](../Physik/Feldtheorie/Wellengleichung.md).
> - RF Signale breiten sich nicht nur auf Leitern, sondern auch in [Substraten / Dielektrika](../Physik/Materialkunde/{MOC}%20Materialkunde.md#Substrate)  aus
>     - in allen achsen xyz $\to$ Freiraumausbreitung
> - In unterschiedlichen Substraten / Dielektrika wandert das Signal unterschiedlich schnell

> [!warning] Variation des Signals über Ort und Zeit - [**Welle** ](../Physik/Feldtheorie/Wellengleichung.md)
>![invert_dark|1000](../_assets/RF-sign.svg)

### Frequenz vs. Leitungslänge

> [!NOTE] elektrisch kurze Leitung (engl. lumped element) 
> Eine Leitung ist *elektrisch kurz*, falls die Leitungslänge $l$ deutlich kleiner als die Wellenlänge $\lambda$ bei der Betriebsfrequenz ist bzw. falls die Laufzeit $\uptau$ eines **Sinusförmigen** Signals längs der Leitung deutlich kleiner ist als die Periodendauer $T$ ist.  
>
> $$
> \lambda = \frac{c_{0}}{f}\gg l \qquad \text{oder} \qquad \uptau = \frac{\text{Strecke}}{\text{Geschwindigkeit}} = \frac{l}{c_{0}} \ll T = \frac{1}{f}
> $$
> 

> [!NOTE] nicht elektrisch kurz ($l>\frac{\lambda}{10}$) (engl. [Transmission Line](Transmission%20Line.md))
>  Zeigt die Spannung längs der Leitung **keinen** konstanten Verlauf mehr, so ist die Leitung *nicht* als elektrisch *kurz* anzusehen. In der Praxis geht man davon aus, dass der Effekt ab einer Leitungslänge von **einem Zehntel der Wellenlänge** bedeutsam wird.
>  $$\boxed{ l > \frac{\lambda}{10} }$$
> - Bei digitalen Signalen gilt dies für die Flankenanstiegszeit von 10% bis 90% des Pegels
> - *Alternativ:* 9x die Frequenz des schnellsten digitalen Signals
>     - da ab der 9ten Harmonischen kann das Signal als Rechecksignal klassifiziert werden.

