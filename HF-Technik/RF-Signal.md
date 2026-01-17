---
tags:
aliases:
  - HF-Signal
keywords:
  - GHFT-V1
subject:
  - KV
  - VL
  - HF-Systemtechnik 1
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 4. Oktober 2024
professor:
  - Reinhard Feger
title: RF-Signale
release: true
---
 
# RF-Signale

> [!question] Was ist ein RF Signal?
> 
> - Ist die Leitungslänge viel größer als die Wellenlänge ist spricht man von einem RF-Signal
> - Ist am Ende der Leitung der **gleiche pegel** wie am Anfang? $\to$ Beim RF-Signalen nicht trivial.
> - Hauptsächlich von Komponentengrößen und Verbindungslängen abhängig.

> [!success] Besonderheiten bei RF-Signalen
> - Leitungen auf denen RF-Signale übertragen werden, müssen als [Transmission Lines](Transmission%20Line.md) (TLs) behandelt werden.
> - Auf einer TL müssen nicht nur zeitliche sondern auch **örtliche** Änderungen berücksichtigt werden
> - RF Signale breiten sich nicht nur auf Leitern, sondern auch in [Substraten / Dielektrika](../Physik/Materialkunde/{MOC}%20Materialkunde.md#Substrate)  aus
>     - in allen achsen xyz $\to$ Freiraumausbreitung
> - In unterschiedlichen Substraten / Dielektrika wandert das Signal unterschiedlich schnell

> [!warning] Variation des Signals über Ort und Zeit - [**Welle** ](../Mathematik/Analysis/Wellengleichung.md)
>![invert_dark|1000](../_assets/RF-sign.svg)

## Frequenz vs. Leitungslänge

> [!NOTE] elektrisch kurze Leitung (engl. lumped element) 
> Eine Leitung ist *elektrisch kurz*, falls die Leitungslänge $l$ deutlich kleiner als die Wellenlänge $\lambda$ bei der Betriebsfrequenz ist bzw. falls die Laufzeit $\uptau$ eines **Sinusförmigen** Signals längs der Leitung deutlich kleiner ist als die Periodendauer $T$ ist.  
>
> $$
> \lambda = \frac{c_{0}}{f}\gg l \qquad \text{oder} \qquad \uptau = \frac{\text{Strecke}}{\text{Geschwindigkeit}} = \frac{l}{c_{0}} \ll T = \frac{1}{f}
> $$
> 

> [!NOTE] nicht elektrisch kurz ($l>\frac{\lambda}{10}$) (engl. [Transmission Line](Transmission%20Line.md))
>  Zeigt die Spannung längs der Leitung **keinen** konstanten Verlauf mehr, so ist die Leitung ==nicht== als elektrisch ==kurz== anzusehen. In der Praxis geht man davon aus, dass der Effekt ab einer Leitungslänge von **einem Zehntel der Wellenlänge** bedeutsam wird.
>  $$\boxed{ l > \frac{\lambda}{10} }$$
> - Bei digitalen Signalen gilt dies für die Flankenanstiegszeit von 10% bis 90% des Pegels
> - *Alternativ:* 9x die Frequenz des schnellsten digitalen Signals
>     - da ab der 9ten Harmonischen kann das Signal als Rechecksignal klassifiziert werden.
