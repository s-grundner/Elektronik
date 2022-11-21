# 7 Arrays - Übungen

1. Es soll ein Array angelegt werde mit 5 Vornamen. Anschließend soll der Inhalt des Arrays in der Konsole ausgegeben werden und die "Adresse" unter der das Array abgelegt wird.
   
2. Es soll ein Array angelegt werde mit 5 Vornamen. Anschließend soll der Inhalt des Arrays in ein anderes Array kopiert werden.

   

3. Es sollen 100 Zufallszahlen abgespeichert werden. Jede der Zufallszahlen soll einen ganzzahligen Wertebereich 0 - 50 haben.
   Tipp: `Math.random()` liefert eine double-Zufallszahl zwischen 0.0 und 1.0

   

4. Aus einem 100 Elemente großen Zahlen-Array (Zufallszahlen 0 .. 10) sollen sämtliche Indizes des Arrays ermittelt werden an dem eine 3 steht (in ein zweites Array Schreiben).

   

5. Ermittle die größte Zahl aus einem Zufallszahlen-Array (Wert und Index)

   

6. Ermittle die kleinste Zahl aus einem Zufallszahlen-Array (Wert und Index)

   

7. Kopiere das 2te bis 5te Element eines Arrays in ein zweites Array 

   

8. Vertausche zwei Elemente an Position **i** und **j** in einem Array 

   

9. Lösche ein Element an Position **loeschPos** aus einem Array (letztes Element leer)

   

10. Lösche **loeschLen** Elemente von Position **loeschPos** beginnend.

   

11. Füge ein Element **99999** an Position **insPos** in ein Array ein (das vorher letzte Element geht verloren).

   ​

12. Sortiere ein Array aufsteigend/abfallend



13. Drehe ein Array um

   

### Beispiele

1. Es soll ein Array angelegt werde mit 5 Vornamen. Anschließend soll der Inhalt des Arrays in der Konsole ausgegeben werden und die "Adresse" unter der das Array abgelegt wird.

   L1:   

   ```java
   String[] name = {"Sepp", "Hans", "Michael", "Klaus", "Johann"};

   for (int i=0; i < name.length; i++)	// i als Index. Sie geht von 0 bis (AnzahlElemente-1)
     System.out.println(name[i]);

   System.out.println(name);				  // Ausgabe der Referenzvariable gibt zwei Dinge aus: den HashCode und
   									      // die Information was unter der Adresse zu finden ist
   ```

   L2:

   ```java
   String[] name = {"Sepp", "Hans", "Michael", "Klaus", "Johann"};

   System.out.println(Arrays.toString(name));	// toString ist eine Methode die eine passende Ausgabe zur Verfügung stellt.
   ...
   ```

   Die Adresse selbst kann in Java nicht ermittelt werden. Die Trennung zwischen Betriebssystem und Software durch die Java-VM ist ein Grundkonzept der Sprache. Daher kann die physikalische Adresse in Java nicht ermittelt werden. Der HashCode kann als eine Art Adresse interpretiert werden.

2. Es soll ein Array angelegt werde mit 5 Vornamen. Anschließend soll der Inhalt des Arrays in ein anderes Array kopiert werden.

   L:

   ```java
   String[] name = {"Sepp", "Hans", "Michael", "Klaus", "Johann"};
   String[] name2 = new String[name.length];						// 2te Array -Variable mit Größe der 1ten.

   for (int i=0; i < name.length; i++)			// die Zählvariable i wird als Index für das Array verwendet. Sie geht von 0 bis (AnzahlElemente-1)
     name2[i] = name[i];					    // an jeder Stelle wird der Inhalt kopiert

   System.out.println(Arrays.toString(name));
   System.out.println(Arrays.toString(name2));
   ```

    Falsch ist:

   ```java
   String[] name = {"Sepp", "Hans", "Michael", "Klaus", "Johann"};
   String[] name2 = new String[name.length];                       // 2te Array -Variable mit Größe der 1ten.

   name2 = name;			// bringt keinen Fehler und auch die Augabe ist gleich, allerdings wird
   						// hier nicht kopiert, sondern die zweite    Ref.-Var zeigt auf das gleiche Array 

   System.out.println(Arrays.toString(name));
   System.out.println(Arrays.toString(name2));
   ```
   Array -Variable sind Referenzdatentypen. Das bedeutet die Variable *name* und *name2* beinhalten Adressen auf die Arrays. Mit der Zuweisung *name2 = name* wird die Adresse des *name*-Arrays in die *name2*-Variable kopiert. Damit zeigen beide Variable auf das idente Array . Würde eines der beiden Arrays verändert, wird diese Änderung auch über die zweite Variable angezeigt.

3. Es sollen 100 Zufallszahlen abgespeichert werden. Jede der Zufallszahlen soll einen ganzzahligen Wertebereich 0 - 50 haben.
   Tipp: `Math.random()` liefert eine double-Zufallszahl zwischen 0.0 und 1.0

   L1: 

   ```java
   int[] randNum = new int[100];		// leeres double-Array mit 100 Elementen (Index 0 .. 99)

   for (int i=0; i < randNum.length; i++)			// Schleife mit Zählervariable i von 0 bis 99
     randNum[i] = (int)(Math.random() * 50.0);		// die 0.0 - 1.0 Zufallszahl wird mit 50 mult und anschl. auf Ganzzahl gecastet.
   ```
   L2:

   ```java
   int[] randNum = new int[100];		// leeres double-Array mit 100 Elementen (Index 0 .. 99)

   Arrays.parallelSetAll(randNum, v -> (int)(Math.random() * 50));
   ```

