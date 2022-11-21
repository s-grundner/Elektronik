# 3 Streams - Übungen

## Wort-Zähler (018)

Mittels *StringStream* sind Worte in einem String zu Zählen:

Beispielhafte Ausgabe:

```
Input-String:     "I have a Dream"
Anzahl der Worte: 4
```

Lösen Sie die Anforderung mittels

- eigenen Funktion `int countWords(string inStr)`
- Stringstream *istringstream*

Tipp: Lesen Aus einem Stream wird jeweils mit einem *Whitespace* getrennt.

## Zahlen-Konverter (019)

Ergänzen Sie die Funktion *getConv* zum Konvertieren von dezimalen Zahlen in die hexadezimale und oktale Entsprechung (mittels Stream).

```c++
#include <iomanip>      // setw

string getConv(int num);

int main() {
    int num;
    cout << "Geben Sie eine dezimale Zahl ein: ";
    cin >> num;

    cout << getConv(num) << endl;
    return 0;
}

string getConv(int num) {

  
}
```

Eine Ausgabe soll beispielhaft so aussehen:

```
Geben Sie eine dezimale Zahl ein: 1234
 Dez-Num =       1234
 Hex-Num =        4d2
 Oct-Num =       2322
```

Tipps:

- ` << setw(10) << ` hält für die folgende Ausgabe 10 Zeichen Platz bereit
- ` << hex << ` konvertiert die folgende Ausgabe in eine hexadezimale Zahl (analog mit oktalen Zahlen)

## Gesamtpreis (020)

Mittels der Funktion *getline()* kann eine String von der Tastatur eingelesen werden:

```c++
string str;
getline(cin, str);
```

Durch *Stringstreams* kann ein numerische String einfach in entsprechend andere Typen konvertiert werden:

```c++
str = "12";
int num;
stringstream(str) >> num;
```

Schreiben Sie mithilfe dieser Funktionen ein Programm zur Berechnung eines Gesamtpreises. Die Ausgabe soll so Aussehen:

```
Geben Sie die Menge ein: 12
Geben Sie den Preis ein: 15.20
Gesamtpreis            : 182.4
```

## Datei Lesen (021)

Lesen Sie den Inhalt der Datei *myfile.txt* ein und geben sie den Inhalt in der Konsole aus.

```c++
fstream fhdl;
// open
string str;
...
fhdl >> str;
...
// close
```

## Datei Schreiben (022)

Schreiben Sie die Zahlen 1..100 in die Datei *myfile.txt*.

```c++
fstream fhdl;
// open
...
fhdl << num;
...
// close
```

## TelBook (017)

Für ein Telefonbuch ist eine Struktur TPerson mit den Elementen vName, nName und telNr (int) zu erstellen. In dieses Element sind von der Tastatur solange Namen einzulesen bis ein leerer Name eingegeben wird. Das Array das die Personen beinhaltet wird in die binäre Datei "privat.tel" Gespeichert. Anschließend wird der Inhalt des Telefonbuchs ausgegeben (aus der Datei gelesen) und das Programm beendet. Bei erneutem Ausführen des Programms werden die eingegebenen Namen an die bestehende Datei angehängt.

## KonvSQL (024)

In einer SQL-Datei sollen:

- zwei Spalten in der Reihenfolge verändert werden. Dadurch sollen Zeilen die so aussehen:

   ```
   INSERT INTO pruefen(MatrNr, VorlNr, ProfNr, Note, Datum) VALUES (25403, 5041, 2125, 2.0, '2011-04-12');
   ```
   
   in diese Form verändert werden:

   ```
   INSERT INTO pruefen(MatrNr, ProfNr, VorlNr, Datum, Note) VALUES (25403, 2125, 5041, '2011-04-12', 2.0);
   ```
   
   Das betrifft genau die Zeilen die mit "INSERT INTO pruefen" beginnen (Groß-/Kleinschreibung soll keine Rolle spielen - Qt::CaseInsensitive), unabhängig davon ob darin mehr oder weniger Leerzeichen/Tabulatoren zu finden sind.
   
- Tabulatoren sind durch ein einzelnes Leerzeichen zu ersetzen

- In der gesamten Datei sollen nach jedem Beistrich genau ein Leerzeichen stehen und davor keines:

   `abc,     def` -> `abc, def`
   `abc,def` -> `abc, def`

   `abc ,def` -> `abc, def`

Testdatei:

```
DELETE FROM `Professoren`;	
		  
INSERT INTO Studenten(MatrNr, GName , Semester, GebDatum) VALUES (24002, 'Xenokrates', 18,  		'1970-12-13'); 
INSERT INTO Studenten(MatrNr, 	GName , Semester, GebDatum) VALUES (25403, 'Jonas', 12, '1969-05-10'  ); 
INSERT	 INTO Studenten(MatrNr, GName , Semester, GebDatum) VALUES (26120, 'Fichte', 10, '1940-12-13'  ); 

INSERT  INTO Professoren(PersNr, GName,  	Rang, Raum, GebDatum) VALUES (2125, 'Sokrates', 'c4', 226, '1940-12-13'  ); 
INSERT INTO Professoren(PersNr, GName,	Rang, Raum, GebDatum) VALUES (2126, 'Russel', 'c4', 232, '1942-12-13'  );  
 
INSERT INTO    Assistenten(PersNr, GName, Fachgebiet, ProfNr, GebDatum) VALUES (3002, 'Platon', 'Ideenlehre', 2125, '1960-12-13'  ); 
INSERT INTO Assistenten(PersNr, GName, Fachgebiet, ProfNr, GebDatum) VALUES (3003, 'Aristoteles', 'Syllogistik', 2125, '1962-12-13'  ); 
INSERT INTO Assistenten(PersNr, GName, Fachgebiet, ProfNr, GebDatum) VALUES (3004, 'Wittgenstein', 'Sprachtheorie', 2126, '1961-12-24'  ); 
 
INSERT INTO Vorlesungen(VorlNr, VTitel, Sws, ProfNr) VALUES (5001, 'Grundzüge', 4, 2137);
INSERT INTO Vorlesungen(VorlNr, VTitel, Sws, ProfNr) VALUES (5041, 'Ethik', 4, 2125);

INSERT INTO hoeren(VorlNr, MatrNr) VALUES (5041, 26120);
INSERT INTO hoeren(VorlNr, MatrNr) VALUES (4052, 26120);

INSERT	INTO  pruefen(MatrNr , VorlNr, ProfNr, Note, Datum) VALUES (28106, 5001, 2126, 1.0, '2010-03-17');
INSERT INTO  pruefen(MatrNr, VorlNr, ProfNr, Note, Datum) VALUES (25403, 5041, 2125, 2.0, '2011-04-12');

INSERT INTO voraussetzen(VorlNr, 	VorausS) VALUES (4002, 4001);

-- Fehlerhaft:
INSERT INTO pruefen(MatrNr, VorlNr, ProfNr, Note, Datum) VALUES (29120, 4003, 2138, 4.0, '2011-04-11');
```

