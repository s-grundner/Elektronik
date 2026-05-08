---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 6th May 2026
professor:
release: false
title: Exceptions
---

# Exceptions

Situationen während der Bearbeitung von Programmen, die besondere Behandlung erfordern

- Folge: Aufruf des Exception Handlers

> [!question] Ursachen für Exceptions:
> 
> **Hardware**
> - (Hardware-)Interrupt: Gerät signalisiert, dass Daten verfügbar sind
> - Bsp: Eingabe über Maus/Tastatur; Temperatursensor hat Daten
> 
> **Software**
> - Softwareinterrupts: Aufruf von Betriebssystemroutinen (Spezifikation über Interruptnummer)
> - Traps: Ausnahmesituationen, die durch prozessorinterne Fehler hervorgerufen werden;
> - Bsp: ungültiger Befehlscode

| Exception                      | Cause |
| ------------------------------ | ----- |
| Instruction address misaligned | 0     |
| Instruction access fault       | 1     |
| Illegal instruction            | 2     |
| Breakpoint                     | 3     |
| Load address misaligned        | 4     |
| Load access fault              | 5     |
| Store address misaligned       | 6     |
| Store access fault             | 7     |
| Environment call from U-Mode   | 8     |
| Environment call from S-Mode   | 9     |
| Environment call from M-Mode   | 11    |
|                                |       |

## Privilege Levels

Exceptions treten auf unterschiedlichen Berechtigungsstufen (*privilege levels*) auf. Privilege Levels beschränken den Zugriff auf Speicher oder bestimmte (privilegierte) Instruktionen

RISC-V privilege levels (vom höchsten zum niedrigsten):

- **Machine mode (M):**
	- Höchste Privilegstufe.
	- Wird typischerweise von Firmware, Bootloadern oder einfachen Embedded-Systemen genutzt.
	- Kontrolliert die niedrigeren Privilegstufen.
- **Hypervisor mode (H):**
	- Optionale Erweiterung zur Unterstützung von Virtualisierung.
	- Ermöglicht einem Hypervisor die Verwaltung von Gastbetriebssystemen.
- **Supervisor (S):**
	- Wird vom Betriebssystemkern verwendet.
	- Bietet kontrollierten Zugriff auf Systemressourcen, Speicherverwaltung (MMU), Interrupt-Verarbeitung und Systemaufrufe.
	- Kein direkter Hardwarezugriff wie im M-Mode.
- **User mode (U):**
	- Niedrigste Privilegstufe für normale Anwendungen.
	- Kein direkter Zugriff auf privilegierte Instruktionen oder kritische Systemressourcen; Zugriff erfolgt über Systemaufrufe

## Exception Register

Jedes privilege level besitzt eigene Register zur Behandlung der Exceptions

- Control und Status Register (CSR Register)
- CSRs sind in der RISC-V Privileged Specification zu finden
- Im Folgenden: Beschränkung auf M-mode exceptions (aber andere Modi sind sehr ähnlich)

Verwendete M-mode Register bei Exceptions sind:

- `mtvec`, `mcause`, `mepc`, `mscratch`

(Für S-mode entsprechende Register: stvec, scause, sepc, sscratch;
andere Modi analog)


## Beispiel

```asm
	# save registers that will be overwritten
	csrrw t0, mscratch, t0 # swap t0 and mscratch
	sw t1, 0(t0)           # [mscratch] = t1
	sw t2, 4(t0)           # [mscratch+4] = t2
	
	# check cause of exception
	csrr t1, mcause        # t1=mcause
	addi t2, x0, 2         # t2=2 (illegal instruction exception code)
illegalinstr:
	bne t1, t2, checkother # branch if not an illegal instruction
	csrr t2, mepc          # t2=exception PC
	addi t2, t2, 4         # increment exception PC
	csrw mepc, t2          # mepc=t2
	j done
	
# restore registers and return
checkother:
	addi t2, x0, 4         # t2=4 (load address misaligned exception code)
	bne t1, t2, done       # branch if not a misaligned load
	j exit                 # exit program

# restore registers and return from the exception
done:
	lw t1, 0(t0)           # t1 = [mscratch]
	lw t2, 4(t0)           # t2 = [mscratch+4]
	csrrw t0, mscratch, t0 # swap t0 and mscratch
	mret                   # return to program
exit:
	...
```

Prüfen von zwei Exception-Typen

Sonst: Instruktion nocheinmal ausführen

macht einfach mit nächster Instr. weiter
 Illegal instruction (mcause = 2):
 Load address misaligned (mcause = 4):

Abbruch des Programms (via exit label)