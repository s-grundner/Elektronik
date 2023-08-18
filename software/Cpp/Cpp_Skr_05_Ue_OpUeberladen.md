# 5 Überladen von Operatoren - Übungen

## Datum

Für eine Datum-Klasse (m_tag, m_monat, m_jahr) sollen die Operatoren +, -, und << überladen werden.

- +:Datum + Tage ergibt neues Datum
- -: Datum -Tage ergibt neues Datum
- <<: formatierte Ausgabe in ostream (cout)

## Array (030)

Zuweisungsoperator, Beispiel eigene *array*-Klasse:

```
Array arr1, arr2, arr3; 
...
arr3 = arr1 + arr2;
```

Zuweisungen dieser Art werden häufig verwendet. Hier erfolgen allerdings mehr als nur 1 Schritt. Der erste Schritt ist die Berechnung der Summe `(arr1+arr2) = (x)`. Unabhängig von dieser Operation ist die Zuweisung des Ergebnisses `arr3 = (x)`. Die Zuweisungsoperation hat zwei Operanden: *arr3* und *(x)*. Der erste Operand *arr3* wird durch die Operation verändert und muss daher als Referenz verfügbar sein. Als Member-Funktion ist der erste Operand **this* ohnehin veränderbar. Es ist nicht zulässig die Zuweisungsoperation als Nicht-Member-Funktion zu implementieren. Der Rückgabewert derOperation ist der gesamte Ausdruck `(arr3 = x)`. Die Operation kann ja verkettet verwendet werden, etwa:

```
if ( zeile = read(f) ) {    // Lesen einer Zeile kann true/false zurueckgeben
```

Array-Beispiel:

```c++
#include <iostream>
#include <cstring>

using namespace std;

class array {
private:
    int m_size;
    int *m_dta;
public:
    array(const array& arr) {
        cout << "Copy Constuctor ..." << endl;
        m_size = arr.m_size;
        m_dta = new int[m_size];
        memcpy(m_dta, arr.m_dta, m_size*sizeof(int));
    }
    array(int n) : m_size(n) {
        cout << "Constructor ..." << endl;
        m_dta = new int[n];
    }
    int &operator[](const int &pos) {
        cout << "Index-Operator ..." << endl;
        return *(m_dta+pos);
    }
    array &operator+(array &arr) {
        cout << "Plus-Operator ..." << endl;
        int *ptr = new int[m_size + arr.m_size];
        for (int i=0; i<m_size; i++) {
            ptr[i] = m_dta[i];
        }
        for (int i=m_size; i<(m_size+arr.m_size); i++) {
            ptr[i] = arr.m_dta[i - m_size];
        }
        array *newArr = new array(0);
        newArr->m_dta = ptr;
        newArr->m_size = m_size+arr.m_size;
        return *newArr;
    }
    array &operator=(const array &arr) {
        cout << "Zuweisungs-Operator ..." << endl;
        delete [] m_dta;
        m_size = arr.m_size;
        m_dta = new int[m_size];
        for (int i=0; i<m_size; i++) {
            m_dta = arr.m_dta;
        }
        return *this;
    }
    ~array() {
        cout << "Destructor ..." << endl;
    }
    void print() {
        cout << "[";
        for (int i=0; i<m_size; i++) {
            cout << m_dta[i] << " ";
        }
        cout << "]" << endl;
    }
};

int main() {
    array arr1(3);
    cout << arr1[0] << endl;
    arr1[0] = 1;
    arr1[1] = 2;
    arr1[2] = 3;
    cout << arr1[0] << endl;

    array arr2(arr1);
    arr2[0] = 4;
    cout << arr2[0] << endl;

    array arr3(0);

    arr1.print();
    arr2.print();
    arr3 = arr1 + arr2;					// <-- Zuweisungsoperator
    array arr4 = arr1 + arr2;		// Copy-Konstruktor
    arr3.print();
    arr4.print();
    return 0;
}
```

## Komplex

Folgender Ausschnitt aus einer `main()` soll (sinnvoll) funktionieren:

```c++
complex a(1.1,1), b(2,2), c;

c = a + b;
c = a + 17;
c = a + 3.1415;
c = (int)a;
```

- Überladen Sie einen [] -Operator um mit c[0] den Realteil und mit c[1] den Imaginärteil zurückzugeben.
- Subtraktion mittels - Operator
- Multiplikation mit einer realen Zahl mittels * Operator
- Ausgabe mittels << Operator

## Bruch

