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
title: Schiebebefehle
---

# Schiebebefehle

| Befehl  | Beschriebung | Operation auf die Register | 
| - | - | - |
| `sll rd, rs1, rs2` | shift left logical | `rd := rs1 << rs2[4:0]` |
| `slli rd, rs1, uimm` | shift left logical immediate | `rd := rs1 << uimm` | 
| `srl rd, rs1, rs2` | shift right logical | `rd := rs1 >> rs2[4:0]` | 
| `srli rd, rs1, uimm` | shift right logical immediate | `rd := rs1 >> uimm` |
| `sra rd, rs1, rs2` | shift right arithmetic | `rd := rs1 >>> rs2[4:0]` |
| `srai rd, rs1, uimm` | shift right arithmetic immediate | `rd := rs1 >>> uimm` |

- `uimm` = Vorzeichenlose 5-Bit Zahl
- `>>>` bezeichnet arithmetischen Shift
- Arithmetischer Shift erhält Vorzeichen (nachrückende Bits nicht auf 0 setzen, sondern MSB von rs1 verwenden)

## Beispiel

| | |
| ---------------- | :--------------------------------------------------- |
| `t0`enthält      | $1111~1111~1111~1111~1111~1111~1110~0111_{2K} = -25$ |
| `srai t0, t0, 4` | $1111~1111~1111~1111~1111~1111~1111~1110_{2K} = -2$ |