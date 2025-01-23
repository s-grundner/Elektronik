---
tags:
  - Rust
aliases: 
created: 2. August 2024
cited:
---

# Rust Programming Language

> [!info] [Introduction - The Embedded Rust Book](https://docs.rust-embedded.org/book/index.html)

```rust title="Hello World"
fn main() {
    println!("Hello, world!");
}
```

**VS-Code Extensions:**
- rust-analyzer
- crate
- rust-syntax

## Ownership, Borrowing und Referenzen

> [!ques] Anstatt eines Garbage Collectors, verwendet Rust das Konzept von Ownership, Borrowing und Referenzen.
> - **Ownership**: Jede Variable hat einen Wert und nur diese Varaible ist der Besitzer dieses Wertes
> - **Borrowing**: Werte können temporär ausgeliehen werden.
> - **Referenzen**: Referenzen sind Zeiger auf Werte.

### Ownership

> [!important] **Ownership Rules**
> 1. Jeder Wert hat einen *Besitzer*
> 2. Es kann nur *einen* Besitzer geben
> 3. Wenn der Owner das *Scope* verlässt, wird der Wert *gelöscht*
