---
tags: 
aliases:
  - LHospital
subject:
  - mathe
source:
  - Rudolf Frauenschuh
created: 21st November 2022
---

# L'Hospital

> [!IMPORTANT] Führt ein [Grenzwert](Grenzwert.md) auf *einen unbestimmten Ausdruck* der Form "$\frac{0}{0}$" oder "$\frac{\infty}{\infty}$", wo gilt:  
>
> $$ \lim_{x\rightarrow a^{+}}\frac{f(x)}{g(x)} = \lim_{x\rightarrow a^{+}}\frac{f'(x)}{g'(x)}, \quad g'(x) \neq 0 $$

- $f(x)$ und $g(x)$ müssen dazu an der Stelle $x_{0}$ differenziert werden.
- $f(x)$ und $g(x)$ müssen getrennt differenziert werden.
- die Regel von *L'Hospital* kann mehrmals hintereinander angeordnet werden. 

## Beispiel

> [!EXAMPLE] Beispiel:  
>
> $$\lim_{x\rightarrow 0} \frac{\sin(x)}{x}=\lim_{x\rightarrow 0 }\frac{\cos(x)}{1}=1$$

> [!IMPORTANT] Jede Exponentialfunktion geht schneller gegen $\infty$ als jede Potenzfunktion, daher:
> - $\lim_{x\rightarrow\infty} \dfrac{x}{e^{x}}=\lim_{x\rightarrow\infty} \dfrac{1}{e^{x}}$;
> - $\lim_{x\rightarrow\infty} \dfrac{100\cdot x^{100}}{e^{x}} = \lim_{x\rightarrow\infty}\dfrac{100\cdot 100 \cdot x^{99}}{e^{x}}=\dots=\lim_{x\rightarrow\infty} \dfrac{100\cdot 100\cdot 99\cdots 1\cdot x}{e^{x}} = \lim_{x\rightarrow\infty} \dfrac{100\cdot100!\cdot1}{e^{x}}=0$;
> - $\lim_{x\rightarrow\infty}\dfrac{x}{x^{2}+1}= \lim_{x\rightarrow\infty}\dfrac{1}{2x}=0$;