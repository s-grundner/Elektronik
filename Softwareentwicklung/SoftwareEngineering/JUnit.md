## [Java](../../Java/{MOC}%20Java.md) - JUnit (401)

 <https://www.youtube.com/watch?v=v2F49zLLj-8> 

- Neues [Java](../../Java/{MOC}%20Java.md)-Projekt:  
  401_Calculator, mit Setting "Projektordner als Stammverzeichnis für Quellenund Klassendateien verwenden"

- Neues Paket: calc

- Eine *Calculator*-Klasse in *Calculator.java* stellt die statische Methode *add()* zur Verfügung:

```java
package calc;
  
public class Calculator {
	static public double add(double a, double b) {
		return a+b;
	}
}
```

- Hauptprogramm (nicht für Test notwendig, nur für die Entwicklung) *Haupt.java*:

```java
package calc;
  
public class Haupt {
	public static void main(String[] args) {
		System.out.println("3.2 + 2.5 = " + Calculator.add(3.2, 2.5));
	}
}
```

- Neu Erstellen aus Templates: *Neuer JUnit - Testfall* - Name: *test1*. Das Template generiert die folgende Datei *test1.java*:


```java
package calc;
 
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
 
class Test1 {
	@Test
	void test() {
		//Calculator testObj = new Calculator();
		double result = Calculator.add(3.2, 4.3);
		assertEquals(7.5, result);
	}
}
```

- Ausführen dieses Tests:  
  Liefert 1/1 Test fehlerfrei bestanden. Durch Verändern des Testobjekts/des Tests kann das Ergebnis geprüft werden.

