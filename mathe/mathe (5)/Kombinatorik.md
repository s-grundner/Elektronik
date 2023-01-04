---
tags: ["Statistik"]
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: ["Ing. Mathematik 4 - Timischl/Kaiser"]
created: 24th October 2022
---

# Kombinatorik
![[Kombinatorik-formeln.PNG|700]]
## Produktregel
Vorgang in $k$ Schritten
- 1. Schritt hat $n_{1}$ Möglichkeiten
- 2. Schritt hat $n_{2}$ Möglichkeiten
- $k$. Schritt hat $n_{k}$ Möglichkeiten
Es gibt insgesamt $n_{1}\cdot n_{2}\dots n_{k}$ Möglichkeiten

## Permutationen
Unter einer **Permutation** versteht man in der Kombinatorik eine Anordnung von Objekten in einer bestimmten Reihenfolge.

Die Anzahl der Permutationen ohne Wiederholung ergibt sich als [Fakultät](https://de.wikipedia.org/wiki/Fakult%C3%A4t_(Mathematik) "Fakultät (Mathematik)"),
während die Anzahl der Permutationen mit Wiederholung über [Multinomialkoeffizienten](https://de.wikipedia.org/wiki/Multinomialkoeffizient "Multinomialkoeffizient") angegeben wird.

### ohne Wiederholung
![[Pasted image 20230104153716.png]]
Fakultät: 
$$n!$$
```ad-example
title: Wv. Möglichkeiten gibt es, $4$ Schüler auf $4$ Plätze aufzuteilen?
$$
4\cdot3\cdot2\cdot1 = \frac{4!}{(4-4)!} = 4!
$$
```

### mit Wiederholung
Multinomialkoeffizient:
$$
n! \choose {k_{1}!,\cdots, k_{n}!}
$$
```ad-example
title: "Teebeutel": Wv. Wörter kann man mit "EEEETTBUL" bilden?
Alle Buchstaben Verschieden, dann: $9!$
$$
\begin{align*}
E_{1}E_{2}E_{3}E_{4}T_{1}T_{2}B_{1}U_{1}L_{1}\\
\frac{9!}{\underbrace{4!}_{E}\cdot\underbrace{2!}_{T}\cdot\underbrace{1!}_{B}\cdot\underbrace{1!}_{U}\cdot\underbrace{1!}_{L}} &= \frac{9!}{4!\cdot 2!} = 7560
\end{align*}
$$
```

## Stichproben
### Geordnet (Variation)
#### ohne Wiederholung
$$\frac{n!}{(n-k)!}$$
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

#### mit Wiederholung
$$n^{k}$$
```ad-example
title: Zahlensysteme: Variation von symbolen
- Dezimal: Basis $10 \rightarrow 10$ verschiedene Symbole $(0-9)$ werden $k$-mal variiert $\rightarrow 10^{k}$ Variationen
- Binär: Basis $2 \rightarrow 2$ verschiedene Symbole $(0-1)$ werden $k$-mal variiert $\rightarrow 2^{k}$ Variationen
- Hex: Basis $16 \rightarrow 16$ verschiedene Symbole $(0-F)$ werden $k$-mal varriert $\rightarrow 16^{k}$ Variationen
```

### Ungeordnet (Kombination)
#### ohne Wiederholung
$n$ über $k$:
$$
\frac{n \cdot (n - 1) \cdot (n - 2) \cdot \ldots \cdot (n - k + 1)}{k!} = \frac{n!}{(n - k)! \cdot k!} = \binom{n}{n - k} = \binom{n}{k}
$$
```ad-example
title: 7 Personen: ABCEFG. Wv Möglchkeiten gibt es, eine 3er Gruppe zu bilden!
Keine Person kommt in einer Gruppe doppelt vor, und die Reihenfolge ist unwichtig.
ABC, ABE, ABF, BCF ...

```

#### mit Wiederholung

# Quellen
