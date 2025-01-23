---
tags:
  - Rust
aliases: 
created: 20th January 2025
cited:
---

# Funktionen

Entry-Point ist die Funktion `main()`.

```rust
fn main() {
    println!("Hello, world!");
}
```

Rust unterstützt **Hoisting**. Methoden müssen nicht vor ihrer Verwendung definiert werden.

```rust
fn main() {
    another_function();
}

fn another_function() {
    println!("This must not be above main");
}
```
```