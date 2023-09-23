---
tags:
  - Infinitesimalrechnung
aliases:
  - Differenzieren
  - Ableitung
  - ableiten
subject:
  - mathe
source:
  - Rudolf Frauenschuh
created: 26th March 2022
---

# Differenzialrechnung

Die Steigung der Tangente nimmt man als Steigung der Funktion im betreffenden Punkt.
Die Ableitung $f'(x)$ ist die Steigung der Tangente am Graphen der Funktion $f(x)$ im Punkt $(x_{0}|f(x_{0}))$.

![](assets/Pasted%20image%2020230923135814.png)

Steigung der Sekante $k=\dfrac{\Delta y}{\Delta x}=\dfrac{f(x_{0}+\Delta)-f(x_{0})}{\Delta x}\to$ Differenzenquotient oder mittlere Steigung im Intervall.
$Q_{i}$ rückt immer näher zu $P$. Der Grenzwert der Sekanten-Steigung ist die Ableitung. 

> [!] 

| Art der Funktion                                | Stammfunktion                                                | Ableitung                                                                      |
| ----------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| konstante Funktion                              | $f(x)=c$                                                     | $f'(x)=0$                                                                      |
| Potenzfunktion                                  | $f(x)=x^{n},n\in\mathbb{R}$                                  | $f'(x)=n\cdot x^{n-1}$                                                         |
| Exponentialfunktion                             | $f(x)=a^{x}$ <br> $f(x)=e^{x}$                               | $f'(x)=a^{x}\cdot \ln a$ <br> $f'(x)=e^{x}$                                    |
| Logarithmusfunktion                             | $f(x)=\ln x$ <br> $f(x)=\log_{a}$                            | $f'(x)=\frac{1}{x}$ <br> $f'(x)=\frac{1}{x\cdot \ln a}$                        |
| Kreisfunktionen <br> (*Winkel $x$ im Bogenmaß*) | $f(x)=\sin x$<br>$f(x)=\cos x$<br>$f(x)=\tan x$              | $f'(x)=\cos x$<br>$f'(x)=-\sin x$<br>$f'(x)=1+\tan ^{2}x=\frac{1}{\cos ^{2}x}$ |
| Arkusfunktionen                                 | $f(x)=\arcsin x$ <br> $f(x)=\arccos x$ <br> $f(x)=\arctan x$ | $f'(x)=\frac{1}{\sqrt{ 1-x^{2} }}, \|x\| < 1$ <br> $f'(x)=-\frac{1}{\sqrt{ 1-x^{2} }}, \|x\| < 1$                                                                               |

## Ableitungsregeln

### Faktorregel

### Summenregel

### Produktregel

### Quotientenregel

### Kettenregel

## Implizit Differenzieren

## partielle Ableitung

# Tags

- [L'Hospital](L'Hospital.md)
- [Linearisieren](Linearisieren)