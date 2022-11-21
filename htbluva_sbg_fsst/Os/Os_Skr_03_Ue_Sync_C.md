# 3 Os - Synchronisation - C - Übungen

## Bank (c++707)


[[http://www.dpunkt.de/java/Programmieren_mit_Java/Multithreading/3.html][Bank Aufgabenbeschreibung (original)]]

Erstellen Sie auf der Grundlage des unten gezeigten Java-Programmes ein CPP-Programm mit der Verwendung von Threads.

Lösen Sie in Ihrem CPP-Programm auch das Lost-Update Problem.

main.cpp:
```c++
#include "simplebank.h"
#include "angestellter.h"

#include <iostream>
using namespace std;

int main() {
	SimpleBank bank;
	
	cout<< endl<< "*** LOST Update Problematik ***"<<endl;
	cout<< endl<< "Es sollen 20 Euro Ueberwiesen werden..."<<endl<<endl;
	
	cout <<"VOR den Ueberweisungen:------------------------------"<<endl;
	bank.kontostand();
	
	// Eine ringfoermige Ueberweisung
	
	std::thread A1(std::move(Angestellter(&bank, 0, 1, 20)));
	std::thread A2(std::move(Angestellter(&bank, 1, 2, 20)));
	std::thread A3(std::move(Angestellter(&bank, 2, 0, 20)));
	
	A1.join();
	A2.join();
	A3.join();
	
	cout <<"NACH den Ueberweisungen:-----------------------------"<<endl;
	bank.kontostand();
 
	return 0;
}
```

Hinweis 1: Der aktuelle Thread soll 1 Sec warten.

```
#include <thread>         // std::this_thread::sleep_for
#include <chrono>         // std::chrono::seconds
...
std::chrono::seconds one_second(1);
std::this_thread::sleep_for (one_second);
...
```


Hinweis 2: Eine Klasse runnable in std.cpp
```
#include <iostream>
#include <thread>

class runnable{
    public:
        void operator()(){
            std::cout << "Hello World" << std::endl;
        }
};

int main(){
    std::thread t(std::move(runnable()));

    t.join();
    return 0;
}
```


### Java-Programm (J500)
Ein Objekt Bank modelliert eine reale Bank, die Konten für verschiedene Personen verwaltet. 
Die Bank hat Überweisungen durchzuführen. Die Überweisungen werden in parallelen Threads abgearbeitet. 


#### Die Klasse SimpleBank
- In diesem Beispiel wird die Bank durch eine Klasse SimpleBank realisiert. 
- Diese Bank besitzt das Array konten, das die Stände der einzelnen Konten enthält. 
- Der Array-Index soll als Kontonummer dienen. 

- Für Transaktionen zwischen zwei Konten stellt SimpleBank die Methode ueberweisung() zur Verfügung. 

- Ihr werden die beiden beteiligten Kontonummern sowie der Betrag der Überweisung übergeben. 

- Zu Demonstrationszwecken wird die Ausführung der Überweisung zwischen der Berechnung des neuen Kontostands und dessen Zurückschreiben unterbrochen. Hierzu wird auf die bekannte Methode sleep() verwendet.

- Als letztes verfügt SimpleBank über die Methode kontostand(), mit der die aktuellen Stände aller Konten angezeigt werden können.


```java
class SimpleBank {
	static int[] konten = {30, 50, 100};

	public void überweisung(int von, int nach, int betrag) {
		int neuerBetrag;
	
		neuerBetrag = konten[von];
		neuerBetrag -= betrag;
		// Inkonsistenz, da neuer Betrag noch nicht vermerkt
		try {
			Thread.sleep((int)Math.random()*1000);
		}
		catch(InterruptedException e) {
		}
		konten[von] = neuerBetrag;
	
		neuerBetrag = konten[nach];
		neuerBetrag += betrag;
		// dito
		konten[nach] = neuerBetrag;
	}
	
	public void kontostand() {
		for(int i = 0; i < konten.length; i++)
			System.out.println("Konto "+ i +": " + konten[i]);
	}
}
```

- Die Überweisungen sollen durch Bankangestellte erfolgen. 
- Diese werden durch die Klasse Angestellter implementiert. 
- Damit mehrere Angestellte gleichzeitig Transaktionen vornehmen können, werden sie von Thread abgeleitet. 


#### Die Klasse Angestellter
Jeder Angestellte gehört zu einer Bank. 
Deshalb wird dem Konstruktor ein Verweis auf SimpleBank übergeben. 
Über diesen Verweis wird die Methode ueberweisung() aufgerufen. 
Die beiden beteiligten Kontonummern sowie der Betrag werden dem 
Konstruktor übergeben und in entsprechenden Datenelementen 
der Klasse gespeichert. 

Diese Datenelemente werden dann in run() benutzt, um die Methode 
ueberweisung() der Bank aufzurufen. Nachdem die Transaktion durchgeführt 
ist, wird eine aktuelle Kontenübersicht ausgegeben.


```java
 class Angestellter extends Thread {

	SimpleBank bank;
	int von, nach, betrag;
	
	public Angestellter(SimpleBank bank, int von,
			int nach, int betrag) {
		this.bank = bank;
		this.von = von;
		this.nach = nach;
		this.betrag = betrag;
	}
	
	public void run() {
		// Überweisung vornehmen
		bank.überweisung(von, nach, betrag);
		// Kontostand ausgeben
		System.out.println("Nachher:");
		bank.kontostand();
	}
}
```


#### Das Main Programm 
- vereinbart drei Verweise auf die Klasse Angestellter. Anschließend wird ein SimpleBank-Objekt erzeugt und eine Übersicht über den Anfangsstand der Konten gegeben. 
- Dann werden die drei Thread-Objekte erzeugt. Die Konten werden hierbei so gewählt, dass sich eine ringförmige Überweisung ergibt. Wenn alles ordnungsgemäß verläuft, dann müsste also die Kontenübersicht am Ende genauso aussehen wie am Anfang. 
- Schließlich werden die Threads durch Aufrufe ihrer start()-Methoden gestartet. In Java wird mittel Aufruf der *start*-Methode einer Thread-Klasse die Funtion *run()* in einem neuen Thread gestartet.

```
public class SimpleBankDemo {

	public static void main(String[] args) {
		Angestellter A1, A2, A3;
		SimpleBank b = new SimpleBank();
	
		System.out.println("Vorher:");
		b.kontostand();
	
		// Eine ringförmige Überweisung
		A1 = new Angestellter(b, 0, 1, 20);
		A2 = new Angestellter(b, 1, 2, 20);
		A3 = new Angestellter(b, 2, 0, 20);
	
		A1.start();
		A2.start();
		A3.start();
	}
}
```

Prinzipiell kann das Beispiel ohne Probleme funktionieren. Falls jedoch von beiden Threads zur gleichen Zeit der Kontostand von Konto A erniedrigt werden soll, so kann es vorkommen, dass beide den gleichen Ausgangskontostand lesen, in ihrer temporären Variablen speichern, davon subtrahieren und dann den neuen Wert schreiben. 
Je nachdem, ob der erste oder der zweite Thread beim Schreiben schneller ist, wird der Kontostand von Konto A um 10 oder um 20 erniedrigt. Der korrekte Wert wäre jedoch die Summe der Einzelabbuchungen, also 30, gewesen. Die Ausgabe des Programms sieht so (oder ähnlich) aus:

```
       Vorher:
       Konto 0: 30
       Konto 1: 50
       Konto 2: 100
       Nachher:
       Konto 0: 10
       Konto 1: 70
       Konto 2: 100
       Nachher:
       Konto 0: 10
       Konto 1: 30
       Konto 2: 120
       Nachher:
       Konto 0: 30
       Konto 1: 30
       Konto 2: 80
```

#### Lost-Update-Problem
- Wie man der letzten Kontenübersicht entnehmen kann, sind nach der letzten Überweisung 40 EUR »verschwunden«. 

- Die Ursache des Problems liegt darin, dass der Vorgang der Abbuchung, also das Lesen, Subtrahieren und Schreiben in mehreren Schritten abläuft und so ein zweiter Thread mit einer eigentlich ungültigen Zahl arbeitet. Dieses Verhalten nennt man Race-Condition. 
Generell sind Race-Conditions Programmfehler, die nur manchmal auftreten, nämlich genau dann, wenn zufällig zwei parallele Threads zur gleichen Zeit auf bestimmte Objekte zugreifen. 
Derartige Fehler sind in der Praxis schwer zu lokalisieren. 


- Die Lösung: Sperrsynchronisation mittels Semaphore Um das Problem zu umgehen, sollte es eine Möglichkeit geben, diese Sequenz als unteilbare Operation zu definieren oder den Zugriff auf das Konto während der Operation zu sperren. 

## Sieb des Eratosthenes (c++700)

- Primzahlenberechnung nach dem sog. "Sieb des Eratosthenes".
- Grundprinzip dabei ist, dass jede ungerade Zahl der Reihe nach daraufhin untersucht wird, ob sie Vielfaches einer bereits erkannten Primzahl ist. Wenn das nicht der Fall ist, dann ist sie natürlich prim.
- Die folgende Lösung stellt für *jede Primzahl einen eigenen Thread* zur Verfügung. D.h. wir erhalten eine Reihe von Threads, die als *Member je eine Primzahl* enthalten.
- Der Main-thread 
  - erzeugt die ungeraden Zahlen und 
  - sendet sie dem nächsten Thread in der Reihe. 
- Dieser ist für die Primzahl 3 zuständig und filtert demnach alle Zahlen aus, die Vielfache von 3 sind. D.h. er schickt diese Zahl nicht weiter. 
- Alle anderen Zahlen reicht er an den nächsten Thread weiter, der für die Primzahl 5 zuständig ist, usw. 
- Jeder Thread erzeugt für die erste Zahl, die er weiterreichen muss (das ist die nächste Primzahl!), dynamisch seinen Nachfolger-Thread. 

### Hauptprogramm main.cpp

```c++
#include <thread>
#include <iostream>
#include "fifo.h"

using namespace std;

struct dta {
    int prim;
    dta *next;
};

void prime(int primNum, Fifo *lastQueue, dta *resList) {
    resList->prim = primNum;    // Zahl in Ergebnisliste aufnehmen
    resList->next = new dta;    // Platz fuer naechsten Ergebniswert
    resList->next->next = nullptr;
    Fifo nextQueue(5);          // Schlange zum Wert weiterreichen
    thread *primThread = nullptr;

  // ===== Enter Code here =====
  
    delete primThread;
}

int main() {
    Fifo zahlBuf(50);                   // Fifo-Buffer zum Zahlen Senden
    dta *resList = new dta;             // Liste mit Ergebnissen

    thread primThread(prime, 2, &zahlBuf, resList);

    for (int i = 3; i < 5000; i=i+2) {  // ungerade Zahlen
        zahlBuf.enqueue(i);             // in den Buffer schieben
    }
    zahlBuf.enqueue(-1);                // Saemtliche Zahlen in Buffer gestellt

    primThread.join();                  // Warten bis Berechnung fertig
    while (resList->next != nullptr) {  // Ausgabe Prim-Zahlen
        cout << resList->prim << endl;
        resList = resList->next;
    }

    while (resList != nullptr) {        // Result-Liste Loeschen
        dta *next = resList->next;
        delete resList;
        resList = next;
    }
    return 0;
}
```

### FiFo Buffer

fifo.cpp

```c++
#include "fifo.h"
#include <iostream>

Fifo::Fifo(int size) {
    m_size = size+1;
    m_beg = 0;
    m_end = 0;
    m_queue = new int[m_size];
}
void Fifo::enqueue(int val) {
    unique_lock<mutex> lck(m_mu);
    while (getLevel() == m_size-1) {
        m_cv.wait(lck);
    }
    m_queue[m_end] = val;
    m_end = (m_end+1) % m_size;
    m_cv.notify_all();
}
int Fifo::dequeue() {
    unique_lock<mutex> lck(m_mu);
    while(getLevel() < 1) {
        m_cv.wait(lck);
    }
    int val = m_queue[m_beg];
    m_beg = (m_beg+1) % m_size;
    m_cv.notify_all();
    return val;
}
int Fifo::getLevel() {
    int val = m_end-m_beg;
    if (val < 0) val += m_size;
    return val;
}
```

fifo.h

```c++
#ifndef FIFO_H
#define FIFO_H
#include <mutex>
#include <condition_variable>

using namespace std;

class Fifo {
public:
    Fifo(int size);
    void enqueue(int val);
    int dequeue();
    int getLevel();
private:
    int m_size;
    int m_beg;
    int m_end;
    int *m_queue;
    mutex m_mu;
    condition_variable m_cv;
};

#endif // FIFO_H
```

## RegEx

Ein **regulärer Ausdruck** (englisch **regular expression**, Abkürzung ***RegExp*** oder ***Regex***) ist in der Informatik eine Zeichenkette, die der Beschreibung von Mengen von Zeichenketten mit Hilfe bestimmter syntaktischer Regeln dient.

Reguläre Ausdrücke können uns häufig in (leider oft sehr unterschiedlicher Form) Suchen/Ersetzten Funktionen vor Editoren/Textverarbeitungsprogrammen helfen.

Zum Beispiel ist die folgende Datei aus einem Skriptum kopiert worden:

```c++
1 / *
2 g++ async-wordsearch.cpp -o asynch-wordsearch.exe -lpthread
3 * /
4 #include <deque>
5 #include <fstream>
6 #include <iostream>
7 #include <vector>
8
9 #include <functional>
10 #include <future>
11 #include <regex>
12 using namespace std;
13
14 #include "tlog.h"
15
16 vector<string> find_matches(string pattern, deque<string> &backlog) {
17 vector<string> results;
18
19 while (backlog.size()) {
20 string word = backlog.front();
21 backlog.pop_front(); // remove word from dequeu
22
23 if (regex_match(word.begin(), word.end(), regex(pattern)))
24 results.push_back(word);
25 }
26 return results;
27 }
28
29 int main(int argc, char* argv[]) {
30 TLog::reset();
31
32 cout << TLog::log("BEGIN") << endl;
33 //...
34 ifstream f("input.txt");
35
36 if (!f) {
37 cerr << "Cannot open input.txt in the current directory\n";
38 return -1;
39 }
40 if (argc < 2) {
41 cerr << "Usage: ./wordsearch.exe pattern\n\n"
42 " ... pattern contains lower case letters and periods.\n"
43 " ... The periods will match any character\n"
44 " ... example: ....n\n";
45 return -2;
46 }
47
48 // get pattern
49 string pattern = argv[1];
50
51 // read input.txt
52 string word;
53 deque<string> backlog;
54 while (f >> word) // read word
55 backlog.push_back(word); // store word
56
57 // regex
58 auto f1 = async(launch::async, find_matches, pattern, ref(backlog));
59 auto f2 = async(launch::async, find_matches, pattern, ref(backlog));
60 auto f3 = async(launch::async, find_matches, pattern, ref(backlog));
61 // vector<string> words = find_matches( pattern, backlog );
62
63 vector<string> words1 = f1.get();
64 vector<string> words2 = f2.get();
65 vector<string> words3 = f3.get();
66
67 cout << TLog::log("find_matches() fertig");
68
69 // ausgabe
70 cout << "Found " << words1.size() + words2.size() + words3.size()
71 << " matches for " << pattern << endl;
72 for (auto s : words1)
73 cout << s << "\n";
74
75 for (auto s : words2)
76 cout << s << "\n";
77
78 for (auto s : words3)
79 cout << s << "\n";
80
81 f.close();
82
83 cout << TLog::log("END") << endl;
84
85 return 0;
86 }
```

Im Skriptum wurden Zeilennummern mit angezeigt und werden mit kopiert. Verwenden Sie Notepad++ (oder einen ähnlichen Editor, versuchen Sie WinWord) zum Entfernen der Zeilennummern. Finden Sie einen einzigen *RegEx* zum Entfernen sämtlicher Zeilennummern (http://www.cplusplus.com/reference/regex/ECMAScript/).

Lösung für Word (hilfreich z. B. https://www.lubasch.ch/office/word/word_tipps/word_platzhaltersuche.pdf):

```
Einstellung "Platzhalter verwenden"
Suchstring: "<[0-9]{1;2}>"
```

Eine Lösung für Notepad++:

```
^[0-9]* *
```

Großer Nachteil von *RegEx* (im Allgemeinen): vielfach werden diese *RegEx* abweichend implementiert/interpretiert. Eigentlich ist *RegEx* durch POSIX standardisiert. Besonders schlimm ist die eigene Definition von Microsoft-Word.

![Os_RegExMan](bilder/Os_RegExMan.png)

Beispiel für E-Mail-Adresse (RFC 5322 Official Standard): https://www.regular-expressions.info/email.html

## RegEx-Match (702)

Erstellen Sie ein Programm, welches sämtliche Zeilen von einer Datei in eine Zweite kopiert, wenn ein Regulärer Ausdrücke auf die Zeile zutrifft.

- Verwenden Sie die oben angeführte Datei (cpp-Code mit Zeilennummern)
- Das Programm soll mitgegebene Aufrufparameter an ein *regex_match* weiterreichen

## RegEx-Replace (703)

Erstellen Sie ein Programm, welches sämtliche Zeilen von einer Datei in eine Zweite kopiert und dabei Pattern-Matches ersetzt.

- Verwenden Sie die oben angeführte Datei (cpp-Code mit Zeilennummern)
- Das Programm soll mitgegebene Aufrufparameter an ein *regex_replace* weiterreichen

## Wordsearch

Allgemein

- Programm von http://marknelson.us/2012/05/23/c11-threading-made-easy/
	
- Übung zu STL (deque, vector), regex, async, mutex, ...
	
- Überblick:
  Das zu erstellende Programm *wordsearch.exe* soll eine große Textdatei *input.txt* einlesen und alle Worte aus der Textdatei ausgeben, die einem bestimmten Muster entsprechen (Kommandozeilen-Argument).

- Beispiel:

  ```
  wordsearch.exe ..turn
  Found 3 matches for ..turn
  Saturn
  return
  upturn
  ```

Lösen Sie die Problemstellung zum Beispiel so:

1ter Schritt: Erzeugen einer Beispiel-Datei, Einlesen der Aufrufparameter **wordsearch-read-only.cpp**

2ter Schritt: Erstellen Sie eine sequentielle Version **wordsearch.cpp**

3ter Schritt: Multithreaded Version **async-wordsearch.cpp**

4ter Schritt: Multithreaded mit *mutex* **async-wordsearch-mutex.cpp**

mögliches *makefile*:

```
all:
	g++ wordsearch.cpp -o wordsearch.exe -lpthread
	g++ async-wordsearch.cpp -o async-wordsearch.exe -lpthread
	g++ async-wordsearch-mutex.cpp -o async-wordsearch-mutex.exe -lpthread
run:
	./wordsearch.exe ..turn
	./async-wordsearch.exe ..turn
	./async-wordsearch-mutex.exe ..turn
clean:
	rm *.exe
```

###   1. Ein- und Ausgabe: wordsearch-read-only.cpp

- Erzeugen Sie die Datei *input.txt*. Windows-Benutzer können einen Inhalt etwa laden von: https://users.cs.duke.edu/~ola/ap/linuxwords. Linux: 

   ```
cp /usr/share/dict/words input.txt
   ```

- Lesen Sie die Datei input.txt wortweise ein und speichern die Worte in einer *deque*
  http://www.cplusplus.com/reference/deque/deque/ (`deque<string>`):

   ```c++
deque<string> myDeq;
ifstream fhdl(fileName);
string line;
   ```

while (getline(fhdl, line, '\n')) myDeq.push_back (line);

fhdl.close();
   ```
  
- Geben Sie die Worte aus der *deque* auf die Konsole aus.

- Messen Sie die benötigte Zeit mit der *Timer* Klasse des letzten Abschnitts.

​```c++
#include <deque>
#include <vector>
#include <iostream>
#include <fstream>
using namespace std;

#include "tlog.h"

int main(int argc, char *argv[]) {
  TLog::reset();
  cout << TLog::log("BEGIN") <<endl;

  //...
  ===ENTER CODE=== f("input.txt");

  if (!f) {
    cerr << "Cannot open input.txt in the current directory\n";
    return -1;
  }
  if (argc < 2) {
    cerr << "Usage: ./wordsearch.exe pattern\n\n"
            " ... pattern contains lower case letters and periods.\n"
            " ... The periods will match any character\n"
            " ... example: ....n\n";
    return -2;
  }

  // get pattern
  string pattern= argv[1];

  // read input.txt
  string word;
  deque<string> backlog;
  while (f >> word)          // read word
    backlog.===ENTER CODE===(word); // store word


  cout << TLog::log("Nach dem Einlesen in die deque") <<endl;
  
  // output
  for ( auto s : backlog )
    cout << s << "\n";

  f.close();
  //...
  cout << TLog::log("END") <<endl;

  return 0;
}
   ```

#### regex: Die Funktion find_matches()
Erzeuge die Funktion *find_matches*, die alle Strings im *backlog-deque* (*backlog*), die auf dem Aufruf-Parameter *pattern* passen, in einem *vector\<string\>* zurückgibt.


```c++
vector<string> find_matches( string pattern, deque<string> &backlog ){
    vector<string> results;
    
    while ( backlog.size() ) {
        string word = backlog.front();
        backlog.pop_front();   // remove word from dequeu

        if ( regex_match( word.begin(), word.end(), regex(pattern)) )
            results.push_back( word );
    }
    return results;
}
```

Aufruf von *find_matches*:

```c++
vector<string> words = find_matches( pattern, backlog );
cout << "Found " << words.size() << " matches for " << pattern << endl;

for ( auto s : words )
    cout << s << "\n";
```

Folgender Aufruf muss möglich sein:

```
./wordsearch.exe ..turn
```

geben Sie alle Worte aus, die dem Pattern entsprechen. Also z. B.:

```
Found 2 matches for ..turn
return
upturn
```

#### Hinweise zu den regex-Funktionen

- http://www.cplusplus.com/reference/regex/


- regex_match - Aufruf mit Iteratoren (von Begin nach End):

  ```c++
  // demo-regex.cpp
  //
  // regex_match()
  // liefert true, nur wenn der GESAMTE string dem Muster entspricht.
  //
  // 	g++ demo-regex.cpp -o demo-regex.exe
  #include <regex> 
  #include <iostream> 
  using namespace std;
    
  int main(){ 
  	bool ret;
  		
  	string str = "Hello"; 
  	regex muster("..ll."); 
  
  	ret = regex_match(str.begin(), str.end(), muster);
  	if (ret){
  		cout <<endl;
  		cout <<__FILE__ <<":"<<__LINE__<< " ..."<< endl;
  		cout << "string= " << str <<endl;
  		cout << "muster= " << "..ll." <<endl;
  		cout << "regex_match(str.begin(), str.end(), muster); liefert true" << endl;		
  	}
  	
  	return 0;
  }
  ```

  (`__FILE__ und __LINE__ `  haben nichts mit RegEx zu tun, damit kann lediglich der Programmname und die Zeilennummer ermittelt werden)

- regex_match - Suche in gegebenen String:

  ```c++
  if (std::regex_match ("subject", std::regex("(sub)(.*)") ))
    std::cout << "string literal matched\n";
  ```
  
- Zusatzfunktionen mit regex_search (http://www.cplusplus.com/reference/regex/match_results/suffix/):

  ```c++
  // match_results::prefix/suffix
  // - using smatch, a standard alias of match_results<string::iterator>
  #include <iostream>
  #include <string>
  #include <regex>
  
  int main () {
      std::string s ("there is a needle in this haystack");
      std::smatch m;
      std::regex e ("needle");
  
      std::cout << "searching for needle in [" << s << "]\n";
      std::regex_search ( s, m, e );
  
      if (m.ready()) {
          std::cout << m[0] << " found!\n";
          std::cout << "prefix: [" << m.prefix() << "]\n";
          std::cout << "suffix: [" << m.suffix() << "]\n";
      }
      return 0;
  }
  
  /*
  Output:
  
  searching for needle in [there is a needle in this haystack]
  needle found!
  prefix: [there is a ]
  suffix: [ in this haystack]
  */
  ```


### 2. wordsearch.cpp: mit regex (find_matches())

Sequentielle Variante mit Verwendung von regex:

```c++
#include <deque>
#include <vector>
#include <iostream>
#include <fstream>
using namespace std;

#include <regex>

#include "tlog.h"

vector<string> find_matches( string pattern, deque<string> &backlog ){
  vector<string> results;

  while ( ===ENTER CODE===.size() ) {
    string word = ===ENTER CODE===.front();
    ===ENTER CODE===.pop_front();   // remove word from dequeu

    if ( regex_match( word.begin(), word.end(), regex(pattern) ) )
      results.===ENTER CODE===( word );
  }
  return results;
}

int main(int argc, char *argv[]) {
  TLog::reset();
  cout << TLog::log("BEGIN") <<endl;

  //...
  ifstream f("input.txt");

  if (!f) {
    cerr << "Cannot open input.txt in the current directory\n";
    return -1;
  }
  if (argc < 2) {
    cerr << "Usage: ./wordsearch.exe pattern\n\n"
            " ... pattern contains lower case letters and periods.\n"
            " ... The periods will match any character\n"
            " ... example: ....n\n";
    return -2;
  }

  // get pattern
  string pattern= argv[1];

  // read input.txt
  string word;
  deque<string> backlog;
  while (f >> word)          // read word
    backlog.push_back(word); // store word
  
  // find matches
  vector<string> words = find_matches( pattern, backlog );
  
  cout << "Found " << words.size()
       << " matches for " << pattern
       << endl;
  
  // output
  for ( auto s : ===ENTER CODE=== )
    cout << s << "\n";


  f.close();
  //...
  cout << TLog::log("END") <<endl;

  return 0;
}
```


### 3. Multithreading
Für die Multi-Threaded-Variante werden für den Aufruf von *find_match* der in C++11 vefügbare *async* wrapper verwendet:

```c++
auto f1 = async( launch::async, find_matches, pattern, backlog );
```

Der *return*-Wert von *async* wird *future* genannt. f1 enthält bei der Ausführung dieser Zeile keinen Wert (lediglich ein Versprechen, dass in dieser Variable in der Zukunt ein Wert liegen wird). Mittels *get*-Methode von f1 kann der Wert später ermittelt werden (wenn noch immer nicht da wird gewartet).

```c++
vector<string> words = f1.get(); 
```

#### async-wordsearch.cpp: find_matches () als async-thread
a. Kopieren Sie das obige Programm *wordsearch.cpp* in *async-wordsearch.cpp*

b. Es werden nun 2 Threads mit *find_matches()*-Aufrufen gestartet.

​	Beachten Sie:
  ```
auto f1 = async( launch::async, find_matches, pattern, backlog );
auto f2 = async( launch::async, find_matches, pattern, backlog );
  ```

​	ist zu wenig, weil
   ```
vector<string> find_matches( string pattern, deque<string>& backlog );
   ```
arbeitet mit einer *Referenz auf backlog*.

Es muss darauf geachtet werden, dass beim Aufruf von async die 3 Threads alle auf dem gleichen Datenbestand (*backlog*) arbeiten:

```c++
#include <future>
#include <functional>
...
auto f1 = async( launch::async, find_matches, pattern, ref(backlog) );
auto f2 = async( launch::async, find_matches, pattern, ref(backlog) );

//Die Ergebnisse einsammeln:
vector<string> words1= f1.get();
vector<string> words2= f2.get();
```

Bringen Sie das Programm zum Laufen.

Was können Sie feststellen?

```c++
#include <deque>
#include <fstream>
#include <iostream>
#include <vector>

#include <functional>
#include <future>
#include <regex>
using namespace std;

#include "tlog.h"

vector<string> find_matches(string pattern, deque<string> &backlog) {
  vector<string> results;

  while (backlog.size()) {
    string word = backlog.front();
    backlog.pop_front(); // remove word from dequeu

    if (regex_match(word.begin(), word.end(), regex(pattern)))
      results.push_back(word);
  }
  return results;
}

int main(int argc, char *argv[]) {
 
  TLog::reset();
  cout << TLog::log("BEGIN") << endl;
  //...
  ifstream f("input.txt");

  if (!f) {
    cerr << "Cannot open input.txt in the current directory\n";
    return -1;
  }
  if (argc < 2) {
    cerr << "Usage: ./wordsearch.exe pattern\n\n"
            " ... pattern contains lower case letters and periods.\n"
            " ... The periods will match any character\n"
            " ... example: ....n\n";
    return -2;
  }

  // get pattern
  string pattern = argv[1];

  // read input.txt
  string word;
  deque<string> backlog;
  while (f >> word)          // read word
    backlog.push_back(word); // store word

  // regex
  auto f1 = async(===ENTER CODE===, find_matches, pattern, ref(backlog));
  auto f2 = async(===ENTER CODE===, find_matches, pattern, ref(backlog));
  auto f3 = async(===ENTER CODE===, find_matches, pattern, ref(backlog));
  //  vector<string> words = find_matches( pattern, backlog );

  vector<string> words1 = ===ENTER CODE===;
  vector<string> words2 = ===ENTER CODE===;
  vector<string> words3 = ===ENTER CODE===;

  cout << TLog::log("find_matches() fertig")<<endl;

  // ausgabe
  cout << "Found " << words1.size() + words2.size() + words3.size()
       << " matches for " << pattern << endl;
  for (auto s : words1)
    cout << s << "\n";

  for (auto s : words2)
    cout << s << "\n";

  for (auto s : words3)
    cout << s << "\n";

  f.close();

  cout << TLog::log("END") << endl;

  return 0;
}
```

### 4. async-wordsearch-mutex.cpp: mutex verwenden
Das vorherige Programm stürzt ab, weil Objekte aus der STL wie *deque* nicht *Thread-Safe* sind.

a. Kopieren Sie *async-wordsearch.cpp* nach *async-wordsearch-mutex.cpp*.

b. Mutex verwenden, um den Zugriff auf *deque* zu synchronisieren, sodass zu einer Zeit immer (garantiert) nur ein Thread *deque* verwenden kann. (Sperrsynchronisation).

c. Beispiel:

```c++
//...
vector<string> find_matches( string pattern, deque<string> &backlog ){
  vector<string> results;
  for ( ; ; ) {
		// EINTRITT in Critical Section.........................
    mutex_sperr.lock();
    if ( backlog.size() == 0 ) {
      mutex_sperr.unlock();
      return results;
    }
    string word = backlog.front();
    backlog.pop_front();
		// AUSTRITT aus Critical Section.........................
    mutex_sperr.unlock(); 
    if ( regex_match( word.begin(), word.end(), regex(pattern) ) )
      results.push_back( word );
  }
}
//...
```

Das Programm sollte nun funktionieren. Machen Sie einige Versuche.

```
./async-wordsearch-mutex.exe ..turn
./async-wordsearch-mutex.exe .e
```

Lösung:

```c++
#include <deque>
#include <fstream>
#include <iostream>
#include <vector>

#include <functional>
#include <future>
#include <regex>
using namespace std;

#include "tlog.h"

// alte Version
// vector<string> find_matches( string pattern, deque<string> &backlog ){
//   vector<string> results;

//   while ( backlog.size() ) {
//     string word = backlog.front();
//     backlog.pop_front();   // remove word from dequeu

//     if ( regex_match( word.begin(), word.end(), regex(pattern) ) )
//       results.push_back( word );
//   }
//   return results;
// }

#include <mutex>

mutex ===ENTER CODE===;

vector<string> find_matches(string pattern, deque<string> &backlog) {
  vector<string> results;
  for (;;) {
    // EINTRITT in Critical Section.........................
===ENTER CODE===
    if (backlog.size() == 0) {
      ===ENTER CODE===.unlock();
      return results;
    }
    string word = backlog.front();
    backlog.pop_front();
    // AUSTRITT aus Critical Section.........................
===ENTER CODE===
    if (regex_match(word.begin(), word.end(), regex(pattern)))
      results.push_back(word);
  }
}

int main(int argc, char *argv[]) {

  TLog::reset();
  cout << TLog::log("BEGIN") << endl;

  ifstream f("input.txt");

  if (!f) {
    cerr << "Cannot open input.txt in the current directory\n";
    return -1;
  }
  if (argc < 2) {
    cerr << "Usage: ./wordsearch.exe pattern\n\n"
            " ... pattern contains lower case letters and periods.\n"
            " ... The periods will match any character\n"
            " ... example: ....n\n";
    return -2;
  }

  // get pattern
  string pattern = argv[1];

  // read input.txt
  string word;
  deque<string> backlog;
  while (f >> word)          // read word
    backlog.push_back(word); // store word

  auto f1 = async(launch::async, find_matches, pattern, ref(backlog));
  auto f2 = async(launch::async, find_matches, pattern, ref(backlog));
  //  auto f3 = async( launch::async, find_matches, pattern, ref(backlog) );

  vector<string> words1 = f1.get();
  vector<string> words2 = f2.get();
  // vector<string> words3= f3.get();

  cout << TLog::log("find_matches() fertig")<<endl;

  cout << "Found " << words1.size() + words2.size() //+words3.size()
       << " matches for " << pattern << endl;
  for (auto s : words1)
    cout << s << "\n";

  for (auto s : words2)
    cout << s << "\n";

  // for ( auto s : words3 )
  //  cout << s << "\n";

  f.close();

  cout << TLog::log("END") << endl;
  return 0;
}
```

Vergleiche mit dem UNIX-Standardprogramm grep:

```
grep "^.e$" input.txt|sort
./async-wordsearch-mutex.exe .e 2> /dev/null | grep -v "Found.*" |sort

Der folgende Aufruf zeigt, dass unser Programm den gleichen Output
liefert wie grep:

./async-wordsearch-mutex.exe .e 2> /dev/null | grep -v "Found.*" |sort | diff - <(grep "^.e$" input.txt|sort)
```

## Java-Producer-Worker (j700)

In Java gibt es etwa `BlockingQueue`s aus `java.util.concurrent` für den Austausch von Daten.

- Start eines Producer und Consumer Threads
- Der Producer füllt die Queue mit Strings, am Ende wird der String *exit* eingefügt
- Der Consumer entnimmt Elemente aus der Queue und gibt sie in der Konsole aus

Hauptprogramm:

```java
public static void main(String[] args) {
    //Creating BlockingQueue of size 10
    BlockingQueue<Message> queue = new ArrayBlockingQueue<>(10);
    Producer producer = new Producer(queue);
    Consumer consumer = new Consumer(queue);
    //starting producer to produce messages in queue
    new Thread(producer).start();
    //starting consumer to consume messages from queue
    new Thread(consumer).start();
    System.out.println("Producer and Consumer has been started");
}
```

Für die Queue wird ein einfacher String verwendet:

```java
public class Message {
    private String msg;
    public Message(String str){
        this.msg=str;
    }
    public String getMsg() {
        return msg;
    }
}
```

Der Producer fügt Elemente in die Queue ein mittels `queue.put()`:

```java
public class Producer implements Runnable {
    private BlockingQueue<Message> queue;

    public Producer(BlockingQueue<Message> q){
        this.queue=q;
    }
    @Override public void run() {
        //produce messages
        for(int i=0; i<100; i++){
            Message msg = new Message(""+i);
            try {
                Thread.sleep(i);
                queue.put(msg);
                System.out.println("Produced "+msg.getMsg());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        //adding exit message
        Message msg = new Message("exit");
        try {
            queue.put(msg);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```

Der Consumer entnimmt Elemente aus der Queue mittels `queue.take()`:

```java
public class Consumer implements Runnable{
    private BlockingQueue<Message> queue;

    public Consumer(BlockingQueue<Message> q){
        this.queue=q;
    }

    @Override
    public void run() {
        try{
            Message msg;
            //consuming messages until exit message is received
            while((msg = queue.take()).getMsg() !="exit"){
                Thread.sleep(10);
                System.out.println("Consumed "+msg.getMsg());
            }
        }catch(InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```

die Funktion `queue.take()` blockiert bis ein Element in der Queue verfügbar ist.

## Referenzen

- Sehr gut lesbares, deutsches Java-Skriptum
  http://ssw.jku.at/Teaching/Lectures/Sem/2003/reports/Brueckl/Brueckl.pdf