---
tags:
  - index
aliases:
  - HF-Technik
  - Hochfrequenztechnik
  - RF-Engineering
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 15th January 2026
professor:
  - Reinhard Feger
release: true
title: HF-Technik
---

# HF-Technik

> [!question]  HF-Technik beschäftigt sich mit der forschung und anwendung von [elektromagnetischer Wellen](../Physik/Feldtheorie/index.md) als Medium zur Übertragung von Nutzsignalen.

Als Übetragungskanal können EM-Wellen 

- mit [elektrischer Leiter](../Chemie/elektrischer%20Leiter.md) (PCB-Stripline, Koaxialkabel, Hohlleiter) geführt werden.
	- Themengebiet [Leitungstheorie](Leitungstheorie.md)
- über [dielektrische Medien](../Elektrotechnik/Dielektrikum.md) (Luft, PCB-Substrat) ausgebreitet werden.
	- Themengebiet [Feldtheorie](../Physik/Feldtheorie/index.md)

> [!question] Was gilt als Hochfrequent? [Leitungstheorie](Leitungstheorie.md)

## Telegrafengleichung

In der [HF-Technik](index.md) ist man häufig daran Interessiert, wie sich Strom und Spannungswellen auf einer Leitung bzw. [EM-Wellen](../Physik/Feldtheorie/index.md) in einem Medium ausbreiten. Wellen variieren sowohl örtlich als auch zeitlich. Die Wellenbetrachtung ist vorallem für [RF-Signale](Leitungstheorie.md) notwendig. Man sucht im Allgemeinen einen Weg, die Welle mathematisch zu beschreiben. Die Telegrafengleichungen leifern ein solches Modell.

Zum aufstellen und lösen der [Wellengleichung](../Physik/Feldtheorie/Wellengleichung.md) gibt es in der Elektrotechnik zwei relevante herangehensweisen:

- Telegrafengleichung allgemein im Zeitbereich: [D'Alembertsche Wellengleichung](../Physik/Feldtheorie/Wellengleichung.md)
- Telegrafengleichung vereinfacht für Sinusgrößen: [Helmholtzsche Differenzialgleichung](Helmholtzsche%20Differenzialgleichung.md)

Unter der Telegrafengleichung können zwei Anwendungsbereiche gemeint sein:

- **Telegrafengleichung**: Die Ausbreitung von $\mathbf{E}$ und $\mathbf{H}$ Feld in einem Medium (*Elektrodynamik*)
- **Telegrafenleitungsgleichung**: Die Ausbreitung einer Strom und Spannungswelle auf einer Leitung (*Leitungstheorie*)

![invert_dark](../_assets/Excalidraw/FeldVsLeitungstheorie.svg)
%% [Edit in Excalidraw](../_assets/Excalidraw/FeldVsLeitungstheorie.md) %%
## Herausforderungen in der HF-Technik

**Design Komplexität**

- Entwurf von HF-Schaltungen und Leiterplatten erfordert nicht nur das Wissen von konventionellen Schaltungsentwurf, hinzu kommt vorallem [Elektromagnetismus](../Physik/Feldtheorie/index.md) und Signalverarbeitung (analog/digital).
- Bei Leiterplatten: Nicht nur diskrete Bauteile sind von bedeutung, auch die verbindungen dazwischen sind zu berücksichtigen.
- Geometrie von elektrischen Leitern ist relevant.

**Design Einschränkungen**

- Material Limitationen
- empfindlich auf [Elektromagnetische Inteferenz](../Analog-Design/Elektromagnetische%20Verträglichkeit.md) von benachbarten Schaltungen (geteiltes Medium).
- Kosten (Hochwertige PCB Substrate, [HDI](../Analog-Design/High%20Density%20Interconnect.md))

## Anwendungen der HF-Technik

Hohe Frequenzen ermöglichen:

- Höhere Datenraten für Übertragungen
- Kompaktes [Antennen](Antenne.md) Design.

Klassische Anwendungen im [Mikrowellenbänder](Mikrowellenbänder.md) des Elektromagnetischen Spektrums

- $f \in [300~\mathrm{MHz}; 300~\mathrm{GHz}]$
- $\lambda \in [1~\mathrm{m}; 1~\mathrm{mm}]$

Gebiete

- [Drahtlose Übertragung](Drahtlose%20Übertragung.md)
- Radar Systeme
- Satelliten Kommunikation
- Medizinische Bildgebung
### Drahtlose Netzwerke

> [!exmple]  WLAN-Router: WIFI-6, 5G 4x4 MIMO
> 
> - Viele verscheidene teilbereiche: HF-Block für WLAN (oben links) und Bluetooth, Prozessor für Digitale Signalverarbeitung. 
> - Theoretisch hunderte GBit/s möglich
> - Frequenzbereich von 2.4 GHz bis 71 GHz
> - Multiple-input multiple-output (MIMO) antennen konfiguration. (Schwarze und Beige Kästchen im HF-Bereich)
>
> ![500](../_assets/Pasted%20image%2020260116010357.png)
> 
> [Image Ref](https://www.alibaba.com/trade/search?scene=invalid_items_initiate_imgsrch&escapeQp=true&IndexArea=image_similar&productId=1600051487042&spm=a2700.details)

### Smartphones

> [!exmple] iPhone 12
> 
> - Smartphones kombinieren eine große anzahl an drahtlosen funktionen
> 	- Mobilfunk, WLAN, Bluetooth, GPS, FM-Radio
> - Niedrigere Frequenzen: z.B. FM-Radio $\sim 100~\mathrm{MHz}$
> - Hohe Frequenzen: z.B. 5G $39~\mathrm{GHz}$
> - ersichtlich ist hier, dass die Antennengeometrie eine wichtige Rolle spielt
> 
> 
> ![](../_assets/Pasted%20image%2020260116011444.png)
> 
>  [Image Ref](https://www.systemplus.fr/reverse-costing-reports/apple-iphone-12-series-mmwave-5g-chipset-and-antenna/)

### Navigation

> [!exmple] GNSS - Global Navigation Satellite System
> 
> - Ermittlung der Position und geschwindigkeit durch messung von Zeitverzögerung und Doppler-Verscheibungen.
> - Verschiedene Nationen verfügen über deren Eigene SatNav Systeme:
> 
> ![500](../_assets/Pasted%20image%2020260116012155.png)
> 
> [ImageRef](https://globalpos.com.au/pages/insights)
>
> Basiert auf HF-Prinzipien:
> - Eine EM-Welle, die sich in einem Medium (Freiraum) Ausbreitet weist eine gewisse Geschwigkeit ($\sim$ Lichtgeschwindigkeit) auf.
> - Die Satelliten senden Signale aus, welche eine gewisse Laufzeit zum empfänger aufweisen.
> - Der Empfänger misst die unterschiedlichen Laufzeiten, die die Welle von **mehreren Satelliten** benötigt. Können genügend Satelliten erreicht werden, kann so die Position bestimmt werden.
> 