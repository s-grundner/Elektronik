---
tags: 
aliases: 
keywords: 
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 4. Februar 2025
professor:
---
 

# Gammafunktion

## Gammafunktion als Erweiterung der Fakultät

Die **Eulersche Gammafunktion** besitzt die Eigenschaft
 $$\Gamma(n) = (n-1)!$$
für jede natürliche Zahl $n \in \mathbb{N}$

---

Üblicherweise wird die Gammafunktion mittels Integraldarstellung

$$
\Gamma(z) = \int_{0}^{\infty}t^{z-1}e^{ -t }\mathrm{~d}t= \frac{\Gamma(z+1)}{z(z+1)(z+2)\dots(z+n-1)}
$$

für $\mathrm{Re}(z)>0$ bzw $z \in \mathbb{C} \setminus \{0,-1,-2,\dots\}$, definiert.

---

Die Gammafunktion erfüllt damit
$$\Gamma(z+1)=z \Gamma(z)$$
im gesamten Definitionsbereich und ist damit die Fortsetzung der Fakultät auf nichtganzzahlige, negative und komplexe Werte.


