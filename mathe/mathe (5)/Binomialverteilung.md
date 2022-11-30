---
tags: []
aliases: ["Binom"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 16th November 2022
---

# Binomialverteilung

- Bei einem Zufallsexperiment gibt es nur $2$ Ergebnisse: $A$ oder $\neg{A}$
- Es werden $n$ gleichartigen Versuche durchgeführt.
- Die Einzelversuche sind voneinander unabhängig.
- Die Zufallsvariable $X$ gibt an, wie oft bei $n$ Versuchen das Ergebnis $A$ eintritt.
$$p=P(A)$$
Dann ist $X$ binomialverteilt mit den Parametern $n\&p$
$$
\begin{align*}
P(X=k)&=\binom{n}{k}\cdot p^{k} \cdot (1-p)^{n-k}\\\\
E(X)&=n\cdot p\\
V(X)&=n\cdot p\cdot(1-p)&& \text{Varianz}\\
\sigma(X)&=\sqrt{n\cdot p\cdot(1-p)}&&\text{Standardabweichung}
\end{align*}
$$

## Würfeln mit einem Würfel
- Entweder 6 oder nicht 6
- 4 Versuche
- 6er bei einem Würfel
![[Binom-vert.svg]]

$$
\begin{align*}
P(k=4) = \binom{4}{4} \cdot\left(\frac{1}{6}\right)^{4} \cdot\left(\frac{5}{6}\right)^{0} = \frac{1}{6^{4}}\\
P(k=2) = \binom{4}{2} \cdot\left(\frac{1}{6}\right)^{2} \cdot\left(\frac{5}{6}\right)^{2} = \frac{1}{6^{4}}\\
P(k=3) = \binom{4}{3} \cdot\left(\frac{1}{6}\right)^{3} \cdot\left(\frac{5}{6}\right)^{1} = \frac{1}{6^{4}}\\
P(k=1) = \binom{4}{1} \cdot\left(\frac{1}{6}\right)^{1} \cdot\left(\frac{5}{6}\right)^{3} = \frac{1}{6^{4}}\\
P(k=6) = \binom{4}{0} \cdot\left(\frac{1}{6}\right)^{0} \cdot\left(\frac{5}{6}\right)^{4} = \frac{1}{6^{4}}


\end{align*}
$$


```ad-example
title: ![[Pasted image 20221122111119.png]]
1. 
2. Nein, das ziehen eines Asses ist davon abhängig, wie viele bereits gezogen wurden
3. Ja: $P=\frac{1}{20}$
```

```ad-example
title: ![[Pasted image 20221122112926.png|725]]

```

## unbekanntes $n$
````ad-example
title: Wie viele Tickets kann man verkaufen, sodass mit $WSK=0.9$ der Flug nicht überbucht ist? 
- Fluglinie überbucht Flüge (200 Sitze)
- WSK, dass ein gebuchter Passagier erscheint, $p=0.93$

$P(x\leq200)=P(x=0)+P(x=1)+\dots+P(x=200)\geq 0.9$

```ad-success
title: Lösung
ausprobieren mit Taschenrechner: binomial CD kumulierte Binomialverteilung
$n=210$
```
````

## unbekanntes $k$ bei gegebener $WSK$
````ad-example
title: Bsp
$n=6\qquad p=0.4$
bei welchem $k$ gilt $P(x\leq k)>0.6$
````

# Quellen