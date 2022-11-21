In MSYS2 wird nicht nur gcc/g++ installiert sondern eine Vielzahl hilfreicher Entwicklertools.





(https://www.youtube.com/watch?v=uyDBoogrHww)

- Download MSYS2 https://www.msys2.org

- Ausführen des Installers, Empfehlung: Installation nach `C:\msys64`

- Nach Abschluss wird ein Terminal-Fenster geöffnet, in diesem wird Geupdatet:

  ```
  pacman -Syu
  ```

- Nach Beendigung, Schließen des Terminal-Fensters

- Erneutes Öffnen der Console:

  - Startmenü

  - MSYS2 64bit -> MSYS2 MSYS

  - Obiges Update wiederholen bis kein Update mehr erfolgt

  - Update der Base:

      ```
      pacman -Su
      ```

- Installation von gcc im Terminal-Fenster:

  ```
  pacman -S mingw-w64-x86_64-gcc
  ```

- Installation von Clang im Terminal-Fenster

  ```
  pacman -S mingw-w64-x86_64-clang
  ```

- Nach Abschluß, eventuell Editoren Installieren

  ```
  pacman -S nano vim
  ```

- Öffnen des 64-Bit-Terminals:

  - Startmenü
  - MSYS2 64bit -> MSYS2 MinGW-64bit

  ```
  $ clang --version
  clang version 11.0.0 ....
  ```

- Schreiben eines kleine C-Testprogramms:

  ```
  nano test.c
  ....
  #include <stdio.h>
  
  int main() {
      printf("Hello World!");
      return 0;
  }
  ```

  ^X - Y

- Compilen:

  ```
  clang -std=c17 -Wall -Wextra -pedantic test.c
  ```

- VSCode Starten

  https://www.youtube.com/watch?v=C6yxoXFLOAs

  


## Update

Konsole öffnen und eingeben:

```
pacman -Syuu
```

solange bis die Meldung kommt "nothing to do".



## Reparatur

was mal geklappt hat:

```
pacman -S base-devel gcc
```

