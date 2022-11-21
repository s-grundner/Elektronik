# Strukturen - Übungen

### tperson (1000)

- Definieren Sie den Strukturtyp *TPERSON* mit den Elementen Personalnummer (persnrs) und Personalname (name).

- Erstellen Sie ein Array namens *wir* mit 5 Elementen vom Typ *TPERSON*.

- Lesen Sie von der Tastatur Werte in das Array oder verwenden Sie `./t_person.exe < personen.txt`

- Geben Sie das Array auf den Bildschirm aus.

	 Nach dem Einlesen kann nach einer Person gesucht werden.  	

  Der Benutzer wird nach einem Namen gefragt und anschließend wird folgende Funktion aufgerufen:

` TPERSON* suche(char* name, TPERSON* alle, int anzahl);`

 Das folg. Programmfragment soll die Verwendung zeigen:

 ...

```c
int main(){
 	TPERSON wir[5];
 	TPERSON* p;
 	char eingabe[128];
 	...
 	//einlesen
 	...
	// nach dem Namen fragen
	printf("Name: ");
 	scanf("%s", eingabe);
	// suche nach dem richtigen Element
 	**p= suche (eingabe, wir, 5);**	if(NULL==p){
 		....
 	}
 	else {
 		....
 	}
 	...
```

### StrucSpeicher (1001)

Untersuchen Sie folgendes Beispiel auf den Speicherbedarf:

```c
struct {
    unsigned char El1;
    int El2;
    char El3[5];
    int El4;
} r;

r.El1 = 0xFA;
r.El2 = 0xBBBBBBBB;
strcpy(r.El3,"AAAAAA");
r.El4 = 0xCCCCCCCC;
```

(Das Beispiel ist abhängig vom verwendeten Compiler)

Wieviel Speicher wird von der Struktur r belegt? Liegen die Struktur-Elemente im Speicher direkt hintereinander? 

### Termine (1002)

Es ist ein Kalender zu implementieren. Das bedeutet, dass Temen in ein Feld gespeichert werden sollen unter Angabe eines Start- und Enddatums. Zum Beispiel:

```c
5 
12.12.2000 13.12.2000 C Programme aus c-zeiger/02-ueben programmiert. 
12.01.2001 13.01.2001 TODO: C Programme aus c-strukturen/02-ueben programmieren. 
22.01.2001 23.01.2001 C von A-Z lesen 
25.02.2001 28.02.2001 Mathematik Hausuebungen fertigstellen. 
01.03.2001 05.03.2001 TODO: C Dateiumlenkung wiederholen. 
```

Gesucht ist ein Programm mit Hilfe dessen ein Termin eingelesen werden kann und in einem (genügend großen) Feld abgelegt wird.

### Das BeispWorteZaehlen (1002)

Der Inhalt einer beliebigen Textdatei soll hinsichtlich der Häufigkeit der verwendeten Worte analysiert werden. 
Verwenden Sie zum Zählen ein großes Array (z.B. 5000 Elemente) vom folgenden Typ 

```c
struct WordCount { 
    char word[20]; 
    int count;
};
```

Nach dem Programmstart:
`./worthaeufigkeit.exe < daten.txt`

soll zeilenweise eingelesen werden. Die Zerlegung einer Zeile in einzelne Worte soll mit der Funktion `zerlegeInWorte` aus der vorherigen Aufgabe geschehen. 
Suchen Sie dann im Array, ob dieses Wort schon vorkommt. Falls dies der Fall ist, so wird der Wortzähler erhöht, ansonsten wird dieses Wort ans Ende der bisherigen Liste angehängt. Konvertieren Sie alle Wörter in Groß- oder Kleinbuchstaben, um eine Trefferstreuung durch Groß-/ Kleinschreibung zu vermeiden. 
Achten Sie darauf, dass Ihr Programm auch dann noch sinnvoll weiterarbeitet, wenn angenommene Dimensionierungen nicht ausreichen sollten (max. Wortlänge = 20 Zeichen, max. Anzahl unterschiedlicher Wörter=5000) 
Nach vollständigem Einlesen, sind dann die 20 am häufigsten verwendeten Wörter zusammen mit ihrer Häufigkeit auszugeben.

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

   