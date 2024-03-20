---
tags: 
aliases: 
keywords: 
subject:
  - PR
  - Networked Embedded Systems
semester:
  - SS24
  - B2
created: 20. März 2024
professor:
---
 

# Programmieren mit STM HAL und LL

Voraussetzung ist ein bereits generiertes Projekt

> [!warning] Achtung
> Dadurch dass der Code aus der IO-Configuration in CubeMX generiert wird, muss man in bestimmte vorgesehene Abschnitte im Code schreiben:
> zwischen `// User Begin …` und `// User End …`

## Register im STM32

STM32 hat 32 Bit breite Register.

> [!info] Diese Register umfassen GPIO Ports, Timer register, Interrupt vektoren … und können vom Benuzer manipuliert werden:
> - (-) Benötigt aufwändige Recherche im Reference Manual[^1]
> - (-) Nicht Portabel zu anderen MCUs
> - (+) Wenn mans kann fördert es das Verständnis für MCUs 
> - (+) Mit Libraries und CubeMX nicht nötig
> - (+) Auf Register Ebene Programmieren ist effizient
>   - keine Abstraktion

## STM Low Level (LL)

Die Low Level Library (LL) stellt *Macros* (also `#define` Direktiven) bereit, die Komplexe Bitmanipulationen in Lesbare Ausdrücke umwandelt.
- (+) Arbeitet immer noch auf Register ebene aber Lesbarer als reine Register Manipulation
- (-) Nicht Portabel auf andere STM Microcontroller

Beispiele:

## STM Hardware Abstraction Layer (HAL)

# Tags

[^1]: [RM0433](RM0433.pdf)