4. Aus einem 100 Elemente großen Zahlen-Array (Zufallszahlen 0 .. 10) sollen sämtliche Indizes des Arrays ermittelt werden an dem eine 3 steht.

   L:

   ```java
   int[] randNum = new int[100];

   for (int i=0; i < randNum.length; i++)
     randNum[i] = (int)(Math.random() * 10.0);   // Zufallszahl zw. 0 und 10

   // ---------------------

   for (int i=0; i < randNum.length; i++)
     if (randNum[i] == 3)						  // für jedes Mal Array wert == 3
       System.out.println(i);					  // Ausgabe der Position

   System.out.println(Arrays.toString(randNum)); // Ausgabe Array 
   ```

   Vorsicht: **Arrays.binarySearch** funktioniert nur wenn das Array sortiert ist:

   ```java
   ...
   System.out.println("3 wurde gefunden an Position: ", Arrays.binarySearch(arr, 3));
   ```

5. Ermittle die größte Zahl aus einem Zufallszahlen-Array 
   L1:

   ```java
   ...
   int max = randNum[0];					  // Start: 1tes Array sei das Maximum
   for (int i=0; i < randNum.length; i++) {  // Schleife durch ganzes Array 
     if (randNum[i] > max)					  // Prüfen an jeder Position ob Array wert oder Maximum größer
       max = randNum[i];					  // Array wert ist größer max --> max neu setzen
   }
   ```

   L2:

   ```java
   ...
   Arrays.prefix(arr, Integer::max);
   System.out.println(arr[arr.length-1]);
   ```

6. Ermittle die kleinste Zahl aus einem Zufallszahlen-Array 

   L1:

   ```java
   ...
   int min = randNum[0];							// Start: 1tes Array sei das Minimum
   for (int i=0; i < randNum.length; i++) {		// Schleife durch ganzes Array 
     if (randNum[i] > max)							// Prüfen an jeder Position ob Array wert oder Minimum kleiner
       max = randNum[i];							// Array wert ist kleiner min --> min neu setzen
   }
   ```

   L2:

   ```java
   ...  
   Arrays.prefix(arr, Integer::min);
   System.out.println(arrx[arr.length-1]);
   ```

7. Kopiere das 2te bis 5te Element eines Arrays in ein zweites Array 

   L1:

   ```java
   ...
   int von = 1;
   int bis = 4;
   for (int i = von; i <= bis; i++) {		 // Schleife über den zu kopierenden Bereich
       zielFeld[i-von] = vonFeld[i];
   }
   ```

   L2:

   ```java
   ...
   int[] arr2 = Arrays.copyOfRange(arrx, 2, 5);
   ```

8. Vertausche zwei Elemente an Position **i** und **j** in einem Array 

   L:

   ```java
   ...
   int temp = arr[i];		// Element an i merken
   arr[i] = arr[j];			// Element an i überschreiben
   arr[j] = temp;			// gemerktes Element auf j schreiben
   ```
   Ohne Hilfsvariable geht's nicht!
   
9. Lösche ein Element an Position **loeschPos** aus einem Array (letztes Element auf 0 setzen)

   L:

   ```java
   ...
   for (int i = loeschPos; i < (arr.length-1); i++)
     arr[i] = arr[i+1];
   arr[arr.length] = 0;
   ```

10. Lösche **loeschLen** Elemente von Position **loeschPos** beginnend.

    L:

    ```java
    ...
    for (int i = loeschPos; i < (arr.length-loeschLen); i++)	    // Elemente kopieren
      arr[i] = arr[i+loeschLen];

    for (int i = arr.length-loeschLen; i < arr.length; i++)		// Elemente löschen
      arr[i] = 0;
    ```


11. Füge ein Element **99999** an Position **insPos** in ein Array ein (das vorher letzte Element geht verloren).
    L:

    ```java
    ...
    for (int i = arr.length-2; i > insPos - 1; i--)
      arr[i + 1] = arr[i];

    arr[insPos] = 99999;
    ```

12. Sortiere ein Array aufsteigend/abfallend 

    L1:

    ```java
    // aufsteigend
    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[i] > arr[j]) {
          int temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
        }
      }
    }
    ```

    ```java
    // absteigend
    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = i + 1; j < arr.length; j++) {
        if (arr[i] < arr[j]) {
          int temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
        }
      }
    }
    ```

    L2:

    ```java
       int[] arr = {7,2,1,3,4};
      Arrays.sort(arr);	// arr wird aufsteigend sortiert (absteigend aufwendiger)
    ```

13.  Drehe ein Array um (1tes Element an letzter Stelle ...)

    Bsp.: [0, 1, 2, 3] --> [3, 2, 1, 0]

    L:

    ```
    for (int i = 0; i < numArr.length /2; i++) {
      int temp = numArr[i];
      numArr[i] = numArr[numArr.length-1 - i];
      numArr[numArr.length-1 - i] = temp;
    }
    ```



