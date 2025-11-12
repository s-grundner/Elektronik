---
tags:
aliases:
  - Logikgatter
  - Gatter
keywords:
  - AND
  - OR
  - XOR
  - NOT
  - Wahrheitstabelle
  - Schaltsymbole
subject:
  - KV
  - Technische Informatik
semester: WS24
created: 14. Oktober 2024
professor:
title: Grundgatter
draft: false
---

# Grundgatter

Logikgatter dienen zur Realiserung von funktionen [boolescher Algebra](../Mathematik/Algebra/Boolesche%20Algebra.md). Siehe [Ansteuerlogik](Ansteuerlogik.md)

---

$a$ und $b$ sind Eingänge und $y$ der Ausgang des jeweiligen Gatters.

| AND    | $y=a\cdot b$                                                       |
| ------ | ------------------------------------------------------------------ |
| NAND   | $y=\overline{a\cdot b}$                                            |
| OR     | $y=a+b$                                                            |
| NOR    | $y=\overline{a + b}$                                               |
| Buffer | $y=a$                                                              |
| NOT    | $y = \bar{a}$                                                      |
| XOR    | $y = a\oplus b = (\bar{a}\cdot b) + (a \cdot \bar{b})$             |
| XNOR   | $y = \overline{a\oplus b} = (\bar{a} \cdot \bar{b}) + (a \cdot b)$ |

## Wahrheitstabelle

## Schaltsymbole

 ---

# Tags

- [Sequenzielle Logik](Sequenzielle%20Logik.md)
- [Kombinatorische Logik](Kombinatorische%20Logik.md)