---
tags: ["Statistik"]
aliases: ["geordnete Stichprobe", "geordnete Stichproben", "Variationen"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: ["Ing. Mathematik 4 - Timischl/Kaiser"]
created: 4th January 2023
---

# Variation
Eine *Variation* oder *geordnete Stichprobe* ist in der [Kombinatorik](Kombinatorik.md) eine Auswahl von Objekten aus einer Menge in einer bestimmten Reihenfolge.
- Die Menge muss nicht die [Grundmenge](Grundmenge.md) sein.
## ohne Wiederholung
Darf jedes Objekt nur einmal auftreten, spricht man von einer **Variation ohne Wiederholung**.

>[!summary] Formel
> $$\frac{n!}{(n-k)!}$$


```ad-example
title: Wv. Möglichkeiten gibt es, $4$ Schüler auf $6$ Plätze aufzuteilen?
- Ein Schüler kann nicht 2 Plätze belegen
- Sobald ein Schüler hingesetzt wurde, gibt es einen Platz weniger und ein Schüler wird von der Gesamtheit abgezogen. 

$$
6\cdot5\cdot4\cdot3= \frac{n!}{(\underbrace{n}_{\text{Plätze}}-\underbrace{k}_{\text{Schüler}})!}
$$
```

```ad-example
title: W.v. Möglichkeiten gibt es, aus 28 Vereinsmitglieder einen Präsidenten, einen Kassier und einen Schriftführer auszuwählen
- Ein Vereinsmitglied kann keine zwei Positionen einnehmen
- sobald eine Position vergeben wurde kann der Rest der Vereinsmitgleider auf die Restlichen Positionen aufgeteilt werden.
- Durch Multiplizieren ergibt sich dann die Anzahl an Möglichkeiten, die Mitglieder auf die Positionen aufzuteilen.
$$
28\cdot27\cdot26 = \frac{n!}{(n-k)!}
$$
```

## mit Wiederholung
Können Objekte dabei mehrfach ausgewählt werden, so spricht man von einer **Variation mit Wiederholung**.
>[!summary] Formel
$$n^{k}$$


```ad-example
title: Zahlensysteme: Variation von symbolen
- Dezimal: Basis $10 \rightarrow 10$ verschiedene Symbole $(0-9)$ werden $k$-mal variiert $\rightarrow 10^{k}$ Variationen
- Binär: Basis $2 \rightarrow 2$ verschiedene Symbole $(0-1)$ werden $k$-mal variiert $\rightarrow 2^{k}$ Variationen
- Hex: Basis $16 \rightarrow 16$ verschiedene Symbole $(0-F)$ werden $k$-mal varriert $\rightarrow 16^{k}$ Variationen
```

# Tags