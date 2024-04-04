---
tags: 
aliases:
  - vollständige Induktion
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - B1
  - WS23
created: 27. Januar 2024
professor: 
source:
  - Sophie Öttl
---
 

# Induktion (Beweisführung)

# Beispiele

## Gleichung

Mittels der Vollständigen Induktion lässt sich Beweisen, dass Folgende Aussage Wahr ist: 

$$
\forall n \in\mathbb{N}: \sum_{k=1}^{n}(4k^{3}+3k^{2}-k) = n^{2}(n+1)(n+2) 
$$

### Induktionsanfang (IA)

Zuerst wird sie Anfangsbedingung eingesetzt. Da die Summe und die Natürlichen Zahlen bei $1$ Starten ist der Induktionsanfang $n=1$

$$
n=1: \quad 4+3-1 = 6 = 1\cdot 2\cdot 3 \quad ✅
$$

### Induktionsschluss (IS)

> [!info] $n$ geht über auf $n+1$  
> Voraussetzen dass die Formel für $n$ stimmt und überprüfen, ob die Formel für $n+1$ stimmt.

Nun gilt:

$$
n\to n+1: \quad \sum_{k=1}^{n+1}(4k^{3}+3k^{2}-k)
$$

 Man kann nun das letzte Element ($n+1$) herausnehmen und manuell dazu summieren. So ergibt sich:

 $$
\begin{align}
&\sum_{k=1}^{n+1}(4k^{3}+3k^{2}-k) =\\
&\sum_{k=1}^{n}(4k^{3}+3k^{2}-k) + (4(n+1)^{3}+(n+1)^{2}-(n+1))
\end{align}
$$

Dieser Ausdruck muss auch mit der Hypothese übereinstimmen:

$$
\overset! =(n+1)^{2}(n+2)(n+3)
$$

### Induktionsvoraussetzung (IV)

Wir nehmen an, die Formel aus der Angabe Stimmt. So setzen wir ein den Ausdruck aus dem Induktionsschluss ein: 

$$
\begin{align}
\sum_{k=1}^{n}(4k^{3}+3k^{2}-k) &= n^{2}(n+1)(n+2)\\
\text{Rechte Seite}&\text{ wird nun eingesetzt}\\
\sum_{k=1}^{n}(4k^{3}+3k^{2}-k) &+ (4(n+1)^{3}+(n+1)^{2}-(n+1))  \\
&\downarrow \\
n^{2}(n+1)(n+2) &+ (4(n+1)^{3}+(n+1)^{2}-(n+1))
\end{align}
$$

Der eingesetzte Ausdruck muss wieder dem zweiten Term aus der Hypothese entsprechen:

$$n^{2}(n+1)(n+2) + 4(n+1)^{3}+(n+1)^{2}-(n+1) $$

$$\overset! = (n+1)^{2}(n+2)(n+3)$$

> [!info] Nun können die Beiden Terme durch umrechnen auf die gleiche Form gebracht werden:  
> Eine Möglichkeit ist es, alles aus zu multiplizieren. Das funktioniert zwar immer, ist aber Aufwändig. Die Termen können einfach auf den gleichen Ausdruck umgeformt werden. auch wenn noch klammern enthalten sind:

Zur Vereinfachung wird $n+1$ herausgehoben:

$$
\cancel{ (n+1) }\cdot(n^{2}(n+2)+4(n+1)^{2}+(n+1)-1) \overset! = \cancel{ (n+1) }\cdot(n+1)(n+2)(n+3)
$$

Nun muss nur noch folgende Bedingung erfüllt sein, da aus dem zweiten Ausdruck auch $n+1$ herausgehoben werden kann:

$$n^{2}(n+2)+4(n+1)^{2}+(n+1)-1  \overset! = (n+1)(n+2)(n+3)$$

Nun den vereinfachten Ausdruck ausmultiplizieren:

$$
\begin{align}
n^{3}+6n^{2}+11n+6  &\overset! = (n+1)(n+2)(n+3) \\
n^{3}+6n^{2}+11n+6  & = n^{3}+6n^{2}+11n+6 \quad✅
\end{align}
$$

---

## Ungleichung

![](assets/Pasted%20image%2020240127134214.png)

## Teilbarkeit

## Rekursion

Angabe:
$T(n) = 100T(n/10)+ n^2$
$T(1)=1$

Annahme: $T(n)=n^2+\lg⁡(n)\cdot n^2$
Induktions Anfang: $T(1)=1^2+\lg⁡(1)\cdot 1^2=1$
Induktionsschritt $n \to \frac{n}{10}$:
$$
\begin{align}
T(n) &= 100\cdot T\left( \frac{n}{10} \right)+ n^2 \\
T(n) &= 100\cdot \left( \left( \frac{n}{10} \right)^2+\lg⁡\left( \frac{n}{10} \right)\cdot\left( \frac{n}{10} \right)^2  \right) + n^2 \\
T(n) &= 100\cdot \left( \left( \frac{n}{10} \right)^2\cdot \left( 1+\lg⁡\left( \frac{n}{10} \right)  \right) \right) + n^2 \\
T(n) &= 100\cdot \left( \left( \frac{n}{10} \right)^2\cdot (1+\lg⁡(n)-1 ) \right) + n^2 \\
T(n) &= 100\cdot \left( \frac{n^2}{100} \cdot \lg⁡(n) \right) + n^2 \\
T(n) &= n^2\cdot  \lg⁡(n)+ n^2
\end{align}
$$