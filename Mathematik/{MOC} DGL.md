---
tags:
  - MOC
  - Infinitesimalrechnung
  - DGL
aliases:
  - DGL
  - Differenzialgleichungen
  - "#DGL"
  - AWP
subject:
  - Mathematik 3
  - VL
semester: WS24
professor:
  - Markus Passenbrunner
created: 14th March 2022
---

# Differentialgleichungen (DGL)

> [!info] Arten von Differentialgleichungen
>
> | gewöhnlich             | partiell                     |
> | --------------------- | ---------------------------- |
> | Linear                | Nichtlinear                  |
> | homogen               | inhomogen                    |
> | konstaner Koeffizient | nicht-konstanter Koeffizient | 
> 
> > [!info] Ordunung
> > Die höchste Vorkommende [Ableitung](Differenzialrechnung.md) in einer DGL nennen wir deren Ordnung

>[!example] Beispiel 2. Newtonsche Axiom: 
> $m\cdot x''(t) = F$
> - … ist ein Beispiel einer *gewöhnlichen* DGL zweiter Ordnung, das heißt die gesuchte Funktion für $x$ hängt nur von einerm Parameter $x(t)$ ab.
> - Anderfalls heit die gleichung *partielle* DGL

## Allgemeine Form

> [!info]
>  **Implizite Differenzialgleichung:**$F(t,x,x',\dots,x^{(n)}) = 0$
Explizite Differenzialgleichung:

$$
x^{(n)}= f(t,x,x',\dots,x^{(n-1)})
$$
$\implies$
$$
F(t,x,x',\dots,x^{(n)}) := x^{(n)}-f(t,x,x',\dots, x^{(n-1)}) 
$$

## Map of Content

- [lineare DGL 1. Ordnung](lineare%20DGL%201.%20Ordnung.md)
- [lineare DGL 2. Ordnung](lineare%20DGL%202.%20Ordnung.md)
- [DGL-System](DGL-System.md)

## Anwendungen und Beispiele

- [Schwingkreise](../Physik/Schwingkreise.md)
- Wärmeleitungsgleichung
- Schaltungsberechnung mit Induktoren und Kondensatoren
- exponentielles Wachstum

# Tags

![](https://www.youtube.com/embed/p_di4Zn4wz4)

![DGL-NOTES](assets/pdf/DGL-NOTES.pdf)
