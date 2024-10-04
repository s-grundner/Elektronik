---
tags: 
aliases: 
keywords: 
subject:
  - KV
  - HF-Systemtechnik 1
semester: WS24
created: 4. Oktober 2024
professor:
---
 

# RF-Signale

> [!question] Was ist ein RF Signal?
> 
> - Hauptsächlich von Komponentengrößen und Verbindungslängen abhängig.
> - Ist am Ende der Leitung der **gleiche pegel** wie am Anfang?
>     - Beim RF-Signalen nicht trivial.
> - Ist die Leitungslänge viel größer als die Wellenlänge ist spricht man von einem RF-Signal

> [!success] Besonderheiten bei RF-Signalen
> - [Leitungstheorie](../../../HF-Technik/Leitungstheorie.md) muss beachtet werden.
>     - Leitungen auf denen RF-Signale übertragen werden müssen als [Transmission Lines](Transmission%20Line.md) (TLs) behandelt werden.
> - Auf einer [TL](Transmission%20Line.md) müssen nicht nur zeitliche sondern auch **örtliche** Änderungen berücksichtigtwerden
>     - Abhängig vom [Leiter](../../../Physik/Materialkunde/{MOC}%20Materialkunde.md#Leiter)
>     - In [Dielektrika](../../../Physik/Materialkunde/{MOC}%20Materialkunde.md#Substrate) wandert das Signal unterschiedlich schnell
>     - RF Signale breiten sich nicht nur auf Leitern aus sondern auch in Substraten aus (in allen achsen xyz)

> [!warning] Variation über ort und zeit
> ![600](assets/Pasted%20image%2020241003145606.png)

## Frequenz vs. Leitungslänge

> [!NOTE] elektrisch kurze Leitung (engl. lumped element) 
> Eine Leitung ist *elektrisch kurz*, falls die Leitungslänge $l$ deutlich kleiner als die Wellenlänge $\lambda$ bei der Betriebsfrequenz ist bzw. falls die Laufzeit $\uptau$ eines **Sinusförmigen** Signals längs der Leitung deutlich kleiner ist als die Periodendauer $T$ ist.  
>
> $$\lambda = \frac{c_{0}}{f}\gg l \qquad \text{oder} \qquad \uptau = \frac{\text{Strecke}}{\text{Geschwindigkeit}} = \frac{l}{c_{0}} \ll T = \frac{1}{f}$$


> [!NOTE] nicht elektrisch kurz ($l>\frac{\lambda}{10}$) (engl. [Transmission Line](Transmission%20Line.md))
>  Zeigt die Spannung längs der Leitung **keinen** konstanten Verlauf mehr, so ist die Leitung ==nicht== als elektrisch ==kurz== anzusehen. In der Praxis geht man davon aus, dass der Effekt ab einer Leitungslänge von **einem Zehntel der Wellenlänge** bedeutsam wird.
>  $$\boxed{ l > \frac{\lambda}{10} }$$
> - Bei digitalen Signalen gilt dies für die Flankenanstiegszeit von 10% bis 90% des Pegels
> - *Alternativ:* 9x die Frequenz des schnellsten digitalen Signals
>     - da ab der 9ten Harmonischen kann das Signal als Rechecksignal klassifiziert werden.
> - Auf elektrisch kurzen Leitungen ist die [Leitungstheorie](Leitungstheorie.md) anzuwenden
