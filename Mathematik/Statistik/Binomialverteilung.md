---
tags: ["Statistik"]
aliases: [""]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
created: 16th November 2022
---

# Binomialverteilung $P(X)$

- Bei einem Zufallsexperiment gibt es nur $2$ Ergebnisse: $A$ oder $\neg{A}$
- Es werden $n$ gleichartige Versuche durchgeführt.
- Die Einzelversuche sind voneinander unabhängig.
- Die [Zufallsvariable](Zufallsvariable.md) $X$ gibt an, wie oft bei $n$ Versuchen das Ergebnis $A$ eintritt.

Die Binomialverteilung ist eine Verteilungsformel, mit der die Wahrscheinlichkeiten für verschiedene Ergebnisse bei einem Zufallsexperiment bestimmt werden können.

Bei einem solchen Experiment gibt es nur zwei mögliche Ergebnisse: $A$ oder $\neg{A}$.  
Die Einzelversuche sind voneinander unabhängig und die Zufallsvariable $X$ gibt an, wie oft bei $n$ Versuchen das Ergebnis $A$ eintritt.

>[!summary] $$p=P(A)$$

Dann ist $X$ binomialverteilt mit den Parametern $n$ und $p$
>[!summary] $$P(X=k)=\binom{n}{k}\cdot p^{k} \cdot (1-p)^{n-k}$$
>
> mit
> - $n\dots$ Anzahl der Versuche
> - $k\dots$ Anzahl der Erfolge
> - $p\dots$ [Wahrscheinlichkeit](Wahrscheinlichkeit.md) eines Erfolgs
> - $\binom{n}{k}\dots$ Binomialkoeffizient 

## Kennwerte

[Varianz](Varianz.md): $V(X)=n\cdot p\cdot(1-p)$


>[!summary] [Erwartungswert](Erwartungswert.md) $E(X)$  
> $E(X)=n\cdot p$

>[!summary] [Standardabweichung](Standardabweichung.md)  
> $\sigma(X)=\sqrt{n\cdot p\cdot (1-p)}$

![binom_tree](../../_assets/binom_tree.png)

## Unbekanntes $n$

> [!EXAMPLE] Wie viele Tickets kann man verkaufen, sodass mit [WSK](Wahrscheinlichkeit.md)$=0.9$ der Flug nicht überbucht ist? 
> - Fluglinie überbucht Flüge (200 Sitze)
> - WSK, dass ein gebuchter Passagier erscheint, $p=0.93$  
> $P(x\leq200)=P(x=0)+P(x=1)+\dots+P(x=200)\geq 0.9$
> > [!success] Lösung  
> > ausprobieren mit Taschenrechner: binomial CD kumulierte Binomialverteilung  
> > $n=210$

## Unbekanntes $k$ bei gegebener [WSK](Wahrscheinlichkeit.md)

> [!EXAMPLE] Bsp  
> $n=6\qquad p=0.4$  
> bei welchem $k$ gilt $P(x\leq k)>0.6$


> [!EXAMPLE] Würfeln mit einem Würfel
> - Entweder 6 oder nicht 6
> - 4 Versuche
> - 6er bei einem Würfel
> > [!success] Lösung  
> > $$
> > \begin{align*}
> > P(k=4) = \binom{4}{4} \cdot\left(\frac{1}{6}\right)^{4} \cdot\left(\frac{5}{6}\right)^{0} = \frac{1}{6^{4}}\\
> > P(k=2) = \binom{4}{2} \cdot\left(\frac{1}{6}\right)^{2} \cdot\left(\frac{5}{6}\right)^{2} = \frac{1}{6^{4}}\\
> > P(k=3) = \binom{4}{3} \cdot\left(\frac{1}{6}\right)^{3} \cdot\left(\frac{5}{6}\right)^{1} = \frac{1}{6^{4}}\\
> > P(k=1) = \binom{4}{1} \cdot\left(\frac{1}{6}\right)^{1} \cdot\left(\frac{5}{6}\right)^{3} = \frac{1}{6^{4}}\\
> > P(k=6) = \binom{4}{0} \cdot\left(\frac{1}{6}\right)^{0} \cdot\left(\frac{5}{6}\right)^{4} = \frac{1}{6^{4}}
> > \end{align*}
> > $$




> [!EXAMPLE] Prüfe, ob folgende [Zufallsvariable](Zufallsvariablen) $X$ binomialverteilt ist  
>![Pasted image 20221122111119](../../_assets/Pasted%20image%2020221122111119.png)
> > [!success] Lösung  
> > 2. Nein, das ziehen eines Asses ist davon abhängig, wie viele bereits gezogen wurden  
> > 3. Ja: $P=\frac{1}{20}$

> [!EXAMPLE] Prüflos  
> ![725](../../_assets/Pasted%20image%2020221122112926.png)
> > [!success] Lösung

# Quellen