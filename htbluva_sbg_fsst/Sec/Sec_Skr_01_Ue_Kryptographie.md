# 1 Kryptographie - Übungen

## Symmetrische Verfahren

### Caesar-Chiffre

Erstellen Sie eine C++ Funktion zur Kodierung eines Texts mittels Caesar-Chiffre. Jeder Großbuchstabe soll dafür zuvor in einen Kleinbuchstaben umgewandelt werden. Kodiert werden anschließend nur Buchstaben, Sonderzeichen bleiben bestehen.

```c++
string codeVerschiebeCh(string str, int shift);
```

Testen Sie die Funktion mittels dem Beispiel-Text:

```
In einem Raumgebiet befinde sich ein elektrisches Feld (weil zum Beispiel gerade eine Gewitterwolke darueber schwebt). Stell dir vor, du moechtest jemandem mitteilen, wie viel und was fuer Feldstoff sich an einer bestimmten Stelle des Gebiets befindet. Du brauchst dazu ein Mass, eine physikalische Groesse. Ein solches Mass ist die elektrische Feldstaerke. Man wuerde wahrscheinlich zunaechst erwarten, dass die elektrische Feldstaerke einfach in der Naehe eines geladenen Koerpers einen grossen Wert hat und in groesserer Entfernung einen kleinen. Nun kann man aber das Feld so noch nicht eindeutig beschreiben. Wir hatten festgestellt, dass im elektrischen Feld sowohl Druck- als auch Zugspannungen herrschen koennen. Tatsaechlich ist es so, dass in einem Feld Zug und Druck an jedem Ort gleichzeitig herrschen. Wie ist das moeglich? Fuer jedes Stueckchen Feldstoff gibt es eine ausgezeichnete Richtung, in der das Feld unter Zugspannung steht. Wir nennen sie die Zugrichtung. In allen Richtungen quer dazu steht es unter Druckspannung. Abb. 1.42 zeigt einen kleinen Zylinder, den wir in Gedanken aus einem Feld herausgeschnitten haben, und zwar so, dass die Zylinderachse in der Zugrichtung des Feldes liegt. In den Richtungen quer dazu herrscht Druckspannung. (Dass ein Material an jeder Stelle eine ausgezeichnete Richtung hat, ist keine seltene Eigenschaft. So hat die Maserung eines Holzstuecks an jeder Stelle eine bestimmte Richtung.
```

Ein gute Kontrolle ist möglich, wenn als Verschiebe-Spanne zweimal hintereinander 13 eingegeben wird, dann wird auf den ursprünglichen Text verschoben (*ROT13*).

### Verschiebe-Chiffre Decoding

