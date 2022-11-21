# Git Upload

Grundsätzlich:

- Sauber arbeiten, einmal aus dem Tritt können (eigene) Daten verloren gehen
- Groß-/Kleinschreibung beachten

## Erstmaliges Konfigurieren

Voraussetzung: git-for-windows ist installiert

- Erstellen eines lokalen Upload-Ordners (Annahme c:\\....\\FSST_Upload)
  ```
  mkdir c:\.....\FSST_Upload
  ```
- In der Kommandozeile in diesen Ordner wechseln
  ```
  cd c:\......\FSST_Upload
  ```
- Verbinden des lokalen Upload-Ordners mit dem Remote-Repo:
  ```
  git clone https://gitlab.com/htbluva-salzburg-5ahel/fsst_5ahel_upload ./
  ```
- Erstellen eines persönlichen Branches (Annahme eigenes Kürzel XyzA):
  ```
  git branch XyzA
  git checkout XyzA
  git push origin XyzA
  ```

Damit ist dieser Ordner so konfiguriert, dass in diesem Ordner nur mehr auf dem persönlichen Branch gearbeitet wird.

## Upload in diesen Ordner

- In Windows in diesem lokalen Verzeichnis ein entsprechendes Verzeichnis anlegen. Darin das Qt-Projekt hineinkopieren (oder darin Erstellen).

- In der Kommandozeile in den Upload-Ordner wechseln

  ```
  cd c:\......\FSST_Upload
  ```

- Den neuen Ordner in den Index übernehmen

  ```
  git add .
  ```

- Die Änderungen ins lokale Repo commiten:

  ```
  git commit -m "Hausuebung parallele Prozesse"
  ```

- Hausübung ins Remote-Repo kopieren:

  ```
  git push origin XyzA
  ```
## Update der ReadMe.md Datei

Dieser Ablauf kann mittels Skript **updateReadme.bat** erfolgen. Vor dem ersten Ausführen muss in diesem Skript das Benutzerkürzel eingetragen werden.

Die ReadMe.md Datei liegt im master-Branch und kann ein Update erfahren. Dieses erfolgt Remote im master-Branch. Um dieses Update in den eigenen Branch zu erhalten. ist der folgende Vorgang notwendig:

- In der Kommandozeile in den Upload-Ordner wechseln

  ```
  cd c:\......\FSST_Upload
  ```

- Wechseln auf den master-Branch:

  ```
  git checkout master
  ```

- Update vom Remote-Repo:

  ```
  git pull origin master
  ```

- Wechsel auf den eigenen Branch:

  ```
  git checkout XyzA
  ```

- Kopieren der ReadMe.md Datei aus dem master-Branch:

  ```
  git checkout master ReadMe.md
  ```

- Kopieren nach Remote-Repo:

  ```
  git add ReadMe.md
  git commit -m "Update der ReadMe.md Datei"
  git push origin XyzA
  ```

#Uploads

## Seng - Design Pattern

### 01 Design-Pattern Logger

SEng_Skr_05_Ue_DesignPattern.md/Logger

### 02 Design-Pattern Observer

Untersuchen Sie SEng_Skr_05_Ue_DesignPattern.md/Wetterstation

### 03 Design-Pattern MVC

Ausgehend von *SEng_Skr_05_DesignPattern.md/Qt-ListView* ist ein Qt-Projekt zu Erstellen mit:

- Einem ListView
- Einer ComboBox
- Einem TextFeld

Eine Eingabe in das Textfeld soll automatisch in das ListView und die ComboBox übernommen werden

### 04 Design-Pattern Adapter

*SEng_Skr_05_Ue_DesignPattern.md/Rechteck-Adapter*

##Seng - Docu

SEng_Skr_06_Doxygen.md

## Seng - UnitTest

SEng_Skr_07_UnitTest.md

## Os - Threads

Build mit `g++ -std=c++11 -lpthread -o out.exe *.cpp`

### 01 Funktion als Thread

Ergänzen Sie die Lücken im Projekt (Os_Skr_02_Ue_Thread.md/Funktion als Thread)

### 02 Thread aus Funkionen mit Parameter

Ergänzen Sie die Lücken im Projekt (Os_Skr_02_Ue_Thread.md/Funktion mit Paramtern)

### 03 Thread mit Lambda-Ausdruck

Ergänzen Sie die Lücken im Projekt (Os_Skr_02_Ue_Thread.md/Funktion mit Lambda-Ausdruck)

### 04 Klassen in Threads

Ergänzen Sie die Lücken im Projekt (Os_Skr_02_Ue_Thread.md/Klassen in Threads)

### 05 Scheduling - Punktstrich

Testen Sie Os_Skr_02_Ue_Thread.md/Scheduling - Punktstrich.

In welcher Reihenfolge werden die Threadfunktionen aufgerufen?

### 06 Scheduling - Zeitaufwand

Test Sie Os_Skr_02_Ue_Thread.md/Scheduling - Zeitaufwand

Wieso ist welche Art schneller? Wann ist es sinnvoll Aufgaben so zu teilen?

### 07 Scheduling - Future/Async

Test Sie Os_Skr_02_Ue_Thread.md/Scheduling - Zeitaufwand future/async

Wieso ist welche Art schneller? Wann ist es sinnvoll Aufgaben so zu teilen?

