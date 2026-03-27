---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 18th March 2026
professor:
release: false
title: Maschinensprache
---

# RISC-V Maschinen Sprache

Instruktionsformate:

- *R*-Typ: Register-zu-Register Operationen
- *I*-Typ: Short Immediates und Ladebefehle
- *U*-Typ: Befehle für Long Immediates
- *S*-Typ: Abspeichern von Datenworten
- *B*-Typ: Bedingte Sprünge
- *J*-Typ: Unbedingte Sprünge

Überblick

![invert_dark](../../_assets/Pasted%20image%2020260318152322.png)

## R-Typ


## I-Typ

Instruktionen die nur eine Quelle und ein Zeil haben aber ein Immediate benötigen.

Felder:



Befehlsformat:

- `<operator> <rd>, <rs1>, <imm>`
- `<memop> <rd>, <imm>(<rs1>)`

Beispiele:

- `addi s0, s1, 3`
- `slli s0, s1, 4`

## S-Typ

Store Format. Man möchte in ein Register Speichern

Befehlsformat:

- `<memop> <rs2>, <imm>(<rs1>)`

Obersten Bits werden verwendet für immediatewerte 11:5

Da man `rs1` und `rs2`immer an der Selben Stelle haben möchte, werden die LSBs des immediate werte nah oben verschoben.

## B-Typ

Bit 0 des Immediate wert wird nicht kodiert.

0-Bit muss nicht enkodiert werden da der wert immer 0 ist. Ein anderer wert als 0 kann nicht zu einer sinnvollen addrese führen

Immediate zerlegung wegen 2-er Komplement.

- `imm[12:0] = {imm[12],imm[11],imm[10:5],imm[4:1],0}`

## U-Typ

Instruktionstyp der große immedaite werte benötigt

## J-Typ



## Beispiele

### Assembler zu Maschinensparache

```asm
else:
	add a0, t1, a0
	blt t0, a0, else
```

Maschinensparche für blt instruktion: B-Typ Format

- else $\to$ jump -4 bytes
- $-4_{10}=1100_{\mathrm{2K}}$
- Imm [12:0] = 1 1 111111 1110 0

| `1111111`     | `01010` | `00101` | `100`  |    `1110`    | `1100011` |
| ------------- | ------- | ------- | ---- | ---------- | ------- |
| imm [12,10:5] | rs2     | rs1     | funct3 | imm [4:1,11] |  opcode   |
|               | a0      | t0      |        |              |           |
|               | `x10`   | `x5`    |        |              |           |


= FEA2CEE3

### Maschinensprache zu Assembler

#### Disassembly 1

`0xFFF50513`

`1111 1111 1111 0101 0000 0101 0001 0011`

| `111111111111`     | `01010` | `000` | `01010` | `0010011` |
| ------------------ | ------- | ----- | ------- | --------- |
|  imm[12:0] | rs1     | func  | rd      | I-Typ     |
|  $-1_{\mathrm{2K}}$  | x10     | addi  | x10     |           |
|                    | a0      |       | a0      |           |

- Ergebnis: `addi a0, a0, -1`

#### Disassembly 2

`0002E263` -> `0000 0000 0000 0010 1101 0010 0110 0011`

| `00000000`    | `00000` | `00101` | `101` | `00100`      | `1100011` |
| ------------- | ------- | ------- | ----- | ------------ | --------- |
| imm[12, 10:5] | rs2     | rs1     | func3 | imm[4:1, 11] | op        |
|               | x0      | x5      | bge   |              | B-Typ     |
 

- Imm[12:0] 000000000010 0 $\to$ 0x4 (0 an stelle 0 muss ergänzt werden)
- Ergebnis: `bge x5, x0, 4`