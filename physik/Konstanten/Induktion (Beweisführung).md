---
tags: 
aliases:
  - vollständige Induktion
  - Induktionsbeweis
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester: 1
created: 27. Januar 2024
professor:
---
 

# Induktion (Beweisführung)

# Beispiele

## Aufgabe 1: Gleichung

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
=(n+1)^{2}(n+2)(n+3)
$$


$$

$$

### Induktionsvoraussetzung

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

$$
n^{2}(n+1)(n+2) + (4(n+1)^{3}+(n+1)^{2}-(n+1)) = (n+1)^{2}(n+2)(n+3)
$$

Nun können die Beiden Terme durch umrechnen auf die gleiche Form gebracht werden:

Entweder man multiplizie

---

## Aufgabe 2: Ungleichung

![](assets/Pasted%20image%2020240127134214.png)

## Aufgabe 3: Teilbarkeit