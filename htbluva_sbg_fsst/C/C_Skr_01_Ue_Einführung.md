# 1 C Einführung - Übungen

## Installation - Codeblocks

- Download und Installation Codeblocks-Entwicklungsumgebung. Es gibt Versionen die beinhalten einen Compiler (mingw). mingw ist eine MS-Windows-Version einer GNU-Compiler-Sammlung (c, c++ ...):

  http://www.codeblocks.org/downloads/

  Der C-Compiler ist als gcc.exe unter **\<codeblocksverzeichnis\>\\MinGW\\bin\\** verfügbar.

- Erstellen Sie ein Verzeichnis für die c-Quellcodes auf der lokalen Platte (das in die regelmäßige Sicherung einbezogen ist)

## HelloWorld (001)

- Legen Sie im Quellcodeverzeichnis einen Ordner **001_Einf_HelloWorld** an.

- Erstellen Sie eine leere Textdatei **HelloWorld.c** in diesem Ordner

- Fügen Sie den folgenden Code ein:

  ```c
  #include <stdio.h>
  
  int main() {
      printf("Hello World!");
      return 0;
  }
  ```

- Kommando-Zeile: gehen Sie ins Verzeichnis ihrer HelloWorld.c Datei und führen Sie aus:

  ```sh
  ...>gcc -c HelloWorld.c
  ```
  Damit das klappt muss der Pfad unter dem gcc.exe liegt (MinGW-Verzeichnis unter Code-Blocks) in die Path-Umgebungsvariable aufgenommen worden sein.

- Linken Sie die erstellte Objekt-Datei:

  ```
  ...>gcc HelloWorld.o -o HelloWorld.exe
  ```

- Ausführen von HelloWorld.exe:

  ```sh
  ...>HelloWorld.exe
  Hello World!
  ```


Das erstellte Programm (*.exe) ist direkt in MS-Windows lauffähig (ohne VM ...).

## HelloWorld (002)

- Erstellen Sie ein neues Projekt unter Codeblocks/CLion. Als Startpunkt wird dort automatisch ein HelloWorld erstellt. Compilieren und testen/debuggen Sie das Programm in CodeBlocks/CLion.

## ASCII Tabelle (003)

- Eine Ausgabe in die Konsole kann mit `printf("Hello World")` angestoßen werden.

- Im Speicher können nur Nummern abgelegt werden. Mit dem sogenannten ASCII-Code werden Zeichen (Buchstaben, Zahlen, Sonderzeichen ...) in eine entsprechende Nummer übersetzt. Der ASCII-Code definiert für 128 Zeichen eine Nummer zwischen 0 und 127 benötigt also 7 Bits, aus praktischen Gründen wird ein 8 Bit-Datentyp verwendet (CHAR = Charakter = Zeichen). Hexadezimal hat diese Nummer zwei Stellen 0x00 - 0x7F.

- Geben Sie in der Konsole eine ASCII-Tabelle aus. Als Spalten soll die niederwertigere Hex-Ziffer dienen. Als Zeile die höherwertigere Hex-Ziffer, zum Beispiel:

  ```
  C-ASCII-Tabelle:
     ..0 ..1 ..2 ..3 ..4 ..5 ..6 ..7 ..8 ..9 ..A ..B ..C ..D ..E ..F
  0..
  1..
  2..      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /
  3..  0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
  4..  @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O
  5..  P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _
  6..  `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o
  7..  p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~   ⌂
  8..  Ç   ü   é   â   ä   à   å   ç   ê   ë   è   ï   î   ì   Ä   Å
  9..  É   æ   Æ   ô   ö   ò   û   ù   ÿ   Ö   Ü   ø   £   Ø   ×   ƒ
  A..  á   í   ó   ú   ñ   Ñ   ª   º   ¿   ®   ¬   ½   ¼   ¡   «   »
  B..  ░   ▒   ▓   │   ┤   Á   Â   À   ©   ╣   ║   ╗   ╝   ¢   ¥   ┐
  C..  └   ┴   ┬   ├   ─   ┼   ã   Ã   ╚   ╔   ╩   ╦   ╠   ═   ╬   ¤
  D..  ð   Ð   Ê   Ë   È   ı   Í   Î   Ï   ┘   ┌   █   ▄   ¦   Ì   ▀
  E..  Ó   ß   Ô   Ò   õ   Õ   µ   þ   Þ   Ú   Û   Ù   ý   Ý   ¯   ´
  F..  ­   ±   ‗   ¾   ¶   §   ÷   ¸   °   ¨   ·   ¹   ³   ²   ■    
  ```

- Aus der Tabelle kann der Code jedes Zeichens direkt abgelesen werden, zum Beispiel 'A' = 0x41 (=65) oder '0' = 0x30 (= 48).

- probieren Sie das Programm auch in einer Linux-Umgebung aus. Welche Teile der Tabelle werden so wie hier dargestellt und welche nicht und warum?