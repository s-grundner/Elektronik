---
tags: ["ds-algo"]
aliases: ["time complexity", "space complexity", "Big-O", "big-O"]
subject: ["null"]
source: ["null"]
reference: []
created: 17th April 2022
last_edited: 17th April 2022
---

# Big-[O-Notation](https://de.wikipedia.org/wiki/Landau-Symbole)

The efficiency of an algorithm is often Expressed through the Big-O Notation.
An efficient algorithm is balanced in **time-complexity** and **space-complexity**

Time-complexity describes, how **time-efficient** an algorithm is.
Space-complexity describes, how **memory-efficient** an algorithm is.

Memory-efficiency is described as how much memory an algorithm is consuming *during* its operation.

## Runtimes / Time-complexity
### Polynomial Runtimes✅
An Algorithm is considered to have a **Polynomial Runtime**, if, for a given value of $n$, is in the **Form of $n^{k}$**.

Big-O Notation$\dots O(n^{k})$

A polynomial runtime is considered efficient.
#### Constant Time
$O(n^{0}) = O(1)$
#### Logarithmic Time
$O(\log(n))$
#### Linear Time
$O(n^{1}) = O(n)$
#### Quasilinear Time
$O(n\cdot\log(n))$
#### Quad/Cubed Time
$O(n^{2})$
$O(n^{3})$
### Other Runtimes ❌
#### Exponential Time
$O(x^{n})$
#### Fractorial/Combinatorial Time
$O(n!)$

## Memory


---
# Tags