- Für eine Bruch-Klasse (m_zaehler, m_nenner) sollen die Operatoren +, -, * und / überladen werden.
- Schreiben Sie eine Überladung für eine Ausgabe mittels << Operator.
- Überladen Sie einen [] -Operator um mit b[0] den Zähler und mit b[1] den Nenner zurückzugeben.

## Stack (130)

Schreiben Sie eine int-Stack-Klasse:

- effizient (dynamisches Array), das Array  soll immer um mindestens 5 Plätze vergrößert werden (Effizienz)
- Einfügen von int-Elementen mittels push
- Lesen des letzten int-Elements mittels top
- Entfernen des letzten Elements mittels pop
- Prüfen ob noch Elemente im Stack mittels empty
- Rückgabe der Anzahl der Elemente mittels size

Die folgenden Operatoren sind notwendig:

- == vergleicht zwei Stacks

- << funktioniert wie push - kann verkettet werden:

  ```
  myStack << 2 << 3;
  ```

- = soll als Zuweisung funktionieren:

  ```
  Stack myStack2;
  myStack2 = myStack1;
  ```

  ganz wichtig: Standardmäßig ist dieser Operator verfügbar - allerdings nur als Shallow-Copy.

- = soll als Copy-Konstruktor funktionieren:

  ```
  Stack myStack2 = myStack1;
  ```

  ganz wichtig: Standardmäßig ist dieser Operator verfügbar - allerdings nur als Shallow-Copy.

- [] soll als Schreibender und auch als Lesender Operator funktionieren (ist zwar unüblich für Stack ...) 

## CString

- Erstellen Sie eine String-Klasse `CString`

- Das angeführte Hauptprogramm soll funktionieren:

  ```c++
  int main()
  {
      CString s1("Hallo ");
      CString s2;
      char str3[] = "Welt ";
      CString s3(str3);
  
      cout << endl << " 1:" << s1 << " 2:" << s2 << " 3:" << s3 << endl;
      s2 = s1 + s3;
      cout << "\"" << s1 << "\" + \"" << s3 << "\" = \"" << s2 << "\"\n";
      s2 = s3;
  
      cout << s2 << endl;
      //s2 += s3;
      s2 += "!";
      s2 = s2 + "?";
      s3 = s2 + '!';
      cout << s3 << endl;
  
      cout << s3[3] << endl;
  
      s1 >> s3;
      s2 = s2 + '!';
      s2 += ' ';
      s2 << s3;
      cout << s2 << endl;
  
      return 0;
  }
  ```

  und soll dieses Ergebnis liefern:

  ```
   1:Hallo  2: 3:Welt
  "Hallo " + "Welt " = "Hallo Welt "
  Welt
  Welt !?!
  t
  Welt !?! Hallo Welt !?!
  ```

- Bauen Sie in den Destruktor eine Ausgabe ein und stellen Sie sicher, dass die dynamisch erzeugte Zeichenkette auch gelöscht wird. Die Ausgabe sieht dann für das gegebene Programm so aus:

  ```
   1:Hallo  2: 3:Welt
  "Hallo " + "Welt " = "Hallo Welt "
  Welt
  <<zerstoere: "!">>
  <<zerstoere: "?">>
  Welt !?!
  t
  Welt !?! Hallo Welt !?!
  <<zerstoere: "Hallo Welt !?!">>
  <<zerstoere: "Welt !?! Hallo Welt !?!">>
  <<zerstoere: "Hallo ">>
  ```

## Company

Vergleichsoperator == ist möglich mit `bool operator==(typ1 a, typ2 b) ... `.

```c++
...
// ein ABTEILUNGsobjekt erstellen und die Personenobjekte einfügen
 
CAbteilung* abteilung= new CAbteilung("Programmierer-Abteilung");
 
abteilung->addMitarbeiter(ich);
abteilung->addMitarbeiter(sie);
abteilung->addMitarbeiter(er);
 
// statt der Verwendung von toString(), wollen wir,
// dass die Klasse sich vollständig in das C++ Konzept
// 'einbettet'
// cout << abteilung->toString() << endl;
 
cout << *abteilung << endl;
...
```

Lösung:

cintarray.h

```c++
class Intarray{
    ...
public:
    ...



};
```

cintarry.cpp

```c++





```



Aufgabe Vergleichsoperator > überladen

```c++
Intarray ia(3), ib(3);
 
 

if (ia > ib) // zB: (1,3, 2) ist groesser als (1,2,3)
```

 intarray.h

```c++
class Intarray{
     ...
     public:
     ...
     ???????????????????????????

 

};
```

intarray.cpp

```c++



```

## New/Delete (031)

Überladen von New[] und Delete[] Operatoren für die Prüfung von Speicherlecks.