---
tags:
  - Rust
aliases:
created: 2. August 2024
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

---

# Rust Book Notes

```rust title="If in let"
let condition = true;
let foo = if condition {5} else {3};
```

## Compound data types

Tuples können mehrere verschiedene Datentypen in genau einer reihenfolge speichern

```rust title=Tuples
fn main() {
    let tup = (500, 6.4, 1); 
    let (x, y, z) = tup; 
    println!("The value of y is: {y}");
    
    let x: (i32, f64, u8) = (500, 6.4, 1);
    let five_hundred = x.0;
    let six_point_four = x.1;
    let one = x.2;
}
```

Arrays können nur einen Datentypen speichern

```rust title=Arrays
let a: [i32; 5] = [1, 2, 3, 4, 5];
let a = [3; 5]; // <=> let a = [3, 3, 3, 3, 3];
```