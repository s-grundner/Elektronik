# Strings

> [!important] Zwei Typen von Strings:
> `String`: Vector aus Bytes, kann verändert werden, Heap Allocated
> `&str`: Statischer String, Pointer zum Stack

> [!example] String Beispiel
> `String::new` erzeugt neuen Heap allocated String
> `push()` Fügt einen `char` oder `&str` *hinten* an
> `split_whitespace()`

```Rust
fn main() {
  let mut str1: String = String::new(); // Neuen String initialisieren
  str1.push('A'); // Push fügt chars hinten an
  str1.push(" word"); // str1 -> "A word"
  for word: &str in str1.split_whitespace(){
    println!("{}", word);
  }
  let str2: String = str1.replace("A", "Another"); 
  pritnln!("{}", str2);
}
```