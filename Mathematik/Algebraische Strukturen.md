---
tags: 
aliases:
  - Körper
keywords:
  - neutrales Element
  - inverses Element
subject:
  - VL
  - Signale und Systeme
  - Mathematik1
semester: WS24
created: 22. Oktober 2024
professor:
  - Andreas Neubauer
  - Andreas Stelzer
---
 

# Algebraische Strukturen

Strukturen bei natürlichen, ganzen und rationalen Zahlen

![](assets/Pasted%20image%2020241022085134.png)

wobei $M_0:=M \backslash\{0\}$, $\mathbb{R}, \mathbb{C}$ sind somit ein Körper $\mathbb{K}$

## Halbgruppe / Gruppe

Eine Algebra $(M, *)$
- heißt Halbgruppe, wenn sie in Bezug auf die Operation * dem **Assoziativgesetz** genügt.

Sie wird **kommutative** Halbgruppe genannt, wenn die Operation * zusätzlich **kommutativ** ist.
- heißt Gruppe, wenn sie in Bezug auf die Operation * dem Assoziativgesetz genügt, ein neutrales Element $e$ und zu jedem $a \in M$ ein bezüglich * inverses Element $a^{\prime}$ besitzt mit $a * a^{\prime}=e$.

Sie wird Abelsche Gruppe genannt, wenn die Operation * zusätzlich kommutativ ist.

## Ring / Körper

Eine Algebra $(M,+, \cdot)$
- heißt Ring, wenn $(M,+)$ eine Abelsche Gruppe und $(M, \cdot)$ eine Halbgruppe sind und das Distributivgesetz $a(b+c)=a b+a c$ und $(b+c) a=b a+c a$ gilt.
Die Elemente $l \neq 0$ und $r \neq 0$ heißen Nullteiler genau dann, wenn

$$
l \cdot r=0
$$


Ein Ring heißt nullteilerfrei (oder Integritätsbereich), wenn für alle $a, b \in M$ gilt

$$
a b=0 \quad \Longrightarrow \quad a=0 \vee b=0 .
$$

- heißt Körper, wenn $(M,+)$ und $(M \backslash\{0\}, \cdot)$ Abelsche Gruppen sind und das Distributivgesetz $a(b+c)=a b+a c$ und $(b+c) a=b a+c a$ gilt