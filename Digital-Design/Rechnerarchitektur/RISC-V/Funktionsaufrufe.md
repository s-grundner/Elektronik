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
title: Funktionsaufrufe
---

# Funktionsaufrufe

> [!question] [RV-Assembly](index.md#RV-Assembly)

## Konvention für Funktionsaufrufe in RISC-V

> [!example]- Beispiel C Code
> ```c
> void main() { // Caller
> 	int y;
> 	y = sum(42, 7);
> 	...
> }
> int sum(int a, int b) { // Callee
> 	return (a + b);
> }
> ```

**Caller** (Aufrufende Funktion – im Beispiel `main`)

1. Sichere alle [caller-saved](Register.md#Sicherungskonvention) Register (`ra`, ggf. `t0-t6`/`a0-a7`) auf dem [Stack](Stack.md) wenn die Werte dieser Register nach dem Aufruf noch benötigt werden
2. Übergebe Funktionsargumente an den *callee*, indem die Werte in `a0-a7`Abgelegt werden.
3. Rufe Funktion/Unterprogramm auf mit `jal callee`
4. In den Registern `a0`, `a1` ist das Ergebnis gespeichert.
5. Stelle alle gespeicherten Register wieder her und räume den Stack auf

**Callee** (Aufgerufene Funktion – im Beispiel `sum`)

1. Sichere alle [callee-saved](Register.md#Sicherungskonvention) Register (`s0-s11`), die verändert werden, auf dem Stack 
2. Führe Funktionalität aus
3. Speichere das Ergebnis in `a0`, `a1`
4. Stelle alle gespeicherten Register wieder her und räume den Stack auf
5. Springe zurück mit `jr ra`

### Aufruf und Rückehr

![](../../../_assets/Pasted%20image%2020260324165417.png)

1. Zum Callee Springen:
	-  Jump and Link zum Label `simple`: Die *return address* wird in `ra`gespeichert, und zeigt auf die nächste instruktion nach dem `jal`call. Hier `add ...`, dass dann auf der Addresse `PC + 4`

2. Zurück zum Caller:
	- Jump zur addresse die zuvor im Register `ra` gespeichert wurde.

> [!tldr]
> 
> 1. jal simple:
> 	- ra = PC + 4 (0x00000304)
> 	- Sprung zum Label simple (PC = 0x0000051c)
> 2. jr ra:
> 	- PC = ra (0x00000304)

### Argumente und Rückgabewert

| C-Code                                                                    | RV-Assembly                                                               |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| ![invert_dark\|500](../../../_assets/Pasted%20image%2020260324171806.png) | ![invert_dark\|500](../../../_assets/Pasted%20image%2020260324171734.png) |

Man kann hier beobachten, dass `diffofsums` die drei register `t0`, `t1` und `s3`überschreibt, welche eventuell vorher vom caller verwendet wurden.

![600](../../../_assets/Pasted%20image%2020260324171909.png)

> [!success] Lösung zu diesem Problem ist es, die register werte vom *caller* vorher am Stack zu Speichern

### Sichern und Wiederherstellen der Register

> [!question] [Speichern und Laden von Registern](Stack.md#Speichern%20und%20Laden%20von%20Registern)

Das sichern *aller* zu überschreibenden Registern ist wegen der [Sicherungskonvention](Register.md#Sicherungskonvention) nicht erforderlich. Es müssen lediglich *Gesicherte Register* (z.B. `s0-s11`) am Stack gespeichert werden.

![500](../../../_assets/Pasted%20image%2020260324182904.png)

## Non-Leaf Functions

> [!question] Funktion mit Unterfunktion

Die Return-Adresse `ra` vom Caller muss *vor* dem Aufruf in die Unterfunktion (`func2`) **gesichert** werden und *am Ende* der Funktion (`func1`) **wieder hergestellt** werden!

```asm
func1:
	addi sp, sp, -4    # make space on stack
	sw   ra, 0(sp)     # save ra on stack
	jal  func2
	...
	lw   ra, 0(sp)     # restore ra from stack
	addi sp, sp, 4     # make space on stack
	jr   ra            # return to caller
```

## Rekursive Funktionen

> [!question] [Rekursion](../../../Softwareentwicklung/DSA/Rekursion.md): Funktion, die sich selbst aufruft

Bei der Umsetzung in Assembler-Code: Entwicklung der rekursiven Funktion in *zwei* Schritten:

1. Rekursive Aufrufe so behandeln, als ob eine andere Funktion aufgerufen würde, und überschriebene Register ignorieren
2. Dann sichern/wiederherstellen von Registern auf dem Stack nach Bedarf


### Beispiel: Fakultät

$$ 
\operatorname{factorial}(n) = n! = n(n-1)(n-2)(n-3) \ldots 1
$$
```c
int factorial(int n) {
	if (n <= 1) return 1;
	else return (n * factorial(n−1));
}
```

> [!example]- Beispiel `n=3`
> 
> `factorial(3): returns 3*factorial(2)`
> `factorial(2): returns 2*factorial(1)`
> `factorial(1): returns 1`
> 
> ---
> 
> `factorial(1): returns 1`
> `factorial(2): returns 2*1`
> `factorial(3): returns 3*2*1`

![](../../../_assets/Pasted%20image%2020260324191335.png)

![](../../../_assets/Pasted%20image%2020260324191447.png)

### Beispiel: Collatz Schrittzahl

> [!question] [Collatz-Problem](../../../Softwareentwicklung/DSA/Collatz-Problem.md)

> [!success]- Lösung 
> 
>  ### Sections
>  
> ```asm
> .globl main
> .text
> ```
> 
> ### Rekursionslabel
> 
> - Hier wird die Return Addresse zum Letzten Rekursiven Aufruf im Stack gespeichert.
> - Da im Rückgabewert selbst `a0` nicht verwendet wird (anders als bei z.B. `factorial`) muss dieses Register nicht im Stack gespeichert werden.
> - Es werden die Bedingungen abgefragt und anschließend zu den labels `c_base` für den Anker, `c_even` und `c_odd` gesprungen.
> 
> ``` asm
> collatz_recu:
>   addi sp, sp, -4       # allocate stack space
>   sw   ra, 0(sp)        # save return address
> 
>   addi t0, zero, 1
>   beq  a0, t0, c_base   # if (n == 1)
> 
>   andi t1, a0, 1
>   bnez t1, c_odd        # if (odd)
> 
>   jal  zero, c_even     # else
> ```
> 
> ### Bedingungen
> 
> 1. In den Bedingungen wird zunächst die Arithmetik zum Rekursionsabstieg ausgeführt (die Terme die in der Rekursionsvorschrift innerhalb des Arguments des rekrsiven Aufrufs stehen) Durchgeführt:
> 	- $\frac{n}{2}$ für `c_even`
> 	- $3n +1$ für `c_odd`
> 2. Rekursive Aufruf
> 3. Arithmetik für den Rekursiven Aufstieg (Terme die in der Rekursionsvorschrift außerhalb des rekursiven Aufrufs stehen)
> 	- $1+\dots$ für `c_even`
> 	- $1+\dots$ für `c_odd`
> 4. Return Address wiederherstellen und zur übergeordneten Rekursionsebene zurückkehren.
> 
> ```asm
> c_even:
>   srli a0, a0, 1        # n = n >> 1 = n / 2
> 
>   jal  ra, collatz_recu # recursive call
>   addi a0, a0, 1        # n++
> 
>   lw   ra, 0(sp)        # restore return address
>   addi sp, sp, 4        # restore stack
>   jalr zero, ra, 0      # return
> 
> c_odd:
>   addi t0, zero, 3
>   mul  t0, t0, a0       # 3n
>   addi a0, t0, 1        # n = 3n + 1
> 
>   jal  ra, collatz_recu # recursive call
>   addi a0, a0, 1        # n++
> 
>   lw   ra, 0(sp)        # restore return address
>   addi sp, sp, 4        # restore stack
>   jalr zero, ra, 0      # return
> ```
> 
> Anker
> 
> ```asm
> c_base:
>   addi a0, zero, 0      # set base case n = 0
>   addi sp, sp, 4        # restore stack
>   jalr zero, ra, 0      # return
> ```
> 
> ### Testaufruf
> 
> ```asm
> main:
>   addi a0, zero, 42     # n = 42
>   jal  ra, collatz_recu
>   addi a1, a0, 0        # s0 = collatz(42)
>   addi a0, zero, 1      # ecall print_int
>   ecall
>   addi a0, zero, 11     # ecall print_char
>   addi a1, zero, '\n'
>   ecall
>   addi a0, zero, 1337   # n = 1337
>   jal  ra, collatz_recu
>   addi a1, a0, 0        # s1 = collatz(1337)
>   addi a0, zero, 1      # ecall print_int
>   ecall
> ```