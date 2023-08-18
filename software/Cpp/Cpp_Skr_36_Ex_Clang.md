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

  

  
  
  
  
  
  
  

## direkt

Precompiled Version:

Windows snapshot builds -> Windows installer (64-bit)
([Windows installer (64-bit)](https://prereleases.llvm.org/win-snapshots/LLVM-12.0.0-6923b0a7-win64.exe) [(.sig)](https://prereleases.llvm.org/win-snapshots/LLVM-12.0.0-6923b0a7-win64.exe.sig),  based on Git commit [6923b0a7](https://github.com/llvm/llvm-project/commit/6923b0a7) (28 August 2020).)

https://llvm.org/builds/



