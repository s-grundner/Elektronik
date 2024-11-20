---
tags: 
aliases:
  - Verschiebung und Skalierung
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 2. Oktober 2024
professor:
---
 

# Elementare Operationen

- Amplituden Verschiebung (Erhöhung, Erniedrigung) - keine echte Elementare operation, da außerhalb des Argumentes
- Zeitverschieung (Verzögerung, Voreilung)
- Spiegelung
- Skalierung

![](assets/Pasted%20image%2020241120133723.png)

> [!important] Skalierungen (Streckungen bzw. Stauchungen) und Verschiebungen eines Signals $f(t)$ in Zeit- und Amplitudenrichtung lassen sich durch die Verwendung der Schreibweise
> 
> $$
> g(t)=A f\left(\frac{t-t_0}{T}\right)+a_0
> $$
>
> unmittelbar ablesen.
> **Zuerst:** Skalierung um $T$ in Zeitrichtung und $A$ in Amplitudenrichtung
> **Dann:** Verschiebung um $t_0$ in Zeitrichtung und $a_0$ in Amplitudenrichtung


|             | **Skalierung in Zeitrichtung**   |     |              | **Skalierung in Amplitudenrichtung**  |
| ----------: | :------------------------------- | --- | -----------: | :------------------------------------ |
|    $T< -1$: | Spiegelung und Streckung         |     |     $A< -1$: | Spiegelung und Streckung              |
|  $-1<T< 0$: | Spiegelung und Stauchung         |     |  $-1 <A< 0$: | Spiegelung und Stauchung              |
|    $0<T<1$: | Stauchung                        |     |     $0<A<1$: | Stauchung                             |
|      $1<T$: | Streckung                        |     |       $1<A$: | Streckung                             |
|             |                                  |     |              |                                       |
|             | **Verschiebung in Zeitrichtung** |     |              | **Verschiebung in Amlitudenrichtung** |
| $t_{0}< 0$: | Verschiebung nach *links*        |     |   $a_{0}<0$: | Verschiebung nach unten               |
|  $t_{0}>0$: | Verschiebung nach *rechts*       |     | $a_{0} > 0$: | Verschiebung nach oben                |
