# Array-Klasse

## Op-Überladen

```c++
#include <iostream>

using namespace std;

class array {
public:
  // Copy-Constructor
  array(const array &arr) {
    m_size = arr.m_size;
    m_dta = new int[m_size];
    for (int i=0; i<m_size; i++) {
      m_dta[i] = arr.m_dta[i];
    }
  }
  array(const int &n) {
    m_size = n;
    m_dta = new int[n];
  }
  int &operator[](int idx) {
    return *(m_dta+idx);
  }
  array operator+(const array &arr) {
    array neuArr(m_size+arr.m_size);
    for (int i=0; i<m_size; i++) {
      neuArr.m_dta[i] = m_dta[i];
    }
    for (int i=0; i<arr.m_size; i++) {
      neuArr.m_dta[m_size+i] = arr.m_dta[i];
    }
    return neuArr;
  }
  private:
  int m_size;
  int *m_dta;
};

int main()
{
  array arr1(2);

  arr1[0] = 1;
  arr1[1] = 2;
  cout << arr1[0] << endl;

  array arr2(arr1);
  arr2[0] = 3;
  arr2[1] = 4;
  array arr11(0);

  arr11 = (arr1 + arr2);       // 1)
  array arr10 = arr1 + arr2;   // 2)

  cout << endl << arr10[0] << endl;
  cout << arr10[1] << endl;
  cout << arr10[2] << endl;
  cout << arr10[3] << endl;
  cout << arr10[4] << endl;

  return 0;
}
```

1.  `arr11 = (arr1 + arr2);`

   - Rechts vom Gleichheitszeichen: + Operation. Dieser Klammerausdruck wird ausgewertet und gibt ein neu erzeugtes array-Objekt zurück.

   - Gleichheitszeichen: Zuweisungsoperation, ohne Überladen erzeugt diese Operation eine flache Kopie des Objekts rechts vom Gleichheitszeichen

   Problem: das Objekt rechts vom Gleichheitszeichen (Additionsobjekt) bleibt bestehen. Für uns hier ist das praktisch, der Zeigerinhalt bleibt bestehen, allerdings bleibt auch zusätzlich der Speicherplatz für m_size bestehen.

   **Lösung Teil 1:** Destruktor der den Inhalt freigibt:

   ```c++
   ~array() {
     for(int i=0; i<m_size; i++)
       m_dta[i] = 99;
     delete[] m_dta;
   }
   ```

   der Teil in dem dir Daten mit 99 überschrieben werden ist eigentlich gar nicht notwendig, er ist lediglich dazu da um zu zeigen, dass arr11 die entsprechenden Werte annimmt. Nun wird zwar das temporäre Objekt *neuArr* am Ende der *operator+* Funktion zerstört, allerdings hat nun *arr11* keinen sinnvollen Wert.

   **Lösung Teil 2:** der Standard-*Zuweisungsoperator =* macht eine *flache* Kopie (*shallow*) des errechneten neuen Arrays. Hier muss eine *tiefe* Kopie (*deep*) gemacht werden:

   ```c++
   array &operator=(const array &arr) {
     m_size = arr.m_size;
     for (int i=0; i<m_size; i++) {
       m_dta[i] = arr.m_dta[i];
     }
     return *this;
   }
   ```

   Beim Ausführen wird ersichtlich: der Destruktor mit den 99er Markierungen hat keine Auswirkung mehr.

2. `array arr10 = arr1 + arr2;`

   - Rechts vom Gleichheitszeichen ist eine *operator+*-Operation wie vorhin auch.
   - Links vom Gleichheitszeichen wird ein Objekt neu definiert. Dadurch hat der *=* Operator hier die Bedeutung des *Initialisierungs-Operators*.
     - Wenn rechts vom Gleichheitszeichen ein Objekt verfügbar ist, dann wird es direkt als *arr10* Objekt übernommen (keine Kopierfunktion o.ä.).
     - Kann das Objekt nicht direkt übernommen werden, dann wird hier der *Copy-Konstruktor* aufgerufen.

   Beide Fälle sind fehlerfrei möglich.

