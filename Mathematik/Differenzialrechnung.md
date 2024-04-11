---
tags:
  - Infinitesimalrechnung
aliases:
  - Differenzieren
  - Ableitung
  - ableiten
  - Differenzialquotient
  - differenziell
subject:
  - mathe
source:
  - Rudolf Frauenschuh
created: 26th March 2022
---

# Differenzialrechnung

Die Steigung der Tangente nimmt man als Steigung der Funktion im betreffenden Punkt.  
Die Ableitung $f'(x)$ ist die Steigung der Tangente am Graphen der Funktion $f(x)$ im Punkt $(x_{0}|f(x_{0}))$.

**Der Differenzialquotient hat aber eine viel Weitreichendere Bedeutung**
Die Tangente ist eine lineare Näherung (Approximation) an einer Kurve. Sogar die *Beste Näherung*.


> [!INFO] Bei der Differenzialrechnung wird somit die Änderung in einer Funktionen betrachtet.  
> Sie wird in der Physik als häufigste Operation verwendet und benötigt um Naturgesetze zu definieren. (Siehe [DGL](../{MOC}%20DGL.md))

![](Pasted%20image%2020230923135814.png)

Steigung der Sekante $k=\dfrac{\Delta y}{\Delta x}=\dfrac{f(x_{0}+\Delta x)-f(x_{0})}{\Delta x}\to$ Differenzenquotient oder mittlere Steigung im Intervall.  
$Q_{i}$ rückt immer näher zu $P$. Der [Grenzwert](Grenzwert.md) der Sekanten-Steigung ist die Ableitung. 

> [!SUCCESS] Differenzieren einer Funktion  
> Die Funktion $f$ mit $y = f(x)$ heißt an der Stelle $x_{0}$ *differenzierbar*, wenn der [Grenzwert](Grenzwert.md)
> 
> $\lim_{ \Delta x \to \infty } = \dfrac{\Delta f}{\Delta x}=\frac{f(x_{0}+\Delta x)-f(x_{0})}{\Delta x}$ existiert.  
> 
> Diesen [Grenzwert](Grenzwert.md) nennt man *Ableitung* oder *Differenzialquotient* von $f$ an der Stelle $x_{0}$.
> 
> Er wird mit $f(x_{0})$, $y'(x_{0})$ oder $\frac{dy}{dx}\Big|_{x=x_{0}}$ (gesprochen: $dy$ nach $dx$ für $x=x_{0}$) bezeichnet.
> 
> Das Bilden der Ableitung wird *ableiten* oder *differenzieren* genannt.

> [!SUCCESS] Differenzieren heißt linear approximieren
> 1. Der *Differenzialquotient* (die Ableitung) $f'(x)$ ist der *[Grenzwert](Grenzwert.md) des Differenzenquotienten*: $f'(x_{0})=\frac{\lim_{ \Delta x \to 0}\Delta y}{\Delta x}$.
> 2. Die Bezeichnung $\frac{dy}{dx}$ soll an die Verwandtschaft der Ableitung mit einem Differenzenquotient erinnern.  
> 	Differenzierbarkeit einer Funktion an der Stelle $x_{0}$ bedeutet geometrisch, dass es dort eine *Tangente* gibt.  
> 	Ist eine Funktion also an einer Stelle $x_{0}$ *differenzierbar*, so heißt dies, dass sie dort *linear approximierbar* ist.  
> 	In der Nähe von $x_{0}$ verlaufen der Funktionsgraph und die Tangente "praktisch" glech.

>[!EXAMPLE] $f(x) = x^{2}$  
> $\lim_{ \Delta x \to 0 } \frac{(x+\Delta x)^{2}-x^{2}}{\Delta x^{2}}$

| Art der Funktion                                | Stammfunktion                                                | Ableitung                                                                                         |
| ----------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- |
| konstante Funktion                              | $f(x)=c$                                                     | $f'(x)=0$                                                                                         |
| Potenzfunktion                                  | $f(x)=a\cdot x^{n},n\in\mathbb{R}$                           | $f'(x)=a\cdot n\cdot x^{n-1}$                                                                     |
| [Exponentialfunktion](Exponentialfunktion.md)                             | $f(x)=a^{x}$ <br> $f(x)=e^{x}$                               | $f'(x)=a^{x}\cdot \ln a$ <br> $f'(x)=e^{x}$                                                       |
| Logarithmusfunktion                             | $f(x)=\ln x$ <br> $f(x)=\log_{a}$                            | $f'(x)=\frac{1}{x}$ <br> $f'(x)=\frac{1}{x\cdot \ln a}$                                           |
| Kreisfunktionen <br> (*Winkel $x$ im Bogenmaß*) | $f(x)=\sin x$<br>$f(x)=\cos x$<br>$f(x)=\tan x$              | $f'(x)=\cos x$<br>$f'(x)=-\sin x$<br>$f'(x)=1+\tan ^{2}x=\frac{1}{\cos ^{2}x}$                    |
| Arkusfunktionen                                 | $f(x)=\arcsin x$ <br> $f(x)=\arccos x$ <br> $f(x)=\arctan x$ | $f'(x)=\frac{1}{\sqrt{ 1-x^{2} }}, \|x\| < 1$ <br> $f'(x)=-\frac{1}{\sqrt{ 1-x^{2} }}, \|x\| < 1$ |

## Ableitungsregeln

| Summenregel     | $[f(x) \pm g(x)]' =f'(x) \pm g'(x)$                                                                |
| --------------- | -------------------------------------------------------------------------------------------------- |
| Faktorregel     | <br>$[\lambda \cdot f(x)]' = \lambda \cdot f'(x)\qquad \lambda \in \mathbb{R}$ <br><br>            |
| Produktregel    | <br>$[f(x)\cdot g(x)]' = f'(x)\cdot g(x) + f(x)\cdot g'(x)$ <br><br>                               |
| Quotientenregel | <br>$\left[\dfrac{f(x)}{g(x)}\right]'=\dfrac{f(x)'\cdot g(x)- f(x)\cdot g(x)'}{g(x)^{2}}$ <br><br> |
| Kettenregel     | <br>$(f\circ g)'(x)= f(g(x))'=f'(g(x))\cdot g(x)'$                                                 |
| Umkehrregel     |                                                                                                    |

# Tags

- [Partielle Ableitung](Partielle%20Ableitung.md)
- [Totales Differenzial](../Totales%20Differenzial.md)
- [L'Hospital](L'Hospital.md)
- [Linearisieren](Linearisieren)
- [[Mittelwertsatz der Differenzialrechnung]]
