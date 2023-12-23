---
tags: []
aliases: []
created: 23. Dezember 2023
---

# x86 Assembly

## i386 Intel

[INSTRUCTION SET](https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86-32_bit)

### REGISTERS

| General Purpose Registers | Non General Purpose Registers     |
| ------------------------- | --------------------------------- |
| `eax`                     | `esp` Pointer to Stacktop         |
| `ebx`                     | `ebp` Pointer to Stackbase        |
| `ecx`                     | `eip` Pointer to next instruction | 
| ...                       |                                   |




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

## AVR Machine Language

