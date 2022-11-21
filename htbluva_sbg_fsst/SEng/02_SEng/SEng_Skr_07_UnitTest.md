# 7 Unit-Test

Ein Unit-Test testet eine kleine Einheit (Unit), noch bevor sie in das gesamte Projekt eingebunden (integriert) wird. Die Idee ist, die Erfüllung der konkreten Anforderung zu Testen. Um keinen Einfluss von anderen Teilen der System-Software zu verspüren (im Guten wie im Schlechten) wird das Testen des Features in einer Eigens erstellten, sinnvoller Weise nach möglichst einfachen Umgebung erfolgen. 

Damit findet der Test möglichst unabhängig von anderen Komponenten ab. In vielen Entwicklungstools kann ein Unit-Test bereits während der Entwicklung mit integriert werden. Der große Vorteil gegenüber einem bloßen manuellen Testen ist, dass mit jeder späteren (auch kleinen) Änderung gleich eine ganze Reihe von Tests wieder gestartet werden kann. Der zweite große Vorteil ist, dass ein entsprechender Nachweis der Testung mitgeliefert werden kann.

## Unit-Test mit QTCreator C++ (651)

https://doc.qt.io/qt-5/qttestlib-tutorial1-example.html

https://www.youtube.com/watch?v=MqI8jPFcSkE

In diesem Beispiel wird die Addition eines Taschenrechners erstellt. Die Taschenrechner-Software ist in der Klasse *Calculator* zu finden. Der Test der Funktion dieser Klasse wird in die Klasse *TestCalculator* entwickelt.

Für die Projekterstellung Auswahl des Templates *Anderes Projekt->Autotest-Projekt*, damit kann einfach gestartet werden, die generierten Dateien werden dann ein wenig angepasst. Als Testfallname wird hier noch *testcalculator* eingegeben.

Damit werden schon ein paar Makros integriert, zusätzlich auch noch ein paar Funktionen, die aber gelöscht/umbenannt werden können:

- TestCalculator();
- ~TestCalculator();
- void test_case1();

**autotest.pro** (Qt-Projektkonfiguration):

```
QT += testlib
QT -= gui

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES +=  tst_testcalculator.cpp \
    calculator.cpp

HEADERS += \
    calculator.h
```

**tst_testcalculator.cpp** (Testsoftware):

```c++
#include "calculator.h"         // Klasse zum Testen
#include <QtTest>

// add necessary includes here
class TestCalculator : public QObject
{
    Q_OBJECT

private slots:                  // jeder Slot ist ein Test
    // -- setup / cleanup --
    void init();                // Initialisierung

    // -- tests --
    void testConstructor();     // Konstruktor(en) Testen
    void testSum();             // Funktion sum() Testen

private:
    int A0 = 0;
    int B0 = 0;

    Calculator mCalc;           // Zu testendes Objekt

};

void TestCalculator::init(){ }

void TestCalculator::testConstructor() {
    // default values
    Calculator c1;

    QVERIFY(c1.getA() == 0);        // Prüfung: nach Initialisierung sind A und B auf 0
    QVERIFY2(c1.getB() == 0, "Zweiter Operand passt nicht");
    // wenn OK:  "PASS : TestCalculator::testConstructor()"
    // wenn NOK: "FAIL! : TestCalculator::testConstructor() 'c1.getA() == 0' returned FALSE. ()
    //            Loc: [../QtTestIntroduction/TestCalculator.cpp(16)]"
}

void TestCalculator::testSum() {
    // Summe des Taschenrechners soll die Summe von A0 und B0 berechnen
    QCOMPARE(mCalc.sum(), A0+B0);
    A0 = 1; B0 = 0;
    QCOMPARE(mCalc.sum(A0,B0), A0+B0);
}

QTEST_APPLESS_MAIN(TestCalculator)      // Ausführung des Tests ohne GUI

#include "tst_testcalculator.moc"
```

In diesem Test wird:

- Eine Initialisierung getestet. Hier ist kein Test eingefügt.

- der Konstruktor getestet. Er wird aufgerufen und es wird geprüft ob anschließend die beiden Parameter a und b Null sind.
- die Funktion *sum()* getestet. Dabei wird die Funktion mit verschiedenen Parametern aufgerufen und die Ergebnisse mit den Return-Werten Verglichen.

Das Testobjekt ist die Klasse *Calculator* ein einfacher Taschenrechner:

**calculator.h:**

```c++
#ifndef CALCULATOR_H
#define CALCULATOR_H

class Calculator {
public:
    Calculator();
    int getA();
    int getB();
    int sum();
    int sum(int a, int b);
private:
    int a;
    int b;
};
#endif // CALCULATOR_H
```

**calculator.cpp:**

```c++
#include "calculator.h"

Calculator::Calculator() {
    a = 0;
    b = 0;
}
int Calculator::getA() {
    return a;
}
int Calculator::getB() {
    return b;
}
int Calculator::sum() {
    return a+b;
}
int Calculator::sum(int a, int b){
    return a+b;
}
```

Diese Konfiguration kann ausgeführt werden und liefert, wenn's klappt:

```
17:14:39: Starte ...Autotest.exe ...
********* Start testing of TestCalculator *********
Config: Using QtTest library 5.13.1, Qt 5.13.1 (i386-little_endian-ilp32 shared (dynamic) debug build; by GCC 7.3.0)
PASS   : TestCalculator::initTestCase()
PASS   : TestCalculator::testConstructor()
PASS   : TestCalculator::testSum()
PASS   : TestCalculator::cleanupTestCase()
Totals: 4 passed, 0 failed, 0 skipped, 0 blacklisted, 1ms
********* Finished testing of TestCalculator *********
17:14:42: ...Autotest.exe wurde mit dem Rückgabewert 0 beendet
```

## Java - JUnit (401)

 https://www.youtube.com/watch?v=v2F49zLLj-8 

- Neues Java-Projekt:
  401_Calculator, mit Setting "Projektordner als Stammverzeichnis für Quellen- und Klassendateien verwenden"

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

  ```
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

