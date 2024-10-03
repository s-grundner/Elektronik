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

Was ist ein RF Signal?

- Hauptsächlich von der komponentengröße und verbindungslängen abhängig
- Ist am ende der Leitung der **==gleiche pegel==** wie am anfang? Beim RF-Signalen nicht trivial.
- Ist die Leitungslänge viel größer als die Wellenlänge ist spricht man von RF
- [Leitungstheorie](../../../HF-Technik/Leitungstheorie.md) muss beachtet werden.
    - Leitungen auf denen RF-Signale übertragen werden müssen wie [Transmission Line](Transmission%20Line.md)s (TLs) behandelt werden.
- Auf einer [TL](Transmission%20Line.md) müssen nicht nur zeitliche sondern auch *örtliche* Änderungen berücksichtigtwerden
    - Abhängig vom [Leiter](../../../Physik/Materialkunde/{MOC}%20Materialkunde.md#Leiter),
    - [Dielektrikum](../../../Physik/Materialkunde/{MOC}%20Materialkunde.md#Substrate) wandert das signal unterschiedlich schnell

 > [!warning] Variation über ort und zeit
> ![600](assets/Pasted%20image%2020241003145606.png)

RF Signale breiten sich nicht nur auf Leitern aus sondern auch in Substraten aus (in allen achsen xyz)