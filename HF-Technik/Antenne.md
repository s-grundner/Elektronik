---
tags:
  - RF
aliases:
  - Antennen
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 23rd October 2025
professor:
  - Reinhard Feger
release: true
title: Antenne
---

# Antennen

## Grundbegriffe und Kenngrößen

Antennen erzeugen und empfangen [Elektromagnetische Wellen](../Physik/Elektromagnetische%20Wellen.md), die sich im freien Raum ausbreiten:
- Im Sendefall: Antenne wandelt an die an ihrem [Tor](Streuparameter.md) zugeführte [Leistung](../Elektrotechnik/elektrische%20Leistung.md) möglichst effizient in eine EM-Welle um.
- Im Empfangsfall: Die Antenne nimmt aus einen EM-Wellenfeld Energie auf und stellt diese an ihrem [Netzwerktor](Streuparameter.md) zur Verfügung.

### Antennen als Wellentypwandler

- Zumeist ist nur das ferne EM-Feld von technischem Interesse
- Da jede Antenne in [hinreichend großem Abstand](HF-Technik/Fernfeld%20und%20Nahfeld.md) als klein angesehen werden kann, ist eine Beschreibung in Kugelkoordinaten zweckmäßig.
- Die Antenne erzeugt ein Wellenfeld (Freiraumwelle), welches Leistung von der Antenne fortführt (a).
- Im Empfangsfall (b) nimmt eine Antenne Energie aus einem Wellenfeld auf und regt eine Leitungswelle an ihrem Netzwerktor (Tor 2) an.

>[!summary] Sende- & Empfangsfall  
>![invert_light|800](../_assets/ant_sende_empf.png)


### Reziprozitätsgesetz

> [!hint] Der Sende und Empfangsfall sind [reziprok](../Index/Reziprok.md).
> 
> Die Strahlungseigenschaften und auch die [Impedanz](../Elektrotechnik/Impedanz.md) sind im Sende und Empfangsfall gleich.
> Dieser Zusammenhang wird als Reziprozität bezeichnet.
> 
> Praktisch:
> - Die Antenne gibt im Sendefall ihre maximale Strahlungdichte in eine Richtung ab.
> - Ebenso koppelt die Antenne im Empfangsfall die maximale [Leistung](../Elektrotechnik/elektrische%20Leistung.md) einer Welle aus, wenn sie aus einer bestimmten Richtung auf die Antenne trifft.

### Richtwirkung

Zur Beschreibung der Richtwirkung gibt des einfachere Modelle, welche eine Bezugsgröße zur Abgestrahlten Leistungsdichte $S$ komplexerer Antennenbauformen leifern 

- [Isotroper Kugelstrahler](HF-Technik/Isotroper%20Kugelstrahler.md) (Mathematisch einfach aber nicht realisierbar)

![Isotroper Kugelstrahler](HF-Technik/Isotroper%20Kugelstrahler.md#^DIRECTIVITY)

- [Hertzscher Dipol](HF-Technik/Hertzscher%20Dipol.md) (Mathematisch schwerer zu Berschreiben, jedoch realisierbar und daher messbar)

### Antennengewinn

Die Direktivität ist ein idealer Faktor bei dem die Leistung jeder Richtung in Summe die Speiseleistung ergibt. Die Antenneneffizienz  $\varepsilon_{\mathrm{ant}}$ dient als richtungsunabhängiger Wirkungsgrad wodurch der **Antennengewinn** $G(\theta,\phi)$ zustande kommt.

> [!def] **Antennengewinn** (Gain) $G(\theta,\phi)$ ^GAIN
> 
> $$ G(\theta,\phi) = \varepsilon_{\mathrm{ant}}D(\theta,\phi) $$

### Antennenwirkfläche

![Antennenwirkfläche](HF-Technik/Antennenwirkfläche.md#^AEFF)

## Antennenbauformen und Modelle

- Drahtantennen
- [Richtantennen](Richtantennen.md)
- Halbwellendipol

# Quellen

![Starlink und Richtantennen](https://www.youtube.com/embed/qs2QcycggWU)

- Fringing Field -> Randfeld

## 9:27

- [TEM-Welle](Transversale%20Elektromagnetische%20Welle.md) -> Amplituden sind Normal zur Ausbreitungsrichtung
- $\vec E\times\vec H$ visualisiert

## 25:30

Quadratur Amplituden [Modulation](Modulation.md) ([QAM](Quadratur%20Amplituden%20Modulation.md))
