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

> [!question] Rick Rabiser
> Laut seiner Erfahrung lohnt es sich nicht eine Liste zu sortieren. Man findet die zufällig angeordneten Elemente im durch schnitt genauso schnell. 

## Listen Operationen

- Löschen
- Suchen
- Einfügen

### Unsortierte Liste

### Sortierte Liste

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
    if (p == head) head = q;
    else prev.next = q;
  }
}
```

```java title:"Löschen"

```
