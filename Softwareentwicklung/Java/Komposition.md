## Komposition (auch Starke Aggregation):

Eine Klasse ist Teil einer anderen Klasse. Das Teilobjekt existiert nicht ohne das beinhaltende Objekt. Im Konstruktor wird ein Objekt neu angelegt und der Member-Variable zugewiesen:

```java
class OberKlasse {
  UnterKlasse uk;				   // Member-Variable
  public OberKlasse() {			    // Konstruktor
    uk = new UnterKlasse(...);		// UnterKlassen-Objekt wird im Konstruktor erzeugt
  }
}
```