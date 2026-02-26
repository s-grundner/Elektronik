---
tags: 
aliases:
  - Mealy
  - Moore
  - FSM
  - Finite State Machine
keywords:
  - Mealy
  - Moore
subject:
  - Technische Informatik
  - KV
semester: WS23
created: 28. November 2023
professor:
  - Timm Ostermann
---
 

# Automatentheorie

> [!question] [Sequenzielle Logik](Sequenzielle%20Logik.md)

---

**Blöcke**

- $\delta$ ... Zustandsüberführungsfunktion
- $\lambda$ ... Ausgabefunktion
- $M$ ... Memory / Speicher

**Zustände**

- $i(t)$ ... Initial Condition
- $s(t)$ ... State
- $o(t)$ ... Output

## Moore Automat


![invert_dark|400](../_assets/Pasted%20image%2020250520225549.png)

$$
\begin{align}
o(t)&= \lambda (s(t)) \\
s(t+1) &= \delta(i(t),s(t))
\end{align}
$$

Hier ist der Ausgang **indirekt** abhängig von dem Anfangswert.

> [!example]- Beispiel
> 
> ![invert_dark](../_assets/Pasted%20image%2020250521001259.png)
> 
> $$
> \begin{array}{c|c|c}
> i(t) & & a\quad b\\ \hline
> s(t) & o(t) & s(t+1) \\ \hline
> u & 0 & u \quad v\\
> v & 1 & u \quad x\\
> x & 1 & v \quad u
> \end{array} \qquad
> \begin{array}{c|ccccccc}
> t & 0 & 1 & 2 & 3 & 4 & 5 & 6 \\
> i(t) & a & b & b & a & a & b \\ \hline
> s(t) & v & u & v & x & v & u & v \\ \hline
> o(t) & 1 & 0 & 1 & 1 & 1 & 0 & 1
> \end{array}
> $$
> 
> Aus der Wahrheitstabelle
> 
> $\lambda : (u,v,x)\mapsto (0,1,1)$
> $\delta : (u,v,x) \mapsto \begin{cases} (u,u,v)  & \text{für } i=a \\ (v,x,u)  & \text{für } i=b\end{cases}$

## Mealy Automat



![invert_dark|400](../_assets/Pasted%20image%2020250520231609.png)

$$
\begin{align}
o(t)&= \lambda (i(t), s(t)) \\
s(t+1) &= \delta(i(t), s(t))
\end{align}
$$

Hier ist der Ausgang **direkt** abhängig von dem Anfangswert.

> [!hint] Der Ausgangswert steht am Pfeil

> [!example]- Beispiel
>
> ![invert_dark|400](../_assets/Pasted%20image%2020250521003108.png)
> 
> $$
> \begin{array}{c|c|c}
> i(t) & a\quad b & a\quad b\\ \hline
> s(t) & o(t) & s(t+1) \\ \hline
> u & 0 \quad 1 & u \quad v\\
> v & 1 \quad 1 & u \quad x\\
> x & 1 \quad 0 & v \quad u
> \end{array} \qquad
> \begin{array}{c|ccccccc}
> t & 0 & 1 & 2 & 3 & 4 & 5 & 6 \\
> i(t) & a & b & b & a & a & b \\ \hline
> s(t) & v & u & v & x & v & u & v \\ \hline
> o(t) & 1 & 0 & 1 & 1 & 1 & 0 &
> \end{array}
> $$
> 
> Aus der Wahrheitstabelle
> 
> $\lambda : (u,v,x) \mapsto \begin{cases} (0,0,1) & \text{für } i=a \\ (1,1,0) & \text{für } i=b\end{cases}$
> $\delta : (u,v,x) \mapsto \begin{cases} (u,u,v) & \text{für } i=a \\ (v,x,u) & \text{für } i=b\end{cases}$

## Äquivalenz der Automaten

> [!def] **D1)**
> Zwei Automaten werden als äquivalen betrachtet wenn sie immer beide für die gleiche Folge von möglichen Eingagnsvariablen die gleiche Folge an Ausgangsvariablen liefern

Dies führt bei der Äquivalenz von Moore und Mealy Automat zu einem Problem, da der erste Ausgangswert des Moore Automaten ausschließlich von dem Anfangszustand abhängt. Ein Eingangssignal wirkt sich erst ab dem zweiten Ausgangswert einer Folge aus.

Mealy und Moore Automaten können daher allgemein nie äquivalent im Sinne der Definition **D1** sein.

> [!def] **D2)**
> Ein Moore und ein Mealy Automat werden als äquvalent betrachtet, wenn sie immer beide für die gleiche Folge von möglichen Eingangsvariablen die gleiche Folge an Ausgangsvariablen liefern, *wenn der erste Ausgangswert des Moore-Automaten gelöscht wird*.


---
### Entwicklung von Mealy-Automaten

>[!example] Erkennung von Folge: abba $\to$ Lampe geht an  
> Input: ababbbaabbabbaaababbaabbb  
![invert_dark|500](../_assets/exMealy.jpg)
> 
> Erweitern mit Leerzeichen:  
![invert_dark|500](../_assets/exMealyErw.jpg)

### Mealy-Moore Transformation

![invert_dark|500](../_assets/exMoore.jpg)
