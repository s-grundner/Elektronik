---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Softwareentwicklung 1
semester:
  - WS23
  - B1
created: 16. Oktober 2023
professor:
---
 

# Datentypen

## Ganzzahlige Datentypen

### EBNF Grammatik

```EBNF
VarDecl = Type Var {"," Var} ";".
Var = ident [ "=" Expr ].
Type = "byte" | "short" | "int" | "long" | ... .
```

## Gleitkomma Datentypen

### EBNF Grammatik

```EBNF
FloatConstant = [Digits] "." [Digits] [Exponent] [FloatSuffix].
Digits = digit {digit}.
Exponent = ("e" | "E") ["+" | "-"] Digits.
FloatSuffix = "f" | "F" | "d" | "D".
```

# Tags

- [C-Datentypen](../C/C-Datentypen.md)
- [Java_Datentypen](Java/Java_Datentypen.md)