---
tags:
  - Java
aliases: 
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester: SS24
created: 22. Mai 2024
professor: 
cited:
---
 

# Generics

```java title="Generic Class"
public class MyGenericClass<T> {
  private final T obj;

  public MyGenericClass(T obj) {
    this.obj = obj;
  }

  public T getOnject() {
    return obj;
  }
}
```

```java title="main"
public class Main {
  public static void main(String[] args) {
    MyGenericClass<Integer> myGen = new MyGenericClass<>(47);
    Integer i = myGen.getObject(); // i = 47
  }
}
```