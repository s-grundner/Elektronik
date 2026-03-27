---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 24th March 2026
professor:
release: false
title: Multiplikation
---

# Multiplikation

> [!info] Nur Verfügbar mit der `M` Erweiterung

- Multiplikation von 32-bit Zahlen kann zu 64-bit Resultat führen
- Extra Instruktionen für die oberen 32-Bit (signed und unsigned Kombinationen)

| Befehl             | Bescheribung | Operation auf Register    |
| ------------------ | ------------ | ------------------------- |
| `mul rd, rs1, rs2` | Multiply     | `rd := (rs1 * rs2)[31:0]` |
| `mulh rd, rs1, rs2` | Multiply high signed * signed     | `rd := (rs1 * rs2)[63:32]` |
| `mulhsu rd, rs1, rs2` | Multiply high signed * unsigned    | `rd := (rs1 * rs2)[63:32]` |
| `mulhu rd, rs1, rs2` | Multiply high unsigned * unsigned    | `rd := (rs1 * rs2)[63:32]` |

## Beispiel

```asm
# s1 = 0x40000000 = 2^30
# s2 = 0x80000000 = -2^31

# s1 * s2 = -2^61 = 0xE0000000 00000000
mul s3, s1, s2 
mulh s4, s1, s2 

# s4 = 0xE0000000; s3 = 0x00000000
# {s4,s3} = s1 * s2
```
