---
tags: ["Baugruppen/Oszillator"]
aliases: ["BHK", "Barkhausen Kriterien"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 2nd January 2023
---

# Herleitung der Schwingbedingungen eines [Oszillator](Clock%20Generierung.md)

## Aussagen aus dem Barkhausen Kriterium:

- Die vom Rückkoppelnetzwerk hervorgerufene [Dämpfung](../Dämpfung.md) muss vom Verstärker kompensiert werden 
- Die Eingekoppelte Spannung $\overline{U_{1}}$ und die Rückgekoppelte Spannung $\overline{U_{3}}$
- Ist Betrag von $|g|=|k|\cdot|A|< 1$, kann keine Schwingung entstehen
- Ist Betrag von $|g|=|k|\cdot|A|> 1$, wächst die Amplitude an, bis sie durch nichtlineare Bauelemente begrenzt wird.
- Das Rückkoppelnetzwerk ist Frequenzselektiv
- Die Anregung der Schwingung erfolgt aus dem Rauschen oder aus einer Störung heraus

## Herleitung der Schwingfähigkeit eines Oszillators

![Pasted image 20230124212033](assets/Pasted%20image%2020230124212033.png)

| Verstärker                                                        | Rückkoppler                                            |
| ----------------------------------------------------------------- | ------------------------------------------------------ |
| - $U_{2}=A\cdot U_{1}$                                            | - $U_{3}= k\cdot U_{2}$                                |
| - parasitäre Phasenverschiebung $\alpha$ von $U_{2}$ nach $U_{1}$ | - Rückkoppelnetzwerk (z.B. [Schwingkreise](../../mathe/mathe%20(4)/Schwingkreise.md))          |
|                                                                   | - Phasenverschiebung $\beta$ <br> $U_{2}$ nach $U_{3}$ |

>[!summary] $U_{1}=U_{3}=k\cdot U_{2}=\underbracket{k\cdot A}_{g}\cdot U_{1}$  
> $g$ … Schleifenverstärkung
> >[!IMPORTANT] $g=1$, wenn das BHK erfüllt ist

# Tags