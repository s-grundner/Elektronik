---
tags:
  - Mathe
  - Logik
aliases:
  - Kontrapositionsregel
  - De Morgansche Regel
  - De Morgan
  - Assoziativgesetz
  - Assoziativgesetze
  - Distributivgesetz
  - Distributivgesetze
  - Beweismathematik
  - Satz 1.5
keywords:
  - De Morgan
  - Kontrapositionsregel
  - Distributivgesetze
  - Assoziativgesetze
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 2. Oktober 2023
professor:
  - Andreas Neubauer
---
 

# Regeln des logischen Schließens

Beim Beweis mathematischer Sätze verwendet man oft folgende Beziehungen, die man *Regeln des logischen Schließens* nennt.

> [!important] **Satz 1.5**. Seien $A$, $B$, $C$ beliebige Aussagen, $T$ eine [Tautologie](Aussagenlogik.md) und $K$ eine [Kontradiktion](Aussagenlogik.md), dann gilt:  
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

- [Direkter Beweis](Modus%20Ponens.md)
- [Indirekter Beweis](Indirekter%20Beweis.md)
- [Widerspruchsbeweis](Widerspruchsbeweis.md)
- [Vollständige Induktion](Induktionsbeweis.md)
