## C++ Cipher-Klasse

Übung zum Erstellen von abstrakten Klassen und einfachen Chiffren.

### Hintergrund

Ein Text soll verschlüsselt (chiffriert) werden. Der einfachste Ansatz dazu: jedes Zeichen eines Textes wird im Alphabet verschoben, zum Beispiel um 3 Stellen:

```
A->D
B->E
C->F
...
```

Man nennt diese Chiffre eine **Substitution**, in diesem Fall eine additive. Als Schlüssel dient hier die Zahl 3. Der Verschlüsselnde verschiebt die Buchstaben um 3 Stellen nach Hinten, der Entschlüsselnde verschiebt den verschlüsselten Text (Chiffrat) um 3 Stellen nach Vor.

Für dieses Beispiel wird verschlüsselt:

```
Hallo -> Idoor
```

Für die folgende Aufgabe ist diese Additive Substitution zu implementieren.

Eine weitere Möglichkeit, die vor allem Hardwaretechnisch wesentlich einfacher zu realisieren ist, ist die Substitution mittels XOR. Während die Additive Ver- und Entschlüsselung aufwendig (naja) ist, weil fürs Ver- und Entschlüsseln ein anderer Algorithmus notwendig ist, kann für (bitweise) XOR der Gleiche verwendet werden.

Beispiel: es soll die Zahl 0001 mit dem Schlüssel 0101 ver-XOR t werden:

```
0001 XOR 0101 = 0100
```

das Chiffrat 0100 wird mit dem gleichen Schlüssel 0101 und dem gleichen Algorithmus entschlüsselt:

```
0100 XOR 0101 = 0001
```

Diese Behauptung kann einfach mittels Wahrheitstabelle bestätigt werden.

Mit diesen beiden Substitutionsvarianten sollen Polymorphe-Cipher (Chiffre)- Klassen erstellt werden.

### Basis-Klasse

Erstellen Sie die abstrakte Klasse *Cipher*:

aus cipher.h:

```c++
class Cipher{
public:
    // kodieren/dekodieren des gesamten Strings
    string encrypt(string s, int key);
    string decrypt(string s, int key);

    // kodieren/dekodieren eines Zeichens: muss von ab-
    // geleiteten Klassen implementiert werden
    virtual char encrypt(char ch, int key)=0;
    virtual char decrypt(char ch, int key)=0;
};
```

aus cipher.cpp:

```c++
#include "cipher.h"

string Cipher::encrypt(string s, int key) {

    ... encrypt((char)(s[i]), key);

}

string Cipher::decrypt(string s, int key) {

    ... decrypt((char)(s[i]), key);

}
```

### XorSubstitution (cpp802)

Hier wird ein Schlüssel (int-Zahl) mit jedem Zeichen (char) XOR-Verknüpft. Dass der Schlüssel hier ein int ist spielt keine Rolle, es wird lediglich ein char zurückgegeben.

- Erstellen Sie die Klasse *XorSubstitution*

- Leiten Sie die Klasse von der Klasse *Cipher* ab. Dafür sind abstrakte Methoden zu überschreiben.

- Das folgende Hauptprogramm soll lauffähig sein und mit folgenden Aufruf das angeführte Ergebnis liefern:

  ```
  out.exe "Hello, world!" 23
  [ 95,114,123,123,120,59,55,96,120,101,123,115,54 ]
  korrekte Ver-/Entschluesselung
  ```

  xorcipher.cpp (Demoprogramm):

  ```c++
  #include <string>
  #include "xorsubstitution.h"
  #include <iostream>
  using namespace std;
  
  int main (int argc, char* argv[]) {
      string plainText;
      int key;
  
      plainText = string(argv[1]);
      sscanf(argv[2], "%i", &key);
  
      Cipher* cipher = new XorSubstitution();
      // -----------------Kodieren:
      string cryptText = cipher->encrypt(plainText, key);
  
      cout << "[ ";
      for (unsigned int i=0; i< cryptText.size() -1; i++){
          cout << (int) cryptText[i] << "," ;   // Ausgabe als ASCII-Codes
      }
      cout << (int) cryptText[cryptText.size() -1];
      cout << " ]" << endl;
  
      // -----------------Dekodieren:
      string decoded = cipher->decrypt(cryptText, key);
  
      // -----------------Vergleich mit Ausgangsstring:
      if (plainText == decoded)
          cout << "korrekte Ver-/Entschluesselung" <<endl;
      else
          cout << "fehlerhafte Ver-/Entschluesselung" <<endl;
  
      return 0;
  }
  ```

### AddSubstitution (cpp803)

Hier wird der Schlüssel mit jedem Zeichen addiert. Überläufe können ignoriert werden, bei der Dekodierung gibt es entsprechende Unterläufe.

- Erstellen Sie die Klasse *AddSubstitution*

- Leiten Sie die Klasse von der Klasse *Cipher* ab. Dafür sind abstrakte Methoden zu überschreiben.

- Das folgende Hauptprogramm soll lauffähig sein und mit folgenden Aufruf das angeführte Ergebnis liefern:

  ```
  out.exe "Hello, world!" 23
  [ 95,124,-125,-125,-122,67,55,-114,-122,-119,-125,123,56 ]
  korrekte Ver-/Entschluesselung
  ```

  addcipher.cpp (Demoprogramm):

  ```c++
  #include <string>
  #include "addsubstitution.h"
  #include <iostream>
  using namespace std;
  
  int main (int argc, char* argv[]) {
      string plainText;
      int key;
  
      plainText = string(argv[1]);
      sscanf(argv[2], "%i", &key);
  
      Cipher* cipher = new AddSubstitution();
      // -----------------Kodieren:
      string cryptText = cipher->encrypt(plainText, key);
  
      cout << "[ ";
      for (unsigned int i=0; i< cryptText.size() -1; i++){
          cout << (int) cryptText[i] << "," ;   // Ausgabe als ASCII-Codes
      }
      cout << (int) cryptText[cryptText.size() -1];
      cout << " ]" << endl;
  
      // -----------------Dekodieren:
      string decoded = cipher->decrypt(cryptText, key);
  
      // -----------------Vergleich mit Ausgangsstring:
      if (plainText == decoded)
          cout << "korrekte Ver-/Entschluesselung" <<endl;
      else
          cout << "fehlerhafte Ver-/Entschluesselung" <<endl;
  
      return 0;
  }
  ```

