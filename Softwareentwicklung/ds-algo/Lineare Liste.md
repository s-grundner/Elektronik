---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Algorithmen und Datenstrukturen
semester: SS24
created: 24. April 2024
professor:
  - Rick Rabiser
cited:
---
 

# Lineare [Liste](Linked%20Lists.md)

## Listen Operationen

- Löschen
- Suchen
- Einfügen

### Unsortierte Liste

###  Sortierte Liste

```java title:"Einfügen"
void insert (int val) {
  Node p = head;
  Node prev = null;
  while (p != null && p.val < val) {
    prev = p;
    p = p.next;
  }
  // p == null || p.val >= val
  if (p == null || p.val != val) {
  // val not found
  // found: (p != null) && (p.val == val)
  Node q = new Node(val) q.next = p
    if (p == head)
      head = q
    else prev.next = q
    }
  }
```

```java title:"Löschen"

```
