# Zeiger - Übungen

##  Swap (096)

Erstellen Sie eine Funktion zum Vertauschen von zwei int-Werten swap(). Die Werte von den beiden Variablen x und y sollen innerhalb einer Funktion vertauscht werden. Dafür müssen zwei Werte aus der Funktion zurückgegeben werden --> Call-by-Reference.

L:

```c
void swap (int* , int* );

int main(){
    int x = 1111;
    int y = 9999;

    printf("\nVor dem Aufruf von swap(): x=%d und y=%d\n", x,y);
    swap (&x, &y);
    printf("\nNach dem Aufruf von swap(): x=%d und y=%d\n", x,y);
    return 0;
}

void swap (int* a, int* b){
    int help;
    help = *a;
    *a = *b;
    *b = help;
}
```

##  Ausgabe (097)

Geben SIe Zeigervariablen (Adressen) mittels %p und %x aus und vergleichen das Ergebnis.

L:

```c
int main() {
    int i = 0xFF;
    int *ptr = &i;
    printf("Adresse = %X Adresse = %p, Wert = %d", ptr, ptr, *ptr);
    return 0;
}
```

%p gibt Adressen in einem klar definierten Format aus: hexadezimal und immer genauso lange wie die Adresse sein kann (inkl. führender Nullen).

##  Strcpy (098)

Erstellen Sie eine Funktion zum Kopieren einer Zeichenkette in eine zweite (siehe Bibliotheksversion strcpy()). Wichtig: Zielzeichenkette muss groß genug sein.

##  Strncpy (099)

Erstellen Sie eine Funktion strncpy() zum Kopieren eines char-Felds in ein Zweites unter Angabe der Anzahl der Zeichen.

## Strcmp (100)

Erstellen Sie eine Funktion strcmp() zum Vergleichen zweier Zeichenketten. Bei Gleichheit soll die Funktion 0 zurückgeben, wenn das erste Zeichenkette kleiner ist, dann soll eine negative Zahl mit der char-Differenz zurückgegeben werden. Wenn das erste Zeichenkette größer ist, dann soll eine positive Zahl mit der char-Differenz zurückgegeben werden. Der Vergleich soll erfolgen bis in der ersten Zeichenkette ein \0 kommt.

## Strncmp (101)
Erstellen Sie eine Funktion strncmp() zum Vergleichen zweier Zeichenketten. Bei Gleichheit soll die Funktion 0 zurückgeben, wenn das erste Zeichenkette kleiner ist, dann soll eine negative Zahl mit der char-Differenz zurückgegeben werden. Wenn das erste Zeichenkette größer ist, dann soll eine positive Zahl mit der char-Differenz zurückgegeben werden. Die Anzahl der Zeichen die verglichen werden sollen, soll mit einem Parameter angegeben werden.

## Strcat (102)
Zeichenkette anhängen. Die Zielzeichenkette muss groß genug definiert sein um die resultierende Zeichenkette aufzunehmen.

## Strncat (103)
Zeichenkette anhängen mit Angabe wieviele Zeichen maximal angehängt werden dürfen. Die Zielzeichenkette muss groß genug definiert sein um die resultierende Zeichenkette aufzunehmen.

## Strlen (104)
Bestimmung der Länge einer Zeichenkette. Das Ende einer Zeichenkette kann erkannt werden durch ein EOS-Zeichen ('\0').

##  FeldMinMax (105)

Die Funktion find_max_min_pos() soll von einem Integer-Array die Position des Maximums und die Position des Minimums liefern. Mit einem herkömmlichen return kann man ja nur einen Wert zurückgeben. Zur Lösung muss daher eine Call-by-Reference Funktion.

##  TextData (106)

Gegeben sei ein Text, der das Zeichen '=' enthält. (Beispiel "nachname=meier").

Schreiben Sie die **Funktion cgi()**, die als Input (Funktionsparameter) den Text bekommt und folgende Informationen zurück gibt:

