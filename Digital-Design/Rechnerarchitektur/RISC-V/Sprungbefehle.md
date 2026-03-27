---
tags:
  - Assembly/RV
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 24th March 2026
professor:
release: false
title: Untitled
keywords:
  - if
  - if/else
  - for
  - while
---

# Sprungbefehle

Sprungbefehle dienen zur Änderung der linearen Befehlsausführung

Es gibt zwei Arten von Sprungbefehlen:


| Bedingt                                | Unbedingt                      |
| -------------------------------------- | ------------------------------ |
| `beq`: branch if equal                 | `j`: jump                      |
| `bne`: branch if not equal             | `jr`: jump register            |
| `blt`: branch if less than             | `jal`: jump and link           |
| `bge`: branch if greater than or equal | `jalr`: jump and link register |

## Bedingter Sprung

![](../../../_assets/Pasted%20image%2020260324162752.png)

Sprungmarken (labels) versehen Position im Quelltext mit eindeutigem Bezeichner.
(Label dürfen keine reservierten Bezeichner sein und müssen mit Doppelpunkt enden)

![](../../../_assets/Pasted%20image%2020260324162933.png)

## Unbedingter Sprung

![](../../../_assets/Pasted%20image%2020260324163103.png)

## `if`-Anweisung

Assembler überprüft die *negierte Bedingung* `(i != j)` des Codes der höheren Programmiersprache `(i == j)`

![](../../../_assets/Pasted%20image%2020260324163209.png)


## `if`/`else`-Anweisung

Assembler überprüft die *negierte Bedingung* `(i != j)` des Codes der höheren Programmiersprache `(i == j)`

![](../../../_assets/Pasted%20image%2020260324164704.png)

## `while`-Schleife

Assembler überprüft die *negierte Bedingung* `(pow == 128)` des Codes der höheren Programmiersprache `(pow != 128)`

![](../../../_assets/Pasted%20image%2020260324164804.png)

## `for`-Schleife

- *Initialisierung*: wird vor Beginn der Schleife ausgeführt
- *Bedingung*: wird zu Beginn jeder Iteration getestet
- *Schleifenoperation*: wird am Ende jeder Iteration ausgeführt
- *Anweisung*: wird jedes Mal ausgeführt, wenn die Bedingung erfüllt ist

![](../../../_assets/Pasted%20image%2020260324164852.png)