---
tags:
  - Mathe
  - Logik
aliases:
  - Kontrapositionsregel
  - De Morgansche Regel
  - De Morgan
  - reduction ad absurdum
  - Assoziativgesetz
  - Assoziativgesetze
  - Distributivgesetz
  - Distributivgesetze
  - Beweis
keywords:
  - De Morgan
  - Kontrapositionsregel
  - reduction ad absurdum
  - Distributivgesetze
  - Assoziativgesetze
subject:
  - Mathematik1
  - "357.100"
semester: 1
created: 2. Oktober 2023
professor:
  - Andreas Neubauer
ref:
  - Satz 1.5
---
 

# Regeln des logischen Schließens

Beim Beweis mathematischer Sätze verwendet man oft folgende Beziehungen, die man *Regeln des logischen Schließens* nennt.

> [!ABSTRACT] *Satz 1.5*[^1] - Seien $A$, $B$, $C$ beliebige Aussagen, $T$ eine Tautologie und $K$ eine Kontradiktion, dann gilt:  
> (a) $\neg(\neg A)\equiv A$  
> 
> (b) $\left.\begin{align}\neg (A\wedge B)\equiv \neg A\vee \neg B \\ \neg (A\vee B)\equiv \neg A \wedge \neg B\end{align}\quad\right\}\text{ De Morgansche Regeln}$  
> 
> (c) $A\implies B\equiv\neg(A\wedge \neg B) \equiv\neg A\vee B$  
>
> (d) $A\implies B\equiv \neg B\implies \neg A\quad\}\text{ Kontrapositionsregel}$  
> 
> (e) $A\implies B\equiv A\wedge \neg B\implies K$  
> 
> (f) $(A\implies B)\wedge(B\implies C)\implies(A\implies C)\equiv T$  
> 
> (g) $A \iff B\equiv(A\implies B)\wedge(B\implies A)$  
> 
> (h) $(A\implies B)\wedge A\implies B\equiv T$
> 
> (i) $\left.\begin{align}A\wedge (B\vee C)\equiv (A\wedge B)\vee (A\wedge C)\\ A \vee (B\wedge C)\equiv (A\vee B)\wedge(A\vee C)\end{align}\quad\right\}\text{ Distributivgesetze}$
> 
> (j) $\left.\begin{align}(A \vee B) \vee C \equiv A \vee (B \vee C)\quad(=: A\vee B\vee C)\\(A \wedge B) \wedge C \equiv A \wedge (B \wedge C)\quad(=: A\wedge B\wedge C)\end{align}\quad\right\}\text{ Assoziativgesetze}$

## Methoden zur mathematischen Beweisführung

![](assets/Pasted%20image%2020240129163115.png)

![](assets/Pasted%20image%2020240129163127.png)

![](assets/Pasted%20image%2020240129163136.png)

![](assets/Pasted%20image%2020240129163146.png)

[^1]: Satz 1.5 - [Skriptum - Andreas Neubauer](../xEDU/JKU/Mathe/mathematik.pdf), [S. 6]