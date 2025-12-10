---
tags:
aliases:
keywords:
subject:
  - VL
  - Softwareentwicklung 2
semester: SS24
created: 20. Juni 2024
professor:
---
 

# Iterator

Ein **Iterator** gehört zur Gruppe der [Verhaltensmuster](../Designpatterns/Verhaltensmuster.md). Dieses Muster sei hier erwähnt, die Anwendung und Funktion ist in Standard-Template-Library für die Collections implementiert.


## Iterator in Java

Eine Klasse die das Iterator Interface implementiert

```java 
public class DigitInStringIterator implements Iterator<Integer> {
  int idx;
  String str;
  public DigitInStringIterator(String str) {
    this.str = str;
    idx = 0;
  }

  private void runToNextDigit() {
    while(idx !Character.isDigit(str.charAt(idx))) {
      idx++;
    }
    // idx < str.length(): next digit found
    // idx == str.length():
  }

  @Override
  public boolean hasNext() {
    return idx < str.length();
  }

  @Override
  public Integer next() {
    idx++;
    return str.charAt(idx - 1);
  }

}
```

### Mit Innerer Klasse

```java
public class Test {
  public static Iterator<String> forArray(String [] arr) {
    return new Iterator<String>() {

      @Override
      public boolean hasNext() {
      
      }

      @Override
      public String next(){
      
      }
    
    } 
  }
}
```

### Iterator vs Iterable

```java

String[] iterable = {...} // String array implements iterable

StringArrayIterator iterator = new StringArrayIterator(iterable);

for(String s : iterable) {

}

while(iterator.hasNext()) {
  iterator.next()
}
```