## Iteratoren

Um durch Listen-ähnliche Strukturen laufen zu können werden *Iteratoren* definiert. Für das obige Array-Beispiel:

```c++
for (int *it=arr11.begin(); it!=arr11.end();it++) {
  cout << *it << " ";
}
```

Mit der *begin()* Funktion wird auf das erste Element der Auflistung gezeigt und mit *end()* auf das Element nach dem letzten Element gezeigt. Der *-Operator des Iterators wird so überladen, dass er ein aktuelles Element zurückgibt und der ++-Operator wechselt von einem Element auf sein folgendes.

Implementieren Sie die notwendigen Funktionen (für diese Array-Klasse ist das trivial).

## Template

Erweitern Sie das obige Array-Beispiel damit es nicht nur für int-Typen funktioniert, sondern für alle Datentypen - **generische Programmierung**. Dazu wird der Klasse vorangestellt:

```c++
template<typename *>
```

und überall in der Klasse wo der int-Datentyp des Elements angeführt ist, wird dieser durch *T* ersetzt. Im Hauptprogramm wird *array* ersetzt durch *array\<int\>*. Das Programm funktioniert genau gleich wie zuvor. Erweitern Sie das Hauptprogramm:

```c++
array<____________> strArr(4);   // Typ einfuegen
strArr[0] = "Hallo";
strArr[1] = " ";
strArr[2] = "Welt";
strArr[3] = "!";

for (auto strIt=strArr.begin(); strIt!=strArr.end();strIt++) {
  cout << *strIt << " ";
}
cout << endl;
```

Hier wird *auto* als Datentyp verwendet. Der Compiler prüft die Software und wählt automatisch den richtigen Datentypen. Dieses Schlüsselword ist erst ab C++11 verfügbar. Viele Compiler lassen es trotzdem auch in früheren Versionen zu. Der Vorteil von auto wird gerade in dieser Schleife sichtbar - wenn array als int oder als char* definiert werden, muss der Iterator ebenfalls angepasst werden. Für die generische Programmierung wird angestrebt das Programm an möglichst wenigen Stellen verändern zu müssen.

Grundsätzlich wird empfohlen: auto für solche Fälle auf alle Fälle verwenden. C++ macht in vielen Fällen sehr "entspannte" Type-Casts und dadurch können für diese Fälle Fehler entstehen. Mit auto werden diese Fehler vermieden.

Frage: obiges Arbeiten mit *char\** als Array-Elemente resultiert in Pointer-auf-Pointer Elemente des Arrays. Werden dadurch Speicher-Lecks verursacht?

# Weitere Datenstrukturen

Manchmal sollen:

- Daten in eine Struktur abgelegt werden und in der umgekehrten Reihenfolge entnommen werden. Dann ist eine Stack-Struktur praktischer
- Daten in eine Struktur abgelegt werden und in der gleichen Reihenfolge entnommen werden. Dann ist eine Queue-Struktur (FIFO) praktischer
- Daten in eine Struktur abgelegt werden und beliebig in der Mitte Elemente eingefügt oder entnommen/entfernt werden können. Dann ist eine verkettete Liste effizienter

Arrays sind die effizienteste Art Daten zu speichern, wenn die Größe bekannt ist und nicht verändert werden muss. Der Zugriff auf eine beliebige Zelle kann sehr schnell erfolgen.

Wann immer die Größe mit der Laufzeit verändert werden muss oder Funktionen wie Einfügen von Elementen in der Mitte und/oder Vorne und/oder in der Mitte notwendig sind gibt es effizientere Strukturen. Diese anderen Strukturen können analog zum Array entwickelt werden.

Werden diese Lösungen nicht äußerst akribisch untersucht, kann es schnell passieren, dass *Speicher-Lecks* zurückbleiben. Sehr problematisch sind diese, weil sie oft sehr lange unentdeckt bleiben und wenn sie dann auftreten, dann können die Ursachen schwer gefunden werden.