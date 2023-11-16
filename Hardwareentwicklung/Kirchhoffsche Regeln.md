---
tags:
  - Schaltungsanalyse
aliases:
  - Maschenregel
  - Knotenregel
  - Kirchhoff
  - Kirchhoff'sche Regeln
created: 26. September 2023
---

# Kirchhoff'sche Regeln

> [!QUESTION] Die Kirchhoffschen Regeln stellen fast immer die Ausgangssituation bei der Analyse eines elektrischen Netzwerks dar [^1]

## Maschenregel

![InlineR](assets/Pasted%20image%2020230926161556.png)

> [!SUMMARY] Spannungen, deren Zählrichtung mit der Umlaufrichtung der Masche übereinstimmt, haben ein positives Vorzeichen.  
>
> $$M: -U_{q}+U_{1}+U_{2} = 0$$
>
> $$\Rightarrow U_{1}+U_{2} = U_{q}$$
>
> Allgemein:  
>
>$$\sum_{\text{Masche}}=0$$

## Knotenregel

![InlineR](assets/Pasted%20image%2020230926162529.png)

> [!SUMMARY] Die Summe der in einen Knoten fließenden Ströme muss gleich der Summe der aus dem Knoten herausfließenden Ströme sein.  
>
> $$K: I_{q}=I_{1}+I_{2}$$

> Allgemein:  
>
> $$\sum_{\text{Knoten}}=0$$

# Tags

[^1]: [Leitfaden ELIT](https://oeh.jku.at/sites/default/files/documents/pdfs/leitfaden_elit_2020.pdf)