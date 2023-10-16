---
tags:
  - Logik
  - Mathe
  - Mengenlehre
aliases:
  - Prädikat
  - Quantor
  - Allquantor
  - Existenzquantor
  - Prädikate
  - Quantoren
keywords:
  - Allquantor
  - Existenzquantor
  - einstelliges Prädikat
  - mehrstelliges Prädikat
subject:
  - Mathematik1
  - "357.100"
semester: 1
created: 8. Oktober 2023
professor: 
ref:
  - Def 1.7.
  - Def 1.9.
  - Satz 1.10.
---

# Prädikate und Quantoren

Aussagen können von Parametern abhängen. Dies führt uns zu *Prädikaten-* oder *Quantorenlogik*.

> [!abstract] *Definition 1.7.* ein *einstelliges Prädikat* $A(\cdot)$ ist ein sprachlicher Ausdruck mit **einer** Leerstelle und **einer** Klasse $M$, sodass gilt:  
> 	Durch Einsetzen eines Objekts $a$ aus der Klasse $M$ entsteht eine Aussage $A(a)$.
> 
> Mithilfe des *Allquantors* $\forall$ und des *Existenzquantors* $\exists$, bildet man dies beiden Aussagen:  
>
> $$\forall a\in M : A(a) \qquad\text{und}\qquad\exists a\in M : A(a)$$
>
> deren Wahrheitswerte definieren sich durch:  
> $|\forall a\in M:A(a)|=W:\iff$ für alle $a\in M$ ist $A(a)$ wahr,  
> $|\exists a \in M:A(a) |=W\iff$ es existier ein $a \in M$, sodass $A(a)$ wahr ist
> 
> Ist $M$ eine leere Menge $\emptyset$, so definiert man  
> $\forall a \in \emptyset:A(a)$ ist eine Tautologie  
> $\exists a\in \emptyset:A(a)$ ist eine Kontradiktion 

> [!ABSTRACT] *Definition 1.9.* Ein *zweistelliges Prädikat* $A(\cdot_{1}, \cdot_{2})$ ist ein sprachlicher Ausdruck mit **zwei** Leerstellen **zwei** Klassen $M_{1}$ und $M_{2}$ von Objekten, sodass gilt:  
> Durch Einsetzen eines Objektes $a$ aus der Klasse $M_{1}$ in die erste Leerstelle von $A(\cdot_{1},\cdot_{2})$ entsteht ein *einstelliges Prädikat* $A(a, \cdot_{2})$, dessen Leerstelle die zweite Stelle von $A(\cdot_{1},\cdot_{2})$ ist und dessen Einsetzungsklasse $M_{2}$ ist.
> 
> Durch Einsetzen eines Objekts $b$ aus der Klasse $M_{2}$ in die zweite Leerstelle von $A(\cdot_{1}, \cdot_{2})$ entsteht ein *einstelliges Prädikat* $A(\cdot_{1},b)$, dessen Leerstelle die erste Stelle von $A(\cdot_{1},\cdot_{2})$ ist und dessen Einsetzungsklasse $M_{1}$ ist.

Ist $A(\cdot_{1},\cdot_{2})$ ins zweistelliges Prädikat für das gilt $M_{1}=M_{2}:=M$, dann schreibt man:  

$$\forall a,b\in M:A(a,b)\qquad\text{statt}\qquad \forall a \in M\forall b \in M:A(a,b)$$

bzw.

$$\exists a,b \in M : A(a,b)\qquad\text{statt}\qquad\exists b\in M\exists a\in M:A(a,b)$$

> [!ABSTRACT] *Satz 1.10.* sei $A(\cdot_{1},\cdot_{2})$ ein zweistelliges Prädikat mit Einsetzungsklassen $M_{1}$ und $M_{2}$. Dann gilt:  
> 
> (a) $\forall a\in M_{1} \forall b\in M_{2} :A(a,b)\equiv \forall b\in M_{2}\forall a\in M_{1}:A(a,b)$  
> 
> (b) $\exists a\in M_{1}\exists b \in M_{2}: A(a,b)\equiv \exists b\in M_{2}\exists a\in M_{1}:A(a,b)$  
> 
> (c) $\neg(\forall a\in M_{1}\forall b\in M_{2}:A(a,b))\equiv\exists \in M_{1}\exists b \in M_{2} :(\neg A(a,b))$  
> 
> (d) $\neg(\forall a\in M_{1}\exists b\in M_{2}:A(a,b))\equiv \exists a\in M_{1} \forall b \in M_{2}:(\neg A(a,b))$

> [!INFO] Zwei Allquantoren ($\forall$) die für das Gleiche Prädikat gelten sind mit sprachlich  einem *und*  verknüpft

> [!INFO] Zwei Existenzquantoren ($\exists$) die für das gleiche Prädikat gelten, sind sprachlich mit einem *sodass* verknüpft

## Sätze mit Quantoren richtig Beweisen

> [!IMPORTANT] Für einen Beweis mit Quantoren ist die symbolische Schreibweise in sprachliche Ausdrücke zu übersetzen.

>[!EXAMPLE] Sprachlicher Beweis: $\neg(\forall a \in M:A(a))\equiv \exists a \in M:(\neg A(a))$
> - $\neg (\forall a \in M:A(a))$: Nicht für alle $a$ in $M$ gilt $A(a)$
> - $\exists a \in M:(\neg A(a))$: Es existiert ein $a$ aus $M$ sodass $A(a)$ falsch ist.
> 
> Diese beiden Aussagen sind logisch Äquivalent

> [!WARNING] Aufpassen mit Beispielen
> Eine Beispiel-Menge zu definieren und dann den Satz durch einsetzen der Menge in die Quantoren zu "Beweisen" zeigt nur, dass der Satz für diese Menge gilt und nicht für alle Mengen.
> *Testen* $\neq$ *Beweisen*

> [!INFO] Für den Beweis einer Existenz-Aussage genügt es, eine Aussage zu beweisen

