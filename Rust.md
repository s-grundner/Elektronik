---
tags: 
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

> [!important] statisch und stark typisierte Programmiersprache.
bei der Deklaration von Variablen wird immer ein statischer typ zugewiesen (kann nicht mehr verändert werden)
> - explizit vom User: `let foo: u32 = 4`
> - implizit von Compiler: `let bar = 4` wird automatisch als integer deklariert.

## Rust Format `rustfmt`



## Rust Projekte mit `cargo`

> [!hint] Commands
> - `cargo new <project-name>`
> - `cargo build`
> - `cargo run`
> - `cargo check`