In deutschsprachigen Texten kommen die Buchstaben mit etwa folgender Häufigkeit ([https://de.wikipedia.org/wiki/Buchstabenh%C3%A4ufigkeit](https://de.wikipedia.org/wiki/Buchstabenhäufigkeit)) vor:

| a    | b    | c    | d    | e     | f    | g    | h    | i    | j    | k    | l    | m    |
| ---- | ---- | ---- | ---- | ----- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 6,51 | 1,89 | 3,06 | 5,08 | 17,40 | 1,66 | 3,01 | 4,76 | 7,55 | 0,27 | 1,21 | 3,44 | 2,53 |


| n    | o    | p    | q    | r    | s    | t    | u    | v    | w    | x    | y    | z    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 9,78 | 2,51 | 0,79 | 0,02 | 7,00 | 7,27 | 6,15 | 4,35 | 0,67 | 1,89 | 0,03 | 0,04 | 1,13 |

Der Buchstabe *e* kommt demzufolge mit etwa 17%iger Wahrscheinlichkeit vor. Schreiben Sie eine C++ Funktion die die Häufigkeit von Buchstaben in einem verschlüsselten Text ermittelt und demzufolge den Text decodiert. Die einfachste Art ist es lediglich das am häufigsten auftretende Zeichen zu ermitteln.

### Homophone Chiffre

Erstellen Sie einen Substitution-Code um eine binäre Zeichenübertragung zu kodieren. Bekannt ist, dass das Zeichen 0 mit einer Häufigkeit von 80% auftritt. Ein einfacher verschiebender Code ist leicht zu brechen, Beispiel für einen Klartext:

```
0 1 0 0 0 1 1 0 0 0 0 0 0 0 0  
```

Unabhängig davon wie eine einfache, direkte Ersetzung erfolgt ist der Code durch die deutliche Häufung des Zeichens `0` relativ einfach.

Daher besser *homophon* Kodieren:

```
1ter 0er: A
2ter 0er: B
3ter 0er: D
4ter 0er: E
     1er: C
```

Damit ergibt sich obiger Klartext kodiert:

```
0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 
A C B D E C C A B D E A B D E 
```

Jedes Zeichen kommt mit der gleichen Häufigkeit vor, ein Brechen des Codes ist ohne zusätzliche Information hier nicht möglich. Wenn genügend Geheimtext bekannt ist, kann allerdings erkannt werden, dass die Zeichen A-B-D-E immer in der gleichen Reihenfolge vorkommen, weitere Verbesserung: zufällige Abfolge dieser Zeichen (mit gleicher Häufung).

## C++ Cipher-Klasse

Übung zum Erstellen von abstrakten Klassen und einfachen Chiffren.

### Basis-Klasse

Erstellen Sie die abstrakte Klasse *Cipher*:

aus Cipher.h:

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

aus Cipher.cpp:

```c++
#include "Cipher.h"

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

  main.cpp:

  ```c++
  #include <string>
  #include "XorSubstitution.h"
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

  main.cpp:

  ```c++
  #include <string>
  #include "ADDSubstitution.h"
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

### Strom-Chiffre (cpp804)

Die obigen Codes sind nach modernen Erkenntnissen statistisch trivial zu Brechen. Aus diesem Grund wird hier jedes Zeichen mit einem anderen Code verschlüsselt.

![Kry_StromChiffre](bilder/Kry_StromChiffre.png)

Dafür wird ein Strom an Schlüsseln generiert. Für unser Beispiel soll dieser Strom mittels Zufallsgenerator erzeugt werden. Es hilft uns, dass der Zufallsgenerator immer die gleiche Zahlenfolge liefert, wenn mit einem gleichen Seed gestartet wird. Dadurch kann beim Entschlüsseln "zufällig" die gleiche Schlüsselfolge generiert werden. Wird der folgende Code ausgeführt, erhält *num* immer den gleichen Wert (auf dem gleichen System).

```c++
srand(10);
int num = rand() % 256;
```

Mit den so erzeugten Schlüsseln wird das Zeichen mittels obiger *XorSubstitution* verschlüsselt.

<img src="bilder/Kry_StreamCipher_.png" style="zoom:80%;" />

- Erstellen Sie die Klasse *StreamCipher* abgeleitet von der *XorSubstitution*-Klasse.

- Die *encrypt/decrypt*-Methoden der *Cipher*-Klasse müssen überschrieben werden. Auszug StreamCipher.cpp:

  ```c++
  string  StreamCipher::encrypt(string s, int key){
    // Schluesselstromgenerator initialisieren
    srand(key);
  
    // XOR-Verschlüsselung verwenden
    for (unsigned int i=0; i < s.size(); i++){
      s[i] = XorSubstitution::encrypt       ... rand()%256 ...
    }
    return s;
  }
  ```

- Das folgende Hauptprogramm soll lauffähig sein und mit folgenden Aufruf das angeführte Ergebnis liefern (die Zahlen können hier abweichen):

  ```
  out.exe "Hello, world!" 23
  [ 57,-79,-98,25,37,-52,111,105,38,68,-1,-34,-95 ]
  korrekte Ver-/Entschluesselung
  ```

  main.cpp:

  ```c++
  #include <string>
  #include "StreamCipher.h"
  #include <iostream>
  #include <cstdio>
  
  using namespace std;
  
  int main (int argc, char* argv[]) {
    string plainText;
    int key;
  
    plainText = string(argv[1]);
    sscanf(argv[2], "%i", &key);
  
    // Achtung: nicht Cipher, ueberschr. Meth. soll verw. werden:
    StreamCipher* cipher = new StreamCipher();
    // -----------------Kodieren:
    string cryptText = cipher->encrypt(plainText, key);
  
    cout << "[ ";
    for (unsigned int i=0; i< cryptText.size() -1; i++)
    {
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

### Diffie-Hellman

Um Daten zwischen 2 Kommunikationsteilnehmern sicher (verschlüsselt) austauschen zu können, muss ein Schlüssel ausgetauscht werden. Der Austausch von Schlüssel ist immer problematisch.

- Mittels **asymmetrischer Verfahren** (Verschlüsselungsschlüssel ungleich Entschlüsselungsschlüssel) kann dieses Problem gelöst werden.

- Jeder Kommunikationsteilnehmer generiert sich ein Schlüsselpaar (p, s) mit einem öffentlichen Schlüssel **P** (**Public Key**) und einem geheimen Schlüssel **S** (**Secret Key**).

- Eine Nachricht, die mit P verschlüsselt wurde, lässt sich nur mit S wieder entschlüsseln und umgekehrt. P und S sind invers zueinander.

- Will Alice einen Liebesbrief P (Klartext) an Bob schicken, den kein Anderer lesen soll, so verschlüsselt sie ihn mit Bobs öffentlichem Schlüssel $p_B$. Nur Bob ist im Besitz des zugehörigen geheimen Schlüssels $s_B$ und kann damit Alices verschlüsselten Brief C (Chiffrat) entschlüsseln.

![Kry_DHCipher](bilder/Kry_DHCipher.png)

- Asymmetrische Verfahren können auch verwendet werden, um damit über eine ungeschützte Verbindung einen geheimen symmetrischen Schlüssel zu vereinbaren, der dann zur Verschlüsselung einer vertraulichen Nachricht verwendet wird. Symmetrische Verfahren sind wesentlich schneller (vor allem wichtig bei größeren Datenmengen).

- Ein solches **Schlüsselvereinbarungsprotokoll** geht auf Whitfield **Diffie** und Martin **Hellman** zurück. 

- Ein **Trustcenter** veröffentlicht eine große Primzahl n und dazu eine kleinere Zahl g (Generator)  $g = [2, ..., n-2]$ mit der Eigenschaft, dass die Potenzen von g modulo n alle Zahlen zwischen 1 und n-1 durchlaufen. 

- Jeder Kommunikationsteilnehmer veröffentlicht seinen Public Key p bei einem Trustcenter. Dafür wird eine **geheime Zahl s** (Secret Key) gewählt ($s = [1, ..., n-1]$) und berechnet den Public Key $p = g^s mod\ n$ und schickt diesen zur Veröffentlichung an das Trustcenter.  

![Kry_DHCipher_02](bilder/Kry_DHCipher_02.png)

Beachten Sie:

Die von Bob und Alice unabhängig berechneten Schlüssel **k sind gleich** (ohne sie auszutauschen)

**Alice:** $k = p_B^{s_A} mod \ n$

**Bob:**  $k = p_A^{s_B} mod \ n$

Es gilt allgemein: $p= g^s mod\ n$

$p_A = g^{s_A} mod\ n$      bzw.     $p_B = g^{s_B} mod\ n$

Bob: 	$k = p_A^{s_B} mod\ n  = (g^{s_A} mod\ n)^{s_B} mod\ n = g^{s_A\cdot s_B} mod\ n$

Alice: 	$k = p_B^{s_A} mod\ n  = (g^{s_B} mod\ n)^{s_A} mod\ n = g^{s_B\cdot s_A} mod\ n$

### DHCipher-Klasse (cpp800)

Definieren Sie eine Klasse *DHCipher*.

Der Konstruktor erhält als Parameter n (Primzahl) und g (2 < g < n-2). Er erzeugt einen zufälligen geheimen Schlüssel s (Zufallszahl) (mit 1 < s < n-1) und berechnet daraus den zugehörigen öffentlichen Schlüssel $p = g^s mod\ n$. 

Der geheime Schlüssel bleibt in der Klasse, der öffentliche Schlüssel wird über den Getter *getPublicKey()* allgemein zur Verfügung gestellt. 

*getPublicKey()* spielt die Rolle des Trustcenters (damit kann ein Public Key bezogen werden).

Die Methoden *encrypt(text, publicKey)* und *decrypt(text, publicKey)* berechnen aus dem übergebenen öffentlichen Schlüssel p des Partners und dem eigenen geheimen Schlüssel s den gemeinsamen geheimen symmetrischen Schlüssel

$k = p^s mod\ n$. 

Dieser dient zur Initialisierung der Stromchiffre (s. o.), mit der der übergebene Text ver- beziehungsweise entschlüsselt wird.

Das nachfolgende Testprogramm holt sich den Klartext und g und n von der Kommandozeile. Zur Vereinfachung kann auch mit festen Werten gearbeitet werden, wie zum Beispiel n = 23 und g = 5.

```c++
...
cout << endl << "*** DIFFI-HELLMAN *** " << endl;
int n=23;
int g=5;
```

Anschließend erzeugt das Programm zwei DHCipher-Objekte alice und bob, die mit den Daten initialisiert werden, die vom Trustcenter stammen würden:

```c++
DHCipher* alice = new DHCipher(n, g);
DHCipher* bob = new DHCipher(n, g);
```

Bobs öffentlicher Schlüssel wird an Alice übergeben, die damit den Klartext (*plainText*) zu *cryptText* verschlüsselt:

```c++
cryptText = alice->encrypt(plainText, bob->getPublicKey());
cout << "[ ";
for (unsigned int i=0; i< cryptText.size() -1; i++){
  cout << (int) cryptText[i] << "," ;
}
cout << (int) cryptText[cryptText.size() -1];
cout << " ]" << endl;
```

Bob entschlüsselt *cryptText* mithilfe von Alices öffentlichem Schlüssel. Schließlich wird verifiziert, dass die ursprüngliche Nachricht korrekt zurückgewonnen wurde:

```c++
decoded = bob->decrypt(cryptText, alice->getPublicKey());

if (plainText == decoded)
  cout << "true" <<endl;
else
  cout << "false" <<endl;

...
```

Das Testprogramm gibt je nach zufällig gewählten Schlüsseln verschiedene Zahlenfolgen aus, beispielsweise:

```
> out.exe "Hello, world!" 23

[50, -36, -105, -65, -60, -126, -78, -79, 76, -62, -72, -lll, 42]
korrekte Ver-/Entschluesselung
```

Hier nun die Klasse DHCipher:

```c++
class DHCipher{
private:
  int secretKey;
  int publicKey;
  int n;
public:
  DHCipher(int n, int g);
  int getPublicKey();
  int sharedKey(int otherKey);

  string encrypt(string s, int key);
  string decrypt(string s, int key);
};
```

## Asymmetrische Verfahren RSA

Algorithmus:

- Auswahl zweier großer Primzahlen **p** und **q**
- Berechnung **N** = p q
- Ermitteln von $\varphi(N) = (p - 1)(q - 1)$                  (*Eulersche-Funktion*)
  Wahl einer natürlichen Zahl **e** für die gilt: $e \in \{1, ... , \varphi-1\}$ und e und $\varphi$ sind prim zueinander (ggT ist 1) und größer 1
- Berechnung $d = (e\ mod\ \varphi)^{-1}$ mittels erweiterten Euklidischen Algorithmus.
- Öffentlicher Schlüssel: **P** = (e, N), Verschlüsseln von m mit $c = m^e mod \ N$
- Privater/Geheimer Schlüssel **S** = (d, N), Entschlüsseln von c mit $m = c^d mod \ N$

Die Nachricht wird geblockt codiert, die Blockgröße ist kleiner als N zu wählen.

### RSA Schlüssel Ermitteln

#### Allgemeines Vorgehen

- Wahl zweier unterschiedlicher Primzahlen
  **p = 13, q = 7**

- Berechnung RSA-Modul $N = p \cdot q$:
  **N = 13*7 = 91**

- Berechnung $\varphi(N)$                                      $\varphi(N)=\varphi(p\cdot q) =(p-1)\cdot (q-1) = 12 \cdot 6$

  $\varphi(N) = $ **72**      ( Anzahl der teilerfremden Zahlen von 91 )

- Verschlüsselungsexponent $1 < e < \varphi(N)$    und     $ggT(e, \varphi(N)) = 1$:
  **e = 5**

- Entschlüsselungsexponent $e\cdot d \equiv 1\ mod\ \varphi(N) = 5\cdot d \equiv 1 \ mod\ 72$, Lösung durch Probieren (Excel?):

  **d = 29**
  (Unten wird die Lösung mittels Euklidischen Algorithmus gezeigt)

- Public-Key: (e,N) = (5, 91)
  Private-Key: (d,N) = (29, 91)

praktisch wird e klein gewählt, häufig wird 65535 gewählt. Für die Sicherheit der Verschlüsselung ist entscheidend: nur e, N dürfen öffentlich bekannt sein. Die Zwischenergebnisse, sowie p und q dürfen nicht öffentlich sein.

- Primzahlen: sind nur durch 1 und sich selbst teilbar

- Zahlenbereich der zu verschlüsselnden Nachricht: N = 91. Daher können Zeichen/Zahlen im Bereich von 0-90 verschlüsselt werden (z.B. a-z, A-Z, 0-9 und Sonderzeichen, Achtung ASCII beinhaltet 128 Zeichenmöglichkeiten)
- Die Chiffrat c für die Nachricht m = 66:
  $c=m^e \mod N = 66^5 \mod 91 = 40$
- Die Entschlüsselung von c = 40 (siehe Unten: Rechnen mit großen Zahlen):
  $m=c^d \mod N = 40^{29} \mod 91 = 66$
- N ist nicht prim, p ist prim, q ist prim
- N=p*q ... warum sind p, q unbekannt wenn N öffentlich ist?
  Da die Zahlen sehr groß sind, ist die Berechnung zu aufwendig.
- $ggt(e, \varphi(N))=1$
- Was bedeutet $e\cdot d \equiv 1 \mod\ \varphi(N)$?
  dass gelten muss      $e\cdot d \mod\ \varphi(N) = 1 $?
- $\varphi(N)$ - Eulersche-Funktion - Anzahl der zu N teilerfremden Zahlen
- $\varphi(N) = N-1$ für N ist eine Primzahl 

Im Folgenden wird ein Beispiel in 3 unterschiedlichen Varianten durchgerechnet.

Berechnen Sie einen einfachen (3 stellig) privaten, geheimen Schlüssel und einen dazu passend öffentlichen, public-Schlüssel.

Zur Lösung der Gleichung $(d\cdot e)\mod \varphi = 1$:

- Anwendung des Euklidischen Algorithmus zur Ermittlung des ggT zwischen $e$ und $\varphi$ (ist immer 1 weil e ja so gewählt wird).
- Ausgehend von der vorletzten Gleichung ( 1=...) wird der erweiterte Euklidische Algorithmus angewendet. Dabei werden die Terme nicht einfach ausmultipliziert sondern, solange es Reste aus der vorhergehenden Gleichung sind, eingesetzt.

#### Variante 1

```
p = 13, q = 11
N = p * q = 143
phi(N) = 12 * 10 = 120
e = 17	(gewählt so dass: phi = 120 ist teilerfremd zu e = 17)
Lösung der Gleichung    d * e mod phi = 1
nach d
```

Euklidischer Algorithmus (ggT Berechnung) (<https://www.mathe-online.at/materialien/Franz.Embacher/files/RSA/Euklid.html>):

```
ggT(e, phi) = ggt(17, 120) -> wir wissen dieser muss 1 sein (wurde ja so gewählt)
120 = 7 * 17 + 1    -> 17 und 120 aus Angabe
17 = 17 * 1 + 0     -> 1ter 17er wurde von oben runtergeholt, 1er wurde von oben runtergeholt, 2ter 17er wurde ermittelt und 0er ebenfalls
-> da kein Rest, Rechnung fertig, ggT ist der Multiplikator von 17 also 1
```

Erweiterter euklidischer Algorithmus, Verwenden der vorletzten Zeile ( 1 = ...), und den Algorithmus von unten nach oben wieder durchgehen. Hier ein Sonderfall, weil die Rechnung so kurz ist:

```
1 = 120 - 7 * 17
```

Womit:

```
-7 * 17 mod 120 = 1			da die Gesuchte positiv sein soll, wird 17 * 120 addiert, ändert ja Nichts, da Vielfaches von 120
(120 - 7) * 17 mod 120 = 1
1921 mod 120 = 1
```

Damit:

```
d = 120 - 7 = 113
```

**Öffentlicher Schlüssel: P = (17, 143)**, Verschlüsseln von m mit $c=m^{17} mod(143)$

**Privater Schlüssel: S = (113, 143)**, Entschlüsseln von c mit $m=c^{113} mod(143)$

Alternative: Tabellarischer Weg (Christian Spannagel):

![Kry_Rsa_Euklid_01](bilder/Kry_Rsa_Euklid_01.png)

also e = -7: wir wollen eine positive Zahl, damit wir das Ergebnis (Rest) nicht verändern dürfen wir 120 dazuzählen: **e** = -7 + 120 = **113**

#### Variante 2

```
p = 13, q = 11
N = p * q = 143
phi(N) = 12 * 10 = 120
e = 19	(phi = 120 ist teilerfremd zu e = 19)
Lösung der Gleichung d * e mod(phi) = 1
Lösung der Gleichung d * 19 mod(120) = 1
```

Euklidischer Algorithmus:

```
ges.: ggt(19, 120)
120 = 6 * 19 + 6
19 = 3 * 6 + 1
6 = 6 * 1 + 0	--> ggT ist 1 (war ja so gewählt)
```

Erweiterter Euklidischer Algorithmus (Reste werden ersetzt (hier 6,1)):

```
Rest: 6 = 120 - 6 * 19
Rest: 1 = 19 - 3*6

1 = 19 - 3*(120 - 6*19)
  = 19*19 - 3*120

19 * 19 mod 120 = 1 ==> d = 19
```

Alternative: Tabellarischer Weg (Christian Spannagel):

![Kry_Rsa_Euklid_01](bilder/Kry_Rsa_Euklid_02.png)

also **d** = **19**

#### Variante 3

```
p = 13, q = 11
N = p * q = 143
phi(N) = 12 * 10 = 120
e = 23	(phi = 120 ist teilerfremd zu e = 23)
Lösung der Gleichung d * e mod(phi) = 1
Lösung der Gleichung d * 23 mod(120) = 1
```

Euklidischer Algorithmus:

```
ges.: ggt(23, 120)
120 = 5 * 23 + 5
23 = 4 * 5 + 3
5 = 1 * 3 + 2
3 = 1 * 2 + 1
2 = 2 * 1 + 0 --> ggT ist 1 (war ja so gewählt)
```

Erweiterter Euklidischer Algorithmus (Reste werden ersetzt (hier 5, 3, 2, 1)):

```
Rest: 5 = 120 - 5*23
Rest: 3 = 23 - 4*5
Rest: 2 = 5 - 1*3
Rest: 1 = 3 - 1*2

1 = 3 - 1*2
  = 3 - (5-1*3)
  = 23-4*5 - (5-23+4*5) = 2*23 - 9*5
  = 2*23 - 9*(120-5*23) = -9*120 + 47*23

47 * 23 mod 120 = 1   ==> d = 47
```

Alternative: Tabellarischer Weg (Christian Spannagel):

![Kry_Rsa_Euklid_01](bilder/Kry_Rsa_Euklid_03.png)

also **d** = 120-73 = **47**

### Erweiterter Euklidischer Algorithmus

Ermitteln Sie **d** aus der Gleichung

```
d*47 mod 60 = 1
```

mittels erweiterten Euklidischen Algorithmus.

Lösung:

| a    | b    | q    | r    | x      | y    |
| ---- | ---- | ---- | ---- | ------ | ---- |
| 47   | 60   | 0    | 47   | **23** | -18  |
| 60   | 47   | 1    | 13   | -18    | 23   |
| 47   | 13   | 3    | 8    | 5      | -18  |
| 13   | 8    | 1    | 5    | -3     | 5    |
| 8    | 5    | 1    | 3    | 2      | -3   |
| 5    | 3    | 1    | 2    | -1     | 2    |
| 3    | 2    | 1    | 1    | 1      | -1   |
| 2    | 1    | 2    | 0    | 0      | 1    |

Damit gilt **d** = **23**.

Probe:

```
 23 * 47
--------
 92
 161
--------
1081 : 60 = 18
 48
   1 Rest
```

### Brechen eines RSA

Gegeben ist das Chiffrat:

```
c = "8 1 4 7 2 5 6"
```

und der Public-Key(e, N):  (3, 10)

Brechen Sie die Verschlüsselung mittels Brute Force und berechnen Sie den unverschlüsselten Plain-Text.

Lösung:

- Für die Entschlüsselung wird der Private-Key benötigt. Dieser muss ermittelt werden.
  Es gilt: $\varphi(N)$ ist die Anzahl der zu N teilerfremden Zahlen.
  

In der Menge 1..N: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] sind zu N = 10 folgende **4** Zahlen teilerfremd:
  [1, 3, 7, 9] - alle anderen Zahlen haben einen ggT zusammen mit 10 ungleich 1.

Damit gilt für die Eulersche Funktion: $\varphi(N) = \varphi(10) = 4$

Für $d$ und $e$ gilt - beide müssen kleiner $\varphi(N)=4$ sein. Weiters gilt:

$d\cdot e \equiv 1 \mod \varphi(N)$

d kann nun durch Probieren ermittelt werden:

| d    | $3\cdot d\ mod\ 4$ | Ergebnis |
| ---- | ------------------ | -------- |
| 1    | $3\cdot 1\ mod\ 4$ | 3        |
| 2    | $3\cdot 2\ mod\ 4$ | 2        |
| 3    | $3\cdot 3\ mod\ 4$ | 1        |

lediglich **d = 3** liefert den gesuchten Rest.

- Entschlüsseln des Textes: $m = c^d \mod\ N$            mit               $d = 3$            $N = 10$            $\varphi(N) = 4$

  | c               | 8    | 1    | 4    | 7    | 2    | 5    | 6    |
  | --------------- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | berechne: $c^d$ | 512  | 1    | 64   | 343  | 8    | 125  | 216  |
  | $m= c^d \mod N$ | 2    | 1    | 4    | 3    | 8    | 5    | 6    |
  | Buchstabenfolge | B    | A    | D    | C    | H    | E    | F    |

- Probe: Verschlüsseln: $c = m^e \mod N$              mit               $e = 3$            $N = 10$            $\varphi(N) = 4$

  | m                | 2    | 1    | 4    | 3    | 8    | 5    | 6    |
  | ---------------- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
  | berechne: $m^e$  | 8    | 1    | 64   | 27   | 512  | 125  | 216  |
  | $c = m^e \mod N$ | 8    | 1    | 4    | 7    | 2    | 5    | 6    |

### RSA Schlüssel Anwenden

Wenden Sie die Schlüssel zur Verschlüsselung der Folge 0010020711 an

Öffentlicher Schlüssel: P = (17, 143)
Privater Schlüssel: S = (113, 143)

Verschlüsseln (Blockgröße kleiner als 143 wählen, also 3 stellig):

```
001 -> 001^17 mod 143 = 001
002 -> 002^17 mod 143 = 084
071 -> 071^17 mod 143 = 080
100 -> 100^17 mod 143 = 133
001 084 080 133
```

Entschlüsseln:

```
001 -> 001^113 mod 143 = 001
084 -> 084^113 mod 143 = 002
080 -> 080^113 mod 143 = 071
133 -> 133^113 mod 143 = 100
001 002 071 100
```

(große Potenzen bzw. Rechnen mit Modulo: https://medienwissenschaft.uni-bayreuth.de/inik/material/email_nur_fuer_dich/3_verschluesseln/3.3_asymmetrisch_verschluesseln/Modulares%20Potenzieren%20-%20AB.pdf

und https://www.geogebra.org/classic?lang=de-AT)

## Java - RSA, AES

Kryptographie-Einstieg in JAVA wird gezeigt: `http://www.torsten-horn.de/techdocs/java-crypto.htm`

### Prüfen ob Bibliothek funktioniert (j300)

```java
import javax.crypto.Cipher;
import java.security.*;

public class KryEinf_01 {
  public static void main( String[] args ) throws GeneralSecurityException {
    System.out.println( "\nSecurity-Provider:" );
    for( Provider prov : Security.getProviders() ) {
      System.out.println( "  " + prov + ": " + prov.getInfo() );
    }
    System.out.println( "\nMaxAllowedKeyLength (fuer '" + Cipher.getInstance( "AES" ).getProvider() + "' mit aktuellen 'JCE Policy Files'):\n"
            + "  DES        = " + Cipher.getMaxAllowedKeyLength( "DES"        ) + "\n"
            + "  Triple DES = " + Cipher.getMaxAllowedKeyLength( "Triple DES" ) + "\n"
            + "  AES        = " + Cipher.getMaxAllowedKeyLength( "AES"        ) + "\n"
            + "  Blowfish   = " + Cipher.getMaxAllowedKeyLength( "Blowfish"   ) + "\n"
            + "  RSA        = " + Cipher.getMaxAllowedKeyLength( "RSA"        ) + "\n" );
  }
}
```

### Symmetrische Chiffre AES (j301)

https://www.torsten-horn.de/techdocs/java-crypto.htm

Beispiel zum symmetrischen Ver-/Entschlüsseln von Dateien.

Aufruf zum Verschlüsseln mittels *AES* und Passwort *geheim*:

```
java CryptoSimple -e MeineDatei.txt MeineDateiOut.txt AES geheim
```

Analog Entschlüsseln mittels *AES* und Passwort *geheim*:

```
java CryptoSimple -d MeineDateiOut.txt MeineDateiIn.txt AES geheim
```

der Code:

```java
/**
 * Kopie aus 
 *            https://www.torsten-horn.de/techdocs/java-crypto.htm
 *
 *
 *
 * 1. Zur Vorbereitung:
 *    In einer Kommandozeile das Verzeichnis wechseln in welchem CryptoSimple.class liegt.
 *    Pruefen ob der Befehl java funktioniert, sonst kann fuer diese Kommandozeile path angepasst werden:
 *      set path=%path%;c:\program files\java\jdk1.8.0_181\bin 
 *    Dann eine Datei erzeugen:
 *    echo Mein Text Abc Xyz > MeineDatei.txt
 * 2. AES-Ver- und -Entschlüsselung:
 *    java CryptoSimple -e MeineDatei.txt MeineDatei.txt.aes AES "geheim"
 *    java CryptoSimple -d MeineDatei.txt.aes MeineDatei.txt.aes.txt AES "geheim"
 * 3. Blowfish-Ver- und -Entschlüsselung:
 *    java CryptoSimple -e MeineDatei.txt MeineDatei.txt.blowfish Blowfish "geheim"
 *    java CryptoSimple -d MeineDatei.txt.blowfish MeineDatei.txt.blowfish.txt Blowfish "geheim"
 * 4. DES-Ver- und -Entschlüsselung:
 *    java CryptoSimple -e MeineDatei.txt MeineDatei.txt.des DES "geheim"
 *    java CryptoSimple -d MeineDatei.txt.des MeineDatei.txt.des.txt DES "geheim"
 * In allen drei Fällen stimmt die Ergebnisdatei MeineDatei.txt...txt mit der ursprünglichen Datei MeineDatei.txt überein. Die drei nicht auf .txt endenden Dateien enthalten jeweils den verschlüsselten Inhalt.
 *
 */

import java.io.*;
import java.security.*;
import java.util.Arrays;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;

/** Rudimentaeres Cipher-Beispiel, nicht fuer reale Verwendung geeignet */
public class CryptoSimple {
  public static void main( String[] args ) throws GeneralSecurityException, IOException
  {
    if( args.length == 5 ) {
      if( args[0].toLowerCase().startsWith( "-e" ) ) {        // encrypt
        encrypt( args[1], args[2], args[3], args[4] );
        return;
      } else if( args[0].toLowerCase().startsWith( "-d" ) ) { // decrypt
        decrypt( args[1], args[2], args[3], args[4] );
        return;
      }
    }
    System.out.println( "Fehler: Es werden vier Parameter benoetigt:\n" +
            "Zum Verschluesseln:\n" +
            "  -e Quelldatei EncryptedZieldatei CipherAlgorithmus Passwort\n" +
            "Zum Entschluesseln:\n" +
            "  -d EncryptedQuelldatei DecryptedZieldatei CipherAlgorithmus Passwort\n" );
  }

  /** Verschluesseln */
  public static void encrypt( String srcFile, String encryptedDstFile, String algorithm, String password )
    throws GeneralSecurityException, IOException
  {
    encrypt( new FileInputStream( srcFile ), new FileOutputStream( encryptedDstFile ), algorithm, password );
  }

  /** Verschluesseln (Streams werden mit close() geschlossen) */
  public static void encrypt( InputStream inpStream, OutputStream encryptedOutStream, String algorithm, String password )
    throws GeneralSecurityException, IOException
  {
    SecretKey secKey = new SecretKeySpec( hashPwd( password, algorithm ), algorithm );
    Cipher    cipher = Cipher.getInstance( algorithm );
    byte[]    byteBuffer = new byte[64 * 1024];
    int       n;
    cipher.init( Cipher.ENCRYPT_MODE, secKey );
    CipherOutputStream cos = new CipherOutputStream( encryptedOutStream, cipher );
    try {
      while( (n = inpStream.read( byteBuffer )) > 0 ) { cos.write( byteBuffer, 0, n ); }
    } finally {
      cos.close();
      encryptedOutStream.close();
      inpStream.close();
    }
  }

  /** Entschluesseln */
  public static void decrypt( String encryptedSrcFile, String decryptedDstFile, String algorithm, String password )
    throws GeneralSecurityException, IOException
  {
    decrypt( new FileInputStream( encryptedSrcFile ), new FileOutputStream( decryptedDstFile ), algorithm, password );
  }

  /** Entschluesseln (Streams werden mit close() geschlossen) */
  public static void decrypt( InputStream encryptedInpStream, OutputStream decryptedOutStream, String algorithm, String password )
    throws GeneralSecurityException, IOException
  {
    SecretKey secKey = new SecretKeySpec( hashPwd( password, algorithm ), algorithm );
    Cipher    cipher = Cipher.getInstance( algorithm );
    byte[]    byteBuffer = new byte[64 * 1024];
    int       n;
    cipher.init( Cipher.DECRYPT_MODE, secKey );
    CipherInputStream cis = new CipherInputStream( encryptedInpStream, cipher );
    try {
      while( (n = cis.read( byteBuffer )) > 0 ) { decryptedOutStream.write( byteBuffer, 0, n ); }
    } finally {
      cis.close();
      encryptedInpStream.close();
      decryptedOutStream.close();
    }
  }

  /** MD5-Hash */
  private static byte[] hashPwd( String password, String algorithm ) throws NoSuchAlgorithmException, UnsupportedEncodingException
  {
    MessageDigest md = MessageDigest.getInstance( "MD5" );
    md.update( password.getBytes( "ISO-8859-1" ) );
    return ( "DES".equals( algorithm ) ) ? Arrays.copyOf( md.digest(), 8 ) : md.digest();
  }
}
```

### Asymmetrische Chiffre - RSA (j303)

Verschlüsselung mittels RSA:

- Erzeugen eines Schlüsselpaares Privater- und Public-Key
- Verschlüsseln einer Input-Datei (in.txt) mittels Public-Key in eine Zwischen-Datei (enc.txt)
- Entschlüsseln der Zwischendatei (enc.txt) in eine Output-Datei (out.txt) mittels Private-Key
- Da die Performance der RSA-Verschlüsselung schlecht ist, funktioniert das Programm nur für "kleine" Dateien (in.txt). Für größere Dateien empfiehlt sich eine hybride Verschlüsselung

```java
/*
 * Das folgende Verschluesselungsprogrammierbeispiel hat die Eigenschaften:
 *    Es zeigt das Prinzip der "RSA-Verschluesselung":
 *    Die zu verschluesselnde Datei wird "asymmetrisch" mit RSA verschluesselt.
 * Fuer die Ausfuehrung notwendig:
 *    in.txt   . . . . . . . . . . . . . . . . [beliebige Quelldatei zum Verschluesseln]
 * Nach der Ausfuehrung werden die Dateien erstellt:
 *    enc.txt  . . . . . . . . . . . . . . . . [verschluesselte Datei]
 *    out.txt  . . . . . . . . . . . . . . . . [wiederhergestellte entschluesselte Datei]
 *    privKey.rsa  . . . . . . . . . . . . . . [Privater Schluessel]
 *    pubKey.rsa . . . . . . . . . . . . . . . [Oeffentlicher Schluessel]
 * 
 * ACHTUNG: wenn die Datei in.txt zu grosz wird, dann wird RSA nicht ausgefuehrt - 
 * RSA ist dann zu rechenintensiv - Empfehlung: Verwendung einer Hybriden Verschluesselung.
 */
import java.io.*;
import java.security.*;
import javax.crypto.*;

public class CryptoRsa {
   static final String ASYMMETRIC_ALGO = "RSA";
   static final int rsaKeySize = 1024;
   static final String publicKeyFile = "./pubKey.rsa";
   static final String privateKeyFile = "./privKey.rsa";
   static final String inputFile = "./in.txt";
   static final String encryptedFile = "./enc.txt";
   static final String outputFile = "./out.txt";

   public static void main( String[] args ) throws GeneralSecurityException, ClassNotFoundException, IOException {
      // Erzeugen des RSA Schluesselpaares ============================================
      FileOutputStream publicKeyOut = new FileOutputStream(publicKeyFile);
      FileOutputStream privateKeyOut = new FileOutputStream(privateKeyFile);
      try {
         // Public und Private Key erzeugen (Parameter oben definiert: RSA)
         KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance( ASYMMETRIC_ALGO );
         keyPairGen.initialize( rsaKeySize );
         KeyPair keyPair = keyPairGen.generateKeyPair();
         // Schreibe Public Key
         ObjectOutputStream out = new ObjectOutputStream( publicKeyOut );
         try { out.writeObject( keyPair.getPublic() ); } finally { out.close(); }
         // Schreibe Private Key
         out = new ObjectOutputStream( privateKeyOut );
         try { out.writeObject( keyPair.getPrivate() ); } finally { out.close(); }
      } finally {
         privateKeyOut.close();
         publicKeyOut.close();
      }
      // Verschluesseln einer Datei ===================================================
      FileInputStream inFileIn = new FileInputStream(inputFile);
      FileOutputStream encFileOut = new FileOutputStream(encryptedFile);

      try {
         // RSA-Public Key lesen
         Key publicKey;
         ObjectInputStream keyIn = new ObjectInputStream( new FileInputStream(publicKeyFile) );
         try { publicKey = (Key) keyIn.readObject(); } finally { keyIn.close(); }
         Cipher cipher = Cipher.getInstance( ASYMMETRIC_ALGO );
         cipher.init( Cipher.ENCRYPT_MODE, publicKey );

         DataOutputStream out = new DataOutputStream( encFileOut );
         try {

            transform( inFileIn, out, cipher );
         } finally {
            out.close();
         }
      } finally {
         publicKeyOut.close();
         inFileIn.close();
         encFileOut.close();
      }
      // Entschluesseln einer Datei ===================================================
      FileInputStream encFileIn = new FileInputStream(encryptedFile);
      FileInputStream privateKeyIn = new FileInputStream(privateKeyFile);
      FileOutputStream outFileOut = new FileOutputStream(outputFile);
      try {
         Key privateKey;
         DataInputStream in = new DataInputStream( encFileIn );
         try {
            // RSA-Private-Key Lesen
            ObjectInputStream keyIn = new ObjectInputStream( privateKeyIn );
            try { privateKey = (Key) keyIn.readObject(); } finally { keyIn.close(); }
            // Entschluesseln des Symmetrischen Schluessels mit dem Priv-RSA-Schluessel
            Cipher cipher = Cipher.getInstance( ASYMMETRIC_ALGO );
            cipher.init( Cipher.DECRYPT_MODE, privateKey );
            // Datei-Inhalt mit symmetrischen Schluessel entschluesseln
            transform( in, outFileOut, cipher );
         } finally {
            in.close();
         }
      } finally {
         privateKeyIn.close();
         encFileIn.close();
         outFileOut.close();
      }
   }
   // Lesen von InputStream
   // Schreiben nach OutputStream
   // Kodieren/Dekodieren mit Cipher
   private static void transform( InputStream in, OutputStream out, Cipher cipher )
         throws IOException, GeneralSecurityException {
      int blockSize = 1000; //cipher.getBlockSize();
      byte[] input = new byte[blockSize];
      byte[] output = new byte[cipher.getOutputSize( blockSize )];
      int len;
      while( (len = in.read( input )) == blockSize ) {
         cipher.doFinal(input, 0, blockSize);
         int outLength = cipher.update( input, 0, blockSize, output );
         out.write( output, 0, outLength );
      }
      out.write( ( len > 0 ) ? cipher.doFinal( input, 0, len ) : cipher.doFinal() );
   }
}
```

### Hybride Verschlüsselung RSA/AES (j304)

Im folgenden Beispiel wird:

- eine Quelldatei (in.txt) mit einem erzeugten symmetrischen Schlüssel verschlüsselt und in eine Zwischendatei (enc.txt) geschrieben
- der verwendete symmetrische Schlüssel wird mit RSA asymmetrische verschlüsselt (mit dem Public-Key) und in die Zwischendatei (enc.txt) an den Beginn geschrieben (samt dessen Länge)
- anschließend wird aus der Zwischendatei (enc.txt) der RSA verschlüsselte symmetrische Schlüssel wieder eingelesen
- er wird mittels RSA-Private-Key entschlüsselt
- mit dem entschlüsselten Schlüssel wird die restliche Zwischendatei dekodiert und in eine Zieldatei (out.txt) geschrieben.

```java
/*
 * Das folgende Verschluesselungsprogrammierbeispiel hat die Eigenschaften:
 *    Es zeigt das Prinzip der "hybriden Verschluesselung":
 *    Die zu verschluesselnde Datei wird "symmetrisch" verschluesselt (z.B. mit AES oder Blowfish)
 *    und der dafuer verwendete geheime "Secret Key" (= "Session Key") wird "asymmetrisch" mit RSA
 *    verschluesselt.
 *    Der symmetrische "Secret Key" wird in der verschluesselten Ergebnisdatei gespeichert.
 *    Der Anwender sieht nur die beiden asymmetrischen Schluessel (in Form von Dateien): Den 
 *    geheimen "Private Key" und den Oeffentlichen "Public Key".
 * Fuer die Ausfuehrung notwendig:
 *    in.txt   . . . . . . . . . . . . . . . . [beliebige Quelldatei zum Verschluesseln]
 * Nach der Ausfuehrung werden die Dateien erstellt:
 *    enc.txt  . . . . . . . . . . . . . . . . [verschluesselte Datei]
 *    out.txt  . . . . . . . . . . . . . . . . [wiederhergestellte entschluesselte Datei]
 *    privKey.rsa  . . . . . . . . . . . . . . [Privater Schluessel]
 *    pubKey.rsa . . . . . . . . . . . . . . . [Oeffentlicher Schluessel]
 * 
 */

import java.io.*;
import java.security.*;
import javax.crypto.*;

public class CryptoRsaAes {
   static final String ASYMMETRIC_ALGO = "RSA";
   static final String SYMMETRIC_ALGO  = "AES"; // oder z.B. "Blowfish"
   static final int rsaKeySize = 1024;
   static final String publicKeyFile = "./pubKey.rsa";
   static final String privateKeyFile = "./privKey.rsa";
   static final String inputFile = "./in.txt";
   static final String encryptedFile = "./enc.txt";
   static final String outputFile = "./out.txt";

   public static void main( String[] args ) throws GeneralSecurityException, ClassNotFoundException, IOException {
      // Erzeugen des RSA Schluesselpaares ============================================
      FileOutputStream publicKeyOut = new FileOutputStream(publicKeyFile);
      FileOutputStream privateKeyOut = new FileOutputStream(privateKeyFile);
      try {
         // Public und Private Key erzeugen (Parameter oben definiert: RSA)
         KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance( ASYMMETRIC_ALGO );
         keyPairGen.initialize( rsaKeySize );
         KeyPair keyPair = keyPairGen.generateKeyPair();
         // Schreibe Public Key
         ObjectOutputStream out = new ObjectOutputStream( publicKeyOut );
         try { out.writeObject( keyPair.getPublic() ); } finally { out.close(); }
         // Schreibe Private Key
         out = new ObjectOutputStream( privateKeyOut );
         try { out.writeObject( keyPair.getPrivate() ); } finally { out.close(); }
      } finally {
         privateKeyOut.close();
         publicKeyOut.close();
      }
      // Verschluesseln einer Datei ===================================================
      FileInputStream inFileIn = new FileInputStream(inputFile);
      FileOutputStream encFileOut = new FileOutputStream(encryptedFile);
      try {
         // Symmetrischen Key erzeugen (Parameter oben definiert: AES)
         KeyGenerator keyGen = KeyGenerator.getInstance( SYMMETRIC_ALGO );
         keyGen.init( Math.min( 256, Cipher.getMaxAllowedKeyLength( SYMMETRIC_ALGO ) ) );
         SecretKey symKey = keyGen.generateKey();
         Key publicKey;
         // RSA-Public Key lesen
         ObjectInputStream keyIn = new ObjectInputStream( new FileInputStream(publicKeyFile) );
         try { publicKey = (Key) keyIn.readObject(); } finally { keyIn.close(); }
         Cipher cipher = Cipher.getInstance( ASYMMETRIC_ALGO );
         cipher.init( Cipher.WRAP_MODE, publicKey );
         // Symmetrischen Schluessel mit RSA-Public-Key verschluesseln
         byte[] wrappedKey = cipher.wrap( symKey );
         // Schreiben: Schluessel + Sym-Key-Verschluesselte Daten
         DataOutputStream out = new DataOutputStream( encFileOut );
         try {
            out.writeInt( wrappedKey.length );
            out.write( wrappedKey );
            cipher = Cipher.getInstance( SYMMETRIC_ALGO );
            cipher.init( Cipher.ENCRYPT_MODE, symKey );
            transform( inFileIn, out, cipher );
         } finally {
            out.close();
         }
      } finally {
         publicKeyOut.close();
         inFileIn.close();
         encFileOut.close();
      }
      // Entschluesseln einer Datei ===================================================
      FileInputStream encFileIn = new FileInputStream(encryptedFile);
      FileInputStream privateKeyIn = new FileInputStream(privateKeyFile);
      FileOutputStream outFileOut = new FileOutputStream(outputFile);
      try {
         DataInputStream in = new DataInputStream( encFileIn );
         try {
            // Lesen des Schluessels aus der verschluesselten Datei
            int length = in.readInt();
            byte[] wrappedKey = new byte[length];
            in.read( wrappedKey, 0, length );
            // RSA-Private-Key Lesen
            Key privateKey;
            ObjectInputStream keyIn = new ObjectInputStream( privateKeyIn );
            try { privateKey = (Key) keyIn.readObject(); } finally { keyIn.close(); }
            // Entschluesseln des Symmetrischen Schluessels mit dem Priv-RSA-Schluessel
            Cipher cipher = Cipher.getInstance( ASYMMETRIC_ALGO );
            cipher.init( Cipher.UNWRAP_MODE, privateKey );
            Key symKey = cipher.unwrap( wrappedKey, SYMMETRIC_ALGO, Cipher.SECRET_KEY );
            // Datei-Inhalt mit symmetrischen Schluessel entschluesseln
            cipher = Cipher.getInstance( SYMMETRIC_ALGO );
            cipher.init( Cipher.DECRYPT_MODE, symKey );
            transform( in, outFileOut, cipher );
         } finally {
            in.close();
         }
      } finally {
         privateKeyIn.close();
         encFileIn.close();
         outFileOut.close();
      }
   }
   // Lesen von InputStream
   // Schreiben nach OutputStream
   // Kodieren/Dekodieren mit Cipher
   private static void transform( InputStream in, OutputStream out, Cipher cipher )
         throws IOException, GeneralSecurityException {
      int blockSize = cipher.getBlockSize();
      byte[] input = new byte[blockSize];
      byte[] output = new byte[cipher.getOutputSize( blockSize )];
      int len;
      while( (len = in.read( input )) == blockSize ) {
         int outLength = cipher.update( input, 0, blockSize, output );
         out.write( output, 0, outLength );
      }
      out.write( ( len > 0 ) ? cipher.doFinal( input, 0, len ) : cipher.doFinal() );
   }
}
```

### Hybride Verschlüsselung mit JUnit-Test (j302)

Hier ein umfassendes Beispiel wie:

- RSA-Schlüssel (private und public) erzeugt werden können
- Daten mit RSA ver-/entschlüsselt werden können
- Daten symmetrisch mittels AES (o. ä.) ver-/entschlüsselt werden können
- Daten kombiniert (symmetrisch + asysmmetrisch) ver-/entschlüsselt werden können

Aufruf zum Code generieren (außerhalb des Ordners crypto in welchem sich CryptoRsaAes.class befindet):

```
java crypto.CryptoRsaAes -g key.priv key.pub 512
```

Aufruf zum Verschlüsseln:

```
java crypto.CryptoRsaAes -e key.pub InputFile EncryptedFile
```

Aufruf zum Entschlüsseln:

```
java crypto.CryptoRsaAes -d key.priv EncryptedFile OutputFile
```

Code (*CryptoRsaAes.java*):

```java
/*
 * Das folgende Verschlüsselungsprogrammierbeispiel hat die Eigenschaften:
 *    Es zeigt das Prinzip der "hybriden Verschlüsselung": Die zu verschlüsselnde Datei wird "symmetrisch" verschlüsselt (z.B. mit AES oder Blowfish) und der dafür verwendete geheime "Secret Key" (= "Session Key") wird "asymmetrisch" verschlüsselt (mit RSA).
 *    Der symmetrische "Secret Key" wird in der verschlüsselten Ergebnisdatei gespeichert.
 *    Der Anwender sieht nur die beiden asymmetrischen Schlüssel (in Form von Dateien): Den geheimen "Private Key" und den öffentlichen "Public Key".
 *    Bitte beachten: Um das Beispiel kurz zu halten, fehlt die vorhergehende Zip-Komprimierung.
 *    Führen Sie folgende Schritte durch:
 * Erstellen Sie ein target-Verzeichnis
 * Nach der Ausführung werden im target Verzeichnis die Dateien erstellt:
 *   MeineDstDatei.txt  . . . . . . . . . . . [wiederhergestellte entschlüsselte Datei]
 *   MeineSrcDatei.txt  . . . . . . . . . . . [ursprüngliche Originaldatei]
 *   MeineVerschluesselteDatei.aes.rsa  . . . [verschlüsselte Datei]
 *   PrivateKey.rsa   . . . . . . . . . . . . [Privater Schlüssel]
 *   PublicKey.rsa  . . . . . . . . . . . . . [Öffentlicher Schlüssel]
 * 
 */

package crypto;

import java.io.*;
import java.security.*;
import javax.crypto.*;

public class CryptoRsaAes
{
  static final String ASYMMETRIC_ALGO = "RSA";
  static final String SYMMETRIC_ALGO  = "AES"; // oder z.B. "Blowfish"

  public static void main( String[] args ) throws GeneralSecurityException, ClassNotFoundException, IOException
  {
    if( args.length == 4 ) {
      if( args[0].toLowerCase().startsWith( "-g" ) ) {        // generateKeyPair
        generateKeyPair( args[1], args[2], Integer.parseInt( args[3] ) );
        return;
      } else if( args[0].toLowerCase().startsWith( "-e" ) ) { // encrypt
        encrypt( args[1], args[2], args[3] );
        return;
      } else if( args[0].toLowerCase().startsWith( "-d" ) ) { // decrypt
        decrypt( args[1], args[2], args[3] );
        return;
      }
    }
    System.out.println( "\nFehler: Es werden vier Parameter benoetigt:\n" +
            "Zum Generieren des privaten und oeffentlichen RSA-Schluessels (RsaKeySize z.B. 2048):\n" +
            "  -g PrivateKeyFile PublicKeyFile RsaKeySize\n" +
            "Zum Verschluesseln:\n" +
            "  -e PublicKeyFile InputFile EncryptedFile\n" +
            "Zum Entschluesseln:\n" +
            "  -d PrivateKeyFile EncryptedFile OutputFile\n" );
   }

  /** Generiere privaten und oeffentlichen RSA-Schluessel */
  public static void generateKeyPair( String privateKeyFile, String publicKeyFile, int rsaKeySize )
    throws NoSuchAlgorithmException, IOException
  {
    generateKeyPair( new FileOutputStream( privateKeyFile ), new FileOutputStream( publicKeyFile ), rsaKeySize );
  }

  /** Generiere privaten und oeffentlichen RSA-Schluessel (Streams werden mit close() geschlossen) */
  public static void generateKeyPair( OutputStream privateKeyFile, OutputStream publicKeyFile, int rsaKeySize )
    throws NoSuchAlgorithmException, IOException
  {
    try {
      KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance( ASYMMETRIC_ALGO );
      keyPairGen.initialize( rsaKeySize );
      KeyPair keyPair = keyPairGen.generateKeyPair();
      ObjectOutputStream out = new ObjectOutputStream( publicKeyFile );
      try { out.writeObject( keyPair.getPublic() ); } finally { out.close(); }
      out = new ObjectOutputStream( privateKeyFile );
      try { out.writeObject( keyPair.getPrivate() ); } finally { out.close(); }
    } finally {
      privateKeyFile.close();
      publicKeyFile.close();
    }
  }

  /** Verschluesseln */
  public static void encrypt( String publicKeyFile, String inputFile, String encryptedFile )
    throws GeneralSecurityException, ClassNotFoundException, IOException
  {
    encrypt( new FileInputStream( publicKeyFile ), new FileInputStream( inputFile ), new FileOutputStream( encryptedFile ) );
  }

  /** Verschluesseln (Streams werden mit close() geschlossen) */
  public static void encrypt( InputStream publicKeyFile, InputStream inputFile, OutputStream encryptedFile )
    throws GeneralSecurityException, ClassNotFoundException, IOException
  {
    try {
      KeyGenerator keyGen = KeyGenerator.getInstance( SYMMETRIC_ALGO );
      keyGen.init( Math.min( 256, Cipher.getMaxAllowedKeyLength( SYMMETRIC_ALGO ) ) );
      SecretKey symKey = keyGen.generateKey();
      Key publicKey;

      ObjectInputStream keyIn = new ObjectInputStream( publicKeyFile );
      try { publicKey = (Key) keyIn.readObject(); } finally { keyIn.close(); }

      Cipher cipher = Cipher.getInstance( ASYMMETRIC_ALGO );
      cipher.init( Cipher.WRAP_MODE, publicKey );
      byte[] wrappedKey = cipher.wrap( symKey );

      DataOutputStream out = new DataOutputStream( encryptedFile );
      try {
        out.writeInt( wrappedKey.length );
        out.write( wrappedKey );
        cipher = Cipher.getInstance( SYMMETRIC_ALGO );
        cipher.init( Cipher.ENCRYPT_MODE, symKey );
        transform( inputFile, out, cipher );
      } finally {
        out.close();
      }
    } finally {
      publicKeyFile.close();
      inputFile.close();
      encryptedFile.close();
    }
  }

  /** Entschluesseln */
  public static void decrypt( String privateKeyFile, String encryptedFile, String outputFile )
    throws GeneralSecurityException, ClassNotFoundException, IOException
  {
    decrypt( new FileInputStream( privateKeyFile ), new FileInputStream( encryptedFile ), new FileOutputStream( outputFile ) );
  }

  /** Entschluesseln (Streams werden mit close() geschlossen) */
  public static void decrypt( InputStream privateKeyFile, InputStream encryptedFile, OutputStream outputFile )
    throws GeneralSecurityException, ClassNotFoundException, IOException
  {
    try {
      DataInputStream in = new DataInputStream( encryptedFile );
      try {
        int length = in.readInt();
        byte[] wrappedKey = new byte[length];
        in.read( wrappedKey, 0, length );

        Key privateKey;
        ObjectInputStream keyIn = new ObjectInputStream( privateKeyFile );
        try { privateKey = (Key) keyIn.readObject(); } finally { keyIn.close(); }

        Cipher cipher = Cipher.getInstance( ASYMMETRIC_ALGO );
        cipher.init( Cipher.UNWRAP_MODE, privateKey );
        Key symKey = cipher.unwrap( wrappedKey, SYMMETRIC_ALGO, Cipher.SECRET_KEY );

        cipher = Cipher.getInstance( SYMMETRIC_ALGO );
        cipher.init( Cipher.DECRYPT_MODE, symKey );
        transform( in, outputFile, cipher );
      } finally {
        in.close();
      }
    } finally {
      privateKeyFile.close();
      encryptedFile.close();
      outputFile.close();
    }
  }

  private static void transform( InputStream in, OutputStream out, Cipher cipher )
    throws IOException, GeneralSecurityException
  {
    int    blockSize = cipher.getBlockSize();
    byte[] input     = new byte[blockSize];
    byte[] output    = new byte[cipher.getOutputSize( blockSize )];
    int    len;
    while( (len = in.read( input )) == blockSize ) {
      int outLength = cipher.update( input, 0, blockSize, output );
      out.write( output, 0, outLength );
    }
    out.write( ( len > 0 ) ? cipher.doFinal( input, 0, len ) : cipher.doFinal() );
  }
}
```

## C/C++ eigener RSA (c++810)

Schreiben Sie ein Programm zum Berechnen eines RSA-Public/Private-Key Paares und Verschlüsseln/Entschlüsseln Sie eine Nachricht damit:

```c++
#include<iostream>
#include<math.h>
#include<string>
#include<stdlib.h>
#include <stdio.h>
#include <cstring>

using namespace std;

#define LEN 1000

int *cd(int phi, const int *e, int *d, int len);
int *ce(int phi, int *e, int *len);
int gcd(int u, int v);
int encrypt(char z, int e, int n);
char decrypt(int enc, int d, int n);

int main() {
    int p = 11;              // Primzahl 1  97
    int q = 5;               // Primzahl 2  23
    int n = p * q;           // Modul
    int phi = (p-1) * (q-1); // Euler

    int e[LEN];              // Liste von e's
    int d[LEN];              // Liste von passenden d's
    int len = 0;             // Anzahl der e und d's

    ce(phi, e, &len);        // Ber. moegl. e-Werte: 1 < e < phi und ggt(e,phi) = 1
    cd(phi, e, d, len);      // Ber. pass. d-Werte: Erfuellen von (d*e mod phi = 1)

    // Anzeigen sämtlicher Schlüssel: =============================================
    printf("Moegliche Paare e|d:\n");
    for (int i=0; i < len; i++) {
        printf("\t%3i | %3i\n", e[i], d[i]);
    }

    // Auswahl eines e|d Paares, hier einfach der 5te =============================
    int et = e[5];
    int dt = d[5];
    printf("\nAuswahl e|d:\n\t");
    printf("%4i | %4i\n", et, dt);
    printf("\np | q | n | phi:\n\t");
    printf("%4i | %4i | %4i | %4i\n",p, q, n, phi);

    printf("\n");
    printf("Schluessel Priv:\n\t%4i | %4i\n\n", et, n);
    printf("Schluessel Pub:\n\t%4i | %4i\n", dt, n);

    // Msg: ======================================================================
    char strStart[65] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !\"§$%&/()=?";
    printf("\nOriginal: \n\t%s\n", strStart);

    // Kodieren/Dekodieren =======================================================
    printf("\nChiffrat:\n\t");
    char strZiel[LEN] = {0};
    for (int i = 0; i < 65; i++) {
        int enc = encrypt(strStart[i], et, n);
        printf("%4x,", enc);
        strZiel[i] = decrypt(enc, dt, n);
        //sprintf(strZiel, "%s%c", strZiel, c);
    }
    printf("\n\nDecodiert:\n\t");
    printf("%s", strZiel);

    if (strcmp(strStart, strZiel) != 0) {
        printf("FEHLER\n");
    }
}
```

Implementieren Sie die notwendigen Funktionen. Das Ende der Ausgabe mit dem fertigen Programm sieht so ähnlich aus:

```
Original:
        abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !"º$%&/()=?

Chiffrat:
          61,  62,  91, 389,  aa, 1d6, 3ba, 59e, 55a, 5e5,  99, 882, 433, 20c, 7cd, 128, 3c4, 12a, 3af,  8b, 22a, 636, 71d, 4c8,  be, 388, 366, 350, 6a4, 507, 170, 5c1, 777, 5f1,   4, 4b1, 25c, 343, 74f,  37, 5ca, 84f, 5b5, 851, 1ac, 76d, 546,  f7,  29, 394, 41f, 3db, 5b2, 5e1, 2d4,fffffbe1, 1c2, 4a3, 7e0, 5ef, 741, 79e, 756, 644,   0,

Decodiert:
        abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ !"º$%&/()=?
```

- Tipp für (a>b) gilt: ggT(a,b) = ggT(a%b,b) 
- wie Sicher ist diese Verschlüsselung - im Vergleich, zum Beispiel mit einer einfachen Substitution?
- mit welchen Maßnahmen kann die Verschlüsselung sicherer gemacht werden?

## Betriebsmodus ECB

Eine sehr anschauliche Demonstration in der Sache Betriebsmodus wird hier gezeigt (Quelle: https://de.wikipedia.org/wiki/Electronic_Code_Book_Mode). Mittels durchaus sehr hochwertigem Algorithmus AES-256 (128 Bit mit 256Bit Schlüssel - zugelassen für höchste Geheimhaltung in USA) wird hier ein Bild verschlüsselt. Nicht optimal: es wird der ECB-Modus gewählt. Das Bild ist natürlich größer als die 128 Bit Blocklänge und wird daher auf 128 Blöcke zerlegt. Diese werden jeweils mit AES-256 verschlüsselt. Durch diesen Modus werden sämtlichen folgenden Blöcke auf die gleiche Art verschlüsselt und liefern die gleiche Chiffre. Für die Verschlüsselung:

```
openssl.exe enc -aes-256-ecb -pass pass:"pw" -in Tux_origBody.ppm -out Tux_encBody.ppm
```

Wichtig dabei das Bildformat. PPM wird gewählt weil es ein Bitmap-Format ist. Vor der Verschlüsselung wurde der Header aus der Datei entfernt (sonst wäre das Bild anschließend nicht direkt lesbar). Mittels Irfan-View etwa kann eine Konvertierung einfach erfolgen (linke Abbildung).

Dem verschlüsselten Bild wird anschließend der ursprüngliche Header wieder vorne eingefügt. Das Bild kann anschließend mit einem Bildbetrachter wieder geöffnet werden (mittlere Abbildung). Es ist klar ersichtlich, dass trotz der zeitgemäßen Verschlüsselung die Figur nach wie vor erkennbar ist. Der Grund ist klar - hintereinander folgende Blöcke mit gleichem Inhalt (Farbe) liefern die gleiche Chiffre. Daher ist dieser ECB-Modus auch zu vermeiden.

Abschließend wird das Bild auf die gleiche Art mit Modus CBC verschlüsselt (rechte Abbildung). Hier sieht es wesentlich besser auf - das Bild sieht zufällig durchmischt aus (kein Umriss erkennbar). CBC ist ein Mechanismus mit welchem ein Teil des vorhergehenden Blockes in den nächsten mitgenommen wird. Für den ersten Block wird ein Initial-Vektor eingebaut.

```
openssl.exe enc -aes-256-cbc -pass pass:"pw" -in Tux_origBody.ppm -out Tux_encBody.ppm
```

(Diese Prozedur ist allgemein bekannt: https://www.youtube.com/watch?v=k8zJh1tAcok, https://en.wikipedia.org/wiki/File:Tux.jpg, https://en.wikipedia.org/wiki/File:Tux_ecb.jpg)

![Kry_Tux](bilder/Kry_Tux_.png)

Beim Zusammenfügen des Header- und Body-Teils muss ein Editor verwendet werden der wirklich sämtliche Zeichen korrekt mitkopiert. Alternativ via Kommandozeile (hier Windows):

```
type Tux_origHead.ppm > Tux_enc.ppm && type Tux_encBody.ppm >> Tux_enc.ppm
```

## C/C++ - openSSL

**Vorbereitung:**

- Installation der Bibliotheken (es gibt 32/64bit und Light/Std):

  ​	`https://slproweb.com/products/Win32OpenSSL.html`

  installiert nach:

  ​	`C:\Program Files (x86)\OpenSSL-Win32` 

  Kopieren der DLLs nach: WindowsSystem/**bin-Ordner**

  durch diese Installation gibt's ein Verzeichnis:

  ​	`C:\Program Files (x86)\OpenSSL-Win32\lib\MinGW` 

  dieses MinGW-Verzeichnis gibts nur für die 32 Bit Version, für 64 Bit gibt's nur ein VC-Verzeichnis

- Code::Blocks

  - unter `Settings > Compiler... > Linker settings >  ` den Pfad zu `libcrypto.a` (64-Bit libcrypto.lib) Einstellen
  - unter `Settings > Compiler... > Search directories > Compiler` den Include-Pfad hinzufügen (C:\Program Files (x86)\OpenSSL-Win32\include oder C:\OpenSSL-Win64\include)
  - wird nicht benötigt: unter `Settings > Compiler... > Search directories > Linker` das Lib-Verzeichnis hinzufügen
    (C:\Program Files (x86)\OpenSSL-Win32\lib)
  - Zum erstellten Programm wird die DLL `libcrypto.dll` kopiert. Diese kann von `C:\Program Files (x86)\OpenSSL-Win32\libcrypto-1_1.dll` kopiert werden.

- Komandozeile:

  ```
  >g++ -c main.cpp -I"C:\OpenSSL-Win64\include"
  >g++ -L"C:\OpenSSL-Win64\lib" -o out.exe main.o "C:\OpenSSL-Win64\lib\libcrypto.lib"
  ```

  oder 

  ```
  g++.exe -L"C:\OpenSSL-Win64\lib" -o out.exe main.o -llibcrypto
  ```

  vor der Ausführung: libcrypto.dll hin kopieren

### openSSL - CrtPem (c814)

In diesem Beispiel werden mittels openSSL ein Schlüsselpaar (Private und Public) erzeugt. Die Schlüssel werden als Pem-Dateien abgelegt (Privacy-enhanced Electronic Mail - RFC Standard). PEM-Dateien sind Base64-Container mit einer Lesbaren Kopf-/Fußzeile.

DLL ablegen nicht vergessen, für die Projekterstellung müssen eventuell Compilerschalter gesetzt werden (-fpermissive).

```c++
#include <openssl/bn.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/applink.c>

#define KEY_LENGTH  2048

int main(void) {
  // Keys Produzieren ==================================================
  printf("Generating RSA (%d bits) keypair...", KEY_LENGTH);
  fflush(stdout);

  RSA *keypair = RSA_new();
  BIGNUM *e = BN_new();
  BN_set_word(e, (unsigned int)3);            // Exponent auf 3

  RSA_generate_key_ex(keypair, KEY_LENGTH, e, NULL);
  BN_free(e);

  // Konvertieren Key->PEM =============================================
  BIO *pri = BIO_new(BIO_s_mem());
  BIO *pub = BIO_new(BIO_s_mem());

  PEM_write_bio_RSAPrivateKey(pri, keypair, NULL, NULL, 0, NULL, NULL);
  PEM_write_bio_RSAPublicKey(pub, keypair);

  // Konvertieren fuer Konsole =========================================
  size_t pri_len = BIO_pending(pri);
  size_t pub_len = BIO_pending(pub);

  char *pri_key = (char*)malloc(pri_len + 1);
  char *pub_key = (char*)malloc(pub_len + 1);

  BIO_read(pri, pri_key, pri_len);
  BIO_read(pub, pub_key, pub_len);

  pri_key[pri_len] = '\0';
  pub_key[pub_len] = '\0';

  printf("\n%s\n%s\n", pri_key, pub_key);
  printf("done.\n");
  BIO_free_all(pub);
  BIO_free_all(pri);
  free(pri_key);
  free(pub_key);

  // Keys in pem-Dateien schreiben =====================================
  FILE *pubPem = fopen("pub.pem", "wb");
  PEM_write_RSA_PUBKEY(pubPem, keypair);
  fclose(pubPem);
  FILE *priPem = fopen("pri.pem", "wb");
  PEM_write_RSAPrivateKey(priPem, keypair, NULL, NULL, 0, NULL, NULL);
  fclose(priPem);

  return 0;
}
```

Erzeugen der Schlüssel aus der Kommandozeile:

```
openssl.exe genrsa -out privkey.pem 2048
openssl.exe rsa -in privkey.pem -pubout > pubkey.pem
```

### openSSL - RSA-Encoding eines Strings (c814)

Es wird ein String eingegeben und dieser mittels abgelegtem Public-RSA-Schlüssel verschlüsselt:

```c++
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <string.h>
#include <openssl/applink.c>

#define KEY_LENGTH  2048
#define STR_LEN (KEY_LENGTH/8)
#define PUB 1

RSA* getPublicRSA() {
  RSA *rsa = NULL;
  FILE *pubPem = fopen("pub.pem", "r");
  rsa = PEM_read_RSA_PUBKEY(pubPem, &rsa, NULL, NULL);
  fclose(pubPem);
  return rsa;
}
RSA* getPrivateRSA() {
  RSA *rsa = NULL;
  FILE *priPem = fopen("pri.pem", "r");
  rsa = PEM_read_RSAPrivateKey(priPem, &rsa, NULL, NULL);
  fclose(priPem);
  return rsa;
}

int main(void) {
  // Get the message to encrypt
  char   msg[STR_LEN];         // Message to encrypt
  printf("Message to encrypt: ");
  fgets(msg, STR_LEN, stdin);

  // Key aus Pem-Datei -------------------------------------------------------------
  RSA* publicRSA = PUB ? getPublicRSA() : getPrivateRSA();

  // Nachricht Kodieren ------------------------------------------------------------
  int encrypt_len = RSA_size(publicRSA);
  char *encrypt = (char *)malloc(encrypt_len);
  if (PUB)
    encrypt_len = RSA_public_encrypt(strlen(msg), (unsigned char*)msg,
                  (unsigned char*)encrypt, publicRSA, RSA_PKCS1_OAEP_PADDING);
  else
    encrypt_len = RSA_private_encrypt(strlen(msg), (unsigned char*)msg,
                  (unsigned char*)encrypt, publicRSA, RSA_PKCS1_PADDING);
  if(encrypt_len == -1) {
    char *err = (char *)malloc(130);
    ERR_load_crypto_strings();
    ERR_error_string(ERR_get_error(), err);
    fprintf(stderr, "Error encrypting message: %s\n", err);
    free(err);
  } else {
    // Kodierten Text in Datei Schreiben -----------------------------------------
    FILE *outFile = fopen("data.enc", "wb");
    fwrite(encrypt, sizeof(char), encrypt_len, outFile);
    fclose(outFile);
  }

  RSA_free(publicRSA);
  free(encrypt);

  return 0;
}
```

Encoding in der Kommandozeile (mit einem Public-Key):

```
openssl.exe rsautl -encrypt -inkey pub.pem -pubin -in data.txt -out data.enc  -oaep
```

### openSSL - RSA-Decoding einer Datei (c814)

Hier wird eine Kodierte Datei geladen und mittels Privaten Schlüssel entschlüsselt (der muss zu dem Schlüssel der Verschlüsselung passen):

```c++
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <string.h>
#include <openssl/applink.c>

#define KEY_LENGTH  2048
#define STR_LEN (KEY_LENGTH/8)
#define PUB 1

RSA* getPublicRSA() {
  RSA *rsa = NULL;
  FILE *pubPem = fopen("pub.pem", "r");
  rsa = PEM_read_RSA_PUBKEY(pubPem, &rsa, NULL, NULL);
  fclose(pubPem);
  return rsa;
}

RSA* getPrivateRSA() {
  RSA *rsa = NULL;
  FILE *priPem = fopen("pri.pem", "r");
  rsa = PEM_read_RSAPrivateKey(priPem, &rsa, NULL, NULL);
  fclose(priPem);
  return rsa;
}

int main(void) {

  // Kodierten Text Laden ----------------------------------------------------------
  FILE *inFile = fopen("data.enc", "rb");

  int encrypt_len = STR_LEN;
  char *encrypt = (char *)malloc(encrypt_len);
  int len = 0;
  while ((len = fread(encrypt, sizeof(char), encrypt_len, inFile)) != 0) {
    encrypt_len += len;
    encrypt = (char *)realloc(encrypt, encrypt_len);
  }
  fclose(inFile);

  encrypt_len = encrypt_len-STR_LEN;
  encrypt = (char *)realloc(encrypt, encrypt_len);

  // PrivateKey aus Pem-Datei ------------------------------------------------------
  RSA* privateRSA = PUB ? getPrivateRSA() : getPublicRSA();

  // Entschluesseln ----------------------------------------------------------------
  char *decrypt = (char *)malloc(encrypt_len);
  if (PUB)
    encrypt_len = RSA_private_decrypt(encrypt_len, (unsigned char*)encrypt,
                  (unsigned char*)decrypt, privateRSA, RSA_PKCS1_OAEP_PADDING);
  else
    encrypt_len = RSA_public_decrypt(encrypt_len, (unsigned char*)encrypt,
                  (unsigned char*)decrypt, privateRSA, RSA_PKCS1_PADDING);

  if (encrypt_len == -1) {
    char *err = (char *)malloc(130);
    ERR_load_crypto_strings();
    ERR_error_string(ERR_get_error(), err);
    fprintf(stderr, "Error decrypting message: %s\n", err);
  } else {
    for (int i = 0; i < encrypt_len; i++) {
      if (decrypt[i] == '\n') {
        decrypt[i] = 0;
        break;
      }
    }
    printf("Decrypted message: %s\n", decrypt);
  }

  RSA_free(privateRSA);
  free(encrypt);
  free(decrypt);

  return 0;
}
```

Dekodieren Kommandozeile:

```
openssl.exe rsautl -decrypt -inkey pri.pem -in data.enc -out data.txt -oaep
```

### openSSL - RSA (c++808)

Einfaches Beispiel (https://shanetully.com/2012/04/simple-public-key-encryption-with-rsa-and-openssl/) zur

- RSA-Schlüsselerzeugung
- Verschlüsseln eines Textes in eine Datei
- Entschlüsseln des Datei-Textes und Vergleich mit ursprünglicher Nachricht

DLL ablegen nicht vergessen.

```c++
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <stdio.h>
#include <string.h>

#define KEY_LENGTH  2048
#define PUB_EXP     3
#define PRINT_KEYS
#define WRITE_TO_FILE

int main(void) {
  size_t pri_len;            // Length of private key
  size_t pub_len;            // Length of public key
  char   *pri_key;           // Private key
  char   *pub_key;           // Public key
  char   msg[KEY_LENGTH/8];  // Message to encrypt
  char   *encrypt = NULL;    // Encrypted message
  char   *decrypt = NULL;    // Decrypted message
  char   *err;               // Buffer for any error messages

  // Generate key pair
  printf("Generating RSA (%d bits) keypair...", KEY_LENGTH);
  fflush(stdout);
  RSA *keypair = RSA_generate_key(KEY_LENGTH, PUB_EXP, NULL, NULL);

  // To get the C-string PEM form:
  BIO *pri = BIO_new(BIO_s_mem());
  BIO *pub = BIO_new(BIO_s_mem());

  PEM_write_bio_RSAPrivateKey(pri, keypair, NULL, NULL, 0, NULL, NULL);
  PEM_write_bio_RSAPublicKey(pub, keypair);

  pri_len = BIO_pending(pri);
  pub_len = BIO_pending(pub);

  pri_key = malloc(pri_len + 1);
  pub_key = malloc(pub_len + 1);

  BIO_read(pri, pri_key, pri_len);
  BIO_read(pub, pub_key, pub_len);

  pri_key[pri_len] = '\0';
  pub_key[pub_len] = '\0';

  #ifdef PRINT_KEYS
  printf("\n%s\n%s\n", pri_key, pub_key);
  #endif
  printf("done.\n");

  // Get the message to encrypt
  printf("Message to encrypt: ");
  fgets(msg, KEY_LENGTH-1, stdin);
  msg[strlen(msg)-1] = '\0';

  // Encrypt the message
  encrypt = malloc(RSA_size(keypair));
  int encrypt_len;
  err = malloc(130);
  if((encrypt_len = RSA_public_encrypt(strlen(msg)+1, (unsigned char*)msg, (unsigned char*)encrypt,
                                       keypair, RSA_PKCS1_OAEP_PADDING)) == -1) {
    ERR_load_crypto_strings();
    ERR_error_string(ERR_get_error(), err);
    fprintf(stderr, "Error encrypting message: %s\n", err);
    goto free_stuff;
  }

  #ifdef WRITE_TO_FILE
  // Write the encrypted message to a file
  FILE *out = fopen("out.bin", "w");
  fwrite(encrypt, sizeof(*encrypt),  RSA_size(keypair), out);
  fclose(out);
  printf("Encrypted message written to file.\n");
  free(encrypt);
  encrypt = NULL;

  // Read it back
  printf("Reading back encrypted message and attempting decryption...\n");
  encrypt = malloc(RSA_size(keypair));
  out = fopen("out.bin", "r");
  fread(encrypt, sizeof(*encrypt), RSA_size(keypair), out);
  fclose(out);
  #endif

  // Decrypt it
  decrypt = malloc(encrypt_len);
  if(RSA_private_decrypt(encrypt_len, (unsigned char*)encrypt, (unsigned char*)decrypt,
                         keypair, RSA_PKCS1_OAEP_PADDING) == -1) {
    ERR_load_crypto_strings();
    ERR_error_string(ERR_get_error(), err);
    fprintf(stderr, "Error decrypting message: %s\n", err);
    goto free_stuff;
  }
  printf("Decrypted message: %s\n", decrypt);

  free_stuff:
  RSA_free(keypair);
  BIO_free_all(pub);
  BIO_free_all(pri);
  free(pri_key);
  free(pub_key);
  free(encrypt);
  free(decrypt);
  free(err);

  return 0;
}
```

### openSSL - RSA - Signature/Verification (c++809)

(https://gist.github.com/irbull/08339ddcd5686f509e9826964b17bb59)

Programm zum Signieren einer Nachricht mit RSA-private-key und Verifikation mittels public-key (DLL libcrypto.dll in Verzeichnis kopieren):

```c++
#include <iostream>
#include <cstring>
#include <openssl/aes.h>
#include <openssl/evp.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/ssl.h>
#include <openssl/bio.h>
#include <openssl/err.h>
#include <assert.h>

std::string privateKey ="-----BEGIN RSA PRIVATE KEY-----\n"\
 "MIIEowIBAAKCAQEAy8Dbv8prpJ/0kKhlGeJYozo2t60EG8L0561g13R29LvMR5hy\n"\
 "vGZlGJpmn65+A4xHXInJYiPuKzrKUnApeLZ+vw1HocOAZtWK0z3r26uA8kQYOKX9\n"\
 "Qt/DbCdvsF9wF8gRK0ptx9M6R13NvBxvVQApfc9jB9nTzphOgM4JiEYvlV8FLhg9\n"\
 "yZovMYd6Wwf3aoXK891VQxTr/kQYoq1Yp+68i6T4nNq7NWC+UNVjQHxNQMQMzU6l\n"\
 "WCX8zyg3yH88OAQkUXIXKfQ+NkvYQ1cxaMoVPpY72+eVthKzpMeyHkBn7ciumk5q\n"\
 "gLTEJAfWZpe4f4eFZj/Rc8Y8Jj2IS5kVPjUywQIDAQABAoIBADhg1u1Mv1hAAlX8\n"\
 "omz1Gn2f4AAW2aos2cM5UDCNw1SYmj+9SRIkaxjRsE/C4o9sw1oxrg1/z6kajV0e\n"\
 "N/t008FdlVKHXAIYWF93JMoVvIpMmT8jft6AN/y3NMpivgt2inmmEJZYNioFJKZG\n"\
 "X+/vKYvsVISZm2fw8NfnKvAQK55yu+GRWBZGOeS9K+LbYvOwcrjKhHz66m4bedKd\n"\
 "gVAix6NE5iwmjNXktSQlJMCjbtdNXg/xo1/G4kG2p/MO1HLcKfe1N5FgBiXj3Qjl\n"\
 "vgvjJZkh1as2KTgaPOBqZaP03738VnYg23ISyvfT/teArVGtxrmFP7939EvJFKpF\n"\
 "1wTxuDkCgYEA7t0DR37zt+dEJy+5vm7zSmN97VenwQJFWMiulkHGa0yU3lLasxxu\n"\
 "m0oUtndIjenIvSx6t3Y+agK2F3EPbb0AZ5wZ1p1IXs4vktgeQwSSBdqcM8LZFDvZ\n"\
 "uPboQnJoRdIkd62XnP5ekIEIBAfOp8v2wFpSfE7nNH2u4CpAXNSF9HsCgYEA2l8D\n"\
 "JrDE5m9Kkn+J4l+AdGfeBL1igPF3DnuPoV67BpgiaAgI4h25UJzXiDKKoa706S0D\n"\
 "4XB74zOLX11MaGPMIdhlG+SgeQfNoC5lE4ZWXNyESJH1SVgRGT9nBC2vtL6bxCVV\n"\
 "WBkTeC5D6c/QXcai6yw6OYyNNdp0uznKURe1xvMCgYBVYYcEjWqMuAvyferFGV+5\n"\
 "nWqr5gM+yJMFM2bEqupD/HHSLoeiMm2O8KIKvwSeRYzNohKTdZ7FwgZYxr8fGMoG\n"\
 "PxQ1VK9DxCvZL4tRpVaU5Rmknud9hg9DQG6xIbgIDR+f79sb8QjYWmcFGc1SyWOA\n"\
 "SkjlykZ2yt4xnqi3BfiD9QKBgGqLgRYXmXp1QoVIBRaWUi55nzHg1XbkWZqPXvz1\n"\
 "I3uMLv1jLjJlHk3euKqTPmC05HoApKwSHeA0/gOBmg404xyAYJTDcCidTg6hlF96\n"\
 "ZBja3xApZuxqM62F6dV4FQqzFX0WWhWp5n301N33r0qR6FumMKJzmVJ1TA8tmzEF\n"\
 "yINRAoGBAJqioYs8rK6eXzA8ywYLjqTLu/yQSLBn/4ta36K8DyCoLNlNxSuox+A5\n"\
 "w6z2vEfRVQDq4Hm4vBzjdi3QfYLNkTiTqLcvgWZ+eX44ogXtdTDO7c+GeMKWz4XX\n"\
 "uJSUVL5+CVjKLjZEJ6Qc2WZLl94xSwL71E41H4YciVnSCQxVc4Jw\n"\
 "-----END RSA PRIVATE KEY-----\n\0";

std::string publicKey ="-----BEGIN PUBLIC KEY-----\n"\
 "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy8Dbv8prpJ/0kKhlGeJY\n"\
 "ozo2t60EG8L0561g13R29LvMR5hyvGZlGJpmn65+A4xHXInJYiPuKzrKUnApeLZ+\n"\
 "vw1HocOAZtWK0z3r26uA8kQYOKX9Qt/DbCdvsF9wF8gRK0ptx9M6R13NvBxvVQAp\n"\
 "fc9jB9nTzphOgM4JiEYvlV8FLhg9yZovMYd6Wwf3aoXK891VQxTr/kQYoq1Yp+68\n"\
 "i6T4nNq7NWC+UNVjQHxNQMQMzU6lWCX8zyg3yH88OAQkUXIXKfQ+NkvYQ1cxaMoV\n"\
 "PpY72+eVthKzpMeyHkBn7ciumk5qgLTEJAfWZpe4f4eFZj/Rc8Y8Jj2IS5kVPjUy\n"\
 "wQIDAQAB\n"\
 "-----END PUBLIC KEY-----\n";

RSA* createPrivateRSA(std::string key) {
  RSA *rsa = NULL;
  const char* c_string = key.c_str();
  BIO * keybio = BIO_new_mem_buf((void*)c_string, -1);
  if (keybio==NULL) {
    return 0;
  }
  rsa = PEM_read_bio_RSAPrivateKey(keybio, &rsa,NULL, NULL);
  return rsa;
}

RSA* createPublicRSA(std::string key) {
  RSA *rsa = NULL;
  BIO *keybio;
  const char* c_string = key.c_str();
  keybio = BIO_new_mem_buf((void*)c_string, -1);
  if (keybio==NULL) {
    return 0;
  }
  rsa = PEM_read_bio_RSA_PUBKEY(keybio, &rsa,NULL, NULL);
  return rsa;
}

bool RSASign( RSA* rsa,
             const unsigned char* Msg,
             size_t MsgLen,
             unsigned char** EncMsg,
             size_t* MsgLenEnc) {
  EVP_MD_CTX* m_RSASignCtx = EVP_MD_CTX_create();
  EVP_PKEY* priKey  = EVP_PKEY_new();
  EVP_PKEY_assign_RSA(priKey, rsa);
  if (EVP_DigestSignInit(m_RSASignCtx,NULL, EVP_sha256(), NULL,priKey)<=0) {
    return false;
  }
  if (EVP_DigestSignUpdate(m_RSASignCtx, Msg, MsgLen) <= 0) {
    return false;
  }
  if (EVP_DigestSignFinal(m_RSASignCtx, NULL, MsgLenEnc) <=0) {
    return false;
  }
  *EncMsg = (unsigned char*)malloc(*MsgLenEnc);
  if (EVP_DigestSignFinal(m_RSASignCtx, *EncMsg, MsgLenEnc) <= 0) {
    return false;
  }
  EVP_MD_CTX_free(m_RSASignCtx);

  return true;
}

bool RSAVerifySignature( RSA* rsa,
                        unsigned char* MsgHash,
                        size_t MsgHashLen,
                        const char* Msg,
                        size_t MsgLen,
                        bool* Authentic) {
  *Authentic = false;
  EVP_PKEY* pubKey  = EVP_PKEY_new();
  EVP_PKEY_assign_RSA(pubKey, rsa);
  EVP_MD_CTX* m_RSAVerifyCtx = EVP_MD_CTX_create();

  if (EVP_DigestVerifyInit(m_RSAVerifyCtx,NULL, EVP_sha256(),NULL,pubKey)<=0) {
    return false;
  }
  if (EVP_DigestVerifyUpdate(m_RSAVerifyCtx, Msg, MsgLen) <= 0) {
    return false;
  }
  int AuthStatus = EVP_DigestVerifyFinal(m_RSAVerifyCtx, MsgHash, MsgHashLen);
  if (AuthStatus==1) {
    *Authentic = true;
    EVP_MD_CTX_free(m_RSAVerifyCtx);
    return true;
  }
  else if(AuthStatus==0) {
    *Authentic = false;
    EVP_MD_CTX_free(m_RSAVerifyCtx);
    return true;
  }
  else {
    *Authentic = false;
    EVP_MD_CTX_free(m_RSAVerifyCtx);
    return false;
  }
}

void Base64Encode( const unsigned char* buffer,
                  size_t length,
                  char** base64Text) {
  BIO *bio, *b64;
  BUF_MEM *bufferPtr;

  b64 = BIO_new(BIO_f_base64());
  bio = BIO_new(BIO_s_mem());
  bio = BIO_push(b64, bio);

  BIO_write(bio, buffer, length);
  BIO_flush(bio);
  BIO_get_mem_ptr(bio, &bufferPtr);
  BIO_set_close(bio, BIO_NOCLOSE);
  BIO_free_all(bio);

  *base64Text=(*bufferPtr).data;
}

size_t calcDecodeLength(const char* b64input) {
  size_t len = strlen(b64input), padding = 0;

  if (b64input[len-1] == '=' && b64input[len-2] == '=') //last two chars are =
    padding = 2;
  else if (b64input[len-1] == '=') //last char is =
    padding = 1;
  return (len*3)/4 - padding;
}

void Base64Decode(const char* b64message, unsigned char** buffer, size_t* length) {
  BIO *bio, *b64;

  int decodeLen = calcDecodeLength(b64message);
  *buffer = (unsigned char*)malloc(decodeLen + 1);
  (*buffer)[decodeLen] = '\0';

  bio = BIO_new_mem_buf(b64message, -1);
  b64 = BIO_new(BIO_f_base64());
  bio = BIO_push(b64, bio);

  *length = BIO_read(bio, *buffer, strlen(b64message));
  BIO_free_all(bio);
}

char* signMessage(std::string privateKey, std::string plainText) {
  RSA* privateRSA = createPrivateRSA(privateKey);
  unsigned char* encMessage;
  char* base64Text;
  size_t encMessageLength;
  RSASign(privateRSA, (unsigned char*) plainText.c_str(), plainText.length(), &encMessage, &encMessageLength);
  Base64Encode(encMessage, encMessageLength, &base64Text);
  free(encMessage);
  return base64Text;
}

bool verifySignature(std::string publicKey, std::string plainText, char* signatureBase64) {
  RSA* publicRSA = createPublicRSA(publicKey);
  unsigned char* encMessage;
  size_t encMessageLength;
  bool authentic;
  Base64Decode(signatureBase64, &encMessage, &encMessageLength);
  bool result = RSAVerifySignature(publicRSA, encMessage, encMessageLength, plainText.c_str(), plainText.length(), &authentic);
  return result & authentic;
}

int main() {
  std::string plainText = "My secret message.\n";
  char* signature = signMessage(privateKey, plainText);
  bool authentic = verifySignature(publicKey, "My secret message.\n", signature);
  if ( authentic ) {
    std::cout << "Authentic" << std::endl;
  }
  else {
    std::cout << "Not Authentic" << std::endl;
  }
}
```

### openSSL - TLS-WebServer (c++466, c++481)

Für TLS wird ein Zertifikat benötigt (samt Public Key) und ein dazu passender Privater Schlüssel. Damit ein Browser ein Zertifikat direkt akzeptiert muss es von einer vertrauenswürdigen Instanz ausgestellt werden. Für dieses einfache Beispiel wird ein eigenes Zertifikat samt passenden Schlüssel erzeugt:

```
openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
openssl x509 -text -noout -in certificate.pem
openssl pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12
openssl pkcs12 -in certificate.p12 -noout -info
```

Für die Ausführung wird benötigt:

- *certificate.pem* Zertifikat

- *key.pem* passender Schlüssel

- *libcrypto-1_1.dll* (für die Ausführung von openSSL)

- *libcrypto.dll* (für die Ausführung von openSSL)

- *libssl.dll* (für die Ausführung von openSSL)

- *homepage.html* - irgendein HTML das ein Browser lesen kann

  ```html
  <html>
  <head>
  	<meta http-equiv="Content-Type"
  	content="text/html; charset=iso-8859-1">
  	<title>~Eigener Webservers~</title>
  </head>
  <body>
  	<p>Diese Website wird auf meinem eigenen Server gehostet...</p>
  	<p>!Das Zertifikat dieser Seite ist ein Eigenes und wird nicht direkt akzeptiert!</p>
  </body>
  </html>
  
  ```

main.cpp:

```c++
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fstream>

#define _WIN32_WINNT 0x0A00
#include <winsock2.h>
#include <ws2tcpip.h>

#include <openssl/evp.h>
#include <openssl/ssl.h>
#include <openssl/err.h>

std::string getHtmlFile(char *name) {
  std::ifstream is(name);

  std::string str("");
  std::string tstr("");
  std::getline(is, tstr);
  while (std::getline(is, tstr)) {
    str += tstr;
  }
  is.close();
  return str;
}

int create_socket(int port) {
  WSADATA wsaData;
  WSAStartup(MAKEWORD(2,2), &wsaData);

  // socket() ======================================================================
  int s;
  struct sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_port = htons(port);
  addr.sin_addr.s_addr = htonl(INADDR_ANY);

  s = socket(AF_INET, SOCK_STREAM, 0);

  // bind() ========================================================================
  bind(s, (struct sockaddr*)&addr, sizeof(addr));

  // listen() ======================================================================
  listen(s, 1);

  return s;
}

SSL_CTX *create_context() {
  const SSL_METHOD *method;
  method = SSLv23_server_method();

  return SSL_CTX_new(method);
}

void configure_context(SSL_CTX *ctx) {
  SSL_CTX_set_ecdh_auto(ctx, 1);

  /* Muss im gleichen Verzeichnis liegen: */
  SSL_CTX_use_certificate_file(ctx, "certificate.pem", SSL_FILETYPE_PEM);

  /* Muss im gleichen Verzeichnis liegen: */
  SSL_CTX_use_PrivateKey_file(ctx, "key.pem", SSL_FILETYPE_PEM);
}

int main(int argc, char **argv) {
  int sock;
  SSL_CTX *ctx;

  SSL_load_error_strings();
  OpenSSL_add_ssl_algorithms();

  ctx = create_context();
  configure_context(ctx);

  sock = create_socket(443);   // 443 = HTTPS

  /* Handle connections */
  while(1) {
    struct sockaddr_in addr;
    unsigned int len = sizeof(addr);
    SSL *ssl;

    // accept() ===================================================================
    int client = accept(sock, (struct sockaddr*)&addr, (int*)&len);

    // Ausgabe des Anfragenden Clients:
    char *ip_str;
    ip_str = inet_ntoa(addr.sin_addr);
    printf("Bearbeite Anfrage von \"%s\"...\n", ip_str);

    // SSL-Uebertagung initialisierung
    ssl = SSL_new(ctx);
    SSL_set_fd(ssl, client);

    if (SSL_accept(ssl) <= 0) {
      // Wenn Zertifikat abgelehnt wird
      // Bei selbst erstelltem Zertifikat "normal"
      // ERR_print_errors_fp(stderr);
    } else {
      // hier erfolgt die SSL-Uebertragung der html-Datei
      std::string data = getHtmlFile("./homepage.html");
      char *myStr = (char*)data.c_str();
      SSL_write(ssl, myStr, strlen(myStr));
    }

    SSL_shutdown(ssl);
    SSL_free(ssl);
    close(client);
  }

  close(sock);
  SSL_CTX_free(ctx);
  EVP_cleanup();
  WSACleanup();
}
```

Übersetzen mit (Verzeichnisse anpassen):

```
g++.exe -Wall -std=c++11 -fexceptions -g -fpermissive -I"C:\OpenSSL-Win64\include" -c main.cpp -o .\main.o

g++.exe -L"C:\OpenSSL-Win64\lib" -o out.exe .\main.o  -lws2_32 -llibssl -llibcrypto  "C:\OpenSSL-Win64\lib\libcrypto.lib" "C:\OpenSSL-Win64\lib\libssl.lib"
```

Wenn der Server läuft, dann kann mittels Browser verbunden werden:

```
https://localhost
```

Je nach Browser muss auf alle Fälle bestätigt werden, dass dieses *nicht vertrauenswürdige* Zertifikat akzeptiert werden soll.

Für einen echten Server muss ein Zertifikat von einer vertrauenswürdigen Instanz erstellt werden.

### openSSL - TLS - Chat (c++464, 465)

Mit TLS wird hier ein Ping-Pong-Chat aufgebaut. Ein Client meldet sich auf dem Server an, sendet Zahlen von 10 .. 1, empfängt die Antwort des Servers, zeigt diese an und Endet. Der Server empfängt die Daten, gibt sie aus und retourniert sie an den Client.

Server: socket - bind - listen -accept - read/write - close

Server:

```c++
// https://wiki.openssl.org/index.php/Simple_TLS_Server
/*
    Zertifikate Erstellen:
    openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
    openssl x509 -text -noout -in certificate.pem
    openssl pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12
    openssl pkcs12 -in certificate.p12 -noout -info
*/

#include <stdio.h>
#include <unistd.h>
#include <string.h>

#ifdef _WIN32
#define _WIN32_WINNT 0x0A00
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <unistd.h>
#endif // _WIN32

#include <openssl/evp.h>
#include <openssl/ssl.h>
#include <openssl/err.h>

int create_socket(int port) {
  WSADATA wsaData;
  int iResult = WSAStartup(MAKEWORD(2,2), &wsaData);
  if (iResult != 0) {
    printf("WSAStartup failed: %d\n", iResult);
    return 1;
  }

  // --------------------------------------- Socket erzeugen
  int s = socket(AF_INET, SOCK_STREAM, 0);
  if (s < 0) {
    perror("Unable to create socket");
    exit(EXIT_FAILURE);
  }
  // ---------------------------------------- Bind - Port zuweisen
  struct sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_port = htons(port);
  addr.sin_addr.s_addr = htonl(INADDR_ANY);
  if (bind(s, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
    perror("Unable to bind");
    exit(EXIT_FAILURE);
  }
  // ----------------------------------------- Listen - nur auf 1 Client warten
  if (listen(s, 1) < 0) {
    perror("Unable to listen");
    exit(EXIT_FAILURE);
  }

  return s;
}

void init_openssl() {
  SSL_load_error_strings();
  OpenSSL_add_ssl_algorithms();
}

void cleanup_openssl() {
  EVP_cleanup();
}

SSL_CTX *create_context() {
  const SSL_METHOD *method;
  SSL_CTX *ctx;
  method = SSLv23_server_method();
  ctx = SSL_CTX_new(method);
  if (!ctx) {
    perror("Unable to create SSL context");
    ERR_print_errors_fp(stderr);
    exit(EXIT_FAILURE);
  }
  return ctx;
}

void configure_context(SSL_CTX *ctx) {
  SSL_CTX_set_ecdh_auto(ctx, 1);

  /* Set the key and cert */
  if (SSL_CTX_use_certificate_file(ctx, "certificate.pem", SSL_FILETYPE_PEM) <= 0) {
    ERR_print_errors_fp(stderr);
    exit(EXIT_FAILURE);
  }

  if (SSL_CTX_use_PrivateKey_file(ctx, "key.pem", SSL_FILETYPE_PEM) <= 0 ) {
    ERR_print_errors_fp(stderr);
    exit(EXIT_FAILURE);
  }
}

int main(int argc, char **argv) {
  int sock;
  SSL_CTX *ctx;

  init_openssl();
  ctx = create_context();

  configure_context(ctx);
  sock = create_socket(443); // Socket auf TLS-Standardport 443

  char buf[1000];
  /* Handle connections */
  do {
    struct sockaddr_in addr;
    unsigned int len = sizeof(addr);
    SSL *ssl;
    // ----------------------------------------- Accept, Requester Daten lesen
    int client = accept(sock, (struct sockaddr*)&addr, &len);
    // Ausgabe des Anfragenden Clients:
    char *ip_str;
    ip_str = inet_ntoa(addr.sin_addr);
    printf("Bearbeite Anfrage von \"%s\"...\n", ip_str);

    if (client < 0) {
      perror("Unable to accept");
      exit(EXIT_FAILURE);
    }

    ssl = SSL_new(ctx);
    SSL_set_fd(ssl, client);

    if (SSL_accept(ssl) <= 0) {
      // Wenn Certificate nicht aktzeptiert wird
      //ERR_print_errors_fp(stderr);
    } else {
      do {
        if (SSL_read(ssl, buf, 1000) > 0) {
          printf("%s\n", buf);
          SSL_write(ssl, buf, strlen(buf));
        }
      } while (buf[1] != '1');
    }

    SSL_shutdown(ssl);
    SSL_free(ssl);
    close(client);
  } while (strcmp(buf, "0\n") != 0);

  close(sock);
  SSL_CTX_free(ctx);
  cleanup_openssl();
  #ifdef _WIN32
  WSACleanup();
  #endif // _WIN32
}
```

Client:

```c++
#ifdef _WIN32
#define _WIN32_WINNT 0x0A00
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <unistd.h>
#endif // _WIN32

#include <openssl/ssl.h>
#include <openssl/bio.h>
#include <openssl/err.h>
//https://localhost:51234/
#define HOST "encrypted.google.com"
#define HOST "localhost"

/**
 * Example SSL client that connects to the HOST defined above,
 * and prints out the raw response to stdout.
 */
int main(int arc, char **argv) {
  WSADATA wsaData;

  int iResult = WSAStartup(MAKEWORD(2,2), &wsaData);
  if (iResult != 0) {
    printf("WSAStartup failed: %d\n", iResult);
    return 1;
  }
  SSL_load_error_strings();
  ERR_load_crypto_strings();

  OpenSSL_add_all_algorithms();
  SSL_library_init();

  SSL_CTX *ctx = SSL_CTX_new(SSLv23_client_method());
  if (ctx == NULL) {
    printf("errored; unable to load context.\n");
    ERR_print_errors_fp(stderr);
    return -3;
  }

  BIO *bio = BIO_new_ssl_connect(ctx);
  SSL *ssl;
  BIO_get_ssl(bio, &ssl);
  SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY);

  BIO_set_conn_hostname(bio, HOST":https");
  if (BIO_do_connect(bio) <= 0) {
    BIO_free_all(bio);
    printf("errored; unable to connect.\n");
    ERR_print_errors_fp(stderr);
    return -2;
  }

  //    const char *request = "GET / HTTP/1.1\nHost: "HOST"\nUser Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)\nConnection: Close\n\n";
  char request[] = "10\0";

  if (BIO_write(bio, request, 3) <= 0) {
    BIO_free_all(bio);
    printf("errored; unable to write.\n");
    ERR_print_errors_fp(stderr);
    return -1;
  }

  char tmpbuf[1024+1];

  for (int i = 9; i >= 0; i--) {
    int len = BIO_read(bio, tmpbuf, 1024);
    if (len == 0) {
      break;
    } else if (len < 0) {
      if (!BIO_should_retry(bio)) {
        printf("errored; read failed.\n");
        ERR_print_errors_fp(stderr);
        break;
      }
    } else {
      tmpbuf[len] = 0;
      sprintf(request, "%02i", i);
      request[2] = 0;
      printf("%s\n", tmpbuf);
      BIO_write(bio, request, 3);
    }
  }

  BIO_free_all(bio);
  return 0;
}
```

für die Erstellung (je Server und Client):

```
openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
openssl x509 -text -noout -in certificate.pem
openssl pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12
openssl pkcs12 -in certificate.p12 -noout -info
```

dafür wird benötigt:

- *certificate.pem* Zertifikat (im Server-Verzeichnis)
- *key.pem* passender Schlüssel (im Server-Verzeichnis)

- *libcrypto-1_1.dll* (für die Ausführung von openSSL)
- *libcrypto.dll* (für die Ausführung von openSSL)
- *libssl.dll* (für die Ausführung von openSSL)

### openSSL - Lib - MyHash (c++ 805)

Berechnung eines sha256-Hash-Werts:

```c++
#include <iostream>
#include <sstream>
#include <string>
#include <iomanip>

using namespace std;

#include <openssl/sha.h>

string sha256(const string str) {
  unsigned char hash[SHA256_DIGEST_LENGTH];
  SHA256_CTX sha256;
  SHA256_Init(&sha256);
  SHA256_Update(&sha256, str.c_str(), str.size());
  SHA256_Final(hash, &sha256);
  stringstream ss;
  for(int i = 0; i < SHA256_DIGEST_LENGTH; i++) {
    ss << hex << setw(2) << setfill('0') << (int)hash[i];
  }
  return ss.str();
}

int main() {
  cout << sha256("Original String") << endl;
  return 0;
}
```

Dieses Programm berechnet den sha256-Hash-Wert des Strings *Original String*. Bei der Programmausführung wird ausgegeben:

`09d63dd3384577937ef73ac22a674d52702fdf1b82bb624a2d6aa7501af9620f`

Als Vergleich wird der String *Original String* in einer Text-Datei *orig.txt* abgelegt und für diese Datei der Hash mittels GPG-Tools berechnet (in die Datei sha256sum.txt), dort ist der gleiche Hash-Wert zu finden. 

Als zweite Vergleichsmöglichkeit mit Windows-Powershell:

```powershell
> get-filehash -Algorithm sha256 .\orig.txt
```

### openSSL - AES (c++806)

(https://wiki.openssl.org/index.php/EVP_Symmetric_Encryption_and_Decryption)

Hier wird ein Text mittels openSSL ver- und entschlüsselt (DLL libcrypto.dll in Verzeichnis kopieren):

```c++
/**
 *
 * Quelle: wiki.openssl.org/index.php/EVP_Symmetric_Encryption_and_Decryption
 *
 * g++ -c main.cpp -I"C:\OpenSSL-Win64\include"
 * g++ -L"C:\OpenSSL-Win64\lib" -o out.exe main.o -llibcrypto
 *
 * Fuer die Ausfuehrung muss die DLL libcrypto.dll im gleichen Pfad
 * wie die erstellte Exe liegen. Die dll ist Teil der openSsl
 * Installation.
 *
 * Fuer das Uebersetzen des Codes muessen in Codeblocks Anpassungen
 * erfolgen:
 *  - unter
 *            Settings > Compiler... > Linker settings >
 *    den Pfad zu libcrypto.a Einstellen
 *  - unter
 *            Settings > Compiler... > Search directories > Compiler
 *    den Include-Pfad hinzufügen (C:\OpenSSL-Win64\include)
 *
 * 256Bit AES Verschluesselung im CBC-Modus
 * Korrekt muss IV (Initial Value) zufaellig erzeugt werden
 * Wichtig: ciphertext muss grosz genug zur Verfuegung gestellt werden - kann groeszer als PlainText werden.
 * encrypt und decrypt verwenden ein EVP_CIPHER-Objekt, damit kann die Verschl eingestellt werden
 * Wichtig: der encoded-Text ist ein Binaer-Text, es koennen 0er vorkommen und es ist kein Abschluss-Nuller dran.
 *
 */

#include <cstring>
#include <iostream>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>

using namespace std;

int handleErrors(void) {
  ERR_print_errors_fp(stderr);
  abort();
}

int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key, unsigned char *iv, unsigned char *ciphertext) {
  EVP_CIPHER_CTX *ctx;
  int len;
  int ciphertext_len;

  if (!(ctx=EVP_CIPHER_CTX_new())) handleErrors();
  if (1 != EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv)) handleErrors();
  if (1 != EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len))
    handleErrors();

  ciphertext_len = len;

  if (1 != EVP_EncryptFinal_ex(ctx, ciphertext + len, &len)) handleErrors();

  ciphertext_len += len;
  EVP_CIPHER_CTX_free(ctx);

  return ciphertext_len;
}

int decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key, unsigned char *iv, unsigned char *plaintext) {
  EVP_CIPHER_CTX *ctx;
  int len;
  int plaintext_len;

  if (!(ctx=EVP_CIPHER_CTX_new())) handleErrors();
  if (1 != EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv)) handleErrors();
  if (1 != EVP_DecryptUpdate(ctx, plaintext, &len, ciphertext, ciphertext_len)) handleErrors();

  plaintext_len = len;

  if (1 != EVP_DecryptFinal_ex(ctx, plaintext + len, &len)) handleErrors();

  plaintext_len += len;
  EVP_CIPHER_CTX_free(ctx);

  return plaintext_len;
}

int main()
{
  unsigned char *key = (unsigned char *) "01234567890123456789012345678901";  // 256Bit Schluessel
  unsigned char *iv = (unsigned char *) "0123456789012345";                   // Initial-Wert: 128Bit

  unsigned char *plaintext = (unsigned char *)"Der schnelle braune Fuchs springt ueber den faulen Hund";
  unsigned char ciphertext[128];
  unsigned char decryptedtext[128];

  int decrypted_len, ciphertext_len;

  cout << "Text: \"" << plaintext << "\"" << endl;

  ciphertext_len = encrypt(plaintext, strlen((char *)plaintext), key, iv, ciphertext);
  cout << "Code: \"" << ciphertext << "\"" << endl;      // kann aufgrund 0er abgeschnitten ausgegeben werden

  decrypted_len = decrypt(ciphertext, ciphertext_len, key, iv, decryptedtext);
  decryptedtext[decrypted_len] = 0;
  cout << "Text: \"" << decryptedtext << "\"" << endl;

  return 0;
}
```

### openSSL - DES (c++807)

(https://blog.fpmurphy.com/2010/04/openssl-des-api.html)

make:

```
>mingw32-g++.exe -Wall -fexceptions -g -fpermissive -I"C:\OpenSSL-Win64\include" -c main.cpp -o main.o
```

Link:

```
>mingw32-g++.exe -L"C:\OpenSSL-Win64\lib" -o out.exe main.o   "C:\OpenSSL-Win64\lib\libcrypto.lib"
```

(DLL libcrypto.dll in Verzeichnis kopieren)

Code:

```c++
/**
 *
 * Quelle: https://blog.fpmurphy.com/2010/04/openssl-des-api.html
 *
 * g++ -c main.cpp -I"c:\OpenSSL-Win64\include" -fpermissive
 * g++ -L"c:\OpenSSL-Win64\lib" -o out.exe main.o -llibcrypto
 *
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <openssl/des.h>
#include <openssl/rand.h>

#define BUFSIZE 64

int main(void)
{
  unsigned char in[BUFSIZE], out[BUFSIZE], back[BUFSIZE];
  unsigned char *e = out;

  DES_cblock key;
  DES_cblock seed = {0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10};
  DES_key_schedule keysched;

  memset(in, 0, sizeof(in));
  memset(out, 0, sizeof(out));
  memset(back, 0, sizeof(back));

  RAND_seed(seed, sizeof(DES_cblock));

  DES_random_key(&key);

  DES_set_key((DES_cblock *)key, &keysched);

  /* 8 bytes of plaintext */
  strcpy(in, "HillTown");

  printf("Plaintext: [%s]\n", in);

  DES_ecb_encrypt((DES_cblock *)in,(DES_cblock *)out, &keysched, DES_ENCRYPT);

  printf("Ciphertext:");
  while (*e)
    printf(" [%02x]", *e++);
  printf("\n");

  DES_ecb_encrypt((DES_cblock *)out,(DES_cblock *)back, &keysched, DES_DECRYPT);

  printf("Decrypted Text: [%s]\n", back);

  return(0);
}

