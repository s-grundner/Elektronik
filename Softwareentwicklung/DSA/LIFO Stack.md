---
tags:
  - DS
aliases:
  - Stack
  - LIFO
  - Kellerspeicher
subject:
created: 20th April 2022
title: LIFO Stack
---

# LIFO Stack

```java
class GeneralStack {
	private Object[] data = new Object[100];
	private int top = 0;
	
	public void push(Object obj) {
		data[top] = obj;
		top++;
	}
	
	public Object pop() {
		top--;
		return data[top];
	}
}
```

## Referenzen

- [RISC-V Stack implementierung](../../Digital-Design/Rechnerarchitektur/RISC-V/Stack.md)