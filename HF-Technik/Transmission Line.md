---
tags:
  - RF
aliases:
  - HF-Übertragungsleitung
keywords: 
subject:
  - KV
  - HF-Systemtechnik 1
semester: WS24
created: 4. Oktober 2024
professor:
  - Reinhard Feger
---
 

# Transmission Line (TL)

Eine Leitung wird als TL behandelt wenn das Signal auf dieser Leitung als ein [RF-Signal](RF-Signal.md) klassifiziert wird.

Hier kann die Verbindung zwischen Toren/Komponenten nicht mehr Vernachlässigt werden und wird in der Schaltung mit modelliert:

![](assets/Pasted%20image%2020241003150148.png)

Eine TL ist elektrisch kurz: ${ l > \dfrac{\lambda}{10} }$

Eine TL wird mit serien induktivitäten und parallel kapazitäten modelliert (Leitermodell)

## Geometrien von HF-Leitungen

### TEM-Moden

siehe: [Transversale EM-Welle](Transversale%20Elektromagnetische%20Welle.md)

> [!success] Nicht frequenzabhängig. Funktionieren für Alle frequenzen (auch DC) gleich


![](assets/Pasted%20image%2020241010140019.png)

### Andere Moden

HF-Leitungen höherer ordnung

> [!warning] Funktionieren nicht für alle Frequenzen gleich

![](assets/Pasted%20image%2020241010140356.png)

- Rectangular Waveguide (Rechteck Hohlleiter)
- [LWL](Lichtwellenleiter.md) - Dielektrischer Wellenleiter Licht Als EM-Welle durch nicht leitendes Dielektrikum
- Coplanarer Microstrip