- Adresse des Zeichens '='
- Anzahl der Zeichen vor dem '=' Zeichen
- Anzahl der Zeichen nach dem '=' Zeichen

 Erstellen Sie:

- Entwerfen Sie einen Prototyp/Funktionsdeklaration für die Funktion cgi()
- Programmieren Sie die Funktion cgi()
- Erstellen Sie ein kleines Testprogramm

##  CharReplace (107)

Schreiben Sie ein Testprogramm und die **Funktion mystr_ersetze()**. Sie soll als Input einen Text und ein durch ein zweites Zeichen zu ersetzendes Zeichen bekommen und folgendes zurückgeben:

- Anzahl der ersetzten Zeichen und
- Die Adresse des Textes.

(also 2 Rückgabewerte -> call-by-reference)

Prototyp: **char\* mystr_ersetze(char \*s, char old, char new, int \*anzahl);**

(anzahl wird mittels call-by-reference übergeben)

Erstellen Sie: 

- Erstellen Sie ein kleines Testprogramm und
- programmieren Sie die Funktion mystr_ersetze aus.

##  DynSpeicher (108)

Über eine Tastatureingabe sollen solange Zahlen eingelesen werden bis 99 eingegeben wird. Die Zahlen sollen in ein dynamisches Feld gespeichert werden. Zu Beginn soll das Feld 10 Elemente haben. Wenn die 5te Zahl eingegeben wird, dann soll das Feld um 5 Elemente vergrößert werden. Bei Eingabe des 10ten Elements soll das Feld wieder um 5 Elemente vergrößert werden und so fort.

Am Programmende soll das Feld in der Konsole ausgegeben werden.

Geben Sie den Speicher vor Programmende wieder frei.

```c
int main() {
    int num;
    int i = 0;
    int *ptr = (int *) malloc(sizeof(int));

    printf("Geben Sie Ganzzahlen ein. Um die Eingabe zu beenden geben Sie 99 ein.\n\n");
    do {
        if ((i % 5) == 0)                    // immer nur max. 5 Werte in Reserve halten
            ptr = (int *) realloc(ptr, (i + 5) * sizeof(int) );
        scanf("%d", &num);                   // Wert einlesen
        if (num != 99) ptr[i++] = num;     	 // in Array speichern und Index erhöhen
    } while (num != 99);
    printf("\nEingegeben wurde:\n");
    for (i--;i >= 0; i--) {
        printf("%d ",ptr[i]);
    }
    printf("\n");
    free(ptr);
    return 0;
}
```

##  Kommandozeile (109)

Erstellen Sie ein Programm zum addieren/subtrahieren/dividieren/multiplizieren von zwei Zahlen. Die Berechnung soll in der Kommandozeile folgende Eingaben ermöglichen:

`rechne.exe 3 + 4`,  `rechne.exe 2.5 - 7.9`,  `rechne.exe 2.5 x 7.9`  und  `rechne.exe 2.5 / 7.9`

##  CallArg (110)

Zeigen Sie sämtliche Aufrufparameter des Programms in der Kommandozeile an.

##  Dynamischer Speicher (111)

Erstellen Sie eine Funktion store() zum Speichern von Int-Zahlen in einem dynamischen Speicherbereich:

- Beim Programmstart ist der Speicher 0 Plätze groß
- Wird eine Zahl eingegeben, dann wird die Zahl auf einem Platz im dynamischen Speicher abgelegt
- Wenn nicht genug Platz im Speicher ist, dann wird er um 3 Plätze vergrößert

Hauptprogramm:

- Einlesen von Int-Zahlen und ablegen im Speicher mit store()
- Beenden der Zahleneingabe mit Eingabe von „-1“
- Abschließend Ausgabe des Speicherinhalts

Beispielausgabe:

Eingabe von Daten, Ende mit "-1":
1
2
3
4
5
6
7
8
-1

Inhalt dyn. Speicher: [1, 2, 3, 4, 5, 6, 7, 8]

 

Verschieben Sie die Funktion store in ein eigenes Modul store.c/store.h

