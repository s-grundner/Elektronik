---
tags:
  - Architektur/x86
aliases: 
created: 23. Dezember 2023
---

# X86 Assembly

> [!question]  [Rechnerarchitektur](Assembly.md)

## I386 Intel

> [!important] [INSTRUCTION SET](https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86-32_bit)

### Registers

| General Purpose Registers | Non General Purpose Registers     |
| ------------------------- | --------------------------------- |
| `eax`                     | `esp` Pointer to Stacktop         |
| `ebx`                     | `ebp` Pointer to Stackbase        |
| `ecx`                     | `eip` Pointer to next instruction | 
| …                       |                                   |

## Sections

- **text** = Code im Flash
- **data** = Initialisierte globale Variablen (RAM + Flash)
- **bss** = Nicht-initialisierte Variablen (nur RAM)
- **dec** = Gesamtspeicher
- **hex** = Hexadezimale Darstellung

### Hello World

```assembly
# x86 Assembly Testing

.global _start
.intel_syntax
.section .text  

_start:
  # write syscall
  mov %eax, 4
  mov %ebx, 1         # filedescriptor (fd): stdin = 0, stdout = 1, sdterr = 2
  lea %ecx, [message] # load effective address -> pointer to buf / address of buf
  mov %edx, 13        # buf len
  int 0x80            # call instruction

  # exit syscall with code 65
  mov %eax, 1
  mov %ebx, 65  # exit code
  int 0x80  # call instruction

.section .data
  message:
  .ascii "Hello World\n"
```

# Tags

![](https://www.youtube.com/watch?v=L1ung0wil9Y)