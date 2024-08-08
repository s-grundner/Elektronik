---
tags:
  - C
  - MOC
aliases:
  - "#C"
  - C (Programmiersprache)
  - ANSI-C
  - C89
  - C99
  - C11
  - C18
subject:
  - fsst
source: 
created: 17th August 2023
---

# Map of Content - C (Programmiersprache)

```dataview
LIST FROM #c
WHERE !contains(tags, "MOC")
SORT file.name
```

## Memory Safety

Memory Leaks vermeiden:

- Return Out of Scope Variable
- Insufficent bound checks -> Buffer Overflows
- Integer errors
- Uncontrolled format-strings
- Use After free()
- Use of unitialized variables
- Double free()

## Code Style

- [Law Of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter)
- [Handle](<https://en.wikipedia.org/wiki/Handle_(computing)>)
