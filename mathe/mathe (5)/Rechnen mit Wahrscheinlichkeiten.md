# Rechnen mit Wahrscheinlichkeiten
## Rechenregeln
### Additionssatz (ODER-Regel)

> [!summary] für beliebige Ereignisse
> $$P(A\vee B) = P(A) + P(B) - P(A\wedge B)$$

>[!summary] für unvereinbare Ereignisse
> $$P(A\vee B) = P(A) + P(B) - 0$$

### Multiplikationssatz (UND-Regel)

>[!summary] für beliebige Ereignisse
> $P(A\wedge B)=P(A)\cdot P(B|A)$
> - $P(B|A) = P\dfrac{A\wedge B}{P(A)}$
> - $P(A|B) = P\dfrac{A\wedge B}{P(B)}$

>[!summary] für unabhängige Ereignisse
> $P(A\wedge B)=P(A)\cdot P(B)$

## Unvereinbare Ereignisse

![[Pasted image 20230107220855.png]]

>[!summary] Wenn die Ereignisse $A$ & $B$ unvereinbar sind, dann gilt
>$P(A\vee B)=P(A)+P(B)$
>$P(A\wedge B)=0$
>

> [!example] Zweimaliges Werfen eines Würfels
> - $A$: Beim ersten Wurf "6" werfen;
> - $B$: beim ersten Wurf eine ungerade Augenzahl werfen;
> - $C$: beim zweiten Wurf "6" werfen;
> 
> $A$ ist unvereinbar mit $B\rightarrow$ man kann nicht zugleich "6" und dabei eine ungerade Augenzahl werfen.
> $A$ ist mit $C$ vereinbar
> $B$ ist mit $C$ vereinbar



## Bedingte Wahrscheinlichkeit $P(A|B)$

Ist $P(B)\neq 0$, so heißt der Wert  $P(A|B) = \dfrac{P(A\wedge B)}{P(B)}$ die Wahrscheinlichkeit von $A$, unter der Bedingung, dass $B$ eintritt.
- Die bedingte Wahrscheinlichkeit $A$ unter der Bedingung $B$

## Gegenereignis

>[!summary] Sei $E^C$ das Gegenereignis zu $E$, dann gilt:
> $P(E^C)=1-P(E)$

>[!example] gerade & ungerade Zahl beim Roulette
> $P(gerade) = 1-P(ungerade)$

 >[!example] 26 Schüler: 2 haben den selben Geburtstag
> $P(\text{min. 2 den selben Geb.}) = 1-P(\text{es gibt keine 2 mit selben Geb.})$
> 
> $\dfrac{365}{365}\cdot\dfrac{364}{365}\cdot\dfrac{363}{365}\dots\dfrac{340}{365} = \dfrac{365!}{365^{26}\cdot339!}=0.4$
> 
> $1-0.4=0.6$
