---
tags:
aliases:
keywords:
  - C-Programmiersprache
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 5th January 2026
professor:
release: false
title: C-Unions
---

# Union

A "union" is identical to a "struct" syntactically. A union is a special data type that allows storing different data types at the same memory location. In a union the members overlap each other, this is the main difference to a struct. The members of a union can also be structs. Accessing a different member of the union allows you to interpret the same memory space as different types. However, it's crucial to manage the union carefully to avoid unintended type violations.