Allgemein: Die Funktion `ptr = realloc(ptr, size)` passt die Größe eines Speichers so an, dass er dann die Größe size-Bytes hat.

##  Higher/Lower (112)

Implementieren Sie ein Spiel HigherLower welches eine Zufällige Zahl zwischen 1 und 1000 generiert. Der Benutzer soll dann mit 10 Versuchen die richtige Zahl erraten. Das Spiel sagt dem Benutzer nach jedem Raten ob die gesuchte Zahl höher oder tiefer als sein Tipp ist. Das Spiel soll dann je nach Anzahl benötigter Versuche einen Wert zurück geben. Denken Sie daran, dass ein höherer Wert zurück gegeben wird, wenn der Spieler seine Sache gut macht.

Beispiel-Ausgabe:

```
Ihr Tipp: 3
1. Tipp zu niedrig
Ihr Tipp: 800
2. Tipp zu hoch
Ihr Tipp: 697
3. Tipp 697 ist Richtig! Sie gewinnen 800 Punkte!
```

##  Siebzehn Und Vier (113)

Implementieren Sie das Spiel Siebzehn und Vier (Black Jack). Mischen Sie dazu 6 Pakete französischer Spielkarten zu 52 Blatt. Ziel des Spiels ist es mit zwei oder mehr Karten so nahe wie möglich an 21 Punkte heran zu kommen, diesen Wert aber nicht zu überschreiten. Das Spiel verläuft in Runden und eine Runde besteht aus folgenden Schritten:

1. Zu Beginn einer Runde entscheidet der Spieler wieviel er für diese Runde einsetzen will.
2. Der Spieler und der Croupier erhalten je eine offene Karte. Der Spieler erhält zusätzlich noch eine zweite Karte.
3. Der Spieler kann nun beliebig oft eine nächste Karte verlangen.
4. Will der Spieler keine weitere Karte mehr ist der Croupier an der Reihe. Der Croupier zieht genau solange eine Karte wie er weniger als 17 Punkte hat.
5. Hat entweder der Croupier oder der Spieler den Wert 21 überschritten hat er sofort verloren. Ist der Croupier näher an 21 hat der Spieler verloren. Erreichen beide die gleiche Anzahl Punkte ist es ein Unentschieden.
    Dabei werden die Punkte wie folgt gezählt:
  - Augenkarten zählen entsprechend ihrer Augen. 
  - Bildkarten (Bube, Dame und König) zählen zehn Punkte. 
  - Ein Ass zählt nach Belieben ein oder elf Punkte, der Wert des Asses wird zu Ende der Runde vom Spieler gewählt. Für den Croupier gilt das Ass als elf Punkte, ausser er würde sich dabei überkaufen.
6. Hat der Spieler verloren, geht sein Einsatz an die Bank. Bei einem Unentschieden erhält der Spieler seinen Einsatz zurück. Hat der Spieler gewonnen, erhält er den doppelten Einsatz zurück. Im Falle eines Black Jacks (Ass und Bildkarte) erhält der Spieler zweieinhalb mal seinen Einsatz ausbezahlt.
7. Nach dem Auszahlen des Gewinns beginnt die nächste Runde.

Beispiel-Ausgabe:

```
Ihr Punktestand: 350
Ihr Einsatz: 100
Bank				Spieler
				    Pik Bube
Karo 10				Herz 5			Stand 10-15 Neue Karte? j
    				Treff 4			Stand 10-19 Neue Karte? n
Pik 6				     			Stand 16-19
Treff 6				     			Stand 22-19
Sie haben gewonnen.
Ihr Punktestand: 550
Wollen Sie weiterspielen? j
```

##  Casino (114)

Schreiben Sie ein Casino-Programm, dass eine Auswahl von Spielen (Hangman, 17und4, HigherLower, Rolett) ermöglicht. Bei Auswahl wird in das entsprechende Spiel verzweigt. Passen Sie die Spiele so an, dass ein Gewinn von einem Spiel in ein anderes mitgenommen werden kann.