```

## Windows-Powershell

Außer der Signatur kann ein Hash geprüft werden (wenn er mit angegeben wird). Dazu wird der angegebener Hash kopiert. Für die heruntergeladene Datei wird der Hash berechnet (mit der gleichen Hash-Methode). Anschließend werden die Hash-Werte miteinander verglichen.
Für die Ermittlung des Hash-Werts sind entsprechende Tools notwendig oder mittels Windows-Powershell:

```
...\Downloads> get-filehash -Algorithm sha256 .\gpg4win-3.1.10.exe
```

- Einrichten des Mail-Programmes zur Verwendung der Software (siehe obige youtube-Links)

- Test mit adele (https://www.privacy-handbuch.de/handbuch_32t.htm)
  Mit adele können Test-Mails ausgetauscht werden (adele ist ein Programm das automatisch Mails beantwortet). Eventuell werden ihre Mails automatisch als Spam eingeordnet.

## openSSL - Tool

openSSL liefert nicht nur Bibliotheken für die eigene Programmierung (siehe Unten), es ist auch ein Tool mit dem kryptographische Anforderungen aus der Kommandozeile (auch für Skripte ...) erledigt werden werden können.

- Linux: `sudo apt-get install libssl-dev` 

  Windows: https://slproweb.com/products/Win32OpenSSL.html
  dort die volle Version *Win64 OpenSSL v1.1.1c*
  für Windows muss in der Kommandozeile entweder in den entsprechenden Pfad (C:\Program Files\OpenSSL-Win64\bin) gewechselt oder PATH angepasst werden.

- Version (und Funktion) Prüfen `openssl version`

- Generieren einer großen Primzahl (hier 2048 Bit in Hex-Darstellung):

  ```
  >openssl prime -generate -bits 2048 -hex
  E2E3092B65466EE6883EF685166885CD808A48F5FB6B3EFFAD18118C00F78621A6B6FDE9CBF801F1857AC4D65F096407F0DE34CBF7D7DA12928E378C9D7402392FBCBED4FC668C826872FA5BF78965B95E8B1EBB4E8D3FC1A434445FD65D123A6DB5144F72EE80073B7846C5DECAD1F175826B68F2A36CD80DBAC6274D6D411ABD90F8900DB0CE4F5120F3290A18E11FD159E4DA532DF7AFA9D1E212BCF5262E9E96F2BA7ACA32388EA95BAA9BEA15592DE78B72681FEC0F961AB40D5EE7FD6E9B7AD78068E90808C6773179AC2735495A3A9EC71A731812586BC68A35C6979214434D43EE7541A78047729FF2A85505AD562C01C78EAF158B3C6BEEC618E863
  ```

- Diffie-Hellman mit OpenSSL (https://sandilands.info/sgordon/diffie-hellman-secret-key-exchange-with-openssl):

  - Generieren der allgemeinen Parameter n (Primzahl) und g (Generator):

    ```
    >openssl genpkey -genparam -algorithm DH -out dhp.pem
    >openssl pkeyparam -in dhp.pem -text
    ```

    (der zweite Befehl ist lediglich zur Darstellung der Parameter in der Konsole)

  - Generieren eines ersten (Public+Private) Schlüsselpaares aus diesen Parametern (und wieder darstellen):

    ```
    >openssl genpkey -paramfile dhp.pem -out dhkey1.pem
    >openssl pkey -in dhkey1.pem -text -noout
    ```

  - Extrahieren des Public-Key für die Weitergabe:

    ```
    >openssl pkey -in dhkey1.pem -pubout -out dhpub1.pem
    >openssl pkey -pubin -in dhpub1.pem -text
    ```

  - Generieren eines zweiten (Public+Private) Schlüsselpaares aus diesen Parametern (und wieder darstellen):

    ```
    >openssl genpkey -paramfile dhp.pem -out dhkey2.pem
    >openssl pkey -in dhkey2.pem -text -noout
    ```

  - Aus dem Public-Key des ersten Paares und dem Private-Key des zweiten Paares wird ein Schlüssel generiert:

    ```
    >openssl pkeyutl -derive -inkey dhkey2.pem -peerkey dhpub1.pem -out secret2.bin
    ```

    Analog kann ein Schlüssel aus dem Public-Key des zweiten Paares (wurde hier noch nicht generiert) und dem Private-Key des ersten Paares ein Schlüssel generiert werden.

    ```
    >openssl pkey -in dhkey2.pem -pubout -out dhpub2.pem
    >openssl pkeyutl -derive -inkey dhkey1.pem -peerkey dhpub2.pem -out secret1.bin
    ```

    Die beiden secret*.bin-Dateien müssen identisch sein.

- RSA-Schlüsselpaar erzeugen:

  ```
  openssl genrsa -out priv.pem 2048
  openssl rsa -in priv.pem -pubout > pub.pem
  ```
  
- Mit RSA verschlüsseln/entschlüsseln:

  ```
  openssl rsautl -encrypt -pubin -inkey pub.pem -in plain.txt -out cip.encrypted
  openssl rsautl -decrypt -inkey priv.pem -in cip.encrypted -out replain.txt
  ```

- Signatur (mittels RSA-Key) und auch Prüfen:

  ```
  openssl dgst -sha256 -sign priv.pem -out sha256.sign plain.txt
  openssl dgst -sha256 -verify pub.pem -signature sha256.sign plain.txt
  ```

- Symmetrisch Verschlüsseln:

  ```
  >echo I love OpenSSL! > c:\temp\plain.txt
  
  >openssl enc -aes-256-cbc -in c:\temp\plain.txt -out c:\temp\encrypted.bin
  enter aes-256-cbc encryption password:
  Verifying - enter aes-256-cbc encryption password:
  *** WARNING : deprecated key derivation used.
  Using -iter or -pbkdf2 would be better.
  
  >openssl enc -aes-256-cbc -d -in c:\temp\encrypted.bin -pass pass:hello
  *** WARNING : deprecated key derivation used.
  Using -iter or -pbkdf2 would be better.
  I love OpenSSL!
  ```

  (für Linux Pfadangaben weglassen und beim echo Anführungsstriche einfügen)

- Hash-Werte

  Erzeugen eines SHA256-Hashes:

  ```
  openssl sha256 ReadMe.md
  ```

## SSH-Keygen

Das Protokoll *telnet* ermöglicht es direkt Zeichenbasiert mittels TCP zu kommunizieren. Hauptsächlich wird es dazu verwendet um entfernte Rechner zu bedienen (heute oft auch Raspberry ähnlicher Devices). Dafür existiert auf allen gängigen OS auch ein entsprechendes Client-Programm das auch nur *telnet* genannt wird. Der große Nachteil: die Übertragung samt Anmeldeschlüssel erfolgt in Klartext (TCP).

Um die Kommunikation verschlüsselt zu ermöglichen wurde SSH (Secure Shell) entwickelt. Mit einem SSH-Client wird mittels Public-Key-Verfahren auf entfernte Systeme angemeldet. Dazu muss:

- Alice auf ihrem Rechner zu Hause ein RSA-Schlüsselpaar erzeugt werden (mit ssh_keygen - siehe Unten)
- Alice Bringt und Speichert den öffentlichen Schlüssel auf Ihren entfernten Rechner (oder Raspi)
- Auf dem eigenen Rechner ruft Alice nun `ssh 123.123.123.123` (entfernte-Rechner-IP) auf (samt Abfrage Benutzer ...). Dabei läuft folgendes Protokoll ab:
  - der entfernte Rechner generiert eine Zufallszahl und sendet diese mit dem öffentlichen Schlüssel von Alice verschlüsselt an Alice.
  - der Rechner von Alice entschlüsselt die Sendung mit dem privaten Schlüssel und generiert aus der erhaltenen Zufallszahl einen Hash-Wert.
  - dieser Hash-Wert wird an den entfernten Rechner gesendet. Dieser hat ebenfalls den Hash aus der Zufallszahl generiert und vergleicht die beiden Werte

Mit der Installation des SSH-Clients sind automatisch einige Werkzeuge mit verfügbar:

Mittels *OpenSSH*-*ssh-keygen* können diverse Schlüssel erstellt werden. Seit Windows 10 (V1709) ist OpenSSH als App aktivierbar (Apps&Features->Optionale Features Verwalten->Features hinzufügen->OpenSSH Client/Server ...). Die Verwendung ist erläutert unter https://en.wikipedia.org/wiki/Ssh-keygen.

## Hash

Berechnen eines Hash mit Windows in der Powershell (ab V4):

```
Get-FileHash -Algorithm SHA256 .\iview452_x64_setup.exe
```

das klappt auch für **MACTripleDES, MD5, RIPEMD160, SHA1, SHA384, SHA512 **

(Alternativ mittels openSSL - siehe Oben)

## Rechnen mod/pow mit großen Zahlen

Grundregeln für die Modulo-Operation:

- $(a\cdot b) \mod n = ((a \mod n)\cdot (b \mod n)) \mod n$ 
  jeder Term und das Produkt ist Modulo zu rechnen

- $x^{a+b} = x^a \cdot x^b$

- $x^{a+b} \mod n= (x^a \cdot x^b) \mod n = ((x^a \mod n)\cdot (x^b \mod n)) \mod n$
  Die Modulo-Operation darf "hineingezogen" werden - Damit können Summen von Potenzen in der Modulo-Rechnung zerlegt werden

- $x^a \mod n = (x \mod n)^a \mod n$

  Die Modulo-Operation darf "hineingezogen" werden - Damit können Potenzen in der Modulo-Rechnung zerlegt werden

- $x^{a\cdot b} = (x^a)^b = (x^a \mod n)^b \mod n$
  Die Modulo-Operation darf "hineingezogen" werden - Damit können Produkte von Potenzen in der Modulo-Rechnung zerlegt werden

Das Rechnen mit großen Zahlen ist nicht immer einfach. Mit den gezeigten Regeln können zum Teil sehr starke Vereinfachungen erreicht werden.

- $16^{31} \mod 71 = ?$                     $16^{31} = 83076749736717242056487941267521536$
  Versuchen Sie das Beispiel mit dem Taschenrechner zu lösen ....

  $ = 16^{(28+3)} \mod 71$

  $= ((16^{28} \mod 71)\cdot (16^3 \mod 71)) \mod 71$

  $=((16^{4\cdot 7} \mod 71)\cdot (16^3 \mod 71)) \mod 71$
  $=(((16^4 \mod 71)^7 \mod 71)\cdot (16^3 \mod 71)) \mod 71$

  $=(((65535 \mod 71)^{7} \mod 71)\cdot (16^3 \mod 71)) \mod 71$

  $=((3^7 \mod 71)\cdot (16^3 \mod 71)) \mod 71$

  $=((2187 \mod 71)\cdot (4096 \mod 71)) \mod 71$

  $=(49 \cdot 57) \mod 71$  

  $=2793 \mod 71$ 

  $=\underline{24}$

Lösungsansatz in einem Computerprogramm: 

- Wenn ein Exponent ungerade ist, kann er der Exponentwert so dargestellt werden:

  $x^5 = x^1 \cdot x^4$ - eine darauf ausgeführte Modulo-Operation wird für jeden Term und das Produkt ausgeführt

- Für geradzahlige Exponenten kann dieser als Quadrat der Basis mit der Exponent-Hälfte gebildet werden:
  $x^4 = (x^2)^2$ - eine darauf ausgeführte Modulo-Operation wird für die Klammer und das Ergebnis ausgeführt.