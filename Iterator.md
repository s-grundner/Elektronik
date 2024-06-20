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
cited:
---
 
# Iterator

Eine Klasse die das Iterator Interface implementiert

```java 
public class DigitInStringIterator implements Iterator<Integer> {
  int idx;
  String str;
  public DigitInStringIterator(String str) {
    this.str = str;
    idx = 0;
  }

  runTo

  @Override
  public boolean hasNext() {
    return idx < str.length();
  }

}
```