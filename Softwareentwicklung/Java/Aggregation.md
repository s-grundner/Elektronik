---
tags: ["Java", "DB", "oop"]
aliases: []
created: 5. September 2023
---

# Aggregation (auch Schwache Aggregation)

Eine Klasse ist Teil einer anderen Klasse. Die Teilklasse existiert aber auch ohne die beinhaltende Klasse. Man gibt einer Klasse als Parameter des Konstruktors ein Objekt mit und weißt es dort einem Member-Objekt zu.

## Java

```java
class OberKlasse {
  UnterKlasse uk;							// Member-Variable
  public OberKlasse(UnterKlasse para) {		   // Konstruktor mit Objekt als Parameter
    uk = para;							    // existierendes UnterKlassen-Objekt wird zugewiesen
  }
}
```