##  Schriftarten (115)

Schreiben Sie ein Programm das einen einzugebenden Text in einem anderen (ASCII-Art-) Font darstellt. Wählen sie dazu einen von http://www.jave.de/figlet/fonts.html aus.

Beispiel-Ausgabe:

```
Geben Sie einen Text ein: The Quick
ASCII-Art-Font:
_______  _    _   ______    ______    _    _  _____  ______  _    __  
  | |   | |  | | | |       / | _| \  | |  | |  | |  | |     | |  / /  
  | |   | |--| | | |----   | | \  |  | |  | |  | |  | |     | |-< <   
  |_|   |_|  |_| |_|____   \_|__|__\ \_|__|_| _|_|_ |_|____ |_|  \_\  
```

##  4Gewinnt (116)

Schreiben Sie ein 4-Gewinnt-Programm für zwei Spieler:

```
  1   2   3   4   5   6   7
|   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |
|   |   |   |   |   |   |   |
|   | O |   |   |   |   |   |
|   | X | X |   |   |   |   |
|   | O | O | X | O |   |   |
Spieler X:
```

Abwechselnd setzen zwei Spieler einen Stein in eine der Reihen.  Als Eingabe ist eine Ziffer zwischen 1 und 7 einzulesen. Daraufhin wird für einen der Spieler automatisch ein X gesetzt für den zweiten der Spieler ein O. Wann immer einer der Spieler 4 Steine in einer Reihe (waagrecht, senkrecht oder diagonal) platzieren konnte wird das Spiel beendet.

Verbesserung: Merken Sie sich die Abfolge der Züge und bieten ein zurücknehmen von Zügen an.

## Fragen

1. Was gibt folgendes Programm aus:

   ```c
   int main(){
       int x=5;	
       int *ptr;    // Zeigervariable
       ptr= &x;	// Zeigervariable erhält die Adresse der Variablen x
       printf("Die Adresse von x ist %p \n",ptr);
       printf("Die Variable x hat den Wert %i \n", *ptr);
       *ptr= 17;	// mittels der Zeigervariablen den Wert von x ändern
       printf("x hat den Wert %i \n", *ptr);		
       printf("x hat den Wert %i \n", x); 
       return 0;
   }
   ```

   L:

   

2. Was gibt folgendes Programm aus:

   ```c
   ...
   int *ptr;
   int var;

   ptr=&var;       //ptr bekommt die Adresse von var

   *ptr=100;     //var bekommt den Wert 100 zugewiesen
   *ptr= *ptr+100; //var hat jetzt den Wert 200

   printf("%i-", *ptr);    //gibt Wert von var aus
   printf("%p-", &ptr);    //gibt Adresse von ptr aus
   printf("%p-", ptr);      //gibt Adresse von var aus
   ```

   L:

   

3. Kann man statt `ptr = &element[0]`
   auch schreiben: `ptr = element;`?

    L:

   

4. Was gibt folgendes Programm aus:

   ```c
   int main(){
       int i;
       int element[8] = {1,2,4,8,16,32,64,128};
       int *ptr;
       ptr = &element[0];
       printf("Adresse=%p :Wert=%i\n", ptr+1, *(ptr+1));
       printf("Adresse=%p :Wert=%i\n", &ptr[1], ptr[1]);
       printf("\nJetzt alle zusammen : \n");
       for(i=0; i<8; i++)
           printf("element[%i]=%i\n",i, *(ptr+i) );
       return 0;
   }
   ```

   L:

   

5. Worin liegt der Unterschied zwischen:
   `*ptr + 2` und `*(ptr+2)`?
   L:

   

   

6. Was passiert wenn man einen Zeiger inkrementiert?

   ```c
   int element[8] = {1,2,4,8,16,32,64,128};
   int *ptr;
   ptr = &element[0];
   ptr++;
   ptr = ptr + 2;
   ```

   bzw.

   ```c
   ptr = ptr - 2;
   ptr--;
   ```

   L: 

   